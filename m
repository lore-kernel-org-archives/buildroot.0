From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:11:14 +0200
Subject: [Buildroot] [git commit] ejabberd: wait until ejabberd is up and
	running
Message-ID: <20150419091151.032BC8044B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb1e02ed352242b9171730d6f6eabafd52063b82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ejabberdctl start returns immediately even if ejabberd is not ready
yet. Add a call to ejabberdctl started just after to wait until the
status says ejabberd is up and running.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ejabberd/S50ejabberd |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
