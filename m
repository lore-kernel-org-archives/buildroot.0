From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:59:03 +0100
Subject: [Buildroot] [git commit] arch/Config.in: introduce
	BR2_KERNEL_64_USERLAND_32 symbol
Message-ID: <20131104211054.8ADFE9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=957a986214169a76c51e9f63a232b67f286889d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some architectures one can be running a 64-bit kernel with a 32-bit
userland. Such is the case for sparc64 (unsupported) for example and
mips64 with n32 ABI.

Some tools that interface directly with the kernel need to be built
specially for this, so introduce this symbol to tweak their build in
one central kludge to be future-proof.

Example: bug #6602.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in      |    3 +++
 arch/Config.in.mips |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

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
index 86fbe64..d70fd63 100644
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
