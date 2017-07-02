From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:56:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] toolchain-external: skip
	ld-musl symlink on static build
Message-ID: <20170702155509.C828A8180B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cbce09b8046696fc3f47ccc36f27ff45cd08953
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
index 653ec87..23b941a 100644
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
