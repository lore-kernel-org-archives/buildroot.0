From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 24 Nov 2016 22:18:18 +0100
Subject: [Buildroot] [PATCH] package/ola: fix missing numpy
Message-ID: <20161124211818.14096-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OLAs RDM test option needs NumPy.

Note that we need to pass `ac_cv_have_pymod_numpy=yes` as NumPy builds some
shared libraries and ola checks for NumPy using a host Python test program
which fails with 'wrong ELF class'.

Fixes:
http://autobuild.buildroot.net/results/750/750c9bcc753e2c1b7b05d6c43fabf4c405e15f04/
http://autobuild.buildroot.net/results/24a/24ada1e0ec695cb12028048728a9d1e2bcf75a03/
http://autobuild.buildroot.net/results/111/111c5f3eed6a5931de27a1b0b02be6e2114198e6/
.. and more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/ola/Config.in | 2 ++
 package/ola/ola.mk    | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 7b56f5c..2f1d33e 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -54,6 +54,8 @@ config BR2_PACKAGE_OLA_EXAMPLES
 config BR2_PACKAGE_OLA_RDM_TESTS
 	bool "rdm tests"
 	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Build OLA RDM tests.
 
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 75ab25e..24e53e4 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -87,6 +87,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_OLA_RDM_TESTS),y)
 OLA_CONF_OPTS += --enable-rdm-tests
+OLA_DEPENDENCIES += python-numpy
+# needed as numpy builds some shared libraries and ola checks for numpy
+# using a host python test program which fails with 'wrong ELF class'.
+OLA_CONF_ENV = ac_cv_have_pymod_numpy=yes
 else
 OLA_CONF_OPTS += --disable-rdm-tests
 endif
-- 
2.10.2
