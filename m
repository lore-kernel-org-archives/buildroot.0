From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2020 22:58:02 +0100
Subject: [Buildroot] [git commit] toolchain: add hidden
 BR2_TOOLCHAIN_HAS_SSP_STRONG boolean
Message-ID: <20200220215137.DCC778E69B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b751143929d2634c8927e3a392b0202708c4232
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will allow toolchain to indicate if they support
-fstack-protector-strong or not.

Whenever the gcc version is >= 4.9, we always have SSP_STRONG support
if we have SSP support. However, some toolchains older than gcc 4.9
might have backported SSP_STRONG support, which is why we cannot rely
just on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9.

Having this "default" value allows to avoid adding a "select
BR2_TOOLCHAIN_HAS_SSP_STRONG" in the internal toolchain logic plus in
almost external toolchains. But it allows custom external toolchains
that are pre-4.9 to potentially declare that they support strong SSP.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 973c03254f..87509f3d64 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -189,6 +189,10 @@ config BR2_TOOLCHAIN_HAS_THREADS_NPTL
 config BR2_TOOLCHAIN_HAS_SSP
 	bool
 
+config BR2_TOOLCHAIN_HAS_SSP_STRONG
+	bool
+	default y if BR2_TOOLCHAIN_HAS_SSP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_TOOLCHAIN_HAS_UCONTEXT
 	bool
 
