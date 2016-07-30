From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jul 2016 14:47:56 -0700
Subject: [Buildroot] [PATCH 1/1] tinycbor: Add patch to fix black fin build
Message-ID: <1469915276-19104-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch give a name to the unnamed union in CborEncoder structure.
Patch has already been accepted upstream:
https://github.com/01org/tinycbor/commit/0e1440ab929aeee9b4ccc8040365039767801ebf
Add it to buildroot until a new release is available.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 ...ve-a-name-to-unnamed-union-in-CborEncoder.patch | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 package/tinycbor/0001-Give-a-name-to-unnamed-union-in-CborEncoder.patch

diff --git a/package/tinycbor/0001-Give-a-name-to-unnamed-union-in-CborEncoder.patch b/package/tinycbor/0001-Give-a-name-to-unnamed-union-in-CborEncoder.patch
new file mode 100644
index 0000000..c43a7c4
--- /dev/null
+++ b/package/tinycbor/0001-Give-a-name-to-unnamed-union-in-CborEncoder.patch
@@ -0,0 +1,144 @@
+From 03c537c1f7609742bb2059383046eed47fb8fe10 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Sat, 30 Jul 2016 11:03:59 -0700
+Subject: [PATCH] Give a name to unnamed union in CborEncoder
+
+cbor.h contains an unnamed union in CborEncoder structure, this functionality is
+not always supported by all compilers, especially it seems that the Blackfin
+build on buildroot fails (with gcc 4.3). This patch names this union "data".
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ src/cbor.h                                |  6 +++---
+ src/cborencoder.c                         | 22 +++++++++++-----------
+ src/cborencoder_close_container_checked.c |  4 ++--
+ 3 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/src/cbor.h b/src/cbor.h
+index 68b3fd3..a485cdf 100644
+--- a/src/cbor.h
++++ b/src/cbor.h
+@@ -162,7 +162,7 @@ struct CborEncoder
+     union {
+         uint8_t *ptr;
+         ptrdiff_t bytes_needed;
+-    };
++    } data;
+     const uint8_t *end;
+     size_t added;
+     int flags;
+@@ -204,12 +204,12 @@ CBOR_API CborError cbor_encoder_close_container_checked(CborEncoder *encoder, co
+ 
+ CBOR_INLINE_API size_t cbor_encoder_get_buffer_size(const CborEncoder *encoder, const uint8_t *buffer)
+ {
+-    return (size_t)(encoder->ptr - buffer);
++    return (size_t)(encoder->data.ptr - buffer);
+ }
+ 
+ CBOR_INLINE_API size_t cbor_encoder_get_extra_bytes_needed(const CborEncoder *encoder)
+ {
+-    return encoder->end ? 0 : (size_t)encoder->bytes_needed;
++    return encoder->end ? 0 : (size_t)encoder->data.bytes_needed;
+ }
+ 
+ /* Parser API */
+diff --git a/src/cborencoder.c b/src/cborencoder.c
+index ef1bc0b..4af705b 100644
+--- a/src/cborencoder.c
++++ b/src/cborencoder.c
+@@ -197,7 +197,7 @@
+  */
+ void cbor_encoder_init(CborEncoder *encoder, uint8_t *buffer, size_t size, int flags)
+ {
+-    encoder->ptr = buffer;
++    encoder->data.ptr = buffer;
+     encoder->end = buffer + size;
+     encoder->added = 0;
+     encoder->flags = flags;
+@@ -235,7 +235,7 @@ static inline void put64(void *where, uint64_t v)
+ static inline bool would_overflow(CborEncoder *encoder, size_t len)
+ {
+     ptrdiff_t remaining = (ptrdiff_t)encoder->end;
+-    remaining -= remaining ? (ptrdiff_t)encoder->ptr : encoder->bytes_needed;
++    remaining -= remaining ? (ptrdiff_t)encoder->data.ptr : encoder->data.bytes_needed;
+     remaining -= (ptrdiff_t)len;
+     return unlikely(remaining < 0);
+ }
+@@ -243,26 +243,26 @@ static inline bool would_overflow(CborEncoder *encoder, size_t len)
+ static inline void advance_ptr(CborEncoder *encoder, size_t n)
+ {
+     if (encoder->end)
+-        encoder->ptr += n;
++        encoder->data.ptr += n;
+     else
+-        encoder->bytes_needed += n;
++        encoder->data.bytes_needed += n;
+ }
+ 
+ static inline CborError append_to_buffer(CborEncoder *encoder, const void *data, size_t len)
+ {
+     if (would_overflow(encoder, len)) {
+         if (encoder->end != NULL) {
+-            len -= encoder->end - encoder->ptr;
++            len -= encoder->end - encoder->data.ptr;
+             encoder->end = NULL;
+-            encoder->bytes_needed = 0;
++            encoder->data.bytes_needed = 0;
+         }
+ 
+         advance_ptr(encoder, len);
+         return CborErrorOutOfMemory;
+     }
+ 
+-    memcpy(encoder->ptr, data, len);
+-    encoder->ptr += len;
++    memcpy(encoder->data.ptr, data, len);
++    encoder->data.ptr += len;
+     return CborNoError;
+ }
+ 
+@@ -447,7 +447,7 @@ __attribute__((noinline))
+ static CborError create_container(CborEncoder *encoder, CborEncoder *container, size_t length, uint8_t shiftedMajorType)
+ {
+     CborError err;
+-    container->ptr = encoder->ptr;
++    container->data.ptr = encoder->data.ptr;
+     container->end = encoder->end;
+     ++encoder->added;
+     container->added = 0;
+@@ -527,9 +527,9 @@ CborError cbor_encoder_create_map(CborEncoder *encoder, CborEncoder *mapEncoder,
+ CborError cbor_encoder_close_container(CborEncoder *encoder, const CborEncoder *containerEncoder)
+ {
+     if (encoder->end)
+-        encoder->ptr = containerEncoder->ptr;
++        encoder->data.ptr = containerEncoder->data.ptr;
+     else
+-        encoder->bytes_needed = containerEncoder->bytes_needed;
++        encoder->data.bytes_needed = containerEncoder->data.bytes_needed;
+     encoder->end = containerEncoder->end;
+     if (containerEncoder->flags & CborIteratorFlag_UnknownLength)
+         return append_byte_to_buffer(encoder, BreakByte);
+diff --git a/src/cborencoder_close_container_checked.c b/src/cborencoder_close_container_checked.c
+index cdabbc6..0f341f5 100644
+--- a/src/cborencoder_close_container_checked.c
++++ b/src/cborencoder_close_container_checked.c
+@@ -55,14 +55,14 @@
+  */
+ CborError cbor_encoder_close_container_checked(CborEncoder *encoder, const CborEncoder *containerEncoder)
+ {
+-    const uint8_t *ptr = encoder->ptr;
++    const uint8_t *ptr = encoder->data.ptr;
+     CborError err = cbor_encoder_close_container(encoder, containerEncoder);
+     if (containerEncoder->flags & CborIteratorFlag_UnknownLength || encoder->end == NULL)
+         return err;
+ 
+     /* check what the original length was */
+     uint64_t actually_added;
+-    err = extract_number(&ptr, encoder->ptr, &actually_added);
++    err = extract_number(&ptr, encoder->data.ptr, &actually_added);
+     if (err)
+         return err;
+ 
+-- 
+2.5.0
+
-- 
2.5.0
