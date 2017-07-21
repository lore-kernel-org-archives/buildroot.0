From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:18 +0200
Subject: [Buildroot] [PATCH v7 11/23] genrandconfig: fix the case when
	outputdir is 'output'
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-12-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When outputdir is 'output' (the default), genrandconfig didn't work
correctly because it expects the configfile in outputdir, while
Buildroot puts it in the buildroot directory.

Fix this by explicitly checking if outputdir == buildrootdir/output.
Because abspath is used for both paths, string comparison works
reliably.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v7: new patch
---
 utils/genrandconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index eaca6cff8c..4ff7deb26a 100755
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
 
-- 
2.13.2
