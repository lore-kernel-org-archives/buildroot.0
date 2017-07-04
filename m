From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:38 +0200
Subject: [Buildroot] [git commit] docs/manual: update gettext details
Message-ID: <20170704233520.CB6C97FDE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=610908e1dbea6f709a82c64c929c1fa53f08899f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The way gettext is handled in Buildroot has significantly changed,
with changes visible to packages. This commit updates the relevant
section of the manual to document how packages should now interact
with the gettext support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-gettext.txt | 83 +++++++++++++++++----------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index c955b1f..e9c6968 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -7,53 +7,54 @@ Many packages that support internationalization use the gettext
 library. Dependencies for this library are fairly complicated and
 therefore, deserve some explanation.
 
-The 'uClibc' C library doesn't implement gettext functionality;
-therefore with this C library, a separate gettext must be compiled,
-which is provided by the additional +libintl+ library, part of the
+The 'glibc' C library integrates a full-blown implementation of
+'gettext', supporting translation. Native Language Support is
+therefore built-in in 'glibc'.
+
+On the other hand, the 'uClibc' and 'musl' C libraries only provide a
+stub implementation of the gettext functionality, which allows to
+compile libraries and programs using gettext functions, but without
+providing the translation capabilities of a full-blown gettext
+implementation. With such C libraries, if real Native Language Support
+is necessary, it can be provided by the +libintl+ library of the
 +gettext+ package.
 
-On the other hand, the 'glibc' C library does integrate its own
-gettext library functions, so it is not necessary to build a separate
-+libintl+ library.
+Due to this, and in order to make sure that Native Language Support is
+properly handled, packages in Buildroot that can use NLS support
+should:
 
-However, certain packages need some gettext utilities on the target,
+1. Ensure NLS support is enabled when +BR2_SYSTEM_ENABLE_NLS=y+. This
+   is done automatically for 'autotools' packages and therefore should
+   only be done for packages using other package infrastructures.
+
+1. Add +$(TARGET_NLS_DEPENDENCIES)+ to the package
+   +<pkg>_DEPENDENCIES+ variable. This addition should be done
+   unconditionally: the value of this variable is automatically
+   adjusted by the core infrastructure to contain the relevant list of
+   packages. If NLS support is disabled, this variable is empty. If
+   NLS support is enabled, this variable contains +host-gettext+ so
+   that tools needed to compile translation files are available on the
+   host. In addition, if 'uClibc' or 'musl' are used, this variable
+   also contains +gettext+ in order to get the full-blown 'gettext'
+   implementation.
+
+1. If needed, add +$(TARGET_NLS_LIBS)+ to the linker flags, so that
+   the package gets linked with +libintl+. This is generally not
+   needed with 'autotools' packages as they usually detect
+   automatically that they should link with +libintl+. However,
+   packages using other build systems, or problematic autotools-based
+   packages may need this. +$(TARGET_NLS_LIBS)+ should be added
+   unconditionally to the linker flags, as the core automatically
+   makes it empty or defined to +-lintl+ depending on the
+   configuration.
+
+No changes should be made to the +Config.in+ file to support NLS.
+
+Finally, certain packages need some gettext utilities on the target,
 such as the +gettext+ program itself, which allows to retrieve
-translated strings, from the command line.
-
-Additionally, some packages (such as +libglib2+) do require gettext
-functions unconditionally, while other packages (in general, those who
-support +--disable-nls+) only require gettext functions when locale
-support is enabled.
-
-Therefore, Buildroot defines two configuration options:
-
-* +BR2_NEEDS_GETTEXT+, which is true as soon as the toolchain doesn't
-  provide its own gettext implementation
-
-* +BR2_NEEDS_GETTEXT_IF_LOCALE+, which is true if the toolchain
-  doesn't provide its own gettext implementation and if locale support
-  is enabled
-
-Packages that need gettext only when locale support is enabled should:
-
-* use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE+ in the
-  +Config.in+ file;
-
-* use +$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)+ in the package
-  +DEPENDENCIES+ variable in the +.mk+ file.
-
-Packages that unconditionally need gettext (which should be very rare)
+translated strings, from the command line. In such a case, the package
 should:
 
-* use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT+ in the +Config.in+
-  file;
-
-* use +$(if $(BR2_NEEDS_GETTEXT),gettext)+ in the package
-  +DEPENDENCIES+ variable in the +.mk+ file.
-
-Packages that need the +gettext+ utilities on the target (should be
-rare) should:
-
 * use +select BR2_PACKAGE_GETTEXT+ in their +Config.in+ file,
   indicating in a comment above that it's a runtime dependency only.
 
