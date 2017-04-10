From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 11 Apr 2017 00:00:03 +0200
Subject: [Buildroot] [PATCH/autobuild v2 7/7] autobuild-run: use in-tree
	toolchain configs
In-Reply-To: <20170410220003.30421-1-arnout@mind.be>
References: <20170410220003.30421-1-arnout@mind.be>
Message-ID: <20170410220003.30421-7-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of having the list of toolchain configs as a CSV file, they
are now maintained within the buildroot tree itself. Therefore,
autobuild-run must get the toolchain configs from there.

The toolchains-url option is replaced with a toolchains-path option.
This path is relative to the buildroot directory and defaults to
support/config-fragments/autobuild. It is possible to override this
with a relative or absolute path to the directory containing the
toolchain configs.

The toolchain configs no longer contain the hostarch information.  For
the predefined external toolchains, this is handled by checking after
the olddefconfig: because of "depends on HOSTARCH=...", the toolchain
config will have been removed. For the custom external toolchains, we
instead rely on the URL: it ends with -HOSTARCH.tar.gz.

Since we don't fetch from a URL anymore, the exception handling
introduced in 5f1016ab0 is no longer needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Clearly, at the moment, the custom external toolchain tarball names
*don't* end with -HOSTARCH, so the hostarch check doesn't actually
work. However, I think this is the most elegent solution. Other
alternatives are:
- Adding a dummy config option BR2_HOSTARCH=... to the toolchain
  config fragments. This works pretty nicely, because then it will
  be covered automatically by the check that all the toolchain config
  lines are still there. However, this requires manual handling when
  generating the toolchain configs (they are no longer the result of
  "make savedefconfig"). Also, it is not enough for the x86 case
  (i.e. the ctng toolchains): these also work on x86_64 autobuilders,
  so special handling for that case would be needed.
- As it happens, all br-* toolchains are x86_64, and all ctng
  toolchains are x86, so we could just do string matching on those to
  derive the hostarch. However, that would be too much of a hack for
  my comfort.

Any other ideas are welcome!

If this solution is chosen, I propose to replace
http://patchwork.ozlabs.org/patch/748187/ with the renamed tarballs
immediately while applying.
---
 scripts/autobuild-run | 69 ++++++++++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 37 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 20e0033..9b448bb 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -67,7 +67,7 @@ defaults = {
     '--nice': 0,
     '--pid-file': '/tmp/buildroot-autobuild.pid',
     '--http-url': 'http://autobuild.buildroot.org/submit/',
-    '--toolchains-url': 'http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv',
+    '--toolchains-path': 'support/config-fragments/autobuild',
 }
 
 doc = """autobuild-run - run Buildroot autobuilder
@@ -102,7 +102,8 @@ Options:
   -c, --config CONFIG            path to configuration file
                                  Not set by default.
   -d, --debug                    Send log output to stdout instead of log file
-  --toolchains-url URL           URL of toolchain configuration file
+  --toolchains-path URL          Path to the toolchain configuration files
+                                 (relative to buildroot dir).
 
 Format of the configuration file:
 
@@ -169,7 +170,7 @@ else:
     encode_str = _identity
 
 MAX_DURATION = 60 * 60 * 8
-VERSION = 1
+VERSION = 2
 
 def log_write(logf, msg):
     logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()), msg))
@@ -255,10 +256,14 @@ def get_toolchain_configs(**kwargs):
     This function returns an array of toolchain configurations. Each
     toolchain configuration is itself an array of lines of the defconfig.
     """
-    toolchains_url = kwargs['toolchains_url']
+    toolchains_path = kwargs['toolchains_path']
+
+    if os.path.isabs(toolchains_path):
+        toolchains_dir = toolchains_path
+    else:
+        idir = "instance-%d" % kwargs['instance']
+        toolchains_dir = os.path.join(idir, "buildroot", toolchains_path)
 
-    with urlopen_closing(toolchains_url) as r:
-        l = decode_byte_list(r.readlines())
     configs = []
 
     (_, _, _, _, hostarch) = os.uname()
@@ -266,33 +271,26 @@ def get_toolchain_configs(**kwargs):
     if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
         hostarch = 'x86'
 
-    for row in csv.reader(l):
-        config = {}
-        url = row[0]
-        config_hostarch = row[1]
-        keep = False
-
-        # Keep all toolchain configs that work regardless of the host
-        # architecture
-        if config_hostarch == "any":
+    for configfile in os.listdir(toolchains_dir):
+        if configfile.endswith('.config'):
             keep = True
-
-        # Keep all toolchain configs that can work on the current host
-        # architecture
-        if hostarch == config_hostarch:
-            keep = True
-
-        # Assume that x86 32 bits toolchains work on x86_64 build
-        # machines
-        if hostarch == 'x86_64' and config_hostarch == "x86":
-            keep = True
-
-        if not keep:
-            continue
-
-        with urlopen_closing(url) as r:
-            config = decode_byte_list(r.readlines())
-        configs.append(config)
+            with open(os.path.join(toolchains_dir, configfile)) as r:
+                config = decode_byte_list(r.readlines())
+                for configline in config:
+                    # If the toolchain is for a specific arch, check it. The prebuilt toolchains
+                    # are only for x86 or x86_64. If the URL doesn't specify an arch, assume it
+                    # is OK.
+                    m = re.match(r'^BR2_TOOLCHAIN_EXTERNAL_URL=".*(x86|x86_64)\.tar', configline)
+                    if m:
+                        configarch = m.group(1)
+                        if configarch != hostarch:
+                            keep = False
+                        # Assume that x86 32 bits toolchains work on x86_64
+                        # build machines
+                        if configarch == 'x86' and hostarch == 'x86_64':
+                            keep = True
+            if keep:
+                configs.append(config)
     return configs
 
 def prepare_build(**kwargs):
@@ -530,10 +528,7 @@ def gen_config(**kwargs):
     log_write(log, "INFO: generate the configuration")
 
     # Select a random toolchain configuration
-    try:
-        configs = get_toolchain_configs(**kwargs)
-    except:
-        return -1
+    configs = get_toolchain_configs(**kwargs)
 
     i = randint(0, len(configs) - 1)
     config = configs[i]
@@ -929,7 +924,7 @@ def main():
                 submitter = args['--submitter'],
                 make_opts = (args['--make-opts'] or ''),
                 nice = (args['--nice'] or 0),
-                toolchains_url = args['--toolchains-url'],
+                toolchains_path = args['--toolchains-path'],
                 upload = upload,
                 buildpid = buildpid,
                 debug = args['--debug']
-- 
2.11.0
