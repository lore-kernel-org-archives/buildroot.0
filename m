From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 21:21:02 +0100
Subject: [Buildroot] [git commit] package/alure: new package
Message-ID: <20200112201134.7EAE08B72F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e413a204606df1e7bfda28a1c01e32d5e442d7ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the latest commit since there is no release since 1.2 (8 years ago).

While testing with test-pkg, the last build issue was
due to the gcc 4.8.3 compiler missing C++11 feature:
"std::list.erase(const_iterator pos) not implemented" [1]

arm-none-linux-gnueabi/include/c++/4.8.3/bits/vector.tcc:134:5: note:
no known conversion for argument 1 from '__gnu_cxx::__normal_iterator<const alure::Source*, std::vector<alure::Source> >'
to 'std::vector<alure::Source>::iterator {aka __gnu_cxx::__normal_iterator<alure::Source*, std::vector<alure::Source> >}

https://github.com/kcat/alure/blob/14beed2a86d5a36030e907b21c46614d505f07cd/src/context.cpp#L1357

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57158

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/alure/Config.in  | 27 +++++++++++++++++++++++++++
 package/alure/alure.hash |  2 ++
 package/alure/alure.mk   | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 80843dd1a1..d7b14d14b4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2106,6 +2106,7 @@ F:	package/irssi/
 F:	package/vnstat/
 
 N:	Romain Naour <romain.naour@gmail.com>
+F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
 F:	package/bullet/
diff --git a/package/Config.in b/package/Config.in
index 873a592d64..43fcc20d47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1203,6 +1203,7 @@ menu "Libraries"
 
 menu "Audio/Sound"
 	source "package/alsa-lib/Config.in"
+	source "package/alure/Config.in"
 	source "package/aubio/Config.in"
 	source "package/audiofile/Config.in"
 	source "package/bcg729/Config.in"
diff --git a/package/alure/Config.in b/package/alure/Config.in
new file mode 100644
index 0000000000..4acd66d2ee
--- /dev/null
+++ b/package/alure/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_ALURE
+	bool "alure"
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	depends on BR2_USE_WCHAR # use wchar_t
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
+	select BR2_PACKAGE_OPENAL
+	help
+	  Alure is a C++ 3D audio API. It uses OpenAL for audio
+	  rendering, and provides common higher-level features such as
+	  file loading and decoding, buffer caching, background
+	  streaming, and source management for virtually unlimited
+	  sound source handles.
+
+	  https://kcat.strangesoft.net/alure.html
+
+comment "alure needs a toolchain w/ C++, gcc >= 4.9, NPTL, wchar"
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
+
+comment "alure needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/alure/alure.hash b/package/alure/alure.hash
new file mode 100644
index 0000000000..3387f76f9d
--- /dev/null
+++ b/package/alure/alure.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 9b808e5b5a54d156348221dc86704c7831115047d5238691e6088f8c4814b2ca  alure-14beed2a86d5a36030e907b21c46614d505f07cd.tar.gz
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
new file mode 100644
index 0000000000..efb0c4ccc3
--- /dev/null
+++ b/package/alure/alure.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# alure
+#
+################################################################################
+
+ALURE_VERSION = 14beed2a86d5a36030e907b21c46614d505f07cd
+ALURE_SITE = $(call github,kcat,alure,$(ALURE_VERSION))
+ALURE_LICENSE = Zlib, Public Domain (src/decoders/dr_flac.h)
+ALURE_LICENSE_FILES = LICENSE
+ALURE_INSTALL_STAGING = YES
+
+ALURE_DEPENDENCIES = openal
+
+# Disabling alure examples remove the dependecies on physfs and dump libraries.
+# Enable at least one built-in decoder (wave).
+ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
+	-DALURE_BUILD_EXAMPLES=OFF \
+	-DALURE_ENABLE_FLAC=OFF \
+	-DALURE_ENABLE_MINIMP3=OFF \
+	-DALURE_ENABLE_OPUS=OFF \
+	-DALURE_ENABLE_SNDFILE=OFF \
+	-DALURE_ENABLE_VORBIS=OFF \
+	-DALURE_ENABLE_WAVE=ON
+
+ifeq ($(BR2_STATIC_LIBS),y)
+ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=OFF \
+	-DALURE_BUILD_STATIC=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=ON \
+	-DALURE_BUILD_STATIC=ON
+else
+ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=ON \
+	-DALURE_BUILD_STATIC=OFF
+endif
+
+$(eval $(cmake-package))
