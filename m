From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Oct 2013 10:10:22 -0300
Subject: [Buildroot] [PATCH 1/2] arch/Config.in: introduce
	BR2_KERNEL_64_USERLAND_32 symbol
Message-ID: <1382706623-5593-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures one can be running a 64-bit kernel with a 32-bit
userland.
Such is the case for sparc64 (unsupported) for example and mips64 with
n32 ABI.
Some tools that interface directly with the kernel need to be built
specially for this, so introduce this symbol to tweak their build in one
central kludge to be future-proof.
Example: bug #6602.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in      | 3 +++
 arch/Config.in.mips | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 3fd8c1c..bc81dac 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -3,6 +3,9 @@ menu "Target options"
 config BR2_ARCH_IS_64
 	bool
 
+config BR2_KERNEL_64_USERLAND_32
+	bool
+
 config BR2_SOFT_FLOAT
 	bool
 
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 6242bcc..ca8b87f 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -47,6 +47,7 @@ config BR2_MIPS_OABI32
 config BR2_MIPS_NABI32
 	bool "n32"
 	depends on BR2_ARCH_IS_64
+	select BR2_KERNEL_64_USERLAND_32
 config BR2_MIPS_NABI64
 	bool "n64"
 	depends on BR2_ARCH_IS_64
-- 
1.8.1.5
