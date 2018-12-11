From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 11 Dec 2018 23:09:33 +0100
Subject: [Buildroot] [git commit] package/intel-microcode: don't use install
 -D -t
Message-ID: <20181211220603.2B85B8A3F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef78742b3e2e29d547409489263a311b601b7cd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1f0beaf9a8e2b8f0bb6e53694b38d70900b9128f ("intel-microcode:
bump to version 20180807a") introduced the use of "install -D -t" to
the intel-microcode package. The intent is that install will create
the full destination directory, including all components leading to
it, before copying the files.

Unfortunately, "install -D -t" is only supported since coreutils since
v8.23. Several of the build systems we support have older coreutils
versions, such as Debian 7, which uses coreutils 8.13. Ubuntu 14.04
also doesn't have a recent enough coreutils.

So let's create the directory explicitly first, and then use a more
regular "install -t".

Fixes:

  http://autobuild.buildroot.net/results/aa44f9ff90f296f886be6309b3355ed075494fb2/

Note: the "gzip: stdout: Broken pipe" messages in those failures seem
unrelated. We have been able to reproduce the installation failure
without those "Broken pipe" issues, and we have not been able to
reproduce those "Broken pipe" problems.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/intel-microcode/intel-microcode.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 2113873509..ed4ad628dd 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -13,7 +13,8 @@ INTEL_MICROCODE_LICENSE_FILES = license
 INTEL_MICROCODE_REDISTRIBUTE = NO
 
 define INTEL_MICROCODE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/lib/firmware/intel-ucode \
+	mkdir -p $(TARGET_DIR)/lib/firmware/intel-ucode
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/lib/firmware/intel-ucode \
 		$(@D)/intel-ucode/*
 endef
 
