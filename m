From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:41:05 +0200
Subject: [Buildroot] [PATCH] package/ruby: drop useless SuperH CFLAGS tweaks
Message-ID: <20200930204105.322249-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have dropped a long time CodeBench 2019.09 toolchains for SuperH,
and with recent toolchains, Ruby at -Os builds perfectly fine, so
there's no reason to keep this work-around.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ruby/ruby.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 6f8cb319cb..d138aaaa1a 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -20,15 +20,6 @@ HOST_RUBY_CONF_OPTS = \
 RUBY_LICENSE = Ruby or BSD-2-Clause, BSD-3-Clause, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
-RUBY_CFLAGS = $(TARGET_CFLAGS)
-# With some SuperH toolchains (like Sourcery CodeBench 2012.09), ruby fails to
-# build with 'pcrel too far'. This seems to be caused by the -Os option we pass
-# by default. To fix the problem, use standard -O2 optimization instead.
-ifeq ($(BR2_sh),y)
-RUBY_CFLAGS += -O2
-endif
-RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
-
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # On uClibc, finite, isinf and isnan are not directly implemented as
 # functions.  Instead math.h #define's these to __finite, __isinf and
-- 
2.26.2
