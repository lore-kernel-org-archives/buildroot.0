From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 22:11:39 +0200
Subject: [Buildroot] [git commit] chrony: backport upstream patch to fix
 blocking on getrandom() at startup with recent kernels
Message-ID: <20180809200509.751D58B70E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9937b62e0d197644ddf68bde6bcfff6e916ba61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

chrony calls getrandom() at startup if available, so it needs a workaround
for the blocking behaviour on recent (4.14.39+), similar to what was done
for util-linux in commit c4d86707cd6 (util-linux: add two upstream patches
to fix blocking on getrandom() with recent kernels).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ack-to-reading-dev-urandom-when-getrandom.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/chrony/0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch b/package/chrony/0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch
new file mode 100644
index 0000000000..d71685e5cd
--- /dev/null
+++ b/package/chrony/0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch
@@ -0,0 +1,42 @@
+From 7c5bd948bb7e21fa0ee22f29e97748b2d0360319 Mon Sep 17 00:00:00 2001
+From: Miroslav Lichvar <mlichvar@redhat.com>
+Date: Thu, 17 May 2018 14:16:58 +0200
+Subject: [PATCH] util: fall back to reading /dev/urandom when getrandom()
+ blocks
+
+With recent changes in the Linux kernel, the getrandom() system call may
+block for a long time after boot on machines that don't have enough
+entropy. It blocks the chronyd's initialization before it can detach
+from the terminal and may cause a chronyd service to fail to start due
+to a timeout.
+
+At least for now, enable the GRND_NONBLOCK flag to make the system call
+non-blocking and let the code fall back to reading /dev/urandom (which
+never blocks) if the system call failed with EAGAIN or any other error.
+
+This makes the start of chronyd non-deterministic with respect to files
+that it needs to open and possibly also makes it slightly easier to
+guess the transmit/receive timestamp in client requests until the
+urandom source is fully initialized.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util.c b/util.c
+index 4b3e455..76417d5 100644
+--- a/util.c
++++ b/util.c
+@@ -1224,7 +1224,7 @@ get_random_bytes_getrandom(char *buf, unsigned int len)
+       if (disabled)
+         break;
+ 
+-      if (getrandom(rand_buf, sizeof (rand_buf), 0) != sizeof (rand_buf)) {
++      if (getrandom(rand_buf, sizeof (rand_buf), GRND_NONBLOCK) != sizeof (rand_buf)) {
+         disabled = 1;
+         break;
+       }
+-- 
+2.11.0
+
