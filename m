From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:06:20 +0200
Subject: [Buildroot] [PATCH v3 3/4] autobuild-run: adapt to genrandconfig
	with outputdir and buildrootdir options
In-Reply-To: <20170721010621.4877-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
 <20170721010621.4877-1-arnout@mind.be>
Message-ID: <20170721010621.4877-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -i option has been removed from genrandconfig, it has been replaced
with an explicit -o OUTPUTDIR and -b BUILDROOTDIR.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 85d82d8..0f9d046 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -305,6 +305,7 @@ def gen_config(**kwargs):
     """Generate a new random configuration."""
     idir = "instance-%d" % kwargs['instance']
     log = kwargs['log']
+    outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
 
     log_write(log, "INFO: generate the configuration")
@@ -314,7 +315,7 @@ def gen_config(**kwargs):
     else:
         devnull = open(os.devnull, "w")
     ret = subprocess.call([os.path.join(srcdir, "utils/genrandconfig"),
-                           "-i", str(kwargs['instance']),
+                           "-o", outputdir, "-b", srcdir,
                            "--toolchains-url", kwargs['toolchains_url']],
                           stdout=devnull, stderr=log)
     return ret
-- 
2.13.2
