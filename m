From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Jan 2019 22:37:24 +0100
Subject: [Buildroot] [PATCH] autobuild-run: store summary if not uploading
Message-ID: <20190115213724.30311-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using autobuild-run for testing local changes, the results will not
be uploaded. However, the tarballs are very inconvenient for processing
the results (which is obviously needed for testing local changes).

Setting up a database to store build results like on a.b.o is overkill
for most cases. Collecting all results in a single file is also a little
bit complicated, since it would have to be protected against concurrent
updates from the different instances. Therefore, simply create a
"summary" file in addition to the results tarball.

The summary file contains only the information that is readily available
already: result and reason. Submitter is not relevant for the local
testing use case. arch, libc and static are extracted by the a.b.o PHP
scripts so they are not readily available, so they are not included. If
such information is needed for some use case, it is probably better to
set up a local instance of the a.b.o server and database anyway.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 77272f5..c3b51bc 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -617,6 +617,10 @@ def send_results(result, **kwargs):
             sha1 = hashlib.sha1(f.read()).hexdigest()
         resultfilename = "instance-%d-%s.tar.bz2" % (kwargs['instance'], sha1)
         os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
+        summaryfilename = "instance-%d-%s.summary" % (kwargs['instance'], sha1)
+        reason = get_failure_reason() or ("",)
+        with open(summaryfilename, 'wt') as f:
+            f.write("%d,%s\n" % (result, ','.join(reason)))
         log_write(log, "INFO: results saved as %s" % resultfilename)
 
 def run_instance(**kwargs):
-- 
2.20.1
