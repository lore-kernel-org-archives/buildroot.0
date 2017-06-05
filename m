From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon,  5 Jun 2017 13:41:51 -0700
Subject: [Buildroot] [PATCH] package/socat: Fix TABDLY,
	CSIZE and CRDLY shifts for PowerPC
Message-ID: <20170605204151.1563-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As can be seen in linux/arch/powerpc/include/uapi/asm/termbits.h those
constants are defined as (note that those are octal numbers):

\#define TABDLY	00006000
\#define CSIZE	00001400
\#define CRDLY	00030000

which gives shifts of 10, 8 and 12. Adjust socat.mk accordingly to
reflect that difference.

Signed-off-by: Mark Hinds <zoronic@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/socat/socat.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index ba46263..a85c22d 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -9,11 +9,19 @@ SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0
 SOCAT_LICENSE_FILES = COPYING
+ifeq ($(ARCH),powerpc)
+SOCAT_CONF_ENV = \
+	sc_cv_termios_ispeed=no \
+	sc_cv_sys_crdly_shift=12 \
+	sc_cv_sys_tabdly_shift=10 \
+	sc_cv_sys_csize_shift=8
+else
 SOCAT_CONF_ENV = \
 	sc_cv_termios_ispeed=no \
 	sc_cv_sys_crdly_shift=9 \
 	sc_cv_sys_tabdly_shift=11 \
 	sc_cv_sys_csize_shift=4
+endif
 
 # We need to run autoconf to regenerate the configure script, in order
 # to ensure that the test checking linux/ext2_fs.h works
-- 
2.9.4
