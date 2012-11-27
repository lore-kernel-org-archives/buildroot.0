From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2012 22:59:19 +0100
Subject: [Buildroot] [PATCHv3 for-2012.11 4/5] manual: give example where
	_INSTALL_TARGET = NO
In-Reply-To: <1354053560-30352-1-git-send-email-arnout@mind.be>
References: <1354053560-30352-1-git-send-email-arnout@mind.be>
Message-ID: <1354053560-30352-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The tutorial for autotools-package and cmake-package currently gives
the bad example of setting _INSTALL_TARGET to YES, which is the default.
So change this into an example with _INSTALL_TARGET = NO, and explain in
which case this is relevant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-autotools.txt |   16 ++++++++--------
 docs/manual/adding-packages-cmake.txt     |   14 +++++++-------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 4127df4..84d76f9 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -19,12 +19,12 @@ package, with an example :
 05: #############################################################
 06: LIBFOO_VERSION = 1.0
 07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
 08: LIBFOO_SITE = http://www.foosoftware.org/download
 09: LIBFOO_INSTALL_STAGING = YES
-10: LIBFOO_INSTALL_TARGET = YES
-11: LIBFOO_CONF_OPT = --enable-shared
+10: LIBFOO_INSTALL_TARGET = NO
+11: LIBFOO_CONF_OPT = --disable-shared
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 13:
 14: $(eval $(autotools-package))
 ------------------------
 
@@ -42,17 +42,17 @@ staging directory, since usually, only libraries need to be installed in
 the staging directory: their development files are needed to compile
 other libraries or applications depending on them. Also by default, when
 staging installation is enabled, packages are installed in this location
 using the +make install+ command.
 
-On line 10, we tell Buildroot to also install the package to the
+On line 10, we tell Buildroot to not install the package to the
 target directory. This directory contains what will become the root
-filesystem running on the target. Usually, we try not to install header
-files and to install stripped versions of the binary. By default, target
-installation is enabled, so in fact, this line is not strictly
-necessary. Also by default, packages are installed in this location
-using the +make install+ command.
+filesystem running on the target. For purely static libraries, it is
+not necessary to install them in the target directory because they will
+not be used at runtime. By default, target installation is enabled; setting
+this variable to NO is almost never needed. Also by default, packages are
+installed in this location using the +make install+ command.
 
 On line 11, we tell Buildroot to pass a custom configure option, that
 will be passed to the +./configure+ script before configuring
 and building the package.
 
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 4a9e893..bb1705b 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -19,11 +19,11 @@ with an example :
 05: #############################################################
 06: LIBFOO_VERSION = 1.0
 07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
 08: LIBFOO_SITE = http://www.foosoftware.org/download
 09: LIBFOO_INSTALL_STAGING = YES
-10: LIBFOO_INSTALL_TARGET = YES
+10: LIBFOO_INSTALL_TARGET = NO
 11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 13:
 14: $(eval $(cmake-package))
 ------------------------
@@ -42,17 +42,17 @@ staging directory, since usually, only libraries need to be installed in
 the staging directory: their development files are needed to compile
 other libraries or applications depending on them. Also by default, when
 staging installation is enabled, packages are installed in this location
 using the +make install+ command.
 
-On line 10, we tell Buildroot to also install the package to the
+On line 10, we tell Buildroot to not install the package to the
 target directory. This directory contains what will become the root
-filesystem running on the target. Usually, we try not to install header
-files and to install stripped versions of the binary. By default, target
-installation is enabled, so in fact, this line is not strictly
-necessary. Also by default, packages are installed in this location
-using the +make install+ command.
+filesystem running on the target. For purely static libraries, it is
+not necessary to install them in the target directory because they will
+not be used at runtime. By default, target installation is enabled; setting
+this variable to NO is almost never needed. Also by default, packages are
+installed in this location using the +make install+ command.
 
 On line 11, we tell Buildroot to pass custom options to CMake when it is
 configuring the package.
 
 On line 12, we declare our dependencies, so that they are built
-- 
1.7.10.4
