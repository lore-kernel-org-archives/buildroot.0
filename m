From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 May 2019 11:07:15 +0200
Subject: [Buildroot] [git commit] package/openzwave: bump to version 1.6
Message-ID: <20190602201235.6A0498EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d20e251fbc21acc786afc3f82dbb5caf4bd3eac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove all patches (already in version)
- udev is an optional dependency (disabled by default) since
  https://github.com/OpenZWave/open-zwave/commit/89d5b3989fc2cfcf4db85ff9ec71e5c930d6fd33
- Add an upstream patch to fix build

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../openzwave/0001-Fix-compilation-of-MinOZW.patch | 37 --------------------
 ...-Compilers-Get-it-Some-need-a-little-help.patch | 26 +++++++++++++++
 ...ix-warning-on-wcsdup-implicit-declaration.patch | 29 ----------------
 .../0003-Ensure-correct-git-repository-path.patch  | 29 ----------------
 ...ation-error-in-regards-to-Werror-restrict.patch | 39 ----------------------
 package/openzwave/Config.in                        |  5 ++-
 package/openzwave/openzwave.hash                   |  2 +-
 package/openzwave/openzwave.mk                     | 10 ++++--
 8 files changed, 37 insertions(+), 140 deletions(-)

diff --git a/package/openzwave/0001-Fix-compilation-of-MinOZW.patch b/package/openzwave/0001-Fix-compilation-of-MinOZW.patch
deleted file mode 100644
index 773672e0ba..0000000000
--- a/package/openzwave/0001-Fix-compilation-of-MinOZW.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 599e2a11c6f48dde744012ec45686c08e15f3059 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fabrice.fontaine@orange.com>
-Date: Mon, 3 Oct 2016 10:35:52 +0200
-Subject: [PATCH] Fix compilation of MinOZW (#991)
-
-LIBDIR was used in cpp/examples/MinOZW/Makefile to add dynamic
-libraries. However, as it was unset by default, the cross-compilation
-could fail if the host had a library such as libnss3.so in /.
-To fix this issue, this patch sets LIBDIR to top_buildir if it is unset
-
-Fixes:
-  http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898
-
-Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
-[Upstream commit: https://github.com/OpenZWave/open-zwave/commit/599e2a11c6f48dde744012ec45686c08e15f3059]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- cpp/examples/MinOZW/Makefile | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/cpp/examples/MinOZW/Makefile b/cpp/examples/MinOZW/Makefile
-index e575632a3..95d684b77 100644
---- a/cpp/examples/MinOZW/Makefile
-+++ b/cpp/examples/MinOZW/Makefile
-@@ -17,9 +17,11 @@ DEBUG_LDFLAGS	:= -g
- 
- top_srcdir := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))../../../)
- 
-+#where is put the temporary library
-+LIBDIR  	?= $(top_builddir)
- 
- INCLUDES	:= -I $(top_srcdir)/cpp/src -I $(top_srcdir)/cpp/tinyxml/ -I $(top_srcdir)/cpp/hidapi/hidapi/
--LIBS =  $(wildcard $(LIBDIR)/*.so $(LIBDIR)/*.dylib $(top_builddir)/*.so $(top_builddir)/*.dylib $(top_builddir)/cpp/build/*.so $(top_builddir)/cpp/build/*.dylib )
-+LIBS =  $(wildcard $(LIBDIR)/*.so $(LIBDIR)/*.dylib $(top_builddir)/cpp/build/*.so $(top_builddir)/cpp/build/*.dylib )
- LIBSDIR = $(abspath $(dir $(firstword $(LIBS))))
- minozwsrc := $(notdir $(wildcard $(top_srcdir)/cpp/examples/MinOZW/*.cpp))
- VPATH := $(top_srcdir)/cpp/examples/MinOZW
diff --git a/package/openzwave/0001-Fix-issue-1783-Most-Compilers-Get-it-Some-need-a-little-help.patch b/package/openzwave/0001-Fix-issue-1783-Most-Compilers-Get-it-Some-need-a-little-help.patch
new file mode 100644
index 0000000000..51a06a20f1
--- /dev/null
+++ b/package/openzwave/0001-Fix-issue-1783-Most-Compilers-Get-it-Some-need-a-little-help.patch
@@ -0,0 +1,26 @@
+From 3b029a467e83bc7f0054e4dbba1e77e6eac7bc7f Mon Sep 17 00:00:00 2001
+From: Justin Hammond <Justin@dynam.ac>
+Date: Sat, 4 May 2019 02:58:15 +0800
+Subject: [PATCH] Fix issue #1783 - Most Compilers Get it, Some need a little
+ help
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from
+https://github.com/OpenZWave/open-zwave/commit/3b029a467e83bc7f0054e4dbba1e77e6eac7bc7f]
+---
+ cpp/src/CompatOptionManager.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpp/src/CompatOptionManager.cpp b/cpp/src/CompatOptionManager.cpp
+index 90c87b54d..2d9ac435e 100644
+--- a/cpp/src/CompatOptionManager.cpp
++++ b/cpp/src/CompatOptionManager.cpp
+@@ -237,7 +237,7 @@ void CompatOptionManager::WriteXML
+ 	{
+ 		TiXmlElement* valElement = new TiXmlElement( it->first.c_str() );
+ 		char str[32];
+-		TiXmlText * text;
++		TiXmlText * text = NULL;
+ //		std::cout << "Name " << it->first << " Type: " << m_CompatVals[it->second].type << std::endl;
+ 		switch (m_CompatVals[it->second].type) {
+ 			case COMPAT_FLAG_TYPE_BOOL:
diff --git a/package/openzwave/0002-Fix-warning-on-wcsdup-implicit-declaration.patch b/package/openzwave/0002-Fix-warning-on-wcsdup-implicit-declaration.patch
deleted file mode 100644
index 1fe30e41d8..0000000000
--- a/package/openzwave/0002-Fix-warning-on-wcsdup-implicit-declaration.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0878d933223158343af3fe13e03bcd128e8b4cbc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fabrice.fontaine@orange.com>
-Date: Fri, 22 Apr 2016 17:06:27 +0200
-Subject: [PATCH 1/1] Fix warning on wcsdup implicit declaration
-
-Define __GNU_SOURCE in cpp/hidapi/linux/hid.c (like already done in
-cpp/hidapi/libusb/hid.c) to fix implicit declaration of wcsdup function
-
-Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
----
- cpp/hidapi/linux/hid.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/cpp/hidapi/linux/hid.c b/cpp/hidapi/linux/hid.c
-index dbf9b9b..c3eb22b 100644
---- a/cpp/hidapi/linux/hid.c
-+++ b/cpp/hidapi/linux/hid.c
-@@ -21,6 +21,8 @@
-         http://github.com/signal11/hidapi .
- ********************************************************/
- 
-+#define _GNU_SOURCE /* needed for wcsdup() before glibc 2.10 */
-+
- /* C */
- #include <stdio.h>
- #include <string.h>
--- 
-1.9.1
-
diff --git a/package/openzwave/0003-Ensure-correct-git-repository-path.patch b/package/openzwave/0003-Ensure-correct-git-repository-path.patch
deleted file mode 100644
index 6c40ec9d0f..0000000000
--- a/package/openzwave/0003-Ensure-correct-git-repository-path.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 89cdc83307f61422db21cc7965ea294862c128bf Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fabrice.fontaine@orange.com>
-Date: Mon, 30 May 2016 10:37:42 +0200
-Subject: [PATCH 2/2] Ensure correct git repository path
-
-Add "--git-dir ./.git" to ensure the correct git repository path is used (this
-fix a bug when trying to add openzwave to buildroot build system)
-
-Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
----
- cpp/build/support.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cpp/build/support.mk b/cpp/build/support.mk
-index 3f74c7e..f529b25 100644
---- a/cpp/build/support.mk
-+++ b/cpp/build/support.mk
-@@ -29,7 +29,7 @@ GIT		:= $(shell which git)
- ifeq ($(GIT),)
- VERSION_REV ?= 0
- else
--GITVERSION	:= $(shell $(GIT) describe --long --tags --dirty 2>/dev/null | sed s/^v//)
-+GITVERSION	:= $(shell $(GIT) --git-dir ./.git describe --long --tags --dirty 2>/dev/null | sed s/^v//)
- ifeq ($(GITVERSION),)
- GITVERSION	:= $(VERSION_MAJ).$(VERSION_MIN).-1
- VERSION_REV	:= 0
--- 
-2.7.4
-
diff --git a/package/openzwave/0004-Fix-compilation-error-in-regards-to-Werror-restrict.patch b/package/openzwave/0004-Fix-compilation-error-in-regards-to-Werror-restrict.patch
deleted file mode 100644
index b3dbd8f88e..0000000000
--- a/package/openzwave/0004-Fix-compilation-error-in-regards-to-Werror-restrict.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 14164e9920ce3482747483fc16654c82d3ce445f Mon Sep 17 00:00:00 2001
-From: pipiche38 <pipiche38@users.noreply.github.com>
-Date: Fri, 8 Jun 2018 15:13:39 +0200
-Subject: [PATCH] Fix compilation error in regards to -Werror=restrict
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-/usr/share/domoticz/open-zwave/cpp/src/command_classes/DoorLockLogging.cpp: In member function ???virtual bool OpenZWave::DoorLockLogging::HandleMsg(const uint8*, uint32, uint32)???:
-/usr/share/domoticz/open-zwave/cpp/src/command_classes/DoorLockLogging.cpp:312:15: error: passing argument 1 to restrict-qualified parameter aliases with argument 4 [-Werror=restrict]
-      snprintf(usercode, sizeof(usercode), "%s %d", usercode, (int)_data[12+i]);
-               ^~~~~~~~                             ~~~~~~~~
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/OpenZWave/open-zwave/commit/14164e9920ce3482747483fc16654c82d3ce445f]
----
- cpp/src/command_classes/DoorLockLogging.cpp | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/cpp/src/command_classes/DoorLockLogging.cpp b/cpp/src/command_classes/DoorLockLogging.cpp
-index c235a8497..418f61b7d 100644
---- a/cpp/src/command_classes/DoorLockLogging.cpp
-+++ b/cpp/src/command_classes/DoorLockLogging.cpp
-@@ -304,12 +304,13 @@ bool DoorLockLogging::HandleMsg
- 			}
- 			uint8 userid = (_data[10]);
- 			uint8 usercodelength = (_data[11]);
--			char usercode[254];
-+			char usercode[254], tmpusercode[254];
- 			snprintf(usercode, sizeof(usercode), "UserCode:");
- 			if (usercodelength > 0)
- 				for (int i = 0; i < usercodelength; i++ )
- 				{
--					snprintf(usercode, sizeof(usercode), "%s %d", usercode, (int)_data[12+i]);
-+					strncpy(tmpusercode, usercode, sizeof(tmpusercode));
-+                                        snprintf(usercode, sizeof(usercode), "%s %d", tmpusercode, (int)_data[12+i]);
- 				}
- 
- 			if (valid) {
diff --git a/package/openzwave/Config.in b/package/openzwave/Config.in
index 86f45dc7b6..7819a620d2 100644
--- a/package/openzwave/Config.in
+++ b/package/openzwave/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_OPENZWAVE
 	bool "openzwave"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_WCHAR
 	help
 	  Free software library that interfaces with selected Z-Wave
@@ -12,6 +11,6 @@ config BR2_PACKAGE_OPENZWAVE
 
 	  http://www.openzwave.net
 
-comment "openzwave needs udev and a toolchain w/ C++, threads, wchar"
+comment "openzwave needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV || !BR2_USE_WCHAR
+		!BR2_USE_WCHAR
diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
index f3a677bd47..154a6443c0 100644
--- a/package/openzwave/openzwave.hash
+++ b/package/openzwave/openzwave.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	abfb4c7e7728e86ba374c2e0ef7de912594eb24a8c44935457352df844530238	openzwave-V1.5.tar.gz
+sha256	3b11dffa7608359c8c848451863e0287e17f5f101aeee7c2e89b7dc16f87050b	openzwave-v1.6.tar.gz
 sha256	c8db08727d03bea1213cdb29459b4b489b0d68a0866765df40ff205c6cd7224b	license/license.txt
 sha256	4da452226e9064b597020ad404e1c78d8175bc31ad7c1908485a92c0a4d70284	license/lgpl.txt
 sha256	33ffdead480674d5f33e2934822a3b93c93e3f8c894667a3bf30bd1195b38f83	license/gpl.txt
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 38515e3899..9da414d112 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-OPENZWAVE_VERSION = V1.5
+OPENZWAVE_VERSION = v1.6
 OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
 OPENZWAVE_LICENSE = LGPL-3.0+, GPL-3.0 (examples), Apache-2.0 (sh2ju.sh)
 OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
 	license/gpl.txt license/Apache-License-2.0.txt
 
-OPENZWAVE_DEPENDENCIES = host-pkgconf udev
 OPENZWAVE_INSTALL_STAGING = YES
 
 # Set instlibdir to install libopenzwave.so* in the correct directory
@@ -31,6 +30,13 @@ OPENZWAVE_MAKE_OPTS = \
 	sysconfdir=/etc/openzwave \
 	DOXYGEN=
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+OPENZWAVE_DEPENDENCIES += host-pkgconf udev
+OPENZWAVE_MAKE_OPTS += USE_HID=1
+else
+OPENZWAVE_MAKE_OPTS += USE_HID=0
+endif
+
 define OPENZWAVE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(OPENZWAVE_MAKE_OPTS) -C $(@D)
 endef
