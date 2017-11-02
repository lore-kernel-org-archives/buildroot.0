From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:58:25 +0100
Subject: [Buildroot] [git commit] lua-sdl2: fix build without C++ compiler
Message-ID: <20171102215117.1CEED811F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8161a2f5367534a92978dd455bd736ff3f630abf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lua-sdl2 CMakeLists.txt files did not explicitly indicate that it's a
C-only project, and therefore CMake by default tries to find a C++
compiler, causing a build failure when none was available.

This commit fixes that by adding a patch that adjusts the project()
definitions in CMakeLists.txt.

Fixes:

  http://autobuild.buildroot.net/results/45e39562a68c236c582861d410ee1a9924f2bfc5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-CMakeLists-do-not-require-C.patch         | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/lua-sdl2/0002-CMakeLists-do-not-require-C.patch b/package/lua-sdl2/0002-CMakeLists-do-not-require-C.patch
new file mode 100644
index 0000000..eb03ca5
--- /dev/null
+++ b/package/lua-sdl2/0002-CMakeLists-do-not-require-C.patch
@@ -0,0 +1,58 @@
+From 5732174debfe027f7620af55c283060201f0ad03 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 2 Nov 2017 22:54:51 +0100
+Subject: [PATCH] CMakeLists: do not require C++
+
+The project doesn't use C++, so don't let CMake check for a C++
+compiler by explicitly specifying that this is a C-only project.
+
+Submitted-upstream: https://github.com/Tangent128/luasdl2/pull/69
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ common/CMakeLists.txt    | 2 +-
+ examples/CMakeLists.txt  | 2 +-
+ tutorials/CMakeLists.txt | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/common/CMakeLists.txt b/common/CMakeLists.txt
+index 9e19709..8cfb748 100644
+--- a/common/CMakeLists.txt
++++ b/common/CMakeLists.txt
+@@ -15,7 +15,7 @@
+ # ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ 
+-project(common)
++project(common C)
+ 
+ set(
+ 	SOURCES
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
+index 572b3b7..4e3af4d 100644
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -16,7 +16,7 @@
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-project(examples)
++project(examples C)
+ 
+ # Option to enable / disable examples installation
+ option(WITH_DOCS "Installation of documentation and examples" On)
+diff --git a/tutorials/CMakeLists.txt b/tutorials/CMakeLists.txt
+index adefbc9..6ec069e 100644
+--- a/tutorials/CMakeLists.txt
++++ b/tutorials/CMakeLists.txt
+@@ -16,7 +16,7 @@
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-project(tutorials)
++project(tutorials C)
+ 
+ # Option to enable / disable examples installation
+ option(WITH_DOCS "Installation of tutorials" On)
+-- 
+2.13.6
+
