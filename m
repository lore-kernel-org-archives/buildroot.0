From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 22:41:22 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix musl-based builds
	on ARMhf platforms
Message-ID: <20150928204214.507688166B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=066fd9017fd9a325dbf6575c9f068ab939863608
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When ARCH is arm and the hard-floating-point option is on executables
expect to find the dynamic linker at /lib/ld-musl-armhf.so.1 and not
/lib/ld-musl-arm.so.1.

This patch adjusts the logic that creates the symbolic link from the
dynamic linker path to the musl C library (since musl has everything
built into a single file).

[Thomas: tweak the commit log.]

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 61a5dba..79afdaa 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -524,6 +524,8 @@ endef
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
 ifeq ($(BR2_i386),y)
 MUSL_ARCH = i386
+else ifeq ($(BR2_ARM_EABIHF),y)
+MUSL_ARCH = armhf
 else
 MUSL_ARCH = $(ARCH)
 endif
