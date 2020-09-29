From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 21:05:42 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/open-plc-utils:
 fix build with gcc 10
Message-ID: <20200929185628.6ED118E42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5348fca8418872c7b8b3a631c93f5ac2f899b0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/6b3064b64dea3d4aaf219f787429c25918101483

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 86ae2856d800f215acbfb925db8a9669195ef11b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-plc-plc.h-fix-build-with-gcc-10.patch     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch b/package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..063bfc536c
--- /dev/null
+++ b/package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,37 @@
+From 27222be0b8db59cae30a5fcca93255daea147bb6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 23 Sep 2020 19:05:23 +0200
+Subject: [PATCH] plc/plc.h: fix build with gcc 10
+
+Drop plcproperty from plc/plc.h to avoid the following build failure
+with gcc 10 (which defaults to -fno-common):
+
+/home/buildroot/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: rules.o:(.bss+0x0): multiple definition of `plcproperty'; pibruin.o:(.bss+0x0): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6b3064b64dea3d4aaf219f787429c25918101483
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/qca/open-plc-utils/pull/141]
+---
+ plc/plc.h | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/plc/plc.h b/plc/plc.h
+index 1fa32b53..208cf91a 100644
+--- a/plc/plc.h
++++ b/plc/plc.h
+@@ -496,9 +496,7 @@ struct __packed plcproperty
+ 	uint8_t DATA_FORMAT;
+ 	uint32_t DATA_LENGTH;
+ 	uint8_t DATA_BUFFER [128];
+-}
+-
+-plcproperty;
++};
+ 
+ #ifndef __GNUC__
+ #pragma pack (pop)
+-- 
+2.28.0
+
