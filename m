From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] intel-microcode: bump to version 20180807a
Message-ID: <20181202071554.964A080FDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f0beaf9a8e2b8f0bb6e53694b38d70900b9128f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The big "intel-microcode.dat" text file is gone. Only binary files are
provided, in the "intel-ucode" directory. Install it at /lib/firmware/,
like linux-firmware does, and update the iucode-tool init script to use
that path.

We don't install the microcode under "intel-ucode-with-caveats", since
it needs special commits in the Linux kernel (see "relnotes" for more
information).

Tested on an equipment with Intel C3000 processor.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash |  4 ++--
 package/intel-microcode/intel-microcode.mk   | 16 +++++-----------
 package/iucode-tool/S00iucode-tool           |  4 ++--
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 999b27299d..183ba5aeec 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0b381face2df1b0a829dc4fa8fa93f47f39e11b1c9c22ebd44f8614657c1e779  microcode-20180312.tgz
-sha256 6d4deb65ca688d930e188bf93f78430f134097b161e6df4a2ef00728e14965e3  license.txt
+sha256 46ab18699ec42eb6cc01ee1846ec4d7ca979766dee2156f92d69e2f6df548137  microcode-20180807a.tgz
+sha256 c4698c6105d59fec11ad0929e77a003445c560c7706c089990030acbf10c9372  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index e3134b6408..2113873509 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,23 +4,17 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20180312
+INTEL_MICROCODE_VERSION = 20180807a
 INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
-INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/27591/eng
+INTEL_MICROCODE_SITE = https://downloadmirror.intel.com/28087/eng
 INTEL_MICROCODE_STRIP_COMPONENTS = 0
 INTEL_MICROCODE_LICENSE = PROPRIETARY
-INTEL_MICROCODE_LICENSE_FILES = license.txt
+INTEL_MICROCODE_LICENSE_FILES = license
 INTEL_MICROCODE_REDISTRIBUTE = NO
 
-define INTEL_MICROCODE_EXTRACT_LICENSE
-	head -n 33 $(@D)/microcode.dat > $(@D)/license.txt
-endef
-
-INTEL_MICROCODE_POST_EXTRACT_HOOKS += INTEL_MICROCODE_EXTRACT_LICENSE
-
 define INTEL_MICROCODE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/microcode.dat \
-		$(TARGET_DIR)/usr/share/misc/intel-microcode.dat
+	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/lib/firmware/intel-ucode \
+		$(@D)/intel-ucode/*
 endef
 
 $(eval $(generic-package))
diff --git a/package/iucode-tool/S00iucode-tool b/package/iucode-tool/S00iucode-tool
index 0c1e409de2..a97b33c045 100644
--- a/package/iucode-tool/S00iucode-tool
+++ b/package/iucode-tool/S00iucode-tool
@@ -3,12 +3,12 @@
 # Upload microcode into the processor.
 #
 
-microcode_file="/usr/share/misc/intel-microcode.dat"
+MICROCODE_DIR="/lib/firmware/intel-ucode"
 
 case "$1" in
   start)
 	echo "Starting iucode-tool:"
-	/usr/sbin/iucode_tool -k $microcode_file
+	/usr/sbin/iucode_tool -k "$MICROCODE_DIR"
 	echo "done"
 	;;
   stop)
