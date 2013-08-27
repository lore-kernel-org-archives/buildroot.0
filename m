From: Thomas Davis <sunsetbrew@sunsetbrew.com>
Date: Tue, 27 Aug 2013 13:57:01 -0400
Subject: [Buildroot] [1/1] civetweb: new package
Message-ID: <CAG3-AMrakjHihP-_Zr7E4zX=BSs7Ym+Fc8HSVDbQbt11t4K0sQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Submission attempt #2 with recommended changes.

1. Change make file ifdef's to ifeq.
2. Copyright lines removed to prevent confusion.
3. Put end of line in make file.
4. Submitted with git mail if it works, otherwise in plain text
5. Rebased, rebuilt and retested with buildroot.

The explaination of BR2_TOOLCHAIN_BUILDROOT_UCLIBC check in
Config.in was answered in a previous post.  If that will
always be included, I can remove the check.

BTW:  git --send-mail is not working for me.  But I made sure this
mail is in plain-text mode.

Thanks,
Thomas

Signed-off-by: Thomas Davis <sunsetbrew@sunsetbrew.com>
---
 package/Config.in            |    1 +
 package/civetweb/Config.in   |   34 +++++++++++++++++++++++++++++++
 package/civetweb/civetweb.mk |   45 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 0 deletions(-)
 create mode 100644 package/civetweb/Config.in
 create mode 100644 package/civetweb/civetweb.mk

diff --git a/package/Config.in b/package/Config.in
index 7069d77..25433b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -719,6 +719,7 @@ source "package/bridge-utils/Config.in"
 source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/chrony/Config.in"
+source "package/civetweb/Config.in"
 source "package/connman/Config.in"
 source "package/crda/Config.in"
 source "package/ctorrent/Config.in"
diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
new file mode 100644
index 0000000..5285b09
--- /dev/null
+++ b/package/civetweb/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_CIVETWEB
+       bool "civetweb"
+       depends on BR2_TOOLCHAIN_BUILDROOT_UCLIBC && !BR2_PTHREADS_NONE
+       help
+         Full featured embedded web server with LUA support.
+
+         https://sourceforge.net/projects/civetweb
+
+if BR2_PACKAGE_CIVETWEB
+
+       config BR2_CIVETWEB_WITH_IPV6
+               bool "enable IPV6 support"
+               depends on BR2_INET_IPV6
+
+       config BR2_CIVETWEB_WITH_LUA
+               bool "enable LUA support"
+               depends on BR2_LARGEFILE # util-linux
+
+       config BR2_CIVETWEB_WITH_SSL
+               bool "enable SSL support"
+               depends on BR2_PACKAGE_OPENSSL
+
+       comment "civetweb IPV6 support requires IPV6"
+               depends on !BR2_INET_IPV6
+
+       comment "civetweb LUA support requires large file support"
+               depends on !BR2_LARGEFILE
+
+       comment "civetweb SSL support requires OpenSSL"
+               depends on !BR2_PACKAGE_OPENSSL
+endif
+
+comment "civetweb requires a toolchain with PTHREAD support"
+       depends on !BR2_TOOLCHAIN_BUILDROOT_UCLIBC || BR2_PTHREADS_NONE
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
new file mode 100644
index 0000000..db14b2b
--- /dev/null
+++ b/package/civetweb/civetweb.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# civetweb
+#
+################################################################################
+
+CIVETWEB_VERSION = 1.2
+CIVETWEB_SOURCE = civetweb-$(CIVETWEB_VERSION).tar.gz
+CIVETWEB_SITE =
http://github.com/sunsetbrew/civetweb/tarball/v$(CIVETWEB_VERSION)
+CIVETWEB_LICENSE = MIT
+CIVETWEB_LICENSE_FILES = LICENSE.md
+
+CIVETWEB_COPT = $(TARGET_CFLAGS)
+CIVETWEB_MOPT = TARGET_OS=LINUX
+CIVETWEB_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq (BR2_PACKAGE_UTIL_LINUX_FALLOCATE,y)
+       CIVETWEB_COPT += -DHAVE_POSIX_FALLOCATE=0
+endif
+
+ifeq (BR2_CIVETWEB_WITH_IPV6,y)
+       CIVETWEB_MOPT += WITH_IPV6=1
+endif
+
+ifeq (BR2_CIVETWEB_WITH_LUA,y)
+       CIVETWEB_MOPT += WITH_LUA=1
+endif
+
+ifeq (BR2_CIVETWEB_WITH_SSL,y)
+       CIVETWEB_COPT += -DNO_SSL_DL -lcrypt -lssl
+       CIVETWEB_DEPENDENCIES += openssl
+else
+       CIVETWEB_COPT += -DNO_SSL
+endif
+
+define CIVETWEB_BUILD_CMDS
+       $(MAKE) CC="$(TARGET_CC)" -C $(@D) all $(CIVETWEB_MOPT)
COPT="$(CIVETWEB_COPT)"
+endef
+
+define CIVETWEB_INSTALL_TARGET_CMDS
+       $(MAKE) CC="$(TARGET_CC)" -C $(@D) install
DOCUMENT_ROOT=/usr/local/share/doc/civetweb
PREFIX="$(TARGET_DIR)/usr/local" $(CIVETWEB_MOPT)
COPT='$(CIVETWEB_COPT)'
+endef
+
+$(eval $(generic-package))
+

--
1.7.8.3
