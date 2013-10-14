From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 13:01:23 +0200
Subject: [Buildroot] [git commit] ruby: fix 'pcrel too far' build problem on
	SuperH architectures
Message-ID: <20131014112355.502EF9B9FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61ac6731528bf2c6f0598da02d9134821bbb3b00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'pcrel too far' problem detected in the autobuild on SuperH
architectures, seems to be caused by the -Os optimization flag. Using
standard optimization fixes the problem.

Fixes http://autobuild.buildroot.net/results/bc36e051e06f596c2fafdd3cc3745bb34b73ace3/

Investigated-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 2188837..ea19008 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -15,6 +15,15 @@ HOST_RUBY_CONF_OPT = --disable-install-doc --with-out-ext=curses,readline
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
