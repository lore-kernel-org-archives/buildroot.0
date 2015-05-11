From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 00:09:02 +0200
Subject: [Buildroot] [git commit] qemu: fix build on sh4a and sh4aeb
Message-ID: <20150511222305.BA18581D3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18f998b0c5ede6ee96af96cf0039690b79d78c2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qemu doesn't understand sh4a and sh4aeb as separate architectures, it
only knows about sh4 and sh4eb. However, it does support sh4a, since
it emulates the SH7785 CPU which is a SH4A.

Therefore, with this commit, sh4a/sh4aeb are translated as sh4/sh4eb
for Qemu.

Fixes:

  http://autobuild.buildroot.org/results/8f9/8f99a776f35d4ab0841d9fd2db509850ef603bd4/
  and many previous similar build failures

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index d565c88..04df79f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -38,8 +38,8 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-p
 #       sh2a            not supported
 #       sh4             sh4
 #       sh4eb           sh4eb
-#       sh4a            ?
-#       sh4aeb          ?
+#       sh4a            sh4
+#       sh4aeb          sh4eb
 #       sh64            not supported
 #       sparc           sparc
 
@@ -56,6 +56,12 @@ endif
 ifeq ($(HOST_QEMU_ARCH),powerpc)
 HOST_QEMU_ARCH = ppc
 endif
+ifeq ($(HOST_QEMU_ARCH),sh4a)
+HOST_QEMU_ARCH = sh4
+endif
+ifeq ($(HOST_QEMU_ARCH),sh4aeb)
+HOST_QEMU_ARCH = sh4eb
+endif
 HOST_QEMU_TARGETS = $(HOST_QEMU_ARCH)-linux-user
 
 ifeq ($(BR2_PACKAGE_HOST_QEMU),y)
