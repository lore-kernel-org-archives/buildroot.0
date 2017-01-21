From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jan 2017 13:55:07 +0100
Subject: [Buildroot] [git commit] xorg-server: not available with musl on ARM
Message-ID: <20170121125742.776B97FA45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9daafbcb75a7ab593ce8a1f21c6149c8437bc0bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #9606

xserver uses inb/outb on arm, which aren't available with musl.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 0f1d1fe..1c8f8cf 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,6 +1,11 @@
+comment "xorg-server needs a glibc or uClibc toolchain"
+	depends on BR2_arm && BR2_TOOLCHAIN_USES_MUSL
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	depends on BR2_USE_MMU # fork()
+	# xserver uses inb/outb on arm, which aren't available with musl
+	depends on !(BR2_arm && BR2_TOOLCHAIN_USES_MUSL)
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
