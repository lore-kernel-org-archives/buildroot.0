From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 11:17:32 +0100
Subject: [Buildroot] [PATCH next] musl: bump to 1.1.18
Message-ID: <20171127101732.14622-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0002-arm-atomics-asm-with-new-binutils.patch is upstream as of
commit b261a24256792177a5f0531dbb25cc6267220ca5.

Patch 0003-Makefile-include-per-arch-Makefile-before-Makefile is
upstream as of commit 45ca5d3fcb6f874bf5ba55d0e9651cef68515395.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-arm-atomics-asm-with-new-binutils.patch   | 43 ----------------------
 ...ing-callback-enforce-MAXADDRS-to-preclude.patch | 35 ------------------
 package/musl/musl.hash                             |  2 +-
 package/musl/musl.mk                               |  2 +-
 4 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 package/musl/0002-arm-atomics-asm-with-new-binutils.patch
 delete mode 100644 package/musl/0003-in-dns-parsing-callback-enforce-MAXADDRS-to-preclude.patch

diff --git a/package/musl/0002-arm-atomics-asm-with-new-binutils.patch b/package/musl/0002-arm-atomics-asm-with-new-binutils.patch
deleted file mode 100644
index 3790889d7f..0000000000
--- a/package/musl/0002-arm-atomics-asm-with-new-binutils.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b261a24256792177a5f0531dbb25cc6267220ca5 Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Wed, 15 Feb 2017 17:05:50 -0500
-Subject: fix build regression in arm atomics asm with new binutils
-
-binutils commit bada43421274615d0d5f629a61a60b7daa71bc15 tightened
-immediate fixup handling in gas in such a way that the final .arch of
-an object file must be compatible with the fixups used when the
-instruction was assembled; this in turn broke assembling of atomics.s,
-at least in thumb mode.
-
-it's not clear whether this should be considered a bug in gas, but
-.object_arch is preferable anyway for our purpose here of controlling
-the ISA level tag on the object file being produced, and it's the
-intended directive for use in object files with runtime code
-selection. research by Szabolcs Nagy confirmed that .object_arch is
-supported in all relevant versions of binutils and clang's integrated
-assembler.
-
-patch by Reiner Herrmann.
-
-Signed-off-by: Timothy Lee <timothy.ty.lee@gmail.com>
-[Backport from upstream https://git.musl-libc.org/cgit/musl/commit/?id=b261a24256792177a5f0531dbb25cc6267220ca5.]
----
- src/thread/arm/atomics.s | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/thread/arm/atomics.s b/src/thread/arm/atomics.s
-index 202faa4..101ad39 100644
---- a/src/thread/arm/atomics.s
-+++ b/src/thread/arm/atomics.s
-@@ -84,7 +84,7 @@ __a_gettp_cp15:
- 	bx lr
- 
- /* Tag this file with minimum ISA level so as not to affect linking. */
--.arch armv4t
-+.object_arch armv4t
- .eabi_attribute 6,2
- 
- .data
--- 
-cgit v0.11.2
-
diff --git a/package/musl/0003-in-dns-parsing-callback-enforce-MAXADDRS-to-preclude.patch b/package/musl/0003-in-dns-parsing-callback-enforce-MAXADDRS-to-preclude.patch
deleted file mode 100644
index c6b5ef26b4..0000000000
--- a/package/musl/0003-in-dns-parsing-callback-enforce-MAXADDRS-to-preclude.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 45ca5d3fcb6f874bf5ba55d0e9651cef68515395 Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Wed, 18 Oct 2017 14:50:03 -0400
-Subject: [PATCH] in dns parsing callback, enforce MAXADDRS to preclude
- overflow
-
-MAXADDRS was chosen not to need enforcement, but the logic used to
-compute it assumes the answers received match the RR types of the
-queries. specifically, it assumes that only one replu contains A
-record answers. if the replies to both the A and the AAAA query have
-their answer sections filled with A records, MAXADDRS can be exceeded
-and clobber the stack of the calling function.
-
-this bug was found and reported by Felix Wilhelm.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/network/lookup_name.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/network/lookup_name.c b/src/network/lookup_name.c
-index 066be4d5..209c20f0 100644
---- a/src/network/lookup_name.c
-+++ b/src/network/lookup_name.c
-@@ -111,6 +111,7 @@ static int dns_parse_callback(void *c, int rr, const void *data, int len, const
- {
- 	char tmp[256];
- 	struct dpc_ctx *ctx = c;
-+	if (ctx->cnt >= MAXADDRS) return -1;
- 	switch (rr) {
- 	case RR_A:
- 		if (len != 4) return -1;
--- 
-2.11.0
-
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index f3f3741092..db89a72c45 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	937185a5e5d721050306cf106507a006c3f1f86d86cd550024ea7be909071011  musl-1.1.16.tar.gz
+sha256	d017ee5d01aec0c522a1330fdff06b1e428cb409e1db819cc4935d5da4a5a118  musl-1.1.18.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 6d5603398b..b1aace0400 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.16
+MUSL_VERSION = 1.1.18
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.13.6
