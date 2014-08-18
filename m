From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 19 Aug 2014 02:03:26 +0400
Subject: [Buildroot] [PATCH 1/2] binutils: troubleshoot native binutils
	building (add WCHAR dependency)
In-Reply-To: <1408399407-23604-1-git-send-email-abrodkin@synopsys.com>
References: <1408399407-23604-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1408399407-23604-2-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

binutils starting at least from 2.23 when build for target require uClibc
configured with UCLIBC_HAS_WCHAR otherwise:
==========
libtool: link: [...] -o as-new [...]
read.o: In function `read_symbol_name':
read.c:(.text+0x3634): undefined reference to `mbstowcs'
collect2: error: ld returned 1 exit status
==========
because "mbstowcs" won't be compiled in.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 44e7ae0..d59a631 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on !BR2_aarch64 && !BR2_nios2
+	depends on BR2_USE_WCHAR
 	help
 	  Install binutils on the target
 
-- 
1.9.3
