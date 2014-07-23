From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 20:33:19 +0200
Subject: [Buildroot] [PATCH 2/4] python3: optional decimal module support
In-Reply-To: <1406140401-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1406140401-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1406140401-16997-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit makes the decimal module support optional: since Python
3.3 it relies on an external library. The source code of this library
is available built-in as part of the Python sources, but in Buildroot
we generally prefer to use the external library when possible.

To achieve this, this commit adds a patch to Python that is similar to
the one we use for expat support, but this time for the
libmpdec/mpdecimal library.

As a consequence, since mpdecimal now builds properly even when
<fenv.h> is not available (on i386), this commit fixes:

  http://autobuild.buildroot.org/results/b64/b64d5c941a7cac00619da3a0696939f86a8eafc2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/Config.in                          |  6 +++
 package/python3/python3-111-optional-decimal.patch | 53 ++++++++++++++++++++++
 package/python3/python3.mk                         |  7 +++
 3 files changed, 66 insertions(+)
 create mode 100644 package/python3/python3-111-optional-decimal.patch

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 12928f6..3e193c8 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -54,6 +54,12 @@ config BR2_PACKAGE_PYTHON3_CURSES
 	help
 	  curses module for Python3.
 
+config BR2_PACKAGE_PYTHON3_DECIMAL
+	select BR2_PACKAGE_MPDECIMAL
+	bool "decimal module"
+	help
+	  decimal module for Python3.
+
 config BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_EXPAT
 	bool "pyexpat"
diff --git a/package/python3/python3-111-optional-decimal.patch b/package/python3/python3-111-optional-decimal.patch
new file mode 100644
index 0000000..d895ee5
--- /dev/null
+++ b/package/python3/python3-111-optional-decimal.patch
@@ -0,0 +1,53 @@
+Add an option to disable decimal
+
+This patch replaces the existing --with-system-libmpdec option with a
+--with-libmpdec={system,builtin,none} option, which allows to tell
+Python whether we want to use the system libmpdec (already installed),
+the libmpdec builtin the Python sources, or no libmpdec at all.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -2385,13 +2385,20 @@
+ AC_MSG_RESULT($with_system_ffi)
+ 
+ # Check for use of the system libmpdec library
+-AC_MSG_CHECKING(for --with-system-libmpdec)
+-AC_ARG_WITH(system_libmpdec,
+-            AS_HELP_STRING([--with-system-libmpdec], [build _decimal module using an installed libmpdec library]),
++AC_MSG_CHECKING(for --with-libmpdec)
++AC_ARG_WITH(libmpdec,
++            AS_HELP_STRING([--with-libmpdec], [select which libmpdec version to use: system, builtin, none]),
+             [],
+-            [with_system_libmpdec="no"])
++            [with_libmpdec="builtin"])
+ 
+-AC_MSG_RESULT($with_system_libmpdec)
++AC_MSG_RESULT($with_libmpdec)
++if test "$with_libmpdec" != "none"; then
++   MPDEC=yes
++else
++   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _decimal"
++   MPDEC=no
++fi
++AC_SUBST(MPDEC)
+ 
+ # Check for support for loadable sqlite extensions
+ AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -1972,7 +1972,7 @@
+     def _decimal_ext(self):
+         extra_compile_args = []
+         undef_macros = []
+-        if '--with-system-libmpdec' in sysconfig.get_config_var("CONFIG_ARGS"):
++        if '--with-libmpdec=system' in sysconfig.get_config_var("CONFIG_ARGS"):
+             include_dirs = []
+             libraries = [':libmpdec.so.2']
+             sources = ['_decimal/_decimal.c']
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1591ac9..3aa22b2 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -51,6 +51,13 @@ else
 PYTHON3_CONF_OPT += --disable-curses
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_DECIMAL),y)
+PYTHON3_DEPENDENCIES += mpdecimal
+PYTHON3_CONF_OPT += --with-libmpdec=system
+else
+PYTHON3_CONF_OPT += --with-libmpdec=none
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
 PYTHON3_DEPENDENCIES += expat
 PYTHON3_CONF_OPT += --with-expat=system
-- 
2.0.0
