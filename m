From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 May 2014 23:51:25 +0200
Subject: [Buildroot] [git commit] ipsec-tools: needs MMU support
Message-ID: <20140520215352.A3D9E9CCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1698bbe49ffc2874afcdd855a97ac6468bd2814b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipsec-tools/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
