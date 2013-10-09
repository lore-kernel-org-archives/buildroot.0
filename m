From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 15:24:45 +0200
Subject: [Buildroot] [git commit] toolchain: do not check largefile, wchar,
	IPv6 and locale for glibc toolchains
Message-ID: <20131009143430.563389B99F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e05ebca22c63b2bd1c0b09a8ead2a8250c105f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check_glibc function contained checks to verify that the user had
properly enabled the largefile, IPv6, locale and wchar options, to
match how glibc is configured. This was useful when the support for
glibc external toolchains was introduced, but since then, we added the
BR2_TOOLCHAIN_USES_GLIBC symbol that automatically enables largefile,
IPv6, locale and wchar support when a glibc or eglibc external
toolchain is used. Therefore, many of the check_glibc checks are
useless now, so we can remove these.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 0144674..a4a13c7 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -205,11 +205,7 @@ check_glibc = \
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
