From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 20 Apr 2016 10:38:07 +0100
Subject: [Buildroot] [PATCH] yajl: fix build with uClibc
Message-ID: <1461145087-63679-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The failure looks like this:

../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isinf'
../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isnan'

We already have a patch (0001) which should fix this problem, however,
as stated here [1], it doesn't work when cross compiling.

To fix the problem we add -lm to CFLAGS when building with uClibc.

Fixes:

  http://autobuild.buildroot.net/results/308/30892ffb298acc2334f8c694038c420120fe43b9/

1: https://github.com/lloyd/yajl/issues/58#issuecomment-15683796

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/yajl/yajl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 7770e86..145bf2c 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -11,4 +11,8 @@ YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
 YAJL_PATCH = https://github.com/vriera/yajl/commit/6d09f11b8fd358cab0e31b965327e64a599f9ce9.patch
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+YAJL_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -lm"
+endif
+
 $(eval $(cmake-package))
-- 
2.7.3
