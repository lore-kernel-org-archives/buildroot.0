From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  4 Oct 2017 23:02:21 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/libbcg729: new package
Message-ID: <20171004210224.12763-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting http://www.linphone.org/technical-corner/bcg729/downloads
regarding patent information:

"ITU G729 Annex A/B were offically released October/November 1996
(https://www.itu.int/rec/T-REC-G.729), hence all patents covering these
specifications shall have expired in November 2016.

Patent pool administrator confirmed most licensed patents under the
G.729 Consortium have expired (http://www.sipro.com/G729.html)."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: bumped to version 1.0.4, switched to cmake
v2: no changes

Tested v3 using this defconfig

BR2_PACKAGE_LIBBCG729=y

with positive results:

                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: OK
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: OK
                   br-arm-cortex-m4-full [ 8/47]: OK
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: OK
                      br-arm-full-static [11/47]: OK
                            br-bfin-full [12/47]: OK
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: OK
                       br-m68k-5208-full [15/47]: OK
                      br-m68k-68040-full [16/47]: OK
                    br-microblazeel-full [17/47]: OK
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: OK
                      br-openrisc-uclibc [23/47]: OK
               br-powerpc-603e-basic-cpp [24/47]: OK
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: OK
                    br-x86-64-core2-full [31/47]: OK
                          br-x86-64-musl [32/47]: OK
                          br-xtensa-full [33/47]: OK
                     i686-ctng-linux-gnu [34/47]: OK
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: OK
             mips64el-ctng_n64-linux-gnu [38/47]: OK
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: OK
                     sourcery-arm-armv4t [40/47]: OK
                            sourcery-arm [41/47]: OK
                     sourcery-arm-thumb2 [42/47]: OK
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: OK
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: OK
47 builds, 0 skipped, 0 build failed, 0 legal-info failed

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libbcg729/Config.in      |  7 +++++++
 package/libbcg729/libbcg729.hash |  2 ++
 package/libbcg729/libbcg729.mk   | 21 +++++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/libbcg729/Config.in
 create mode 100644 package/libbcg729/libbcg729.hash
 create mode 100644 package/libbcg729/libbcg729.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 43ad9e5f8a..46daf6295c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -218,6 +218,7 @@ F:	package/leafnode2/
 F:	package/libaacs/
 F:	package/libasplib/
 F:	package/libass/
+F:	package/libbcg729/
 F:	package/libbdplus/
 F:	package/libbluray/
 F:	package/libbroadvoice/
diff --git a/package/Config.in b/package/Config.in
index 36b42d24f1..7b99a6a510 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -950,6 +950,7 @@ menu "Audio/Sound"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
 	source "package/libasplib/Config.in"
+	source "package/libbcg729/Config.in"
 	source "package/libbroadvoice/Config.in"
 	source "package/libcdaudio/Config.in"
 	source "package/libcddb/Config.in"
diff --git a/package/libbcg729/Config.in b/package/libbcg729/Config.in
new file mode 100644
index 0000000000..82847a0b72
--- /dev/null
+++ b/package/libbcg729/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBBCG729
+	bool "libbcg729"
+	help
+	  Bcg729 is an opensource implementation of both encoder and
+	  decoder of the ITU G729 Annex A/B speech codec.
+
+	  http://www.linphone.org/technical-corner/bcg729/overview
diff --git a/package/libbcg729/libbcg729.hash b/package/libbcg729/libbcg729.hash
new file mode 100644
index 0000000000..7fa0b4a044
--- /dev/null
+++ b/package/libbcg729/libbcg729.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 94b3542a06cbd96306efc19f959f9febae62806a22599063f82a8c33e989d48b  libbcg729-1.0.4.tar.gz
diff --git a/package/libbcg729/libbcg729.mk b/package/libbcg729/libbcg729.mk
new file mode 100644
index 0000000000..2f1c12dfa5
--- /dev/null
+++ b/package/libbcg729/libbcg729.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libbcg729
+#
+################################################################################
+
+LIBBCG729_VERSION = 1.0.4
+LIBBCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(LIBBCG729_VERSION))
+LIBBCG729_LICENSE = GPL-2.0+
+LIBBCG729_LICENSE_FILES = COPYING
+LIBBCG729_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBBCG729_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBBCG729_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBBCG729_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.11.0
