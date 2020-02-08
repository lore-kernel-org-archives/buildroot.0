From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2020 20:01:10 +0100
Subject: [Buildroot] [git commit] package/sdl_mixer: fix build after aclocal
 include revamp
Message-ID: <20200208185443.7ED248D4F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03a8884c469b96fa85042cd551774f98491687c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After d255b67972 (autotools: do not overwrite first include path), the
ordering of include paths has changed: the system directories are
specified with explicit options passed to autoreconf, which means that
any directory specified in the package _AUTORECONF_OPTS are no longer
first:

  - in package/autoconf/autoconf.mk, we define AUTORECONF as:
    AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"

  - in package/pkg-autotools.mk, we call AUTORECONF with:
    $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)

So, the include directory specified by SDL_MIXER_AUTORECONF_OPTS is now
lagging behind the system headers, and the very issue that d255b67972
was suposed to fix in a generic way, pops up back for this specific
case.

We fix that by patching sdl_mixer so that it uses the bog-down standard
mechanisms, to specify the macro directory from within configure.in,
instead of specifying it on the command line, so that the magic
introduced by d255b67972 does happen.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-configure__set_macro_directory.patch      | 34 ++++++++++++++++++++++
 package/sdl_mixer/sdl_mixer.mk                     |  1 -
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/package/sdl_mixer/0004-configure__set_macro_directory.patch b/package/sdl_mixer/0004-configure__set_macro_directory.patch
new file mode 100644
index 0000000000..5b47f0e80d
--- /dev/null
+++ b/package/sdl_mixer/0004-configure__set_macro_directory.patch
@@ -0,0 +1,34 @@
+# HG changeset patch
+# User "Yann E. MORIN" <yann.morin.1998@free.fr>
+# Date 1581183281 -3600
+#      Sat Feb 08 18:34:41 2020 +0100
+# Node ID 753a1f394620056c35790a571ff5f7c248445943
+# Parent  eb5f08bf9994bf5164ca68015f2e030c2c9dddcd
+configure: set macro directory
+
+Setting the macro directory in configure.in, rather than specifying it
+on the command line, ensures that it is properly searched in the correct
+order, and that autoreconf properly updates our macros with the newer
+system ones, if any.
+
+Fixes:
+    http://autobuild.buildroot.org/results/63a/63ae0bddb3c4436efe967c318e299047f496c5a5/build-end.log
+
+    libtool: Version mismatch error.  This is libtool 2.4.6, but the
+    libtool: definition of this LT_INIT comes from libtool 2.2.6.
+    libtool: You should recreate aclocal.m4 with macros from libtool 2.4.6
+    libtool: and run autoconf again.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+
+diff --git a/configure.in b/configure.in
+--- a/configure.in
++++ b/configure.in
+@@ -1,6 +1,7 @@
+ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT(README)
+ AC_CONFIG_AUX_DIR(build-scripts)
++AC_CONFIG_MACRO_DIR([acinclude])
+ 
+ dnl Set various version strings - taken gratefully from the GTk sources
+ 
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index ab6f7ef014..73eb821ff3 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -18,7 +18,6 @@ SDL_MIXER_DEPENDENCIES = sdl
 
 # We're patching configure.in, so we need to autoreconf
 SDL_MIXER_AUTORECONF = YES
-SDL_MIXER_AUTORECONF_OPTS = -Iacinclude
 
 SDL_MIXER_CONF_OPTS = \
 	--without-x \
