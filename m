From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri, 21 Oct 2016 13:24:14 +0300
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
	"--tc-cfg-uri" option for toolchain configs URI
Message-ID: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces "--tc-cfg-uri" option (short "-t").
Described option is used to pass URI of file that contain
toolchains configurations to be used in autobuilds.

Default value refers to standard buildroot autobuild toolchain
configuration file:
http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv

Such update allows users to add their own toolchain configurations
to use in buildroot autobuilds.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 scripts/autobuild-run | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 33a0481..4b0d7c2 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -66,6 +66,7 @@ defaults = {
     '--make-opts': '',
     '--nice': 0,
     '--pid-file': '/tmp/buildroot-autobuild.pid',
+    '--tc-cfg-uri': 'http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv',
 }
 
 doc = """autobuild-run - run Buildroot autobuilder
@@ -97,6 +98,7 @@ Options:
                                  Defaults to %(--pid-file)s.
   -c, --config CONFIG            path to configuration file
                                  Not set by default.
+  -t, --tc-cfg-uri URI           URI of toolchain configuration file
 
 Format of the configuration file:
 
@@ -243,7 +245,7 @@ class SystemInfo:
 
         return not missing_requirements
 
-def get_toolchain_configs():
+def get_toolchain_configs(**kwargs):
     """Fetch and return the possible toolchain configurations
 
     This function returns an array of dictionaries, with for each toolchain:
@@ -252,7 +254,7 @@ def get_toolchain_configs():
         - hostarch: the host architecture for which the toolchain is built
         - contents: an array of lines of the defconfig
     """
-    tc_cfg_uri = 'http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv'
+    tc_cfg_uri = kwargs['tc_cfg_uri']
 
     with urlopen_closing(tc_cfg_uri) as r:
         l = decode_byte_list(r.readlines())
@@ -514,7 +516,7 @@ def gen_config(**kwargs):
     log_write(log, "INFO: generate the configuration")
 
     # Select a random toolchain configuration
-    configs = get_toolchain_configs()
+    configs = get_toolchain_configs(**kwargs)
     i = randint(0, len(configs) - 1)
     config = configs[i]
 
@@ -905,6 +907,7 @@ def main():
                 submitter = args['--submitter'],
                 make_opts = (args['--make-opts'] or ''),
                 nice = (args['--nice'] or 0),
+                tc_cfg_uri = args['--tc-cfg-uri'],
                 upload = upload,
                 buildpid = buildpid
             ))
-- 
2.5.5
