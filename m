From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 13 Oct 2013 13:45:04 +0200
Subject: [Buildroot] [PATCH v3] ruby: fix 'pcrel too far' build problem on
 SuperH architectures
Message-ID: <2d4efe7ec3764c2fe072.1381664704@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'pcrel too far' problem detected in the autobuild on SuperH
architectures, seems to be caused by the -Os optimization flag. Using
standard optimization fixes the problem.

Fixes http://autobuild.buildroot.net/results/bc36e051e06f596c2fafdd3cc3745bb34b73ace3/

Investigated-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: use intermediate RUBY_CFLAGS variable (thanks ThomasP)
v2: don't try to be smarter than you are (don't change TARGET_CFLAGS)

 package/ruby/ruby.mk |  9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -15,6 +15,15 @@ HOST_RUBY_CONF_OPT = --disable-install-d
 RUBY_LICENSE = Ruby or BSD-2c, BSD-3c, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
+RUBY_CFLAGS = $(TARGET_CFLAGS)
+# With some SuperH toolchains (like Sourcery CodeBench 2012.09), ruby fails to
+# build with 'pcrel too far'. This seems to be caused by the -Os option we pass
+# by default. To fix the problem, use standard -O2 optimization instead.
+ifeq ($(BR2_sh)$(BR2_sh64),y)
+RUBY_CFLAGS += -O2
+endif
+RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
+
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 	RUBY_DEPENDENCIES += berkeleydb
