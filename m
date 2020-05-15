From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 15 May 2020 15:31:20 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: use system
 libargon2
Message-ID: <20200515213120.1174774-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python-argon2-cffi package can be used with the system libargon2,
we should use that instead of the embedded version.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-argon2-cffi/Config.in             | 3 +++
 package/python-argon2-cffi/python-argon2-cffi.mk | 7 ++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/python-argon2-cffi/Config.in b/package/python-argon2-cffi/Config.in
index c1adcbc77d..16bbe6c4e3 100644
--- a/package/python-argon2-cffi/Config.in
+++ b/package/python-argon2-cffi/Config.in
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_PYTHON_ARGON2_CFFI
 	bool "python-argon2-cffi"
+	depends on BR2_USE_MMU # libargon2
+	depends on !BR2_STATIC_LIBS # libargon2
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_LIBARGON2
 	help
 	  The secure Argon2 password hashing algorithm.
 
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index 0e3e1be3d6..674e089eb7 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -10,12 +10,13 @@ PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/74/fd/d78e003a
 PYTHON_ARGON2_CFFI_SETUP_TYPE = setuptools
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
-PYTHON_ARGON2_CFFI_DEPENDENCIES = host-python-cffi
+PYTHON_ARGON2_CFFI_DEPENDENCIES = host-python-cffi libargon2
+PYTHON_ARGON2_CFFI_ENV = ARGON2_CFFI_USE_SYSTEM=1
 
 ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
-PYTHON_ARGON2_CFFI_ENV = ARGON2_CFFI_USE_SSE2=1
+PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=1
 else
-PYTHON_ARGON2_CFFI_ENV = ARGON2_CFFI_USE_SSE2=0
+PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=0
 endif
 
 $(eval $(python-package))
-- 
2.25.1
