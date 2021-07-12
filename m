From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Jul 2021 22:45:58 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] boot/grub2: workaround
 breakage with -O2, -O3 build
Message-ID: <20210712201303.DF900954F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=860c15087d06dd57b9f34ec79f48de8e6aabe1ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When grub2 (i386-pc) is built with -O2 or -O3 it is unable to boot
and the system will reboot in a loop.

Tony Battersby has bisected [0] the error down to this security bugfix:
boot/grub2/0132-kern-parser-Fix-a-stack-buffer-overflow.patch
There is also a bug report by Peter Seiderer about this [1].

As discussed on the mailing list [2], this patch introduces a workaround
in the grub2.mk overriding the global optimization settings with -Os
which results in a booting system.

References:
[0] https://savannah.gnu.org/bugs/?60458
[1] https://bugs.busybox.net/show_bug.cgi?id=13586
[2] http://lists.busybox.net/pipermail/buildroot/2021-May/311524.html

Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7cb51d4843caaa9144270d92f86e60d8b5a2a1ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub2.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index af16ee91e1..52e9199ae9 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -118,9 +118,11 @@ HOST_GRUB2_CONF_ENV = \
 GRUB2_CONF_ENV = \
 	CPP="$(TARGET_CC) -E" \
 	TARGET_CC="$(TARGET_CC)" \
-	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
-	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -fno-stack-protector" \
-	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
+	CFLAGS="$(TARGET_CFLAGS) -Os" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS) -Os" \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
+	TARGET_LDFLAGS="$(TARGET_LDFLAGS) -Os" \
 	TARGET_NM="$(TARGET_NM)" \
 	TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
 	TARGET_STRIP="$(TARGET_CROSS)strip"
