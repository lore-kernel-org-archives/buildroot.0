From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 6 Feb 2018 22:40:59 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: check core-dependencies
Message-ID: <20180206214059.9272-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When generating a random configuration, also check the host
dependencies for that configuration and error out if it fails.

This is mainly intended for the autobuilders, so they don't try to
build a configuration for which the necessary host packages are not
installed.

Instead of erroring out, we could also generate a different random
config. However:

- When called for the autobuilders, the autobuild-run script will
  anyway just attempt another build. The only difference is that a
  warning will be printed in this autobuild log now. This warning
  is in fact quite useful to hint that the autobuilder could benefit
  from intalling this additional host package.

- When called manually, the user may in fact want to install the
  missing host package and continue with the saved random config.

Fixes:

http://autobuild.buildroot.net/results/d7c/d7c12e873a71fef1e0b5e19cfad45024050614e1
http://autobuild.buildroot.net/results/a0a/a0a105c1ec2d0517112b02932a85831d4b597b9f
http://autobuild.buildroot.net/results/96c/96cc6cedc64c777e993671204809599a1498472a

and many others...

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 883322552c..0d08570bc5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -401,7 +401,8 @@ def gen_config(args):
     subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                            "savedefconfig"])
 
-    return 0
+    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+                            "core-dependencies"])
 
 
 if __name__ == '__main__':
-- 
2.15.1
