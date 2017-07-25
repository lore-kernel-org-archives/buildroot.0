From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:50:20 +0200
Subject: [Buildroot] [git commit] genrandconfig: fix the case when outputdir
	is 'output'
Message-ID: <20170725210434.E4AC57FC8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e70470545c348c21f521fa6b7b4cf707d989aad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When outputdir is 'output' (the default), genrandconfig didn't work
correctly because it expects the configfile in outputdir, while
Buildroot puts it in the buildroot directory.

Fix this by explicitly checking if outputdir == buildrootdir/output.
Because abspath is used for both paths, string comparison works
reliably.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index eaca6cf..4ff7deb 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -354,7 +354,10 @@ def gen_config(args):
     # Write out the configuration file
     if not os.path.exists(args.outputdir):
         os.makedirs(args.outputdir)
-    configfile = os.path.join(args.outputdir, ".config")
+    if args.outputdir == os.path.abspath(os.path.join(args.buildrootdir, "output")):
+        configfile = os.path.join(args.buildrootdir, ".config")
+    else:
+        configfile = os.path.join(args.outputdir, ".config")
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
