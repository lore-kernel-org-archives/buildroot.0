From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 19:20:42 -0300
Subject: [Buildroot] [PATCH] busybox 1.21.0: update mdev patch and add ntfs
	volume patch
Message-ID: <1368483642-1637-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/1.21.0/busybox-1.21.0-mdev.patch | 118 +++++++++++++++++------
 package/busybox/1.21.0/busybox-1.21.0-ntfs.patch |  11 +++
 2 files changed, 99 insertions(+), 30 deletions(-)
 create mode 100644 package/busybox/1.21.0/busybox-1.21.0-ntfs.patch

diff --git a/package/busybox/1.21.0/busybox-1.21.0-mdev.patch b/package/busybox/1.21.0/busybox-1.21.0-mdev.patch
index 8f6c8d8..1481cb3 100644
--- a/package/busybox/1.21.0/busybox-1.21.0-mdev.patch
+++ b/package/busybox/1.21.0/busybox-1.21.0-mdev.patch
@@ -68,20 +68,24 @@
  } FIX_ALIASING;
  #define G (*(struct globals*)&bb_common_bufsiz1)
  #define INIT_G() do { \
-@@ -270,13 +298,6 @@ struct globals {
- /* We use additional 64+ bytes in make_device() */
- #define SCRATCH_SIZE 80
+@@ -267,15 +295,8 @@ struct globals {
+ /* Prevent infinite loops in /sys symlinks */
+ #define MAX_SYSFS_DEPTH 3
  
+-/* We use additional 64+ bytes in make_device() */
+-#define SCRATCH_SIZE 80
+-
 -#if 0
 -# define dbg(...) bb_error_msg(__VA_ARGS__)
 -#else
 -# define dbg(...) ((void)0)
 -#endif
 -
--
++/* We use additional bytes in make_device() */
++#define SCRATCH_SIZE 128
+ 
  #if ENABLE_FEATURE_MDEV_CONF
  
- static void make_default_cur_rule(void)
 @@ -288,14 +309,65 @@ static void make_default_cur_rule(void)
  
  static void clean_up_cur_rule(void)
@@ -233,37 +237,91 @@
  #else
  
  # define next_rule() (&G.cur_rule)
-@@ -479,9 +569,6 @@ static void make_device(char *device_nam
+@@ -468,7 +558,7 @@ static char *build_alias(char *alias, co
+ 
+ /* mknod in /dev based on a path like "/sys/block/hda/hda1"
+  * NB1: path parameter needs to have SCRATCH_SIZE scratch bytes
+- * after NUL, but we promise to not mangle (IOW: to restore if needed)
++ * after NUL, but we promise to not mangle (IOW: to restore NUL if needed)
+  * path string.
+  * NB2: "mdev -s" may call us many times, do not leak memory/fds!
+  *
+@@ -478,9 +568,7 @@ static char *build_alias(char *alias, co
+ static void make_device(char *device_name, char *path, int operation)
  {
  	int major, minor, type, len;
- 
+-
 -	if (G.verbose)
 -		bb_error_msg("device: %s, %s", device_name, path);
--
++	char *path_end = path + strlen(path);
+ 
  	/* Try to read major/minor string.  Note that the kernel puts \n after
  	 * the data, so we don't need to worry about null terminating the string
- 	 * because sscanf() will stop at the first nondigit, which \n is.
-@@ -500,8 +587,7 @@ static void make_device(char *device_nam
+@@ -489,29 +577,51 @@ static void make_device(char *device_nam
+ 	 */
+ 	major = -1;
+ 	if (operation == OP_add) {
+-		char *dev_maj_min = path + strlen(path);
+-
+-		strcpy(dev_maj_min, "/dev");
+-		len = open_read_close(path, dev_maj_min + 1, 64);
+-		*dev_maj_min = '\0';
++		strcpy(path_end, "/dev");
++		len = open_read_close(path, path_end + 1, SCRATCH_SIZE - 1);
++		*path_end = '\0';
+ 		if (len < 1) {
+ 			if (!ENABLE_FEATURE_MDEV_EXEC)
+ 				return;
  			/* no "dev" file, but we can still run scripts
  			 * based on device name */
- 		} else if (sscanf(++dev_maj_min, "%u:%u", &major, &minor) == 2) {
+-		} else if (sscanf(++dev_maj_min, "%u:%u", &major, &minor) == 2) {
 -			if (G.verbose)
 -				bb_error_msg("maj,min: %u,%u", major, minor);
++		} else if (sscanf(path_end + 1, "%u:%u", &major, &minor) == 2) {
 +			dbg1("dev %u,%u", major, minor);
  		} else {
  			major = -1;
  		}
-@@ -511,7 +597,8 @@ static void make_device(char *device_nam
- 	/* Determine device name, type, major and minor */
- 	if (!device_name)
- 		device_name = (char*) bb_basename(path);
+ 	}
+ 	/* else: for delete, -1 still deletes the node, but < -1 suppresses that */
+ 
+-	/* Determine device name, type, major and minor */
+-	if (!device_name)
+-		device_name = (char*) bb_basename(path);
 -	/* http://kernel.org/doc/pending/hotplug.txt says that only
++	/* Determine device name */
++	if (!device_name) {
++		/*
++		 * There was no $DEVNAME envvar (for example, mdev -s never has).
++		 * But it is very useful: it contains the *path*, not only basename,
++		 * Thankfully, uevent file has it.
++		 * Example of .../sound/card0/controlC0/uevent file on Linux-3.7.7:
++		 * MAJOR=116
++		 * MINOR=7
++		 * DEVNAME=snd/controlC0
++		 */
++		strcpy(path_end, "/uevent");
++		len = open_read_close(path, path_end + 1, SCRATCH_SIZE - 1);
++		if (len < 0)
++			len = 0;
++		*path_end = '\0';
++		path_end[1 + len] = '\0';
++		device_name = strstr(path_end + 1, "\nDEVNAME=");
++		if (device_name) {
++			device_name += sizeof("\nDEVNAME=")-1;
++			strchrnul(device_name, '\n')[0] = '\0';
++		} else {
++			/* Fall back to just basename */
++			device_name = (char*) bb_basename(path);
++		}
++	}
++	/* Determine device type */
 +	/*
 +	 * http://kernel.org/doc/pending/hotplug.txt says that only
  	 * "/sys/block/..." is for block devices. "/sys/bus" etc is not.
  	 * But since 2.6.25 block devices are also in /sys/class/block.
  	 * We use strstr("/block/") to forestall future surprises.
-@@ -537,6 +624,8 @@ static void make_device(char *device_nam
+@@ -537,6 +647,8 @@ static void make_device(char *device_nam
  		rule = next_rule();
  
  #if ENABLE_FEATURE_MDEV_CONF
@@ -272,7 +330,7 @@
  		if (rule->maj >= 0) {  /* @maj,min rule */
  			if (major != rule->maj)
  				continue;
-@@ -547,7 +636,7 @@ static void make_device(char *device_nam
+@@ -547,7 +659,7 @@ static void make_device(char *device_nam
  		}
  		if (rule->envvar) { /* $envvar=regex rule */
  			str_to_match = getenv(rule->envvar);
@@ -281,7 +339,7 @@
  			if (!str_to_match)
  				continue;
  		}
-@@ -555,7 +644,7 @@ static void make_device(char *device_nam
+@@ -555,7 +667,7 @@ static void make_device(char *device_nam
  
  		if (rule->regex_compiled) {
  			int regex_match = regexec(&rule->match, str_to_match, ARRAY_SIZE(off), off, 0);
@@ -290,7 +348,7 @@
  			//bb_error_msg("matches:");
  			//for (int i = 0; i < ARRAY_SIZE(off); i++) {
  			//	if (off[i].rm_so < 0) continue;
-@@ -574,9 +663,8 @@ static void make_device(char *device_nam
+@@ -574,9 +686,8 @@ static void make_device(char *device_nam
  		}
  		/* else: it's final implicit "match-all" rule */
   rule_matches:
@@ -301,7 +359,7 @@
  		/* Build alias name */
  		alias = NULL;
  		if (ENABLE_FEATURE_MDEV_RENAME && rule->ren_mov) {
-@@ -619,34 +707,30 @@ static void make_device(char *device_nam
+@@ -619,34 +730,30 @@ static void make_device(char *device_nam
  				}
  			}
  		}
@@ -344,7 +402,7 @@
  		}
  
  		if (operation == OP_add && major >= 0) {
-@@ -656,8 +740,17 @@ static void make_device(char *device_nam
+@@ -656,8 +763,17 @@ static void make_device(char *device_nam
  				mkdir_recursive(node_name);
  				*slash = '/';
  			}
@@ -364,7 +422,7 @@
  			if (mknod(node_name, rule->mode | type, makedev(major, minor)) && errno != EEXIST)
  				bb_perror_msg("can't create '%s'", node_name);
  			if (ENABLE_FEATURE_MDEV_CONF) {
-@@ -671,8 +764,7 @@ static void make_device(char *device_nam
+@@ -671,8 +787,7 @@ static void make_device(char *device_nam
  //TODO: on devtmpfs, device_name already exists and symlink() fails.
  //End result is that instead of symlink, we have two nodes.
  //What should be done?
@@ -374,7 +432,7 @@
  					symlink(node_name, device_name);
  				}
  			}
-@@ -681,27 +773,21 @@ static void make_device(char *device_nam
+@@ -681,27 +796,21 @@ static void make_device(char *device_nam
  		if (ENABLE_FEATURE_MDEV_EXEC && command) {
  			/* setenv will leak memory, use putenv/unsetenv/free */
  			char *s = xasprintf("%s=%s", "MDEV", node_name);
@@ -405,7 +463,7 @@
  			unlink(node_name);
  		}
  
-@@ -746,9 +832,16 @@ static int FAST_FUNC dirAction(const cha
+@@ -746,9 +855,16 @@ static int FAST_FUNC dirAction(const cha
  	 * under /sys/class/ */
  	if (1 == depth) {
  		free(G.subsystem);
@@ -423,7 +481,7 @@
  	}
  
  	return (depth >= MAX_SYSFS_DEPTH ? SKIP : TRUE);
-@@ -813,12 +906,107 @@ static void load_firmware(const char *fi
+@@ -813,12 +929,107 @@ static void load_firmware(const char *fi
  		full_write(loading_fd, "-1", 2);
  
   out:
@@ -531,7 +589,7 @@
  int mdev_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
  int mdev_main(int argc UNUSED_PARAM, char **argv)
  {
-@@ -840,8 +1028,8 @@ int mdev_main(int argc UNUSED_PARAM, cha
+@@ -840,8 +1051,8 @@ int mdev_main(int argc UNUSED_PARAM, cha
  	xchdir("/dev");
  
  	if (argv[1] && strcmp(argv[1], "-s") == 0) {
@@ -542,7 +600,7 @@
  		 */
  		struct stat st;
  
-@@ -853,6 +1041,8 @@ int mdev_main(int argc UNUSED_PARAM, cha
+@@ -853,6 +1064,8 @@ int mdev_main(int argc UNUSED_PARAM, cha
  		G.root_major = major(st.st_dev);
  		G.root_minor = minor(st.st_dev);
  
@@ -551,7 +609,7 @@
  		/* ACTION_FOLLOWLINKS is needed since in newer kernels
  		 * /sys/block/loop* (for example) are symlinks to dirs,
  		 * not real directories.
-@@ -878,11 +1068,13 @@ int mdev_main(int argc UNUSED_PARAM, cha
+@@ -878,11 +1091,13 @@ int mdev_main(int argc UNUSED_PARAM, cha
  		char *action;
  		char *env_devname;
  		char *env_devpath;
@@ -566,7 +624,7 @@
  		 * DEVPATH is like "/block/sda" or "/class/input/mice"
  		 */
  		action = getenv("ACTION");
-@@ -893,39 +1085,20 @@ int mdev_main(int argc UNUSED_PARAM, cha
+@@ -893,39 +1108,20 @@ int mdev_main(int argc UNUSED_PARAM, cha
  		if (!action || !env_devpath /*|| !G.subsystem*/)
  			bb_show_usage();
  		fw = getenv("FIRMWARE");
@@ -618,7 +676,7 @@
  
  		snprintf(temp, PATH_MAX, "/sys%s", env_devpath);
  		if (op == OP_remove) {
-@@ -935,16 +1108,18 @@ int mdev_main(int argc UNUSED_PARAM, cha
+@@ -935,16 +1131,18 @@ int mdev_main(int argc UNUSED_PARAM, cha
  			if (!fw)
  				make_device(env_devname, temp, op);
  		}
diff --git a/package/busybox/1.21.0/busybox-1.21.0-ntfs.patch b/package/busybox/1.21.0/busybox-1.21.0-ntfs.patch
new file mode 100644
index 0000000..e119280
--- /dev/null
+++ b/package/busybox/1.21.0/busybox-1.21.0-ntfs.patch
@@ -0,0 +1,11 @@
+--- busybox-1.21.0/util-linux/volume_id/ntfs.c
++++ busybox-1.21.0-ntfs/util-linux/volume_id/ntfs.c
+@@ -150,7 +150,7 @@ int FAST_FUNC volume_id_probe_ntfs(struc
+ 
+ 		attr = (struct file_attribute*) &buf[attr_off];
+ 		attr_type = le32_to_cpu(attr->type);
+-		attr_len = le16_to_cpu(attr->len);
++		attr_len = le32_to_cpu(attr->len);
+ 		val_off = le16_to_cpu(attr->value_offset);
+ 		val_len = le32_to_cpu(attr->value_len);
+ 		attr_off += attr_len;
-- 
1.8.1.5
