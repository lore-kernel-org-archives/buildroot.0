From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 11:01:45 +0100
Subject: [Buildroot] [git commit] libgpgme: fix build on MIPS with older
 kernel headers
Message-ID: <20171218100934.7B6DA80F89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c060dd51dc9a6b2e096718b6bb0021a997bcb14e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MIPS N64 ABI has been missing getdents64 wire up until kernel version
3.10. Disable use of getdents on older kernels.

Fixes:
http://autobuild.buildroot.net/results/961/9619062ce6642ae4121d7debb3b4c632c88723d5/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Philipp Claves <claves@budelmann-elektronik.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpgme/libgpgme.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 31f25b4..5c46c7c 100644
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
