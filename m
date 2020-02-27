From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 27 Feb 2020 23:19:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/binutils: disable binutils >=
 2.33.1 for configurations using BR2_BINFMT_FLAT
Message-ID: <20200227221922.8080-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch added by [1] to fix a segfault with elf2flt when binutils
2.33.1 is used on ARM, introduce a regression with previous binutils
version on m68k and ARM.

Theses issues has been reported upstreme [2] [3].

For now, disable binutils >= 2.33.1 for configurations using
BR2_BINFMT_FLAT.

[1] 2b064f86b6a0fd683f307b51f12d9d919fcaa386
[2] https://github.com/uclinux-dev/elf2flt/pull/16
[3] https://github.com/uclinux-dev/elf2flt/issues/12

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/binutils/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 06902b4ba6..9beabe357c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -24,6 +24,9 @@ config BR2_BINUTILS_VERSION_2_32_X
 config BR2_BINUTILS_VERSION_2_33_X
 	bool "binutils 2.33.1"
 	depends on !BR2_csky
+	# https://github.com/uclinux-dev/elf2flt/pull/16
+	# https://github.com/uclinux-dev/elf2flt/issues/12
+	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.31)"
-- 
2.24.1
