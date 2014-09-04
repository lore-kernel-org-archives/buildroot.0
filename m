From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 4 Sep 2014 17:41:12 +0200
Subject: [Buildroot] [PATCH v2] bfin: disable newer binutils for internal
	toolchain
Message-ID: <20140904154111.GA8353@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You get following linking error, when trying to build a
toolchain for bfin with newer binutils:
bfin-buildroot-linux-uclibc/bin/ld: fde encoding in _divdi3_s.o(.eh_frame) prevents .eh_frame_hdr table being created.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
Changes in v2:
  * added comment about upstream bugreport suggested by Thomas P.
---
 package/binutils/Config.in.host |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 826db6d..45f604a 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -16,12 +16,14 @@ choice
 		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.22"
 
+	# bfin disabled for newer binutils due to
+	# https://sourceware.org/bugzilla/show_bug.cgi?id=17334
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_bfin && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_bfin
 		bool "binutils 2.24"
 
 endchoice
-- 
1.7.10.4
