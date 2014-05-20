From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 23:32:40 +0200
Subject: [Buildroot] [PATCH] ipsec-tools: needs MMU support
Message-ID: <1400621560-27628-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ipsec-tools currently fails to build for Blackfin due to GLOB_TILDE
not being supported in Blackfin external toolchains. However, after
fixing this problem (which will be fixed in later versions of the
Blackfin external toolchains) allows to discover that ipsec-tools uses
fork() anyway.

Therefore, this patch simply marks ipsec-tools as not available on
non-MMU systems.

Consequently, it fixes:

  http://autobuild.buildroot.org/results/fc4/fc4ef4101a20e64eb52da56557d6996dd73b3d86/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipsec-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 57fa5d4..a0d7600 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FLEX
+	depends on BR2_USE_MMU # fork()
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
-- 
1.9.3
