From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Mar 2019 18:32:57 +0100
Subject: [Buildroot] [PATCH 1/2] package/czmq: remove uneeded werror patch
Message-ID: <20190311173258.2334-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch and use --disable-Werror to disable -Werror

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/czmq/0001-configure.ac-remove-Werror.patch | 32 ----------------------
 package/czmq/czmq.mk                               |  4 +--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/czmq/0001-configure.ac-remove-Werror.patch

diff --git a/package/czmq/0001-configure.ac-remove-Werror.patch b/package/czmq/0001-configure.ac-remove-Werror.patch
deleted file mode 100644
index 2a9454d95e..0000000000
--- a/package/czmq/0001-configure.ac-remove-Werror.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9a195dc573f4eed130773e6ef67efd5f71693e97 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 5 Nov 2016 15:33:57 +0100
-Subject: [PATCH] configure.ac: remove -Werror
-
--Werror shouldn't be used in releases, as it can break the build with
-newer versions of the compiler or the C library, when new warnings
-are introduced.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Asaf: Modified for version 4.2.0]
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6868a99b..9a941545 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -952,7 +952,7 @@ AS_IF([test "x$enable_Werror" = "xyes" || test "x$enable_Werror" = "xauto"],
-         ])])
-      AS_IF([test -n "$CPP"],[AS_IF([$CPP --version 2>&1 | grep 'Free Software Foundation' > /dev/null && test "x$GCC" = "xyes"],
-         [AC_MSG_NOTICE([Enabling pedantic errors for GNU CPP preprocessor])
--         CPPFLAGS="$CPPFLAGS -pedantic -Werror -Wall -Wc++-compat"
-+         CPPFLAGS="$CPPFLAGS -pedantic -Wall -Wc++-compat"
-         ],
-         [AC_MSG_NOTICE([Not enabling pedantic errors: preprocessor not supported by this recipe (not GNU CPP)])
-          AS_IF([test "x$enable_Werror" = "xyes"], [AC_MSG_ERROR([--enable-Werror=yes was requested and can not be satisfied for CPP: $CPP])])
--- 
-2.19.1
-
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 56dc65f8bc..e6445be42e 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -7,8 +7,6 @@
 CZMQ_VERSION = 4.2.0
 CZMQ_SITE = https://github.com/zeromq/czmq/releases/download/v$(CZMQ_VERSION)
 
-# 0001-configure.ac-remove-Werror.patch touches configure.ac
-CZMQ_AUTORECONF = YES
 CZMQ_INSTALL_STAGING = YES
 CZMQ_DEPENDENCIES = zeromq host-pkgconf
 CZMQ_LICENSE = MPL-2.0
@@ -18,4 +16,6 @@ CZMQ_LICENSE_FILES = LICENSE
 # host-python, so disable asciidoc entirely.
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
+CZMQ_CONF_OPTS = --disable-Werror
+
 $(eval $(autotools-package))
-- 
2.14.1
