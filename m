From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 21 May 2019 00:40:35 +0300
Subject: [Buildroot] [PATCH/next v2 1/3] package/wpebackend-fdo: bump to
 version 1.2.0
In-Reply-To: <20190520214037.58011-1-aperez@igalia.com>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190520214037.58011-1-aperez@igalia.com>
Message-ID: <20190520214037.58011-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WPE WebKit 2.24.x requires WPEBackend-fdo 1.2.x, as indicated at:

  https://wpewebkit.org/release/schedule/#compatible-components

The added patch makes the build system pick the version of
wayland-scanner from $(HOST_DIR), instead of the target version.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - Included upstream patch which solves picking the correct (host)
    version of wayland-scanner.

---
 ...-how-CMake-looks-for-wayland-scanner.patch | 137 ++++++++++++++++++
 package/wpebackend-fdo/wpebackend-fdo.hash    |   8 +-
 package/wpebackend-fdo/wpebackend-fdo.mk      |   2 +-
 3 files changed, 142 insertions(+), 5 deletions(-)
 create mode 100644 package/wpebackend-fdo/0001-Improve-how-CMake-looks-for-wayland-scanner.patch

diff --git a/package/wpebackend-fdo/0001-Improve-how-CMake-looks-for-wayland-scanner.patch b/package/wpebackend-fdo/0001-Improve-how-CMake-looks-for-wayland-scanner.patch
new file mode 100644
index 0000000000..d83902c662
--- /dev/null
+++ b/package/wpebackend-fdo/0001-Improve-how-CMake-looks-for-wayland-scanner.patch
@@ -0,0 +1,137 @@
+From a03431fb562176d25919e76e0baf52a0ba3752c4 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 15 May 2019 20:54:10 +0300
+Subject: [PATCH] Improve how CMake looks for wayland-scanner
+
+This improves FindWaylandScanner.cmake to allow it to find the
+wayland-scanner tool in any of the following ways (in order of
+preference):
+
+  1. By passing -DWAYLAND_SCANNER=path/to/wayland-scanner to CMake.
+  2. Looking for wayland-scanner in the current $PATH
+  3. Figuring out the location from pkg-config (as before).
+
+This will make the package friendlier to cross-compilation, and
+then build systems can either prepend their locations for host
+tools to $PATH (covered by 2. above), or they can specify the
+tool path in the command line (covered by 1. above) if they need
+to be more specific.
+
+The motivation for this patch is to avoid kludges like the following:
+
+  https://patchwork.ozlabs.org/comment/2172010/
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://github.com/Igalia/WPEBackend-fdo/pull/39]
+
+---
+ cmake/FindWaylandScanner.cmake | 93 ++++++++++++++++++++++++++++++----
+ 1 file changed, 84 insertions(+), 9 deletions(-)
+
+diff --git a/cmake/FindWaylandScanner.cmake b/cmake/FindWaylandScanner.cmake
+index 09a92b2..7130c10 100644
+--- a/cmake/FindWaylandScanner.cmake
++++ b/cmake/FindWaylandScanner.cmake
+@@ -28,15 +28,90 @@
+ # OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+ # ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-find_package(PkgConfig)
+-pkg_check_modules(WAYLAND_SCANNER wayland-scanner)
+-
+-pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
+-if (WAYLAND_SCANNER_VERSION VERSION_LESS "1.15")
+-    set(WAYLAND_SCANNER_CODE_ARG "code")
+-else ()
+-    set(WAYLAND_SCANNER_CODE_ARG "private-code")
++set(WAYLAND_SCANNER "" CACHE FILEPATH "Path to the wayland-scanner tool")
++
++function(wayland_scanner_get_version _result _exepath)
++    set(_version "")
++    set(_status -1)
++    if (EXISTS "${_exepath}")
++        execute_process(
++            COMMAND "${_exepath}" "--version"
++            RESULT_VARIABLE _status
++            ERROR_VARIABLE _version
++            ERROR_STRIP_TRAILING_WHITESPACE
++            OUTPUT_QUIET
++        )
++        if (_status EQUAL 0)
++            string(REPLACE "wayland-scanner" "" _version "${_version}")
++            string(STRIP "${_version}" _version)
++        endif ()
++    endif ()
++    if (_version)
++        set(${_result} "${_version}" PARENT_SCOPE)
++    else ()
++        unset(${_result} PARENT_SCOPE)
++    endif ()
++endfunction()
++
++#
++# Method 1: If -DWAYLAND_SCANNER=... was passed on the command line,
++#           check whether we can extract the version number from it.
++#           Otherwise: unset the variable, to try other methods below.
++#
++if (WAYLAND_SCANNER)
++    wayland_scanner_get_version(WAYLAND_SCANNER_VERSION "${WAYLAND_SCANNER}")
++    if (NOT WAYLAND_SCANNER_VERSION)
++        set(WAYLAND_SCANNER "")
++    endif ()
++endif ()
++
++#
++# Method 2: Try to find an executable program in the current $PATH.
++#
++if (NOT WAYLAND_SCANNER)
++    find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
++    if (WAYLAND_SCANNER_EXECUTABLE)
++        wayland_scanner_get_version(WAYLAND_SCANNER_VERSION "${WAYLAND_SCANNER_EXECUTABLE}")
++        if (WAYLAND_SCANNER_VERSION)
++            set(WAYLAND_SCANNER "${WAYLAND_SCANNER_EXECUTABLE}")
++        endif ()
++    endif ()
++    unset(WAYLAND_SCANNER_EXECUTABLE)
++endif ()
++
++#
++# Method 3: Try to find the executable using pkg-config, in case the
++#           tool was installed in a non-standard location.
++#
++if (NOT DEFINED WAYLAND_SCANNER OR NOT WAYLAND_SCANNER)
++    find_package(PkgConfig)
++    pkg_check_modules(WAYLAND_SCANNER_PC wayland-scanner)
++    if (WAYLAND_SCANNER_PC_FOUND)
++        pkg_get_variable(WAYLAND_SCANNER_PC_EXECUTABLE wayland-scanner wayland_scanner)
++        if (WAYLAND_SCANNER_PC_EXECUTABLE)
++            wayland_scanner_get_version(WAYLAND_SCANNER_VERSION "${WAYLAND_SCANNER_PC_EXECUTABLE}")
++            if (WAYLAND_SCANNER_VERSION)
++                set(WAYLAND_SCANNER "${WAYLAND_SCANNER_PC_EXECUTABLE}")
++            endif ()
++        endif ()
++    endif ()
++    unset(WAYLAND_SCANNER_PC)
++    unset(WAYLAND_SCANNER_PC_EXECUTABLE)
++endif ()
++
++if (WAYLAND_SCANNER_VERSION)
++    if (WAYLAND_SCANNER_VERSION VERSION_LESS "1.15")
++        set(WAYLAND_SCANNER_CODE_ARG "code")
++    else ()
++        set(WAYLAND_SCANNER_CODE_ARG "private-code")
++    endif ()
+ endif ()
+ 
+ include(FindPackageHandleStandardArgs)
+-FIND_PACKAGE_HANDLE_STANDARD_ARGS(WAYLAND_SCANNER DEFAULT_MSG WAYLAND_SCANNER)
++FIND_PACKAGE_HANDLE_STANDARD_ARGS(
++    WAYLAND_SCANNER
++    DEFAULT_MSG
++    WAYLAND_SCANNER
++    WAYLAND_SCANNER_VERSION
++    WAYLAND_SCANNER_CODE_ARG
++)
+-- 
+2.21.0
+
diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 6e6f9f0e3f..4d89d1e16f 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.0.1.tar.xz.sums
-md5 2ee81a4212c18110a06a0c51c12e0d2e wpebackend-fdo-1.0.1.tar.xz
-sha1 cdc6ac95e302a2358204b766936a9bf8ef4f26f2 wpebackend-fdo-1.0.1.tar.xz
-sha256 15b8b1febea5d9c271e95c35b3c1e13f870712a54bc5f689cfdbb96e2f070fc8 wpebackend-fdo-1.0.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.2.0.tar.xz.sums
+md5 74e1b2fc2bc19933b17ff4f8435f67cd wpebackend-fdo-1.2.0.tar.xz
+sha1 60559697512fd483c1d918b708a3d1d130b74a0a wpebackend-fdo-1.2.0.tar.xz
+sha256 b1bb261273772af8f7d96d94989fc2ed0445ec06c7eb21f47a1b94e52422ddd5 wpebackend-fdo-1.2.0.tar.xz
 
 # Hashes for license files:
 sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825 COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 5842861bac..15530ec45f 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.0.1
+WPEBACKEND_FDO_VERSION = 1.2.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.21.0
