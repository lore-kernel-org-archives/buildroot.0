From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 17:10:17 +0200
Subject: [Buildroot] [git commit] chrony: bump to version 3.4
Message-ID: <20180923190321.7744388982@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d5675d480f2e104029adf2ca3a5d87ee5cbbbeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch
was applied upstream in this version, so it can be deleted.

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ack-to-reading-dev-urandom-when-getrandom.patch | 42 ----------------------
 package/chrony/chrony.hash                         |  6 ++--
 package/chrony/chrony.mk                           |  2 +-
 3 files changed, 4 insertions(+), 46 deletions(-)

diff --git a/package/chrony/0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch b/package/chrony/0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch
deleted file mode 100644
index d71685e5cd..0000000000
--- a/package/chrony/0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7c5bd948bb7e21fa0ee22f29e97748b2d0360319 Mon Sep 17 00:00:00 2001
-From: Miroslav Lichvar <mlichvar@redhat.com>
-Date: Thu, 17 May 2018 14:16:58 +0200
-Subject: [PATCH] util: fall back to reading /dev/urandom when getrandom()
- blocks
-
-With recent changes in the Linux kernel, the getrandom() system call may
-block for a long time after boot on machines that don't have enough
-entropy. It blocks the chronyd's initialization before it can detach
-from the terminal and may cause a chronyd service to fail to start due
-to a timeout.
-
-At least for now, enable the GRND_NONBLOCK flag to make the system call
-non-blocking and let the code fall back to reading /dev/urandom (which
-never blocks) if the system call failed with EAGAIN or any other error.
-
-This makes the start of chronyd non-deterministic with respect to files
-that it needs to open and possibly also makes it slightly easier to
-guess the transmit/receive timestamp in client requests until the
-urandom source is fully initialized.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util.c b/util.c
-index 4b3e455..76417d5 100644
---- a/util.c
-+++ b/util.c
-@@ -1224,7 +1224,7 @@ get_random_bytes_getrandom(char *buf, unsigned int len)
-       if (disabled)
-         break;
- 
--      if (getrandom(rand_buf, sizeof (rand_buf), 0) != sizeof (rand_buf)) {
-+      if (getrandom(rand_buf, sizeof (rand_buf), GRND_NONBLOCK) != sizeof (rand_buf)) {
-         disabled = 1;
-         break;
-       }
--- 
-2.11.0
-
diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 38f1534295..925240cf6a 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2017/09/msg00000.html
-md5 f4c4eb0dc92f35ee4bb7d3dcd8029ecb  chrony-3.2.tar.gz
-sha1 64db6c31e013222cc0a2b66322192b4cedf6e048  chrony-3.2.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2018/09/msg00000.html
+md5 7170e750469c198fc6784047d6f71144  chrony-3.4.tar.gz
+sha1 fa41e595e7041a9deda76a69e970a023091474f6  chrony-3.4.tar.gz
 # Locally calculated
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 8868e8481c..b5821b238d 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 3.2
+CHRONY_VERSION = 3.4
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
