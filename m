From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 19:40:36 +0100
Subject: [Buildroot] [git commit] system/inittab: adjust shutdown
Message-ID: <20141120184133.3A3687FD9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1dbb7e8a822416d502095ecb2c463a5179074555
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop null id since that means "don't show anything" for busybox init,
hence the shutdown sequence (/etc/init.d/rcK) doesn't show anything
giving the false impression that it's not being run.
If someone wants a really silent console they'll need to adjust much more than
this anyway.
Also swap the root read-only remount with swapoff since the swap can be
a regular (loop) file in the root filesystem and make the operation fail
resulting in a dirty filesystem.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/inittab |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/system/skeleton/etc/inittab b/system/skeleton/etc/inittab
index 99d84e4..b1892c1 100644
--- a/system/skeleton/etc/inittab
+++ b/system/skeleton/etc/inittab
@@ -30,7 +30,6 @@ null::sysinit:/bin/hostname -F /etc/hostname
 ::ctrlaltdel:/sbin/reboot
 
 # Stuff to do before rebooting
-null::shutdown:/etc/init.d/rcK
-null::shutdown:/bin/umount -a -r
-null::shutdown:/sbin/swapoff -a
-
+::shutdown:/etc/init.d/rcK
+::shutdown:/sbin/swapoff -a
+::shutdown:/bin/umount -a -r
