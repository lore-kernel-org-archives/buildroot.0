From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 15 May 2015 15:05:19 -0300
Subject: [Buildroot] [PATCH v2 1/1] gmock: new package
In-Reply-To: <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
References: <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <1431713119-2821-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
specifics in mind, Google C++ Mocking Framework (or Google Mock for
short) is a library for writing and using C++ mock classes.

Google Mock:

  * lets you create mock classes trivially using simple macros,
  * supports a rich set of matchers and actions,
  * handles unordered, partially ordered, or completely ordered
    expectations,
  * is extensible by users, and
  * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
    Symbian.

  http://code.google.com/p/googlemock/

There are both host and target packages. The target one has include
files required to compile the tests and the static libraries required
to link/run them. The host package installs gmock_gen, a Python script
used to generate code mocks.

Signed-off-by: Marcelo Barbosa <marcelo.barbosa@datacom.ind.br>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/Config.in        |  1 +
 package/gmock/Config.in  | 31 +++++++++++++++++++++++++++++
 package/gmock/gmock.hash |  2 ++
 package/gmock/gmock.mk   | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 package/gmock/Config.in
 create mode 100644 package/gmock/gmock.hash
 create mode 100644 package/gmock/gmock.mk

diff --git a/package/Config.in b/package/Config.in
index af4d2b7..3190bf8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1014,6 +1014,7 @@ menu "Other"
 	source "package/flann/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
+	source "package/gmock/Config.in"
 	source "package/gmp/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
diff --git a/package/gmock/Config.in b/package/gmock/Config.in
new file mode 100644
index 0000000..8a18c29
--- /dev/null
+++ b/package/gmock/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_GMOCK
+	bool "gmock"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	help
+	  Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
+	  specifics in mind, Google C++ Mocking Framework (or Google Mock for
+	  short) is a library for writing and using C++ mock classes.
+	  
+	  Google Mock:
+	  
+	    * lets you create mock classes trivially using simple macros,
+	    * supports a rich set of matchers and actions,
+	    * handles unordered, partially ordered, or completely ordered
+	      expectations,
+	    * is extensible by users, and
+	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
+	      Symbian.
+	  
+	    http://code.google.com/p/googlemock/
+	  
+	  There are both host and target packages. The target one has include
+	  files required to compile the tests and the static libraries required
+	  to link/run them. The host package installs gmock_gen, a Python script
+	  used to generate code mocks.
+
+comment "gmock needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
new file mode 100644
index 0000000..2b71739
--- /dev/null
+++ b/package/gmock/gmock.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b  gmock-1.7.0.zip
diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
new file mode 100644
index 0000000..3a7173e
--- /dev/null
+++ b/package/gmock/gmock.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# gmock
+#
+################################################################################
+
+GMOCK_VERSION = 1.7.0
+GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
+GMOCK_SITE = http://googlemock.googlecode.com/files
+GMOCK_INSTALL_STAGING = YES
+GMOCK_INSTALL_TARGET = NO
+GMOCK_LICENSE = BSD-3c
+GMOCK_LICENSE_FILES = LICENSE
+GMOCK_DEPENDENCIES = gtest
+HOST_GMOCK_DEPENDENCIES = host-python
+
+GMOCK_CONF_OPTS = --enable-static --disable-shared
+
+define GMOCK_EXTRACT_CMDS
+	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(BUILD_DIR)
+endef
+
+# We can't use the default rule for autotools-package staging because it fails
+# because it tries to rebuild/install gtest stuff and fails after this error:
+#    "'make install' is dangerous and not supported. Instead, see README for
+#      how to integrate Google Test into your build system."
+define GMOCK_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
+	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
+	cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
+endef
+
+# Unzipping inside $(@D) and moving everything from the created subdirectory is
+# required because unzipping directly in $(BUILD_DIR) would cause host-gmock to
+# overwrite the gmock subdir instead of unzipping in a host-gmock subdir.
+define HOST_GMOCK_EXTRACT_CMDS
+	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(@D)
+	mv $(@D)/gmock-$(GMOCK_VERSION)/* $(@D)
+	rmdir $(@D)/gmock-$(GMOCK_VERSION)
+endef
+
+define HOST_GMOCK_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
+	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
+	cp -rp $(@D)/scripts/generator/cpp $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+endef
+
+$(eval $(autotools-package))
+# The host package does not build anything, just installs gmock_gen stuff, so
+# it does not need to be a host-autotools-package.
+$(eval $(host-generic-package))
-- 
2.1.0
