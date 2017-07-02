From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:09:45 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] package/lugaru: backport
	upstream fix
Message-ID: <20170702150705.71D9C807E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c4e2d468bd1efb383d9347b0b91527ee27fde7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Fixes:
http://autobuild.buildroot.net/results/389/38917f8420695a9dbb24830fef04159252fceea0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0cad656a9ec5a7903f3d9c0c80963f5d561b0f02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-mismatched-usage-length-build-fail-on-g.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/lugaru/0002-Fix-mismatched-usage-length-build-fail-on-g.patch b/package/lugaru/0002-Fix-mismatched-usage-length-build-fail-on-g.patch
new file mode 100644
index 0000000..9c362a9
--- /dev/null
+++ b/package/lugaru/0002-Fix-mismatched-usage-length-build-fail-on-g.patch
@@ -0,0 +1,58 @@
+From 5a0c9f6358169b447840acdb721250ce932cb180 Mon Sep 17 00:00:00 2001
+From: Martin Erik Werner <martinerikwerner@gmail.com>
+Date: Wed, 8 Mar 2017 22:51:16 +0100
+Subject: [PATCH] Fix mismatched usage length, build fail on g++
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The length of const option::Descriptor usage[] is intended to be
+inferred based on the initialisation in Source/main.cpp, however, the
+extern declaration in Source/Game.hpp hard-codes it to 13.
+
+Remove the hard-coded 13 in the extern declaration, in favour of the
+inferred length.
+
+This also fixes the follwoing build failure with g++ (Debian 4.9.2-10)
+4.9.2:
+(...)/Source/main.cpp:602:5: error: uninitialized const member ???option::Descriptor::index???
+     };
+     ^
+(...)/Source/main.cpp:602:5: warning: missing initializer for member ???option::Descriptor::index??? [-Wmissing-field-initializers]
+(...)/Source/main.cpp:602:5: error: uninitialized const member ???option::Descriptor::type???
+(...)/Source/main.cpp:602:5: warning: missing initializer for member ???option::Descriptor::type??? [-Wmissing-field-initializers]
+(...)/Source/main.cpp:602:5: error: uninitialized const member ???option::Descriptor::shortopt???
+(...)/Source/main.cpp:602:5: warning: missing initializer for member ???option::Descriptor::shortopt??? [-Wmissing-field-initializers]
+(...)/Source/main.cpp:602:5: error: uninitialized const member ???option::Descriptor::longopt???
+(...)/Source/main.cpp:602:5: warning: missing initializer for member ???option::Descriptor::longopt??? [-Wmissing-field-initializers]
+(...)/Source/main.cpp:602:5: error: uninitialized const member ???option::Descriptor::check_arg???
+(...)/Source/main.cpp:602:5: warning: missing initializer for member ???option::Descriptor::check_arg??? [-Wmissing-field-initializers]
+(...)/Source/main.cpp:602:5: warning: missing initializer for member ???option::Descriptor::help??? [-Wmissing-field-initializers]
+CMakeFiles/lugaru.dir/build.make:54: recipe for target 'CMakeFiles/lugaru.dir/Source/main.cpp.o' failed
+
+Signed-off-by: Martin Erik Werner <martinerikwerner@gmail.com>
+
+[Romain: backport to v1.2]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+
+(cherry picked from commit dd685fe9080c2853422d8272792691358ea07dfc)
+---
+ Source/Game.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/Game.hpp b/Source/Game.hpp
+index 51232cc..9bb6adb 100644
+--- a/Source/Game.hpp
++++ b/Source/Game.hpp
+@@ -234,7 +234,7 @@ enum optionIndex
+ /* Number of options + 1 */
+ const int commandLineOptionsNumber = 10;
+ 
+-extern const option::Descriptor usage[13];
++extern const option::Descriptor usage[];
+ 
+ extern option::Option commandLineOptions[commandLineOptionsNumber];
+ extern option::Option* commandLineOptionsBuffer;
+-- 
+2.9.4
+
