From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Nov 2019 19:09:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/waylandpp: fix build with cmake <
 3.13
Message-ID: <20191122180957.618327-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/587fb44ea2272bd134262716870f5ad36a18661d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ke-Make-target_link_options-optional.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/waylandpp/0001-cmake-Make-target_link_options-optional.patch

diff --git a/package/waylandpp/0001-cmake-Make-target_link_options-optional.patch b/package/waylandpp/0001-cmake-Make-target_link_options-optional.patch
new file mode 100644
index 0000000000..a7746c1f36
--- /dev/null
+++ b/package/waylandpp/0001-cmake-Make-target_link_options-optional.patch
@@ -0,0 +1,37 @@
+From a39c0c115e19150551c01b04a5e903376633e771 Mon Sep 17 00:00:00 2001
+From: Nils Christopher Brause <nilschrbrause@googlemail.com>
+Date: Fri, 22 Nov 2019 17:39:20 +0100
+Subject: [PATCH] [cmake] Make target_link_options optional, lowering the
+ required cmake version to 3.4.
+
+[Retrieved from:
+https://github.com/NilsBrause/waylandpp/commit/a39c0c115e19150551c01b04a5e903376633e771]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 386f8d8..47a412c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -21,7 +21,7 @@
+ # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-cmake_minimum_required(VERSION 3.13)
++cmake_minimum_required(VERSION 3.4)
+ project(waylandpp VERSION 0.2.7 LANGUAGES CXX)
+ 
+ # packages
+@@ -160,7 +160,9 @@ if(BUILD_LIBRARIES)
+     "include/wayland-client.hpp;include/wayland-util.hpp;${CMAKE_CURRENT_BINARY_DIR}/wayland-client-protocol.hpp;${CMAKE_CURRENT_BINARY_DIR}/wayland-version.hpp"
+     src/wayland-client.cpp src/wayland-util.cpp wayland-client-protocol.cpp wayland-client-protocol.hpp)
+   # Report undefined references only for the base library.
+-  target_link_options(wayland-client++ PRIVATE "-Wl,--no-undefined")
++  if(${CMAKE_VERSION} VERSION_GREATER "3.14.0")
++    target_link_options(wayland-client++ PRIVATE "-Wl,--no-undefined")
++  endif()
+   define_library(wayland-client-extra++ "${WAYLAND_CLIENT_CFLAGS}" "${WAYLAND_CLIENT_LIBRARIES}"
+     "${CMAKE_CURRENT_BINARY_DIR}/wayland-client-protocol-extra.hpp"
+     wayland-client-protocol-extra.cpp wayland-client-protocol-extra.hpp wayland-client-protocol.hpp)
-- 
2.24.0
