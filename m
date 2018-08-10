From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 22:36:10 +0200
Subject: [Buildroot] [git commit branch/next] support/testing: runtest proxy
 support
Message-ID: <20180810202936.C15DF8B8C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=361bc21c523e0e6f030080eb910dfb53e4614c7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Allow builder.py to inherit the system proxy settings from
the env if they are present.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/builder.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index faf1eb1494..30230fdb17 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -35,6 +35,12 @@ class Builder(object):
 
     def build(self):
         env = {"PATH": os.environ["PATH"]}
+        if "http_proxy" in os.environ:
+            self.logfile.write("Using system proxy: " +
+                               os.environ["http_proxy"] + "\n")
+            self.logfile.flush()
+            env['http_proxy'] = os.environ["http_proxy"]
+            env['https_proxy'] = os.environ["http_proxy"]
         cmd = ["make", "-C", self.builddir]
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
                               env=env)
