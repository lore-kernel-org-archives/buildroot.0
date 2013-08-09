From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  9 Aug 2013 11:36:57 +0200
Subject: [Buildroot] [PATCH 1/3] ltrace: Explicit enable/disable of libunwind
In-Reply-To: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
References: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1376041019-26688-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltrace automaticaly use libunwind if detected. So depending if libunwind was
already compiled or not, ltrcae compile differently. This patch add explicit
dependency to libunwind if detected.

In add, due to limitation of luclibc, ltrace cannot use libunwind with uclib. this patch explicitly compile without libunwind in this case.

Resolve issues detected here:
    http://autobuild.buildroot.net/results/79dae85647526cdeddae5050db0339fbc38c9ae6
    http://autobuild.buildroot.net/results/808569f6bfac059b57eb4f1e692fbc9909e791cf
    http://autobuild.buildroot.net/results/83d0cd13d64053869708c666e2aa533202af67f7

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/ltrace/ltrace.mk |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 7b8d859..4d81121 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -13,4 +13,13 @@ LTRACE_CONF_OPT = --disable-werror
 LTRACE_LICENSE = GPLv2
 LTRACE_LICENSE_FILES = COPYING
 
+LTRACE_LIBUNWIDFLAG = --without-libunwind
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+  ifneq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+    LTRACE_DEPENDENCIES = libunwind
+    LTRACE_LIBUNWIDFLAG = --with-libunwind
+  endif
+endif
+LTRACE_CONF_OPT = $(LTRACE_LIBUNWIDFLAG)
+
 $(eval $(autotools-package))
-- 
1.7.9.5
