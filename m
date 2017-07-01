From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:40:02 +0200
Subject: [Buildroot] [git commit] toolchain-external: skip ld-musl symlink
	on static build
Message-ID: <20170701223701.B2FBE8014A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cfd40f2d90b7bbea1d6309145542f16ead58986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Static build with external musl toolchain leaves a dangling symlink to
libc.so. Don't create that symlink on static build.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 8269345..8460e37 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -475,7 +475,7 @@ endef
 # With the musl C library, the libc.so library directly plays the role
 # of the dynamic library loader. We just need to create a symbolic
 # link to libc.so with the appropriate name.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL):$(BR2_STATIC_LIBS),y:)
 ifeq ($(BR2_i386),y)
 MUSL_ARCH = i386
 else ifeq ($(BR2_ARM_EABIHF),y)
