From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Sep 2020 16:37:51 +0200
Subject: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains: add
 missing glibc toolchain dependencies
In-Reply-To: <20200927143752.1498115-1-romain.naour@gmail.com>
References: <20200927143752.1498115-1-romain.naour@gmail.com>
Message-ID: <20200927143752.1498115-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc toolchains must be disabled for MMU less configuration.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index bfc7237d48..62cdb48478 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -244,12 +244,16 @@ class Toolchain:
             if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC"):
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_UCLIBC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC"):
+                # glibc needs mmu support
+                depends.append("BR2_USE_MMU")
                 # glibc doesn't support static only configuration
                 depends.append("!BR2_STATIC_LIBS")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
                 # all glibc toolchains have RPC support
                 selects.append("BR2_TOOLCHAIN_HAS_NATIVE_RPC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL"):
+                # musl needs mmu support
+                depends.append("BR2_USE_MMU")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_MUSL")
 
             # gcc version
-- 
2.25.4
