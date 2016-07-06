From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 7 Jul 2016 00:30:15 +0200
Subject: [Buildroot] [PATCH v2] bfin: change default to bf532,
	internal toolchain !bf6xx
Message-ID: <20160706223014.GA12952@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default Blackfin processor in Buildroot isn't supported by
gcc 6.1.0, so use bf532 as default. Disable any bf6xx processors
for internal toolchain users.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - revert logic, disable internal toolchain for bf6xx suggested
    by Thomas Petazzoni
---
 arch/Config.in.bfin | 2 +-
 toolchain/Config.in | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 415fc89..9f7056a 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -1,7 +1,7 @@
 choice
 	prompt "Target CPU"
 	depends on BR2_bfin
-	default BR2_bf609
+	default BR2_bf532
 	help
 	  Specify target CPU
 config BR2_bf606
diff --git a/toolchain/Config.in b/toolchain/Config.in
index a725556..b49588f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -39,6 +39,10 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	depends on !BR2_bf606
+	depends on !BR2_bf607
+	depends on !BR2_bf608
+	depends on !BR2_bf609
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
-- 
2.1.4
