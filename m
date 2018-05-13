From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:59:53 +0200
Subject: [Buildroot] [git commit] clamav: add patch to fix build failure
 caused by lack of libcurl
Message-ID: <20180513205913.29CA07F884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=037572ee56ce7b18110eb45ddf507623cba726aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When json-c is enabled but libcurl is disabled, clamav tries to build
the clamsubmit program, which fails with:

  CC       clamsubmit.o
clamsubmit.c:6:23: fatal error: curl/curl.h: No such file or directory
 #include <curl/curl.h>

This is due to an incorrect curl-config detection logic, leading to
/bin/curl-config being present making the configure script believe
that curl is available, even when --without-libcurl is explicitly
passed.

This commit adds a patch, submitted upstream, which fixes this
problem.

Fixes:

  http://autobuild.buildroot.net/results/c43d2ebd8ab30016969d642dbd71c297dc5f6bab/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...zation-libs-curl.m4-fix-curl-config-detec.patch | 75 ++++++++++++++++++++++
 package/clamav/clamav.mk                           |  2 +
 2 files changed, 77 insertions(+)

diff --git a/package/clamav/0003-m4-reorganization-libs-curl.m4-fix-curl-config-detec.patch b/package/clamav/0003-m4-reorganization-libs-curl.m4-fix-curl-config-detec.patch
new file mode 100644
index 0000000000..1d26b099b9
--- /dev/null
+++ b/package/clamav/0003-m4-reorganization-libs-curl.m4-fix-curl-config-detec.patch
@@ -0,0 +1,75 @@
+From 6b6ff53b5931c162be13504a1efc53fc5212f9d1 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 7 May 2018 22:57:34 +0200
+Subject: [PATCH] m4/reorganization/libs/curl.m4: fix curl-config detection
+ logic
+
+The current logic in curl.m4 doesn't behave properly when
+--without-libcurl is passed to the ./configure script.
+
+Indeed, in this case what happens is that:
+
+ (1) Since --without-libcurl is passed, LIBCURL_HOME is set to nothing
+
+ (2) find_curl is set to "no"
+
+ (3) Due to find_curl being "no", LIBCURL_HOME is not set to
+     /usr/local and remains empty
+
+ (4) We test if $LIBCURL_HOME/bin/curl_config exists, which is
+     equivalent to testing if /bin/curl-config exists. So curl.m4 is
+     looking at /bin/curl-config, which is irrelevant in a
+     cross-compilation context: it is not because the build machine
+     has libcurl installed that it is available for the target.
+
+     Due to this mistake, it sets have_curl="yes"
+
+Due to this, the ./configure script assumes it can build the
+clamsubmit program, which fails at build time because curl/curl.h
+doesn't exist.
+
+To fix this, this commit rewrites the curl-config detection logic with
+a simpler loop. If find_curl=yes, it means we have to find libcurl
+ourselves, so we iterate over /usr/local and /usr, and check if a
+bin/curl-config binary is available there. If so, we use this path as
+LIBCURL_HOME and set have_curl="yes".
+
+This preserves the existing behavior, while fixing the situation where
+--without-libcurl is passed, but /bin/curl-config exists.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: https://github.com/Cisco-Talos/clamav-devel/pull/87
+---
+ m4/reorganization/libs/curl.m4 | 15 +++++----------
+ 1 file changed, 5 insertions(+), 10 deletions(-)
+
+diff --git a/m4/reorganization/libs/curl.m4 b/m4/reorganization/libs/curl.m4
+index 2a5966ee7..b6a9c2137 100644
+--- a/m4/reorganization/libs/curl.m4
++++ b/m4/reorganization/libs/curl.m4
+@@ -19,17 +19,12 @@ fi
+ [find_curl="yes"])
+ 
+ if test "X$find_curl" = "Xyes"; then
+-    LIBCURL_HOME=/usr/local
+-fi
+-if test -f "$LIBCURL_HOME/bin/curl-config"; then
+-    have_curl="yes"
+-else
+-    if test "X$find_curl" = "Xyes"; then
+-        LIBCURL_HOME=/usr
+-        if test -f "$LIBCURL_HOME/bin/curl-config"; then
+-            have_curl="yes"
++    for p in /usr/local /usr ; do
++        if test -f "${p}/bin/curl-config"; then
++           LIBCURL_HOME=$p
++           have_curl="yes"
+         fi
+-    fi
++    done
+ fi
+ 
+ if test "X$have_curl" = "Xyes"; then
+-- 
+2.14.3
+
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 2711ca2a86..c0138a8944 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -16,6 +16,8 @@ CLAMAV_DEPENDENCIES = \
 	openssl \
 	zlib \
 	$(TARGET_NLS_DEPENDENCIES)
+# 0003-m4-reorganization-libs-curl.m4-fix-curl-config-detec.patch
+CLAMAV_AUTORECONF = YES
 
 # mmap cannot be detected when cross-compiling, needed for mempool support
 CLAMAV_CONF_ENV = \
