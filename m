From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:27:39 +0100
Subject: [Buildroot] [git commit] package/cdrkit: fix static build with
 libmagic
Message-ID: <20201122141536.0264D86911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ca1b3ee2a153d0bcde89576b41146155c03b8f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmagic is an optional dependency of gensoimage that can raise the
following build failure:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmagic.a(compress.o): in function `uncompressbuf':
compress.c:(.text+0x7bc): undefined reference to `lzma_auto_decoder'
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x828): undefined reference to `lzma_code'
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x848): undefined reference to `lzma_end'
collect2: error: ld returned 1 exit status
genisoimage/CMakeFiles/genisoimage.dir/build.make:628: recipe for target 'genisoimage/genisoimage' failed

Fixes:
 - http://autobuild.buildroot.org/results/7e06edc363817c9c9a1687ec89e9984a90a2012d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cdrkit/cdrkit.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index f49d5150f3..67814f1418 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -18,5 +18,14 @@ else
 CDRKIT_CONF_OPTS += -DBITFIELDS_HTOL=0
 endif
 
+ifeq ($(BR2_PACKAGE_FILE),y)
+CDRKIT_DEPENDENCIES += host-pkgconf file
+CDRKIT_CONF_OPTS += \
+	-DUSE_MAGIC=ON \
+	-DEXTRA_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libmagic`"
+else
+CDRKIT_CONF_OPTS += -DUSE_MAGIC=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
