From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon,  7 Nov 2016 13:00:03 +1100
Subject: [Buildroot] [PATCH 1/1] mpv: fix build on powerpc64 w/ altivec
Message-ID: <2caa778dd77d8e8b473a9d2507368bb2c4b497b9.1478484002.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/77f/77f00633b0b25f001cd4ca54ed3a12aee301c287

Add a patch to work around a name collision between bool and altivec's
bool.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
I've raised the issue upstream with mpv but they do not seem
interested in fixing it there.

It seems to me like this should be fixed in the altivec part of the
toolchain for powerpc64, and I'll investigate that separately but it's
a long term solution.

Cheers,
Sam.

 .../mpv/0002-Fix-build-on-powerpc64-altivec.patch  | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/mpv/0002-Fix-build-on-powerpc64-altivec.patch

diff --git a/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch b/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
new file mode 100644
index 0000000..706f78c
--- /dev/null
+++ b/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
@@ -0,0 +1,25 @@
+Change struct priv's bool field to int so that it isn't modified by
+the "#define bool" introduced by the Altivec headers (included via
+SDL.h).
+
+Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
+---
+ audio/out/ao_sdl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/audio/out/ao_sdl.c b/audio/out/ao_sdl.c
+index d9d0062..6c654eb 100644
+--- a/audio/out/ao_sdl.c
++++ b/audio/out/ao_sdl.c
+@@ -32,7 +32,7 @@
+ 
+ struct priv
+ {
+-    bool paused;
++    int paused;
+ 
+     float buflen;
+ };
+-- 
+2.10.0.297.gf6727b0
+
-- 
2.10.0.297.gf6727b0
