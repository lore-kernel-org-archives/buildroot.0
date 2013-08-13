From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 13 Aug 2013 10:31:37 +0200
Subject: [Buildroot] [PATCH v2] ltrace: Explicit enable/disable of libunwind
Message-ID: <1376382697-24789-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltrace automatically uses libunwind if detected. So depending if libunwind was
already compiled or not, ltrace compiles differently. This patch adds explicit
dependency to libunwind if detected.

In add, due to limitation of uclibc, ltrace cannot use libunwind with uclibc.
This patch explicitly compile without libunwind in this case.

Resolve issues detected here:
    http://autobuild.buildroot.net/results/79dae85647526cdeddae5050db0339fbc38c9ae6
    http://autobuild.buildroot.net/results/808569f6bfac059b57eb4f1e692fbc9909e791cf
    http://autobuild.buildroot.net/results/83d0cd13d64053869708c666e2aa533202af67f7

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
V2:
 Previous version introduced an horrible bug: Usage of = instead of += on 
 LTRACE_CONF_OPT. So, --disable-werror was no more passed to configure 
 script. Thus, patches 2/3 and 3/3 are no more usefull. (Sorry, for the 
 noise)

 package/ltrace/ltrace.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 7b8d859..4174139 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -13,4 +13,11 @@ LTRACE_CONF_OPT = --disable-werror
 LTRACE_LICENSE = GPLv2
 LTRACE_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND)$(BR2_TOOLCHAIN_USES_GLIBC),yy)
+LTRACE_DEPENDENCIES += libunwind
+LTRACE_CONF_OPT += --with-libunwind
+else
+LTRACE_CONF_OPT += --without-libunwind
+endif
+
 $(eval $(autotools-package))
-- 
1.7.9.5
