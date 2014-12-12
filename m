From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Dec 2014 21:04:56 +0100
Subject: [Buildroot] [PATCH v5 11/11] autobuild-run: catch KeyboardInterrupt
	in the same way as SIGTERM
In-Reply-To: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1418414696-32584-12-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Do not handle a keyboard interrupt (SIGINT) in any different way than a
SIGTERM signal (kill). In both cases, the entire process tree of the
autobuild-run process should be killed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 3c448bd..c8ce918 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -701,6 +701,7 @@ def main():
         """Kill all children"""
 
         # uninstall signal handler to prevent being called for all subprocesses
+        signal.signal(signal.SIGINT, signal.SIG_IGN)
         signal.signal(signal.SIGTERM, signal.SIG_DFL)
 
         # stop all instances to prevent new children to be spawned
@@ -740,6 +741,7 @@ def main():
         p.start()
         processes.append(p)
 
+    signal.signal(signal.SIGINT, sigterm_handler)
     signal.signal(signal.SIGTERM, sigterm_handler)
 
     for p in processes:
-- 
1.8.5.1
