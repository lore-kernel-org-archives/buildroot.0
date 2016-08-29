From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 12:04:22 +0200
Subject: [Buildroot] [PATCH] tftpd: disallow on nios with pre-6.x toolchains
Message-ID: <1472465062-9875-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/349/349bc8668614b0f2c970ff33f25216e708ecdb46/
http://autobuild.buildroot.org/results/264/26486e88211d01ee49ad786e9a27a67b849ad1ab/

Older toolchains contain an issue with the linker script causing failures when linking tftpd:

tftpd.c:(.text.startup+0x5c): warning: Unable to reach (null) (at 0x00000000)
from the global pointer (at 0x00011a80) because the offset (-72320) is out of
the allowed range, -32678 to 32767.

This is a known issue which has been fixed from 6.x, so disallow on older
toolchains:

https://www.altera.com/support/support-resources/knowledge-base/solutions/rd02132012_291.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tftpd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index 6517bd5..ea5cb30 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_TFTPD
 	bool "tftpd"
+	# linker issue with pre-6.x toolchains
+	depends on !(BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_6)
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-- 
2.8.1
