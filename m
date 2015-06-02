From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Jun 2015 09:41:06 -0300
Subject: [Buildroot] [PATCH 2/2] samba4: enable for uclibc-ng
In-Reply-To: <1433248866-20991-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433248866-20991-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1433248866-20991-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-ng has the required functionality for samba 4.2.x without the
need for any special tricks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/Config.in | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 57adadd..db8c91d 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,10 +1,16 @@
-comment "samba4 needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "samba4 needs an (e)glibc or uClibc-ng toolchain w/ RPC, wchar"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_UCLIBC_VERSION_NG
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on !BR2_PACKAGE_SAMBA
-	depends on BR2_TOOLCHAIN_USES_GLIBC # needs $ORIGIN support
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # e2fsprogs
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# needs $ORIGIN support
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_UCLIBC_VERSION_NG
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
-- 
2.3.6
