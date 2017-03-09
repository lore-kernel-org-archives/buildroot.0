From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:29:29 +0100
Subject: [Buildroot] [git commit] s6-portable-utils: new package
Message-ID: <20170310092852.4C12D8000A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=401b8f9501411c5ed1db85d598661ac9e5b111b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides s6-portable-utils, a set of tiny general Unix
utilities, often performing well-known tasks such as cut and grep, but
optimized for simplicity and small size.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/s6-portable-utils/Config.in              | 12 +++++++++
 package/s6-portable-utils/s6-portable-utils.hash |  2 ++
 package/s6-portable-utils/s6-portable-utils.mk   | 34 ++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 19392e0..94827d2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -443,6 +443,7 @@ F:	package/ninja/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-networking/
+F:	package/s6-portable-utils/
 F:	package/s6-rc/
 F:	package/skalibs/
 F:	package/smack/
diff --git a/package/Config.in b/package/Config.in
index d12649e..d47e38f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1803,6 +1803,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
diff --git a/package/s6-portable-utils/Config.in b/package/s6-portable-utils/Config.in
new file mode 100644
index 0000000..86ebc4c
--- /dev/null
+++ b/package/s6-portable-utils/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_S6_PORTABLE_UTILS
+	bool "s6-portable-utils"
+	select BR2_PACKAGE_SKALIBS
+	depends on BR2_USE_MMU # skalibs
+	help
+	  s6-portable-utils is a set of tiny general Unix utilities,
+	  often performing well-known tasks such as cut and grep, but
+	  optimized for simplicity and small size. They were designed
+	  for embedded systems and other constrained environments, but
+	  they work everywhere.
+
+	  http://skarnet.org/software/s6-portable-utils/
diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
new file mode 100644
index 0000000..a03e6cd
--- /dev/null
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 cde145b7b9d1f1685f271c45c8aed635e74221689bb8ec21a11b3e5a252d1c4e s6-portable-utils-2.1.0.0.tar.gz
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
new file mode 100644
index 0000000..7461450
--- /dev/null
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# s6-portable-utils
+#
+################################################################################
+
+S6_PORTABLE_UTILS_VERSION = 2.1.0.0
+S6_PORTABLE_UTILS_SITE = http://skarnet.org/software/s6-portable-utils
+S6_PORTABLE_UTILS_LICENSE = ISC
+S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
+S6_PORTABLE_UTILS_DEPENDENCIES = skalibs
+
+S6_PORTABLE_UTILS_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define S6_PORTABLE_UTILS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_PORTABLE_UTILS_CONF_OPTS))
+endef
+
+define S6_PORTABLE_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define S6_PORTABLE_UTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
