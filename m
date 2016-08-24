From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 25 Aug 2016 01:10:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/libgpg-error: optionally depends on
	gettext
Message-ID: <20160824231003.29262-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure.ac has AM_GNU_GETTEXT()

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Discovered while investigating
http://autobuild.buildroot.net/results/f81/f81eabb37788aa6dcdadf4034889c84bef78b876/

I suspect there are many more packages like this... Perhaps it would
make sense to consider gettext (and therefore libiconv) to be part of
the toolchain...
---
 package/libgpg-error/libgpg-error.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index e081b36..dfe58e7 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -11,6 +11,10 @@ LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 
+ifeq ($(BR2_NEEDS_GETTEXT),y)
+LIBGPG_ERROR_DEPENDENCIES += gettext
+endif
+
 define LIBGPG_ERROR_FIX_CROSS_COMPILATION
 	cd $(@D)/src/syscfg && \
 	ln -s lock-obj-pub.$(call qstrip, $(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)).h \
-- 
2.9.3
