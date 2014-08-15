From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 22:27:39 +0200
Subject: [Buildroot] [git commit] package/localedef: don't use config.site
	when cross-compiling
Message-ID: <20140815202747.437D79D439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85448febb3c9f21e6e4082fc344b3ef46261c782
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On fedora 20 64bits host, the file /usr/share/config.site contains
a fix for installing libraries into /lib/lib64 on 64bits systems
that redefine libdir in the generated Makefile.

This causes the bug 7262 reported Normen Bolling.

Set CONFIG_SITE to "no" to not use config.site

fixes: https://bugs.busybox.net/show_bug.cgi?id=7262

Reported-by: Normen Bolling <normen.bolling@teufel.de>
Cc: Normen Bolling <normen.bolling@teufel.de>
Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/localedef/localedef.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 17ffd14..9a7118a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -8,6 +8,10 @@ LOCALEDEF_VERSION = 2.14.1-r17443-ptx1
 LOCALEDEF_SOURCE  = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
 LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src
 
+# Avoid loading /usr/share/config.site that can redefine libdir when
+# the host arch is a 64bit system.
+HOST_LOCALEDEF_CONF_ENV = CONFIG_SITE="no"
+
 HOST_LOCALEDEF_CONF_OPT += \
 	--prefix=/usr \
 	--with-glibc=./eglibc
