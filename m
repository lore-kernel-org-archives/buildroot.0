From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 22:48:17 +0100
Subject: [Buildroot] [PATCH 9/9] package/librtlsdr: drop cmake workaround
In-Reply-To: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
References: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125214817.1177142-9-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librtlsdr/librtlsdr.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 47586bdfb2..7796d1096a 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -34,15 +34,4 @@ else
 LIBRTLSDR_CONF_OPTS += -DENABLE_ZEROCOPY=OFF
 endif
 
-# In case of static-lib-only builds, CMake's FindThreads.cmake code tries to
-# get the right flags, checking first for -lpthreads, then -lpthread, and lastly
-# for -pthread.
-# The 2 first link checks fail because of undefined symbols: __libc_setup_tls.
-# In the later check, CMake successfully compiles and links the test program,
-# but it also tries to run it, which is wrong when cross-compiling.
-#
-# The following CMake variable only disables the TRY_RUN call in the -pthread
-# test.
-LIBRTLSDR_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 $(eval $(cmake-package))
-- 
2.29.2
