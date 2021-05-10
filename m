From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 May 2021 22:37:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/ruby: links with atomic if needed
Message-ID: <20210510203710.1582289-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails since bump to version 3.0.0 in commit
af5226f2fd1292a26f2dfda32f41cbbad7aa4cc because ruby needs atomic
operation support since
https://github.com/ruby/ruby/commit/6ed6b85ece8733518a7da0c3ec714f20d1102bf5

Fixes:
 - http://autobuild.buildroot.org/results/84ee5f4688be994a5440c3a61bddabee72ca3b3c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ruby/ruby.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index fded7acebc..a71ca3a8a2 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -23,6 +23,10 @@ RUBY_CPE_ID_VENDOR = ruby-lang
 # 0001-fix-default-coroutine-selection.patch
 RUBY_AUTORECONF = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+RUBY_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # On uClibc, finite, isinf and isnan are not directly implemented as
 # functions.  Instead math.h #define's these to __finite, __isinf and
-- 
2.30.2
