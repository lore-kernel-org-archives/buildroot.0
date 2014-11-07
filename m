From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 14:33:02 +0100
Subject: [Buildroot] [git commit] coreutils: fix build failure for musl
Message-ID: <20141107133601.07303B5AB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef5c3f4e89c91597f1748b8877c1e3dd5c77c28b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl doesn't implement re_match and friends and coreutils fails to
detect this properly, so force internal regex routines for musl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
