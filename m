From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2009 10:22:52 +0200
Subject: [Buildroot] [git commit] kconfig: fix oldconfig to generate
	.config.cmd
Message-ID: <20090803083237.236C677667@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c0727fd3192dd3f126b9534174b4f529eeda2a33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the recent update of Kconfig to the Kconfig infrastructure found
in 2.6.30 kernels, make oldconfig was broken because it didn't
generate the .config.cmd file. This is done by a call to the
conf_write_autoconf() function.

Moreover, this process was also broken because the
conf_get_autoconfig_name() function was reading the environment
variable BUILDROOT_AUTOCONF while the main Makefile is passing it as
KCONFIG_AUTOCONFIG. We also remove the fallback on
"$(BR2_DEPENDS_DIR)/config/auto.conf" since we are not able to expand
BR2_DEPENDS_DIR at this point. Therefore, the KCONFIG_AUTOCONFIG
envionment variable *must* be set.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/config/conf.c                      |    4 ++
 package/config/confdata.c                  |    4 +--
 package/config/kconfig-to-buildroot2.patch |   47 +++++++++++++++------------
 3 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/package/config/conf.c b/package/config/conf.c
index c824805..2485dcd 100644
--- a/package/config/conf.c
+++ b/package/config/conf.c
@@ -611,6 +611,10 @@ int main(int ac, char **av)
 			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
 			exit(1);
 		}
+		if (conf_write_autoconf()) {
+			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
+			return 1;
+		}
 	}
 	return 0;
 }
diff --git a/package/config/confdata.c b/package/config/confdata.c
index 56bcd87..5219912 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -44,9 +44,7 @@ const char *conf_get_configname(void)
 
 const char *conf_get_autoconfig_name(void)
 {
-	char *name = getenv("BUILDROOT_AUTOCONFIG");
-
-	return name ? name : "$(BR2_DEPENDS_DIR)/config/auto.conf";
+	return getenv("KCONFIG_AUTOCONFIG");
 }
 
 static char *conf_expand_value(const char *in)
diff --git a/package/config/kconfig-to-buildroot2.patch b/package/config/kconfig-to-buildroot2.patch
index 3348b85..877caba 100644
--- a/package/config/kconfig-to-buildroot2.patch
+++ b/package/config/kconfig-to-buildroot2.patch
@@ -1,7 +1,7 @@
 ---
  Makefile            |    7 +++
  README.buildroot2   |   22 ++++++++++
- conf.c              |   13 ++----
+ conf.c              |   17 ++++----
  confdata.c          |  101 ++++++++++++++++++++++++++------------------------
  expr.c              |   42 ++++++++++----------
  gconf.c             |    4 -
@@ -11,7 +11,7 @@
  util.c              |  105 +++++++++++++++++++++++++++++++++++++++++++++++++++-
  zconf.tab.c_shipped |    2 
  zconf.y             |    2 
- 12 files changed, 241 insertions(+), 103 deletions(-)
+ 12 files changed, 244 insertions(+), 104 deletions(-)
 
 Index: config/Makefile
 ===================================================================
@@ -91,7 +91,7 @@ Index: config/conf.c
  				return 1;
  			}
  		}
-@@ -600,16 +599,16 @@
+@@ -600,18 +599,22 @@
  		 * All other commands are only used to generate a config.
  		 */
  		if (conf_get_changed() && conf_write(NULL)) {
@@ -110,7 +110,13 @@ Index: config/conf.c
 +			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
  			exit(1);
  		}
++		if (conf_write_autoconf()) {
++			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
++			return 1;
++		}
  	}
+ 	return 0;
+ }
 Index: config/confdata.c
 ===================================================================
 --- config.orig/confdata.c
@@ -132,7 +138,7 @@ Index: config/confdata.c
  
  static void conf_warning(const char *fmt, ...)
  {
-@@ -36,16 +37,16 @@
+@@ -36,16 +37,14 @@
  
  const char *conf_get_configname(void)
  {
@@ -145,14 +151,13 @@ Index: config/confdata.c
  const char *conf_get_autoconfig_name(void)
  {
 -	char *name = getenv("KCONFIG_AUTOCONFIG");
-+	char *name = getenv("BUILDROOT_AUTOCONFIG");
- 
+-
 -	return name ? name : "include/config/auto.conf";
-+	return name ? name : "$(BR2_DEPENDS_DIR)/config/auto.conf";
++	return getenv("KCONFIG_AUTOCONFIG");
  }
  
  static char *conf_expand_value(const char *in)
-@@ -219,22 +220,22 @@
+@@ -219,22 +218,22 @@
  		sym = NULL;
  		switch (line[0]) {
  		case '#':
@@ -179,7 +184,7 @@ Index: config/confdata.c
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_BOOLEAN;
  			}
-@@ -251,12 +252,8 @@
+@@ -251,12 +250,8 @@
  				;
  			}
  			break;
@@ -194,7 +199,7 @@ Index: config/confdata.c
  			if (!p)
  				continue;
  			*p++ = 0;
-@@ -267,13 +264,13 @@
+@@ -267,13 +262,13 @@
  					*p2 = 0;
  			}
  			if (def == S_DEF_USER) {
@@ -210,7 +215,7 @@ Index: config/confdata.c
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_OTHER;
  			}
-@@ -443,7 +440,7 @@
+@@ -443,7 +438,7 @@
  	if (!out)
  		return 1;
  
@@ -219,7 +224,7 @@ Index: config/confdata.c
  	sym_calc_value(sym);
  	time(&now);
  	env = getenv("KCONFIG_NOTIMESTAMP");
-@@ -452,10 +449,8 @@
+@@ -452,10 +447,8 @@
  
  	fprintf(out, _("#\n"
  		       "# Automatically generated make config: don't edit\n"
@@ -230,7 +235,7 @@ Index: config/confdata.c
  		     use_timestamp ? "# " : "",
  		     use_timestamp ? ctime(&now) : "");
  
-@@ -489,19 +484,19 @@
+@@ -489,19 +482,19 @@
  			case S_TRISTATE:
  				switch (sym_get_tristate_value(sym)) {
  				case no:
@@ -254,7 +259,7 @@ Index: config/confdata.c
  				while (1) {
  					l = strcspn(str, "\"\\");
  					if (l) {
-@@ -517,12 +512,12 @@
+@@ -517,12 +510,12 @@
  			case S_HEX:
  				str = sym_get_string_value(sym);
  				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
@@ -269,7 +274,7 @@ Index: config/confdata.c
  				break;
  			}
  		}
-@@ -564,6 +559,7 @@
+@@ -564,6 +557,7 @@
  {
  	const char *name;
  	char path[128];
@@ -277,7 +282,7 @@ Index: config/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -572,8 +568,20 @@
+@@ -572,8 +566,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -299,7 +304,7 @@ Index: config/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -666,9 +674,11 @@
+@@ -666,9 +672,11 @@
  		close(fd);
  	}
  out:
@@ -314,7 +319,7 @@ Index: config/confdata.c
  	return res;
  }
  
-@@ -683,7 +693,7 @@
+@@ -683,7 +691,7 @@
  
  	sym_clear_all_valid();
  
@@ -323,7 +328,7 @@ Index: config/confdata.c
  
  	if (conf_split_config())
  		return 1;
-@@ -698,22 +708,19 @@
+@@ -698,22 +706,19 @@
  		return 1;
  	}
  
@@ -350,7 +355,7 @@ Index: config/confdata.c
  
  	for_all_symbols(i, sym) {
  		sym_calc_value(sym);
-@@ -726,19 +733,19 @@
+@@ -726,19 +731,19 @@
  			case no:
  				break;
  			case mod:
@@ -376,7 +381,7 @@ Index: config/confdata.c
  			while (1) {
  				l = strcspn(str, "\"\\");
  				if (l) {
-@@ -758,14 +765,14 @@
+@@ -758,14 +763,14 @@
  		case S_HEX:
  			str = sym_get_string_value(sym);
  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-- 
1.6.3.3
