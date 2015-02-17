From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Feb 2015 16:29:32 +0100
Subject: [Buildroot] [PATCHv2 for next 1/2] toolchain-external: improve lib
	subdirectory matching
In-Reply-To: <1424186973-7838-1-git-send-email-patrickdepinguin@gmail.com>
References: <1424186973-7838-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1424186973-7838-2-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bai Yingjie <byj.tea@gmail.com>

The toolchain from the Cavium Networks Octeon SDK provides a sysroot
with library directories lib32, lib32-fp, lib64 and lib64-fp. The -fp
variants are used for processors with hardware floating point unit, such
as the Octeon III variants.

When specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, the toolchain
will use lib32-fp, but currently Buildroot does not accept that pattern.

This patch improves the matching by accepting lib(32|64)?([^/]*)? as lib
directory name.

Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
[ThomasDS: update commit message]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 999a354..e05957c 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -434,13 +434,13 @@ endef
 
 # Returns the sysroot location for the given compiler + flags
 define toolchain_find_sysroot
-$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::')
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
 endef
 
 # Returns the lib subdirectory for the given compiler + flags (i.e
 # typically lib32 or lib64 for some toolchains)
 define toolchain_find_libdir
-$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:')
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
 endef
 
 # Checks for an already installed toolchain: check the toolchain
-- 
1.8.5.1
