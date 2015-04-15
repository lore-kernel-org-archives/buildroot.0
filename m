From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 15 Apr 2015 17:39:07 +0200
Subject: [Buildroot] [PATCH 3/3] ejabberd: wait until ejabberd is up and
	running
In-Reply-To: <1429112347-17009-1-git-send-email-johan.oudinet@gmail.com>
References: <1429112347-17009-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1429112347-17009-3-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ejabberdctl start returns immediately even if ejabberd is not ready
yet. Add a call to ejabberdctl started just after to wait until the
status says ejabberd is up and running.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/S50ejabberd | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
index a471078..ff38d92 100644
--- a/package/ejabberd/S50ejabberd
+++ b/package/ejabberd/S50ejabberd
@@ -25,6 +25,12 @@ case "$1" in
         mkrundir || exit 1
         echo -n "Starting ejabberd... "
         ctl start --spool "$SPOOLDIR"
+        # Wait until ejabberd is up and running.
+        if ctl started; then
+            echo "done"
+        else
+            echo "failed"
+        fi
         ;;
     stop)
         echo -n "Stopping ejabberd... "
-- 
2.1.0
