From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 4 Jul 2019 20:16:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.2.1
In-Reply-To: <20190704083617.6922-1-aperez@igalia.com>
References: <20190704083617.6922-1-aperez@igalia.com>
Message-ID: <CAB0FRstf8qjPRSTaeeA9n-xs0OZnv6ZKSLhgvdX6xzgyBN0uSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeu. 4 juil. 2019 ? 10:36, Adrian Perez de Castro <aperez@igalia.com> a
?crit :

> Update the package to version 1.2.1, which includes build fixes.
> Patch "0001-Improve-how-CMake-looks-for-wayland-scanner.patch" is
> now included and therefore can be removed from Buildroot.
>
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>


> ---
>  ...-how-CMake-looks-for-wayland-scanner.patch | 137 ------------------
>  package/wpebackend-fdo/wpebackend-fdo.hash    |   8 +-
>  package/wpebackend-fdo/wpebackend-fdo.mk      |   2 +-
>  3 files changed, 5 insertions(+), 142 deletions(-)
>  delete mode 100644
> package/wpebackend-fdo/0001-Improve-how-CMake-looks-for-wayland-scanner.patch
>
> diff --git
> a/package/wpebackend-fdo/0001-Improve-how-CMake-looks-for-wayland-scanner.patch
> b/package/wpebackend-fdo/0001-Improve-how-CMake-looks-for-wayland-scanner.patch
> deleted file mode 100644
> index d83902c662..0000000000
> ---
> a/package/wpebackend-fdo/0001-Improve-how-CMake-looks-for-wayland-scanner.patch
> +++ /dev/null
> @@ -1,137 +0,0 @@
> -From a03431fb562176d25919e76e0baf52a0ba3752c4 Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Wed, 15 May 2019 20:54:10 +0300
> -Subject: [PATCH] Improve how CMake looks for wayland-scanner
> -
> -This improves FindWaylandScanner.cmake to allow it to find the
> -wayland-scanner tool in any of the following ways (in order of
> -preference):
> -
> -  1. By passing -DWAYLAND_SCANNER=path/to/wayland-scanner to CMake.
> -  2. Looking for wayland-scanner in the current $PATH
> -  3. Figuring out the location from pkg-config (as before).
> -
> -This will make the package friendlier to cross-compilation, and
> -then build systems can either prepend their locations for host
> -tools to $PATH (covered by 2. above), or they can specify the
> -tool path in the command line (covered by 1. above) if they need
> -to be more specific.
> -
> -The motivation for this patch is to avoid kludges like the following:
> -
> -  https://patchwork.ozlabs.org/comment/2172010/
> -
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> -[Upstream status: https://github.com/Igalia/WPEBackend-fdo/pull/39]
> -
> ----
> - cmake/FindWaylandScanner.cmake | 93 ++++++++++++++++++++++++++++++----
> - 1 file changed, 84 insertions(+), 9 deletions(-)
> -
> -diff --git a/cmake/FindWaylandScanner.cmake
> b/cmake/FindWaylandScanner.cmake
> -index 09a92b2..7130c10 100644
> ---- a/cmake/FindWaylandScanner.cmake
> -+++ b/cmake/FindWaylandScanner.cmake
> -@@ -28,15 +28,90 @@
> - # OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> - # ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> -
> --find_package(PkgConfig)
> --pkg_check_modules(WAYLAND_SCANNER wayland-scanner)
> --
> --pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
> --if (WAYLAND_SCANNER_VERSION VERSION_LESS "1.15")
> --    set(WAYLAND_SCANNER_CODE_ARG "code")
> --else ()
> --    set(WAYLAND_SCANNER_CODE_ARG "private-code")
> -+set(WAYLAND_SCANNER "" CACHE FILEPATH "Path to the wayland-scanner tool")
> -+
> -+function(wayland_scanner_get_version _result _exepath)
> -+    set(_version "")
> -+    set(_status -1)
> -+    if (EXISTS "${_exepath}")
> -+        execute_process(
> -+            COMMAND "${_exepath}" "--version"
> -+            RESULT_VARIABLE _status
> -+            ERROR_VARIABLE _version
> -+            ERROR_STRIP_TRAILING_WHITESPACE
> -+            OUTPUT_QUIET
> -+        )
> -+        if (_status EQUAL 0)
> -+            string(REPLACE "wayland-scanner" "" _version "${_version}")
> -+            string(STRIP "${_version}" _version)
> -+        endif ()
> -+    endif ()
> -+    if (_version)
> -+        set(${_result} "${_version}" PARENT_SCOPE)
> -+    else ()
> -+        unset(${_result} PARENT_SCOPE)
> -+    endif ()
> -+endfunction()
> -+
> -+#
> -+# Method 1: If -DWAYLAND_SCANNER=... was passed on the command line,
> -+#           check whether we can extract the version number from it.
> -+#           Otherwise: unset the variable, to try other methods below.
> -+#
> -+if (WAYLAND_SCANNER)
> -+    wayland_scanner_get_version(WAYLAND_SCANNER_VERSION
> "${WAYLAND_SCANNER}")
> -+    if (NOT WAYLAND_SCANNER_VERSION)
> -+        set(WAYLAND_SCANNER "")
> -+    endif ()
> -+endif ()
> -+
> -+#
> -+# Method 2: Try to find an executable program in the current $PATH.
> -+#
> -+if (NOT WAYLAND_SCANNER)
> -+    find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
> -+    if (WAYLAND_SCANNER_EXECUTABLE)
> -+        wayland_scanner_get_version(WAYLAND_SCANNER_VERSION
> "${WAYLAND_SCANNER_EXECUTABLE}")
> -+        if (WAYLAND_SCANNER_VERSION)
> -+            set(WAYLAND_SCANNER "${WAYLAND_SCANNER_EXECUTABLE}")
> -+        endif ()
> -+    endif ()
> -+    unset(WAYLAND_SCANNER_EXECUTABLE)
> -+endif ()
> -+
> -+#
> -+# Method 3: Try to find the executable using pkg-config, in case the
> -+#           tool was installed in a non-standard location.
> -+#
> -+if (NOT DEFINED WAYLAND_SCANNER OR NOT WAYLAND_SCANNER)
> -+    find_package(PkgConfig)
> -+    pkg_check_modules(WAYLAND_SCANNER_PC wayland-scanner)
> -+    if (WAYLAND_SCANNER_PC_FOUND)
> -+        pkg_get_variable(WAYLAND_SCANNER_PC_EXECUTABLE wayland-scanner
> wayland_scanner)
> -+        if (WAYLAND_SCANNER_PC_EXECUTABLE)
> -+            wayland_scanner_get_version(WAYLAND_SCANNER_VERSION
> "${WAYLAND_SCANNER_PC_EXECUTABLE}")
> -+            if (WAYLAND_SCANNER_VERSION)
> -+                set(WAYLAND_SCANNER "${WAYLAND_SCANNER_PC_EXECUTABLE}")
> -+            endif ()
> -+        endif ()
> -+    endif ()
> -+    unset(WAYLAND_SCANNER_PC)
> -+    unset(WAYLAND_SCANNER_PC_EXECUTABLE)
> -+endif ()
> -+
> -+if (WAYLAND_SCANNER_VERSION)
> -+    if (WAYLAND_SCANNER_VERSION VERSION_LESS "1.15")
> -+        set(WAYLAND_SCANNER_CODE_ARG "code")
> -+    else ()
> -+        set(WAYLAND_SCANNER_CODE_ARG "private-code")
> -+    endif ()
> - endif ()
> -
> - include(FindPackageHandleStandardArgs)
> --FIND_PACKAGE_HANDLE_STANDARD_ARGS(WAYLAND_SCANNER DEFAULT_MSG
> WAYLAND_SCANNER)
> -+FIND_PACKAGE_HANDLE_STANDARD_ARGS(
> -+    WAYLAND_SCANNER
> -+    DEFAULT_MSG
> -+    WAYLAND_SCANNER
> -+    WAYLAND_SCANNER_VERSION
> -+    WAYLAND_SCANNER_CODE_ARG
> -+)
> ---
> -2.21.0
> -
> diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash
> b/package/wpebackend-fdo/wpebackend-fdo.hash
> index 4d89d1e16f..14c6715358 100644
> --- a/package/wpebackend-fdo/wpebackend-fdo.hash
> +++ b/package/wpebackend-fdo/wpebackend-fdo.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpebackend-fdo-1.2.0.tar.xz.sums
> -md5 <https://wpewebkit.org/releases/wpebackend-fdo-1.2.0.tar.xz.sums-md5>
> 74e1b2fc2bc19933b17ff4f8435f67cd wpebackend-fdo-1.2.0.tar.xz
> -sha1 60559697512fd483c1d918b708a3d1d130b74a0a wpebackend-fdo-1.2.0.tar.xz
> -sha256 b1bb261273772af8f7d96d94989fc2ed0445ec06c7eb21f47a1b94e52422ddd5
> wpebackend-fdo-1.2.0.tar.xz
> +# From https://wpewebkit.org/releases/wpebackend-fdo-1.2.1.tar.xz.sums
> +md5 <https://wpewebkit.org/releases/wpebackend-fdo-1.2.1.tar.xz.sums+md5>
> fc76ac572ed03da8237d1e3e3991d0c3 wpebackend-fdo-1.2.1.tar.xz
> +sha1 8c994a25839b9df214c148c8892ee2c6f88ebbde wpebackend-fdo-1.2.1.tar.xz
> +sha256 6ef0852ecb9513a6789f8bbb9533083fcb165bb2d762eeb6d31e0b58c708cca0
> wpebackend-fdo-1.2.1.tar.xz
>
>  # Hashes for license files:
>  sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825
> COPYING
> diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk
> b/package/wpebackend-fdo/wpebackend-fdo.mk
> index 15530ec45f..c7e1b0abcf 100644
> --- a/package/wpebackend-fdo/wpebackend-fdo.mk
> +++ b/package/wpebackend-fdo/wpebackend-fdo.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -WPEBACKEND_FDO_VERSION = 1.2.0
> +WPEBACKEND_FDO_VERSION = 1.2.1
>  WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
>  WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
>  WPEBACKEND_FDO_INSTALL_STAGING = YES
> --
> 2.22.0
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190704/c891f7dc/attachment.html>
