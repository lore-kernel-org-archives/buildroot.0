From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Jun 2017 22:41:15 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] package/socat: Fix TABDLY,
	CSIZE and CRDLY shifts for PowerPC
Message-ID: <20170608204121.4D98F80F6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cce41bf9c73a3e8c06893715b4bc8a7795f2476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

As can be seen in linux/arch/powerpc/include/uapi/asm/termbits.h are
defined as (note that those are octal numbers):

\#define TABDLY	00006000
\#define CSIZE	00001400
\#define CRDLY	00030000

which gives shifts of 10, 8 and 12. Adjust socat.mk accordingly to
reflect that difference.

Signed-off-by: Mark Hinds <zoronic@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a52896f755a55d0fa30f6ba5092c69edaa73724d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socat/socat.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index ba46263..b923cef 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -9,11 +9,20 @@ SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0
 SOCAT_LICENSE_FILES = COPYING
-SOCAT_CONF_ENV = \
-	sc_cv_termios_ispeed=no \
+
+SOCAT_CONF_ENV = sc_cv_termios_ispeed=no
+
+ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
+SOCAT_CONF_ENV += \
+	sc_cv_sys_crdly_shift=12 \
+	sc_cv_sys_tabdly_shift=10 \
+	sc_cv_sys_csize_shift=8
+else
+SOCAT_CONF_ENV += \
 	sc_cv_sys_crdly_shift=9 \
 	sc_cv_sys_tabdly_shift=11 \
 	sc_cv_sys_csize_shift=4
+endif
 
 # We need to run autoconf to regenerate the configure script, in order
 # to ensure that the test checking linux/ext2_fs.h works
