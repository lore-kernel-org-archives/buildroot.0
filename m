From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:09:12 +0100
Subject: [Buildroot] [git commit] package/pkg-cmake: set
	CMAKE_SYSTEM_PROCESSOR correctly on powerpc64{, le}
Message-ID: <20170309210919.477C182564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f812addeb739c9ddf9d55515c4a9cfc3c3ff54b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like ARM, BR2_ARCH doesn't correspond to the uname -m. With cmake
CMAKE_SYSTEM_PROCESSOR is expected to contain the uname -m value.

So we change CMAKE_SYSTEM_PROCESSOR from powerpc64 -> ppc64 (big endian)
and powerpc64le -> ppc64le (little endian).

This corrects the cross compile to the powerpc64{,le} target
architecture for the mariadb (and possibly others) packages that
use the CMAKE_SYSTEM_PROCESSOR variable and compare it against
Power64 based architectures.

Signed-off-by: Daniel Black <daniel.black@au.ibm.com>
Acked-by: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 5d0a455..0897430 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -225,6 +225,10 @@ ifeq ($(BR2_arm),y)
 CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT)l
 else ifeq ($(BR2_armeb),y)
 CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT)b
+else ifeq ($(call qstrip,$(BR2_ARCH)),powerpc64)
+CMAKE_SYSTEM_PROCESSOR = ppc64
+else ifeq ($(call qstrip,$(BR2_ARCH)),powerpc64le)
+CMAKE_SYSTEM_PROCESSOR = ppc64le
 else
 CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
 endif
