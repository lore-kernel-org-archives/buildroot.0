From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Feb 2013 19:23:58 +0100
Subject: [Buildroot] [git commit] busybox: 1.21.0 platform fix-on-fix
Message-ID: <20130227185415.7D3459ADC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4ee2811e30a952bf5a9c35b4d069c7c9b4c3bfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The unxz hunk was missing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.21.0/busybox-1.21.0-platform.patch   |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch b/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
index 2401b86..9be6cb8 100644
--- a/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
+++ b/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
@@ -1,3 +1,16 @@
+--- busybox-1.21.0/archival/libarchive/decompress_unxz.c
++++ busybox-1.21.0-platform/archival/libarchive/decompress_unxz.c
+@@ -30,8 +30,8 @@ static uint32_t xz_crc32(const uint8_t *
+ /* We use arch-optimized unaligned accessors */
+ #define get_unaligned_le32(buf) ({ uint32_t v; move_from_unaligned32(v, buf); SWAP_LE32(v); })
+ #define get_unaligned_be32(buf) ({ uint32_t v; move_from_unaligned32(v, buf); SWAP_BE32(v); })
+-#define put_unaligned_le32(val, buf) move_to_unaligned16(buf, SWAP_LE32(val))
+-#define put_unaligned_be32(val, buf) move_to_unaligned16(buf, SWAP_BE32(val))
++#define put_unaligned_le32(val, buf) move_to_unaligned32(buf, SWAP_LE32(val))
++#define put_unaligned_be32(val, buf) move_to_unaligned32(buf, SWAP_BE32(val))
+ 
+ #include "unxz/xz_dec_bcj.c"
+ #include "unxz/xz_dec_lzma2.c"
 --- busybox-1.21.0/include/platform.h
 +++ busybox-1.21.0-platform/include/platform.h
 @@ -228,7 +228,7 @@ typedef uint32_t bb__aliased_uint32_t FI
