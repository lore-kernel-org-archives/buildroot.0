From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:22 +0100
Subject: [Buildroot] [PATCH 7 of 9] ola: automatically enable python
 bindings if python is enabled
In-Reply-To: <patchbomb.1391343075@argentina>
References: <patchbomb.1391343075@argentina>
Message-ID: <86fd4417f44a50ecc529.1391343082@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For packages with optional python bindings, these bindings can be enabled
automatically when python is enabled. There is no need for explicit
configuration options, unless there is a very good reason to do so.

No legacy option was enabled as there is no impact on users that had the
original explicit symbol enabled.

Ola itself has optional python bindings, these are now automatically enabled
if python is enabled. The rdm tests are treated as a package that requires
python, and thus _selects_ python rather than depending on it.

This commit additionally adds a missing dependency on wchar, needed for
python.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/ola/Config.in |  15 ++++++---------
 package/ola/ola.mk    |   2 +-
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/ola/Config.in b/package/ola/Config.in
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -27,14 +27,6 @@ config BR2_PACKAGE_OLA_WEB
 	help
 	  Build OLA with browser interface.
 
-config BR2_PACKAGE_OLA_PYTHON_BINDINGS
-	bool "python bindings"
-	select BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_PROTOBUF
-	depends on BR2_USE_MMU
-	help
-	  Build OLA with support for the Python language.
-
 config BR2_PACKAGE_OLA_SLP
 	bool "slp tools"
 	help
@@ -52,11 +44,16 @@ config BR2_PACKAGE_OLA_EXAMPLES
 
 config BR2_PACKAGE_OLA_RDM_TESTS
 	bool "rdm tests"
-	select BR2_PACKAGE_OLA_PYTHON_BINDINGS
+	select BR2_PACKAGE_PYTHON
 	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR # python
 	help
 	  Build OLA RDM tests.
 
+comment "rdm tests need a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
+
 endmenu
 
 menu "plugin selections"
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -45,7 +45,7 @@ else
 OLA_CONF_OPT += --disable-slp
 endif
 
-ifeq ($(BR2_PACKAGE_OLA_PYTHON_BINDINGS),y)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 OLA_CONF_OPT += --enable-python-libs
 OLA_DEPENDENCIES += python python-protobuf
 else
