From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:16 +0200
Subject: [Buildroot] [PATCH v7 09/23] genrandconfig: pass outputdir and
	buildrootdir as arguments
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-10-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --instance argument is just an artifact of genrandconfig's
history as part of autobuild-run. It is much more logical to pass
the output directory and the buildroot directory as arguments, with
sane defaults.

This also allows us to remove the hack of creating a symlink in the
instance directory if it doesn't exist yet.

Note that the default outputdir 'output' doesn't work yet, because in
that case Buildroot will put the config file in the buildroot directory
instead of the output directory. This will be fixed in a follow-up
patch.

After this change, the script should be called from autobuild-run as:

    subprocess.call([os.path.join(srcdir, "utils/genrandconfig"),
                     "-o", outputdir, "-b", srcdir,
                     "--toolchains-url", kwargs['toolchains_url']],
                    stdout=devnull, stderr=log)

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v7: new patch
---
 utils/genrandconfig | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 880f1f63cd..4893c43f41 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -352,6 +352,8 @@ def gen_config(args):
         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
 
     # Write out the configuration file
+    if not os.path.exists(args.outputdir):
+        os.makedirs(args.outputdir)
     with open(os.path.join(args.outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
 
@@ -391,29 +393,22 @@ def gen_config(args):
 if __name__ == '__main__':
     import argparse
     parser = argparse.ArgumentParser(description="Generate a random configuration")
-    parser.add_argument("--instance", "-i",
-                        help="Instance number for creating unique directories",
-                        type=int, default=0)
+    parser.add_argument("--outputdir", "-o",
+                        help="Output directory (relative to current directory)",
+                        type=str, default='output')
+    parser.add_argument("--buildrootdir", "-b",
+                        help="Buildroot directory (relative to current directory)",
+                        type=str, default='.')
     parser.add_argument("--toolchains-url",
                         help="URL of toolchain configuration file",
                         type=str,
                         default="http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv")
     args = parser.parse_args()
 
-    # Output directory is already created by autobuild-run so emulate it here
-    idir = "instance-%d" % args.instance
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
-    # Buildroot sources, but to the location of the autobuilder
-    # script.
-    args.outputdir = os.path.abspath(os.path.join(idir, "output"))
-    args.buildrootdir = os.path.join(idir, "buildroot")
-
-    if not os.path.exists(idir):
-        os.mkdir(idir)
-        os.mkdir(args.outputdir)
-        # gen_config expects "buildroot" directory under idir
-        os.symlink("..", args.buildrootdir)
+    # Buildroot sources, but to the current directory.
+    args.outputdir = os.path.abspath(args.outputdir)
 
     try:
         ret = gen_config(args)
-- 
2.13.2
