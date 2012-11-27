From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2012 09:30:12 +0100
Subject: [Buildroot] [PATCH for-2012.11 3/4] manual: give example where
	_INSTALL_TARGET = NO
In-Reply-To: <1354005013-28626-1-git-send-email-arnout@mind.be>
References: <1354005013-28626-1-git-send-email-arnout@mind.be>
Message-ID: <1354005013-28626-3-git-send-email-arnout@mind.be>
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
---
 .topdeps                                  |    2 +-
 .topmsg                                   |    7 ++++++-
 docs/manual/adding-packages-autotools.txt |   16 ++++++++--------
 docs/manual/adding-packages-cmake.txt     |   14 +++++++-------
 4 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/.topdeps b/.topdeps
index d46ee1c..1d0f8a5 100644
--- a/.topdeps
+++ b/.topdeps
@@ -1 +1 @@
-t/manual
+t/manual-target-warning
diff --git a/.topmsg b/.topmsg
index 367c0df..d1713c4 100644
--- a/.topmsg
+++ b/.topmsg
@@ -1,4 +1,9 @@
 From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-Subject: [PATCH] manual: more warnings to not use output/target
+Subject: [PATCH] manual: give example where _INSTALL_TARGET = NO
+
+The tutorial for autotools-package and cmake-package currently gives
+the bad example of setting _INSTALL_TARGET to YES, which is the default.
+So change this into an example with _INSTALL_TARGET = NO, and explain in
+which case this is relevant.
 
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 4127df4..84d76f9 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -21,8 +21,8 @@ package, with an example :
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
@@ -44,13 +44,13 @@ other libraries or applications depending on them. Also by default, when
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
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 4a9e893..bb1705b 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -21,7 +21,7 @@ with an example :
 07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
 08: LIBFOO_SITE = http://www.foosoftware.org/download
 09: LIBFOO_INSTALL_STAGING = YES
-10: LIBFOO_INSTALL_TARGET = YES
+10: LIBFOO_INSTALL_TARGET = NO
 11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 13:
@@ -44,13 +44,13 @@ other libraries or applications depending on them. Also by default, when
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
-- 
1.7.10.4
