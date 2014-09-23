From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 23 Sep 2014 11:45:46 +0200
Subject: [Buildroot] [PATCH 7/8] libssh2: fix static link with libgcrypt
In-Reply-To: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
References: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
Message-ID: <1411465547-6847-7-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR call configure script with environment variable
lt_cv_sys_lib_search_path_spec="" (see packages/Makefile.in). This prevent
libtool to detect compiler builtin paths. Thus, in case where
BR2_PREFER_STATIC_LIB is enabled, libtool does not find libgpg-error
dependency:

/home/jezz/br-continuous/cfgs/31-x86_64-core2-uclibc-static/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libgcrypt.a(rsa.o):
In function `run_selftests':
rsa.c:(.text+0xd2): undefined reference to `gpg_strerror'
rsa.c:(.text+0xfc): undefined reference to `gpg_strerror'

For this case, we may remove $lt_cv_sys_lib_search_path_spec from environment.
However, it not easy to remove a variable from default environment. So, we
prefer to pass a correct value.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/libssh2/libssh2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 50bd265..193714e 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -10,6 +10,7 @@ LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPT = --disable-examples-build
+LIBSSH2_CONF_ENV += lt_cv_sys_lib_search_path_spec="$(STAGING_DIR)/usr/lib"
 
 # libssh2 must use either libgcrypt or OpenSSL
 # Only select openssl if libgcrypt is not selected
-- 
1.9.1
