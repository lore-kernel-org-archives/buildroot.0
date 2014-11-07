From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Nov 2014 09:45:46 -0300
Subject: [Buildroot] [PATCH] coreutils: fix build failure for musl
Message-ID: <1415364346-29236-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl doesn't implement re_match and friends and coreutils fails to
detect this properly, so force internal regex routines for musl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/coreutils/coreutils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 41857e2..391d2cd 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -14,7 +14,8 @@ COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_AUTORECONF = YES
 COREUTILS_GETTEXTIZE = YES
 
-COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=shebangs
+COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=shebangs \
+	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_chown_works=yes \
 	ac_cv_func_euidaccess=no \
-- 
2.0.4
