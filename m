From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 30 Jan 2019 17:01:16 +0100
Subject: [Buildroot] [PATCH] ffmpeg: improve linking avoiding -ldrm to be
 appended when -lavutil is linked
In-Reply-To: <0535ae91-47fa-5a31-5ff6-7977c5bbbe8b@mind.be>
References: <0535ae91-47fa-5a31-5ff6-7977c5bbbe8b@mind.be>
Message-ID: <20190130160116.3782-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream ffmpeg patch[1] has a drawback. Linking against libavutil
results in appending -ldrm to library list in linker command tail, but
in shared linking this is no needed at all since shared linking is
transparent about library dependecies, hence -ldrm in this case is not
needed.

Add patch to avoid this behaviour by:
- Introducing new variable "privatelibs" that is assigned to
  "Libs.private:" when creating various .pc files.
- Move $LIBDRM from extralibs_avutil to privatelibs_avutil

[1]
https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/c50dc77ac708e98d02da7c422a6b9cbf9f565aa5

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...BDRM-to-Libs.private-instead-of-Libs.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private-instead-of-Libs.patch

diff --git a/package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private-instead-of-Libs.patch b/package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private-instead-of-Libs.patch
new file mode 100644
index 0000000000..f19c74f228
--- /dev/null
+++ b/package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private-instead-of-Libs.patch
@@ -0,0 +1,59 @@
+From e34be93d478ad510960d03549572805a0430144c Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Sun, 21 Oct 2018 22:43:39 +0200
+Subject: [PATCH] configure: add LIBDRM to Libs.private instead of Libs
+
+Currently LIBDRM is appended to Libs: in libavutil.pc. This causes
+every program linking with avutil to link with -ldrm in both shared and
+static linking cases. In shared linking case it makes no sense, since
+-ldrm is a dependency of libavutil and is transparent while linking with
+libavutil
+
+- Add privatelibs_avutil variable for explicit private libraries to be
+  appended to Libs.private:
+- Add $LIBDRM to privatelibs_avutil.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ configure                     | 3 ++-
+ ffbuild/pkgconfig_generate.sh | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 9fe7760822..0996d8a85d 100755
+--- a/configure
++++ b/configure
+@@ -7096,7 +7096,8 @@ source_path=${source_path}
+ LIBPREF=${LIBPREF}
+ LIBSUF=${LIBSUF}
+ 
+-extralibs_avutil="$LIBRT $LIBDRM $LIBM"
++extralibs_avutil="$LIBRT $LIBM"
++privatelibs_avutil="$LIBDRM"
+ extralibs_avcodec="$extralibs"
+ extralibs_avformat="$extralibs"
+ extralibs_avdevice="$extralibs"
+diff --git a/ffbuild/pkgconfig_generate.sh b/ffbuild/pkgconfig_generate.sh
+index e5de6716d2..b86486a107 100755
+--- a/ffbuild/pkgconfig_generate.sh
++++ b/ffbuild/pkgconfig_generate.sh
+@@ -13,6 +13,7 @@ name=lib${shortname}
+ fullname=${name}${build_suffix}
+ comment=$2
+ libs=$(eval echo \$extralibs_${shortname})
++privatelibs=$(eval echo \$privatelibs_${shortname})
+ deps=$(eval echo \$${shortname}_deps)
+ 
+ for dep in $deps; do
+@@ -39,7 +40,7 @@ Requires: $($shared || echo $requires)
+ Requires.private: $($shared && echo $requires)
+ Conflicts:
+ Libs: -L\${libdir} $rpath -l${fullname#lib} $($shared || echo $libs)
+-Libs.private: $($shared && echo $libs)
++Libs.private: $($shared && echo $libs) ${privatelibs}
+ Cflags: -I\${includedir}
+ EOF
+ 
+-- 
+2.17.1
+
-- 
2.17.1
