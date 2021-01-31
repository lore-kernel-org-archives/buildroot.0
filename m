From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:21:38 +0100
Subject: [Buildroot] [git commit] Replace LIBFOO_CPE_ID_VERSION_MINOR by
 LIBFOO_CPE_ID_UPDATE
Message-ID: <20210131220227.6B8DD86343@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7922a57f5ac42d25ce90054a66ccdb822e5566c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace LIBFOO_CPE_ID_VERSION_MINOR by LIBFOO_CPE_ID_UPDATE to better
"comply" with the official "Well-Formed CPE Name Data Model" parameters:
 - https://csrc.nist.gov/publications/detail/nistir/7695/final
 - https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt                  |  8 ++++----
 package/libffi/libffi.mk                                 |  2 +-
 package/ntp/ntp.mk                                       |  2 +-
 package/openssh/openssh.mk                               |  2 +-
 package/pkg-generic.mk                                   | 16 ++++++++--------
 package/runc/runc.mk                                     |  4 ++--
 package/sudo/sudo.mk                                     |  4 ++--
 package/wireless_tools/wireless_tools.mk                 |  2 +-
 .../package/cpe-id-pkg4/cpe-id-pkg4.mk                   |  2 +-
 .../package/cpe-id-pkg5/cpe-id-pkg5.mk                   |  4 ++--
 support/testing/tests/core/test_cpeid.py                 | 10 +++++-----
 11 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 21fedd8b6b..75af18b70c 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -522,8 +522,8 @@ LIBFOO_IGNORE_CVES += CVE-2020-54321
    identifier. When not defined the default value is
    +$(LIBFOO_VERSION)+.
 
-** +LIBFOO_CPE_ID_VERSION_MINOR+ specifies the _update_ part of the
-   CPE identifier. When not defined the default value is +*+.
+** +LIBFOO_CPE_ID_UPDATE+ specifies the _update_ part of the CPE
+   identifier. When not defined the default value is +*+.
 --
 +
 If any of those variables is defined, then the generic package
@@ -534,8 +534,8 @@ package infrastructure will define +LIBFOO_CPE_ID+.
 Alternatively, a package can also explicitly set +LIBFOO_CPE_ID_VALID
 = YES+ if the default values for +LIBFOO_CPE_ID_PREFIX+,
 +LIBFOO_CPE_ID_VENDOR+, +LIBFOO_CPE_ID_PRODUCT+,
-+LIBFOO_CPE_ID_VERSION+, +LIBFOO_CPE_ID_VERSION_MINOR+ are all correct
-for this package and don't need to be explicitly overridden.
++LIBFOO_CPE_ID_VERSION+, +LIBFOO_CPE_ID_UPDATE+ are all correct for
+this package and don't need to be explicitly overridden.
 +
 For a host package, if its +LIBFOO_CPE_ID_*+ variables are not
 defined, it inherits the value of those variables from the
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index e87a024040..f8b6568341 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -7,7 +7,7 @@
 LIBFFI_VERSION = 3.3
 LIBFFI_SITE = $(call github,libffi,libffi,v$(LIBFFI_VERSION))
 LIBFFI_CPE_ID_VERSION = 3.3
-LIBFFI_CPE_ID_VERSION_MINOR = rc0
+LIBFFI_CPE_ID_UPDATE = rc0
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_INSTALL_STAGING = YES
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 0b412a35ce..0dc75a7a6d 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -14,7 +14,7 @@ NTP_LICENSE = NTP
 NTP_LICENSE_FILES = COPYRIGHT
 NTP_CPE_ID_VENDOR = ntp
 NTP_CPE_ID_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)
-NTP_CPE_ID_VERSION_MINOR = p$(NTP_VERSION_POINT)
+NTP_CPE_ID_UPDATE = p$(NTP_VERSION_POINT)
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no POSIX_SHELL=/bin/sh
 NTP_CONF_OPTS = \
 	--with-shared \
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index c8937229ab..edcbfc2f62 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -6,7 +6,7 @@
 
 OPENSSH_VERSION = 8.3p1
 OPENSSH_CPE_ID_VERSION = 8.3
-OPENSSH_CPE_ID_VERSION_MINOR = p1
+OPENSSH_CPE_ID_UPDATE = p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 00f48a4609..9fbc63d19e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -616,13 +616,13 @@ $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)
 
 # If any of the <pkg>_CPE_ID_* variables are set, we assume the CPE ID
 # information is valid for this package.
-ifneq ($$($(2)_CPE_ID_VENDOR)$$($(2)_CPE_ID_PRODUCT)$$($(2)_CPE_ID_VERSION)$$($(2)_CPE_ID_VERSION_MINOR)$$($(2)_CPE_ID_PREFIX),)
+ifneq ($$($(2)_CPE_ID_VENDOR)$$($(2)_CPE_ID_PRODUCT)$$($(2)_CPE_ID_VERSION)$$($(2)_CPE_ID_UPDATE)$$($(2)_CPE_ID_PREFIX),)
 $(2)_CPE_ID_VALID = YES
 endif
 
 # When we're a host package, make sure to use the variables of the
 # corresponding target package, if any.
-ifneq ($$($(3)_CPE_ID_VENDOR)$$($(3)_CPE_ID_PRODUCT)$$($(3)_CPE_ID_VERSION)$$($(3)_CPE_ID_VERSION_MINOR)$$($(3)_CPE_ID_PREFIX),)
+ifneq ($$($(3)_CPE_ID_VENDOR)$$($(3)_CPE_ID_PRODUCT)$$($(3)_CPE_ID_VERSION)$$($(3)_CPE_ID_UPDATE)$$($(3)_CPE_ID_PREFIX),)
 $(2)_CPE_ID_VALID = YES
 endif
 
@@ -662,12 +662,12 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
   endif
  endif
 
- # CPE_ID_VERSION_MINOR
- ifndef $(2)_CPE_ID_VERSION_MINOR
-  ifdef $(3)_CPE_ID_VERSION_MINOR
-   $(2)_CPE_ID_VERSION_MINOR = $$($(3)_CPE_ID_VERSION_MINOR)
+ # CPE_ID_UPDATE
+ ifndef $(2)_CPE_ID_UPDATE
+  ifdef $(3)_CPE_ID_UPDATE
+   $(2)_CPE_ID_UPDATE = $$($(3)_CPE_ID_UPDATE)
   else
-   $(2)_CPE_ID_VERSION_MINOR = *
+   $(2)_CPE_ID_UPDATE = *
   endif
  endif
 
@@ -681,7 +681,7 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  endif
 
  # Calculate complete CPE ID
- $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_PRODUCT):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_VERSION_MINOR):*:*:*:*:*:*
+ $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_PRODUCT):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_UPDATE):*:*:*:*:*:*
 endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
 
 # When a target package is a toolchain dependency set this variable to
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 0fec360d5f..c0de2783e4 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-RUNC_VERSION = $(RUNC_CPE_ID_VERSION)-$(RUNC_CPE_ID_VERSION_MINOR)
+RUNC_VERSION = $(RUNC_CPE_ID_VERSION)-$(RUNC_CPE_ID_UPDATE)
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 RUNC_CPE_ID_VENDOR = linuxfoundation
 RUNC_CPE_ID_VERSION = 1.0.0
-RUNC_CPE_ID_VERSION_MINOR = rc92
+RUNC_CPE_ID_UPDATE = rc92
 
 RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index ce18b9d965..7f57c66b75 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SUDO_VERSION = $(SUDO_CPE_ID_VERSION)$(SUDO_CPE_ID_VERSION_MINOR)
+SUDO_VERSION = $(SUDO_CPE_ID_VERSION)$(SUDO_CPE_ID_UPDATE)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
 SUDO_CPE_ID_VALID = YES
 SUDO_CPE_ID_VERSION = 1.9.5
-SUDO_CPE_ID_VERSION_MINOR = p2
+SUDO_CPE_ID_UPDATE = p2
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 01d03218d6..1d29c3b102 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -11,7 +11,7 @@ WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
 WIRELESS_TOOLS_LICENSE = GPL-2.0
 WIRELESS_TOOLS_LICENSE_FILES = COPYING
 WIRELESS_TOOLS_CPE_ID_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR)
-WIRELESS_TOOLS_CPE_ID_VERSION_MINOR = pre9
+WIRELESS_TOOLS_CPE_ID_UPDATE = pre9
 WIRELESS_TOOLS_INSTALL_STAGING = YES
 
 WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
index 8603d20d9d..557acff8a2 100644
--- a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
@@ -2,7 +2,7 @@ CPE_ID_PKG4_VERSION = 67
 CPE_ID_PKG4_CPE_ID_VENDOR = foo
 CPE_ID_PKG4_CPE_ID_PRODUCT = bar
 CPE_ID_PKG4_CPE_ID_VERSION = 42
-CPE_ID_PKG4_CPE_ID_VERSION_MINOR = b2
+CPE_ID_PKG4_CPE_ID_UPDATE = b2
 CPE_ID_PKG4_CPE_ID_PREFIX = cpe:2.4:a
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
index e1ac501e3e..d0db5f03fe 100644
--- a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
@@ -3,13 +3,13 @@ CPE_ID_PKG5_VERSION = 57
 CPE_ID_PKG5_CPE_ID_VENDOR = foo
 CPE_ID_PKG5_CPE_ID_PRODUCT = bar
 CPE_ID_PKG5_CPE_ID_VERSION = 42
-CPE_ID_PKG5_CPE_ID_VERSION_MINOR = b2
+CPE_ID_PKG5_CPE_ID_UPDATE = b2
 CPE_ID_PKG5_CPE_ID_PREFIX = cpe:2.4:a
 
 HOST_CPE_ID_PKG5_CPE_ID_VENDOR = baz
 HOST_CPE_ID_PKG5_CPE_ID_PRODUCT = fuz
 HOST_CPE_ID_PKG5_CPE_ID_VERSION = 43
-HOST_CPE_ID_PKG5_CPE_ID_VERSION_MINOR = b3
+HOST_CPE_ID_PKG5_CPE_ID_UPDATE = b3
 HOST_CPE_ID_PKG5_CPE_ID_PREFIX = cpe:2.5:a
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/core/test_cpeid.py b/support/testing/tests/core/test_cpeid.py
index af8d3c2896..190f0306e5 100644
--- a/support/testing/tests/core/test_cpeid.py
+++ b/support/testing/tests/core/test_cpeid.py
@@ -22,7 +22,7 @@ class CpeIdTest(infra.basetest.BRConfigTest):
         # this package has no CPE ID information, it should not have
         # any CPE_ID variable defined.
         pkg_vars = self.get_vars("CPE_ID_PKG1_CPE_ID")
-        cpe_vars = ["CPE_ID_VALID", "CPE_ID_PRODUCT", "CPE_ID_VERSION", "CPE_ID_VERSION_MINOR",
+        cpe_vars = ["CPE_ID_VALID", "CPE_ID_PRODUCT", "CPE_ID_VERSION", "CPE_ID_UPDATE",
                     "CPE_ID_PREFIX", "CPE_ID"]
         for v in cpe_vars:
             self.assertNotIn("CPE_ID_PKG1_%s" % v, pkg_vars)
@@ -39,7 +39,7 @@ class CpeIdTest(infra.basetest.BRConfigTest):
         # this package has no CPE ID information, it should not have
         # any CPE_ID variable defined.
         pkg_vars = self.get_vars("HOST_CPE_ID_PKG2_CPE_ID")
-        cpe_vars = ["CPE_ID_VALID", "CPE_ID_PRODUCT", "CPE_ID_VERSION", "CPE_ID_VERSION_MINOR",
+        cpe_vars = ["CPE_ID_VALID", "CPE_ID_PRODUCT", "CPE_ID_VERSION", "CPE_ID_UPDATE",
                     "CPE_ID_PREFIX", "CPE_ID"]
         for v in cpe_vars:
             self.assertNotIn("HOST_CPE_ID_PKG2_%s" % v, pkg_vars)
@@ -68,7 +68,7 @@ class CpeIdTest(infra.basetest.BRConfigTest):
 
     def test_pkg4(self):
         # this package defines
-        # <pkg>_CPE_ID_{VENDOR,PRODUCT,VERSION,VERSION_MINOR,PREFIX},
+        # <pkg>_CPE_ID_{VENDOR,PRODUCT,VERSION,UPDATE,PREFIX},
         # make sure we get the computed <pkg>_CPE_ID, and that it is
         # inherited by the host variant
         pkg_vars = self.get_vars("CPE_ID_PKG4_CPE_ID")
@@ -89,8 +89,8 @@ class CpeIdTest(infra.basetest.BRConfigTest):
 
     def test_pkg5(self):
         # this package defines
-        # <pkg>_CPE_ID_{VENDOR,PRODUCT,VERSION,VERSION_MINOR,PREFIX} and
-        # HOST_<pkg>_CPE_ID_{VENDOR,PRODUCT,VERSION,VERSION_MINOR,PREFIX}
+        # <pkg>_CPE_ID_{VENDOR,PRODUCT,VERSION,UPDATE,PREFIX} and
+        # HOST_<pkg>_CPE_ID_{VENDOR,PRODUCT,VERSION,UPDATE,PREFIX}
         # separately, with different values. Make sure we get the
         # right <pkg>_CPE_ID and HOST_<pkg>_CPE_ID values.
         pkg_vars = self.get_vars("CPE_ID_PKG5_CPE_ID")
