From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 08:35:11 +0100
Subject: [Buildroot] [git commit] package/webkitgtk: add option to enable
 sandboxing support
Message-ID: <20191213072642.C1E738A445@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0720ddc20321e390ca7812603300e6763198f199
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to enable WebKit's sandbox, which uses kernel
namespaces to isolate the processes used for Web content rendering
(WebKitWebProcess) and network/disk access (WebKitNetworkProcess).

The reason to have an option is that it needs additional dependencies
(bubblewrap, xdg-dbus-proxy, libseccomp), and that some users may
choose to deploy alternative solutions (for example: putting all
of WebKit inside its own container, using systemd-nspawn or the
like).

Patch "0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch"
is imported from upstream, as it is needed to avoid trying to run
the "bwrap" command from the target during cross-compilation.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...not-run-the-Bubblewrap-executable-when-co.patch | 87 ++++++++++++++++++++++
 package/webkitgtk/Config.in                        | 14 ++++
 package/webkitgtk/webkitgtk.mk                     | 12 ++-
 3 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch b/package/webkitgtk/0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch
new file mode 100644
index 0000000000..3381cbbfb6
--- /dev/null
+++ b/package/webkitgtk/0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch
@@ -0,0 +1,87 @@
+From a725f6fbe6630a980f5ac74d79fd3e18557190bc Mon Sep 17 00:00:00 2001
+From: "aperez at igalia.com"
+ <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Sun, 15 Sep 2019 13:30:01 +0000
+Subject: [PATCH xserver 2/2] [GTK][WPE] Do not run the Bubblewrap executable
+ when configuring for cross-compilation
+ https://bugs.webkit.org/show_bug.cgi?id=201340
+
+Reviewed by Konstantin Tokarev.
+
+* Source/cmake/BubblewrapSandboxChecks.cmake: Do not run the
+Bubblewrap executable when cross-compiling to guess its version.
+Emit a warning instead and trust that valid run-time paths will
+be set using the BWRAP_EXECUTABLE and DBUS_PROXY_EXECUTABLE
+variables. While at it, fix the regular expression used to match
+the version string in the Bubblewrap output when not cross-compiling.
+
+Fetch from: https://bugs.webkit.org/show_bug.cgi?id=201340
+Upstream-Status: Accepted
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+---
+ ChangeLog                                  | 14 ++++++++
+ Source/cmake/BubblewrapSandboxChecks.cmake | 41 ++++++++++++++--------
+ 2 files changed, 41 insertions(+), 14 deletions(-)
+
+diff --git a/Source/cmake/BubblewrapSandboxChecks.cmake b/Source/cmake/BubblewrapSandboxChecks.cmake
+index ac8fbbf3c8e..73cf4ffed35 100644
+--- a/Source/cmake/BubblewrapSandboxChecks.cmake
++++ b/Source/cmake/BubblewrapSandboxChecks.cmake
+@@ -3,20 +3,6 @@ if (ENABLE_BUBBLEWRAP_SANDBOX)
+     if (NOT BWRAP_EXECUTABLE)
+         message(FATAL_ERROR "bwrap executable is needed for ENABLE_BUBBLEWRAP_SANDBOX")
+     endif ()
+-    add_definitions(-DBWRAP_EXECUTABLE="${BWRAP_EXECUTABLE}")
+-
+-    execute_process(
+-        COMMAND "${BWRAP_EXECUTABLE}" --version
+-        RESULT_VARIABLE BWRAP_RET
+-        OUTPUT_VARIABLE BWRAP_OUTPUT
+-    )
+-    if (BWRAP_RET)
+-        message(FATAL_ERROR "Failed to run ${BWRAP_EXECUTABLE}")
+-    endif ()
+-    string(REGEX MATCH "([0-9]+.[0-9]+.[0-9]+)" BWRAP_VERSION "${BWRAP_OUTPUT}")
+-    if (NOT "${BWRAP_VERSION}" VERSION_GREATER_EQUAL "0.3.1")
+-        message(FATAL_ERROR "bwrap must be >= 0.3.1 but ${BWRAP_VERSION} found")
+-    endif ()
+ 
+     find_package(Libseccomp)
+     if (NOT LIBSECCOMP_FOUND)
+@@ -27,5 +13,32 @@ if (ENABLE_BUBBLEWRAP_SANDBOX)
+     if (NOT DBUS_PROXY_EXECUTABLE)
+         message(FATAL_ERROR "xdg-dbus-proxy not found and is needed for ENABLE_BUBBLEWRAP_SANDBOX")
+     endif ()
++
++    if (NOT CMAKE_CROSSCOMPILING)
++        execute_process(
++            COMMAND "${BWRAP_EXECUTABLE}" --version
++            RESULT_VARIABLE BWRAP_RET
++            OUTPUT_VARIABLE BWRAP_OUTPUT
++        )
++        if (BWRAP_RET)
++            message(FATAL_ERROR "Failed to run ${BWRAP_EXECUTABLE}")
++        endif ()
++        string(REGEX MATCH "[0-9]+\\.[0-9]+\\.[0-9]+" BWRAP_VERSION "${BWRAP_OUTPUT}")
++        if (NOT "${BWRAP_VERSION}" VERSION_GREATER_EQUAL "0.3.1")
++            message(FATAL_ERROR "bwrap must be >= 0.3.1 but ${BWRAP_VERSION} found")
++        endif ()
++    elseif (NOT SILENCE_CROSS_COMPILATION_NOTICES)
++        message(NOTICE
++            "***--------------------------------------------------------***\n"
++            "***  Cannot check Bubblewrap version when cross-compiling. ***\n"
++            "***  The target system MUST have version 0.3.1 or newer.   ***\n"
++            "***  Use the BWRAP_EXECUTABLE and DBUS_PROXY_EXECUTABLE    ***\n"
++            "***  variables to set the run-time paths for the 'bwrap'   ***\n"
++            "***  and 'xdg-dbus-proxy' programs.                        ***\n"
++            "***--------------------------------------------------------***"
++        )
++    endif ()
++
++    add_definitions(-DBWRAP_EXECUTABLE="${BWRAP_EXECUTABLE}")
+     add_definitions(-DDBUS_PROXY_EXECUTABLE="${DBUS_PROXY_EXECUTABLE}")
+ endif ()
+-- 
+2.23.0
+
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 4fbf5a190a..87de91f554 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -55,6 +55,20 @@ config BR2_PACKAGE_WEBKITGTK
 
 if BR2_PACKAGE_WEBKITGTK
 
+config BR2_PACKAGE_WEBKITGTK_SANDBOX
+	bool "sandboxing support"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	select BR2_PACKAGE_BUBBLEWRAP # runtime
+	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
+	help
+	  Enable sandboxing of the processes used for network operation,
+	  disk access, and Web content rendering.
+
+comment "sandboxing support needs a toolchain w/ headers >= 3.12"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
 	depends on !BR2_STATIC_LIBS # libsoup -> glib-networking, gnutls
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 1273c1afe8..27ae8c1e5a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -17,19 +17,29 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
-	-DENABLE_BUBBLEWRAP_SANDBOX=OFF \
 	-DENABLE_GEOLOCATION=OFF \
 	-DENABLE_GTKDOC=OFF \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
 	-DPORT=GTK \
+	-DSILENCE_CROSS_COMPILATION_NOTICES=ON \
 	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
 	-DUSE_WOFF2=ON \
 	-DUSE_WPE_RENDERER=OFF
 
+ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
+WEBKITGTK_CONF_OPTS += \
+	-DENABLE_BUBBLEWRAP_SANDBOX=ON \
+	-DBWRAP_EXECUTABLE=/usr/bin/bwrap \
+	-DDBUS_PROXY_EXECUTABLE=/usr/bin/xdg-dbus-proxy
+WEBKITGTK_DEPENDENCIES += libseccomp
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_BUBBLEWRAP_SANDBOX=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
