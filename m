From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Mar 2016 14:23:03 +0000
Subject: [Buildroot] [PATCH] rtptools: disable for MIPS Codescape toolchains
Message-ID: <1457446983-17165-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Codescape toolchains don't provide rpcsvc/ypclnt.h, therefore rtptools
fails to build showing an error like this one:

host2ip.c:13:38: fatal error: rpcsvc/ypclnt.h: No such file or directory
 #include <rpcsvc/ypclnt.h>   /* YP */

Fixes:

  http://autobuild.buildroot.net/results/5a8abdd4918a721c1bddbf68a16d99bea90a59a9/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/rtptools/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rtptools/Config.in b/package/rtptools/Config.in
index 80bbb7a..257be7f 100644
--- a/package/rtptools/Config.in
+++ b/package/rtptools/Config.in
@@ -1,7 +1,14 @@
 config BR2_PACKAGE_RTPTOOLS
 	bool "rtptools"
+	# Codescape toolchains don't have rpcsvc/ypclnt.h
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	help
 	  The rtptools distribution consists of a number of small
 	  applications that can be used for processing RTP data.
 
 	  http://www.cs.columbia.edu/irt/software/rtptools/
+
+comment "rtptools cannot be built with a MIPS Codescape toolchain"
+	depends on BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS || \
+		BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-- 
2.4.10
