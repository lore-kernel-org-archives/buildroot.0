From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 20:17:08 +0200
Subject: [Buildroot] [PATCHv3 11/20] toolchain: do not check largefile, wchar,
	IPv6 and locale for glibc toolchains
In-Reply-To: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381256237-27948-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check_glibc function contained checks to verify that the user had
properly enabled the largefile, IPv6, locale and wchar options, to
match how glibc is configured. This was useful when the support for
glibc external toolchains was introduced, but since then, we added the
BR2_TOOLCHAIN_USES_GLIBC symbol that automatically enables largefile,
IPv6, locale and wchar support when a glibc or eglibc external
toolchain is used. Therefore, many of the check_glibc checks are
useless now, so we can remove these.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index d9051ae..b530a02 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -206,11 +206,7 @@ check_glibc = \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
-	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
-	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
-	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
-	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
 	$(call check_glibc_rpc_feature,$${SYSROOT_DIR})
 
 #
-- 
1.8.1.2
