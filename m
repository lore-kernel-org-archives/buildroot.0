From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:56:01 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] toolchain-external: skip
	ld-musl symlink on static build
Message-ID: <20170702155533.DE44D806A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b40194ab0d1edd678a7fbf8cd27e1fa9a6be2177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Static build with external musl toolchain leaves a dangling symlink to
libc.so. Don't create that symlink on static build.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 7cfd40f2d90b7bbea1d6309145542f16ead58986)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 856be65..1d5ffa9 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -476,7 +476,7 @@ endef
 # With the musl C library, the libc.so library directly plays the role
 # of the dynamic library loader. We just need to create a symbolic
 # link to libc.so with the appropriate name.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL):$(BR2_STATIC_LIBS),y:)
 ifeq ($(BR2_i386),y)
 MUSL_ARCH = i386
 else ifeq ($(BR2_ARM_EABIHF),y)
