From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:32:48 +0100
Subject: [Buildroot] [git commit] python3: make the ossaudiodev module
	optional
Message-ID: <20150110153345.5D86A7FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be6798ace7594eeef8a45d9a2c9e64cf6e3cb5b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like was done for the 'python' package, also make the ossaudiodev
module optional for 'python3'. ossaudiodev is always disabled for
host-python3, and a new option is added to enable it for the target
python3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/112-optional-ossaudiodev.patch |   21 +++++++++++++++++++++
 package/python3/Config.in                      |    5 +++++
 package/python3/python3.mk                     |    7 +++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/python3/112-optional-ossaudiodev.patch b/package/python3/112-optional-ossaudiodev.patch
new file mode 100644
index 0000000..bc5ceca
--- /dev/null
+++ b/package/python3/112-optional-ossaudiodev.patch
@@ -0,0 +1,21 @@
+Add an option to disable the ossaudiodev module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -2417,6 +2417,12 @@
+ fi
+ AC_SUBST(MPDEC)
+ 
++AC_ARG_ENABLE(ossaudiodev,
++	AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
++	[ if test "$enableval" = "no"; then
++	  DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
++	  fi])
++
+ # Check for support for loadable sqlite extensions
+ AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
+ AC_ARG_ENABLE(loadable-sqlite-extensions,
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 375390f..c3118c8 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -61,6 +61,11 @@ config BR2_PACKAGE_PYTHON3_DECIMAL
 	help
 	  decimal module for Python3.
 
+config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
+	bool "ossaudiodev module"
+	help
+	  ossaudiodev module for Python3.
+
 config BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_EXPAT
 	bool "pyexpat"
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f6663dc..b12c460 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -36,6 +36,7 @@ HOST_PYTHON3_CONF_OPTS += 	\
 	--enable-unicodedata	\
 	--disable-test-modules	\
 	--disable-idle3		\
+	--disable-ossaudiodev	\
 	--disable-pyo-build
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
@@ -108,6 +109,12 @@ ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
 PYTHON3_DEPENDENCIES += zlib
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
+PYTHON3_CONF_OPTS += --enable-ossaudiodev
+else
+PYTHON3_CONF_OPTS += --disable-ossaudiodev
+endif
+
 PYTHON3_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
 	ac_cv_file__dev_ptmx=yes \
