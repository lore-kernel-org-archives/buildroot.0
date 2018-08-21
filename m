From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 21 Aug 2018 17:22:26 +0300
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Add new package
Message-ID: <20180821142226.2309-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim.kochan@petcube.com>

Add gettext-tiny package from the sabotage-linux project:

gettext-tiny provides lightweight replacements for tools typically used
from the GNU gettext suite, which is incredibly bloated and takes a lot
of time to build (in the order of an hour on slow devices). the most
notable component is msgfmt which is used to create binary translation
files in the .mo format out of textual input files in .po format. this
is the most important tool for building software from source, because it
is used from the build processes of many software packages.

Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/gettext-tiny/Config.in         | 10 +++++++++
 package/gettext-tiny/gettext-tiny.hash |  2 ++
 package/gettext-tiny/gettext-tiny.mk   | 38 ++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/gettext-tiny/Config.in
 create mode 100644 package/gettext-tiny/gettext-tiny.hash
 create mode 100644 package/gettext-tiny/gettext-tiny.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 215506c71c..b84f8ebb7e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2010,6 +2010,9 @@ N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
 
+N:	Vadim Kochan <vadim4j@gmail.com>
+F:	package/gettext-tiny/
+
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/llvm/
diff --git a/package/Config.in b/package/Config.in
index f5a17492c7..9f29f93511 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -150,6 +150,7 @@ menu "Development tools"
 	source "package/flex/Config.in"
 	source "package/gawk/Config.in"
 	source "package/gettext/Config.in"
+	source "package/gettext-tiny/Config.in"
 	source "package/git/Config.in"
 	source "package/git-crypt/Config.in"
 	source "package/gperf/Config.in"
diff --git a/package/gettext-tiny/Config.in b/package/gettext-tiny/Config.in
new file mode 100644
index 0000000000..641403f1e6
--- /dev/null
+++ b/package/gettext-tiny/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GETTEXT_TINY
+	bool "gettext-tiny"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  gettext-tiny provides lightweight replacements for tools typically
+	  used from the GNU gettext suite, which is incredibly bloated and
+	  takes a lot of time to build (in the order of an hour on slow
+	  devices).
+
+	  https://github.com/sabotage-linux/gettext-tiny
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
new file mode 100644
index 0000000000..3b0b73d047
--- /dev/null
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -0,0 +1,2 @@
+# Locally Computed:
+sha256 40a003e850ae8c29b8e6e6321925596c3a57d7ae8296d880dc1e88a07aebcd93  gettext-tiny-f733dd3fdd7be973f523a464165aae827a17d838.tar.gz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
new file mode 100644
index 0000000000..d24f181c0b
--- /dev/null
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# gettext-tiny
+#
+################################################################################
+
+GETTEXT_TINY_VERSION = f733dd3fdd7be973f523a464165aae827a17d838
+GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
+GETTEXT_TINY_LICENSE = MIT
+GETTEXT_TINY_INSTALL_STAGING = YES
+GETTEXT_TINY_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LIBINTL=MUSL
+endif
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+GETTEXT_TINY_DEPENDENCIES = libiconv
+endif
+
+define GETTEXT_TINY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		LIBINTL=$(LIBINTL) \
+		$(TARGET_CONFIGURE_OPTS)
+endef
+
+define GETTEXT_TINY_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(STAGING_DIR) prefix=/usr install
+endef
+
+define GETTEXT_TINY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) prefix=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.14.1
