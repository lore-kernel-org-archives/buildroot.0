From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Feb 2019 13:02:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/log4cplus: link with libatomic when
 needed
Message-ID: <20190216120210.16988-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.org/results/16e360cb91afff7655f459a3d1fb906ca48f8464

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cplus/log4cplus.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index ac89d2c4b7..33eca1ca26 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -11,6 +11,10 @@ LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LOG4CPLUS_CONF_ENV += LIBS='-latomic'
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LOG4CPLUS_DEPENDENCIES += libiconv
 LOG4CPLUS_CONF_OPTS += --with-iconv
-- 
2.14.1
