From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 16 Dec 2017 22:42:41 +0200
Subject: [Buildroot] [PATCH] libgpgme: fix build on MIPS with older kernel
 headers
Message-ID: <2e227ffb5d56b6d3b40306b14c32e1b6aaa4accc.1513456961.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIPS N64 ABI has been missing getdents64 wire up until kernel version
3.10. Disable use of getdents on older kernels.

Fixes:
http://autobuild.buildroot.net/results/961/9619062ce6642ae4121d7debb3b4c632c88723d5/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Philipp Claves <claves@budelmann-elektronik.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgpgme/libgpgme.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 31f25b4645b0..5c46c7c561ac 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -35,4 +35,9 @@ LIBGPGME_CONF_ENV += LIBS="-largp" ac_cv_type_error_t=yes
 LIBGPGME_DEPENDENCIES += argp-standalone
 endif
 
+# MIPS N64 (re)introduced getdents64 in kernel version 3.10
+ifeq ($(BR2_MIPS_NABI64)x$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10),yx)
+LIBGPGME_CONF_OPTS += --disable-linux-getdents
+endif
+
 $(eval $(autotools-package))
-- 
2.15.1
