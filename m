From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 30 Dec 2019 12:25:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: drop unneeded patch
In-Reply-To: <20191229221520.362426-1-fontaine.fabrice@gmail.com>
References: <20191229221520.362426-1-fontaine.fabrice@gmail.com>
Message-ID: <20191230122504.GB189989@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Dec 2019 23:15:20 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> Commit 0720ddc20321e390ca7812603300e6763198f199 added a patch that is
> already included in current version so remove it
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f48fe526764a0416c330b802f99e35e99e60ed57
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>


> ---
>  ...un-the-Bubblewrap-executable-when-co.patch | 87 -------------------
>  1 file changed, 87 deletions(-)
>  delete mode 100644 package/webkitgtk/0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch
> 
> diff --git a/package/webkitgtk/0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch b/package/webkitgtk/0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch
> deleted file mode 100644
> index 3381cbbfb6..0000000000
> --- a/package/webkitgtk/0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -From a725f6fbe6630a980f5ac74d79fd3e18557190bc Mon Sep 17 00:00:00 2001
> -From: "aperez at igalia.com"
> - <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
> -Date: Sun, 15 Sep 2019 13:30:01 +0000
> -Subject: [PATCH xserver 2/2] [GTK][WPE] Do not run the Bubblewrap executable
> - when configuring for cross-compilation
> - https://bugs.webkit.org/show_bug.cgi?id=201340
> -
> -Reviewed by Konstantin Tokarev.
> -
> -* Source/cmake/BubblewrapSandboxChecks.cmake: Do not run the
> -Bubblewrap executable when cross-compiling to guess its version.
> -Emit a warning instead and trust that valid run-time paths will
> -be set using the BWRAP_EXECUTABLE and DBUS_PROXY_EXECUTABLE
> -variables. While at it, fix the regular expression used to match
> -the version string in the Bubblewrap output when not cross-compiling.
> -
> -Fetch from: https://bugs.webkit.org/show_bug.cgi?id=201340
> -Upstream-Status: Accepted
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> -
> ----
> - ChangeLog                                  | 14 ++++++++
> - Source/cmake/BubblewrapSandboxChecks.cmake | 41 ++++++++++++++--------
> - 2 files changed, 41 insertions(+), 14 deletions(-)
> -
> -diff --git a/Source/cmake/BubblewrapSandboxChecks.cmake b/Source/cmake/BubblewrapSandboxChecks.cmake
> -index ac8fbbf3c8e..73cf4ffed35 100644
> ---- a/Source/cmake/BubblewrapSandboxChecks.cmake
> -+++ b/Source/cmake/BubblewrapSandboxChecks.cmake
> -@@ -3,20 +3,6 @@ if (ENABLE_BUBBLEWRAP_SANDBOX)
> -     if (NOT BWRAP_EXECUTABLE)
> -         message(FATAL_ERROR "bwrap executable is needed for ENABLE_BUBBLEWRAP_SANDBOX")
> -     endif ()
> --    add_definitions(-DBWRAP_EXECUTABLE="${BWRAP_EXECUTABLE}")
> --
> --    execute_process(
> --        COMMAND "${BWRAP_EXECUTABLE}" --version
> --        RESULT_VARIABLE BWRAP_RET
> --        OUTPUT_VARIABLE BWRAP_OUTPUT
> --    )
> --    if (BWRAP_RET)
> --        message(FATAL_ERROR "Failed to run ${BWRAP_EXECUTABLE}")
> --    endif ()
> --    string(REGEX MATCH "([0-9]+.[0-9]+.[0-9]+)" BWRAP_VERSION "${BWRAP_OUTPUT}")
> --    if (NOT "${BWRAP_VERSION}" VERSION_GREATER_EQUAL "0.3.1")
> --        message(FATAL_ERROR "bwrap must be >= 0.3.1 but ${BWRAP_VERSION} found")
> --    endif ()
> - 
> -     find_package(Libseccomp)
> -     if (NOT LIBSECCOMP_FOUND)
> -@@ -27,5 +13,32 @@ if (ENABLE_BUBBLEWRAP_SANDBOX)
> -     if (NOT DBUS_PROXY_EXECUTABLE)
> -         message(FATAL_ERROR "xdg-dbus-proxy not found and is needed for ENABLE_BUBBLEWRAP_SANDBOX")
> -     endif ()
> -+
> -+    if (NOT CMAKE_CROSSCOMPILING)
> -+        execute_process(
> -+            COMMAND "${BWRAP_EXECUTABLE}" --version
> -+            RESULT_VARIABLE BWRAP_RET
> -+            OUTPUT_VARIABLE BWRAP_OUTPUT
> -+        )
> -+        if (BWRAP_RET)
> -+            message(FATAL_ERROR "Failed to run ${BWRAP_EXECUTABLE}")
> -+        endif ()
> -+        string(REGEX MATCH "[0-9]+\\.[0-9]+\\.[0-9]+" BWRAP_VERSION "${BWRAP_OUTPUT}")
> -+        if (NOT "${BWRAP_VERSION}" VERSION_GREATER_EQUAL "0.3.1")
> -+            message(FATAL_ERROR "bwrap must be >= 0.3.1 but ${BWRAP_VERSION} found")
> -+        endif ()
> -+    elseif (NOT SILENCE_CROSS_COMPILATION_NOTICES)
> -+        message(NOTICE
> -+            "***--------------------------------------------------------***\n"
> -+            "***  Cannot check Bubblewrap version when cross-compiling. ***\n"
> -+            "***  The target system MUST have version 0.3.1 or newer.   ***\n"
> -+            "***  Use the BWRAP_EXECUTABLE and DBUS_PROXY_EXECUTABLE    ***\n"
> -+            "***  variables to set the run-time paths for the 'bwrap'   ***\n"
> -+            "***  and 'xdg-dbus-proxy' programs.                        ***\n"
> -+            "***--------------------------------------------------------***"
> -+        )
> -+    endif ()
> -+
> -+    add_definitions(-DBWRAP_EXECUTABLE="${BWRAP_EXECUTABLE}")
> -     add_definitions(-DDBUS_PROXY_EXECUTABLE="${DBUS_PROXY_EXECUTABLE}")
> - endif ()
> --- 
> -2.23.0
> -
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191230/1918e504/attachment.asc>
