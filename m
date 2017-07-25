From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:05:29 +0200
Subject: [Buildroot] [git commit] genrandconfig: get configs from in-tree
	toolchain-configs.csv
Message-ID: <20170725210435.620068017B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84929a53a47f12c98de84ea894e53cc21a033623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now we have the toolchain config fragments in the buildroot directory
itself, it is no longer necessary to fetch it from the toolchain URL.

The --toolchains-url option is renamed to --toolchains-csv.

The paths in the toolchains_csv file should be either absolute, or
relative to buildrootdir.

After this change, the script should be called from autobuild-run as:

    subprocess.call([os.path.join(srcdir, "utils/genrandconfig"),
                     "-o", outputdir, "-b", srcdir,
                     "--toolchains-csv", kwargs['toolchains_csv']],
                    stdout=devnull, stderr=log)

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index d397b23..a67d46f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -118,15 +118,15 @@ class SystemInfo:
         return not missing_requirements
 
 
-def get_toolchain_configs(toolchains_url):
+def get_toolchain_configs(toolchains_csv, buildrootdir):
     """Fetch and return the possible toolchain configurations
 
     This function returns an array of toolchain configurations. Each
     toolchain configuration is itself an array of lines of the defconfig.
     """
 
-    with urlopen_closing(toolchains_url) as r:
-        toolchains_csv = decode_byte_list(r.readlines())
+    with open(toolchains_csv) as r:
+        toolchains = decode_byte_list(r.readlines())
     configs = []
 
     (_, _, _, _, hostarch) = os.uname()
@@ -134,9 +134,9 @@ def get_toolchain_configs(toolchains_url):
     if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
         hostarch = 'x86'
 
-    for row in csv.reader(toolchains_csv):
+    for row in csv.reader(toolchains):
         config = {}
-        url = row[0]
+        configfile = row[0]
         config_hostarch = row[1]
         keep = False
 
@@ -158,8 +158,11 @@ def get_toolchain_configs(toolchains_url):
         if not keep:
             continue
 
-        with urlopen_closing(url) as r:
-            config = decode_byte_list(r.readlines())
+        if not os.path.isabs(configfile):
+            configfile = os.path.join(buildrootdir, configfile)
+
+        with open(configfile) as r:
+            config = r.readlines()
         configs.append(config)
     return configs
 
@@ -329,7 +332,7 @@ def gen_config(args):
     """
 
     # Select a random toolchain configuration
-    configs = get_toolchain_configs(args.toolchains_url)
+    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
 
     i = randint(0, len(configs) - 1)
     toolchainconfig = configs[i]
@@ -408,10 +411,10 @@ if __name__ == '__main__':
     parser.add_argument("--buildrootdir", "-b",
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
-    parser.add_argument("--toolchains-url",
-                        help="URL of toolchain configuration file",
+    parser.add_argument("--toolchains-csv",
+                        help="Path of the toolchain configuration file",
                         type=str,
-                        default="http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv")
+                        default="support/config-fragments/autobuild/toolchain-configs.csv")
     args = parser.parse_args()
 
     # We need the absolute path to use with O=, because the relative
