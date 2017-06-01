From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:37:37 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] toolchain-external:
	adjust musl dynamic linker symlink for mips-sf
Message-ID: <20170601144624.58CF58296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48a2866ba3367fbe158b12bf2d3b7baa5b7a4d3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The external toolchain code has some logic to calculate the correct name
for the dynamic linker symbolic link that needs to be created when the
musl C library is being used. There was already some handling for the
mipsel+soft-float case, but not for the mips+soft-float case. Due to
this, the symbolic link was incorrectly named, and programs were
referencing an non-existing file.

Reported-by: Florent Jacquet <florent.jacquet@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a6a4a8b2ef1fa747fdc79bc7bae0518417910f5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 11a1bf5..653ec87 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -480,6 +480,8 @@ ifeq ($(BR2_i386),y)
 MUSL_ARCH = i386
 else ifeq ($(BR2_ARM_EABIHF),y)
 MUSL_ARCH = armhf
+else ifeq ($(BR2_mips):$(BR2_SOFT_FLOAT),y:y)
+MUSL_ARCH = mips-sf
 else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
 MUSL_ARCH = mipsel-sf
 else ifeq ($(BR2_sh),y)
