From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 11:39:40 +0200
Subject: [Buildroot] [git commit] toolchain-external: adjust musl dynamic
	linker symlink for mips-sf
Message-ID: <20170530093954.6D502828B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6a4a8b2ef1fa747fdc79bc7bae0518417910f5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The external toolchain code has some logic to calculate the correct name
for the dynamic linker symbolic link that needs to be created when the
musl C library is being used. There was already some handling for the
mipsel+soft-float case, but not for the mips+soft-float case. Due to
this, the symbolic link was incorrectly named, and programs were
referencing an non-existing file.

Reported-by: Florent Jacquet <florent.jacquet@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 9670350..856be65 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -481,6 +481,8 @@ ifeq ($(BR2_i386),y)
 MUSL_ARCH = i386
 else ifeq ($(BR2_ARM_EABIHF),y)
 MUSL_ARCH = armhf
+else ifeq ($(BR2_mips):$(BR2_SOFT_FLOAT),y:y)
+MUSL_ARCH = mips-sf
 else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
 MUSL_ARCH = mipsel-sf
 else ifeq ($(BR2_sh),y)
