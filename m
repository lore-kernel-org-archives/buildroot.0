Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E521CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E78F180E64;
	Thu, 14 Aug 2025 19:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5HTFAORNCbL; Thu, 14 Aug 2025 19:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D1680E3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D1680E3F;
	Thu, 14 Aug 2025 19:57:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEA2F228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F344D404AF
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3bPKXqBGk0J for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB59404AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFB59404AB
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD0F0875ED; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 511f787734a97d06d8fb870f63a730def6bbf610
X-Git-Newrev: cf2ea88f485a75c1c89a8ecc42d2e6305f1ba3e4
X-Patchwork-Hint: ignore
Message-Id: <20250814195612.CD0F0875ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libzenoh-pico:
 fix build w/ RUNTIME_DEBUG
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf2ea88f485a75c1c89a8ecc42d2e6305f1ba3e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

On the autobuilder the following build error would appear for the
libzenoh-pico package when the option BR2_ENABLE_RUNTIME_DEBUG is
enabled:

```
[  1%] Building C object CMakeFiles/zenohpico_shared.dir/src/api/encoding.c.o
In function '_z_encoding_convert_into_string',
    inlined from 'z_encoding_to_string' at /workdir/instance-0/output-1/build/libzenoh-pico-1.2.1/src/api/encoding.c:261:5:
/workdir/instance-0/output-1/build/libzenoh-pico-1.2.1/src/api/encoding.c:203:15: error: 'strncat' output truncated before terminating nul copying 1 byte from a string of the same length [-Werror=stringop-truncation]
  203 |         (void)strncat(value, &sep, 1);
      |               ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
```

This error can be reproduced with:

```
cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LIBZENOH_PICO=y
BR2_ENABLE_RUNTIME_DEBUG=y
EOF
make olddefconfig
make libzenoh-pico
```

This patch include the upstream commit [1] that fixes this issue.

[1] https://github.com/eclipse-zenoh/zenoh-pico/commit/60e635cbb1dc6be8eda559a913d4689845f0d62e

Fixes: https://autobuild.buildroot.org/results/0c4/0c4644b17646d3ec482f0a4cf02d6fde19db2c99
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit ec12da7384b10344cae3835bb4e7aa43e7d01b21)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-fix-compilation-issues.patch              | 199 +++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/package/libzenoh-pico/0002-fix-compilation-issues.patch b/package/libzenoh-pico/0002-fix-compilation-issues.patch
new file mode 100644
index 0000000000..f9ff5bf506
--- /dev/null
+++ b/package/libzenoh-pico/0002-fix-compilation-issues.patch
@@ -0,0 +1,199 @@
+From 584e3d2cf8e879e5ad042f742a3d8656d7d98ed7 Mon Sep 17 00:00:00 2001
+From: Jean-Roland Gosse <jean.roland.gosse@gmail.com>
+Date: Thu, 10 Jul 2025 14:37:00 +0200
+Subject: [PATCH] Fix compilation issues (#986)
+
+* fix: compilation issues
+
+* fix: stringop-overflow
+
+* doc: add comment to _z_str_append function
+
+Upstream: https://github.com/eclipse-zenoh/zenoh-pico/commit/60e635cbb1dc6be8eda559a913d4689845f0d62e
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ include/zenoh-pico/utils/string.h | 8 ++++++++
+ src/api/encoding.c                | 4 ++--
+ src/protocol/codec/declarations.c | 4 ++++
+ src/protocol/codec/transport.c    | 3 ++-
+ src/protocol/config.c             | 8 +++-----
+ src/session/rx.c                  | 3 +++
+ src/transport/multicast/rx.c      | 4 ++++
+ src/transport/unicast/rx.c        | 4 ++++
+ 8 files changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/include/zenoh-pico/utils/string.h b/include/zenoh-pico/utils/string.h
+index e4ffd69d..2f56cb79 100644
+--- a/include/zenoh-pico/utils/string.h
++++ b/include/zenoh-pico/utils/string.h
+@@ -18,6 +18,7 @@
+ #include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
++#include <string.h>
+ 
+ #ifdef __cplusplus
+ extern "C" {
+@@ -63,6 +64,13 @@ size_t _z_strcnt(char const *haystack_start, const char *harstack_end, const cha
+ 
+ size_t _z_str_startswith(const char *s, const char *needle);
+ 
++// Must be used on a null terminated string with str[strlen(str) + 1] being valid memory.
++static inline void _z_str_append(char *str, const char c) {
++    size_t len = strlen(str);
++    str[len] = c;
++    str[len + 1] = '\0';
++}
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/src/api/encoding.c b/src/api/encoding.c
+index b4ff4cb1..16a5b9ff 100644
+--- a/src/api/encoding.c
++++ b/src/api/encoding.c
+@@ -19,6 +19,7 @@
+ #include <string.h>
+ 
+ #include "zenoh-pico.h"
++#include "zenoh-pico/utils/string.h"
+ 
+ #if Z_FEATURE_ENCODING_VALUES == 1
+ #define ENCODING_SCHEMA_SEPARATOR ';'
+@@ -196,11 +197,10 @@ static z_result_t _z_encoding_convert_into_string(const z_loaned_encoding_t *enc
+         return _Z_ERR_SYSTEM_OUT_OF_MEMORY;
+     }
+     // Copy prefix
+-    char sep = ENCODING_SCHEMA_SEPARATOR;
+     (void)strncpy(value, prefix, prefix_len);
+     // Copy schema and separator
+     if (has_schema) {
+-        (void)strncat(value, &sep, 1);
++        _z_str_append(value, ENCODING_SCHEMA_SEPARATOR);
+         (void)strncat(value, _z_string_data(&encoding->schema), _z_string_len(&encoding->schema));
+     }
+     // Fill container
+diff --git a/src/protocol/codec/declarations.c b/src/protocol/codec/declarations.c
+index 905aad39..2146537e 100644
+--- a/src/protocol/codec/declarations.c
++++ b/src/protocol/codec/declarations.c
+@@ -163,6 +163,10 @@ z_result_t _z_declaration_encode(_z_wbuf_t *wbf, const _z_declaration_t *decl) {
+         case _Z_DECL_FINAL: {
+             ret = _z_decl_final_encode(wbf);
+         } break;
++
++        default:
++            ret = _Z_ERR_MESSAGE_SERIALIZATION_FAILED;
++            break;
+     }
+     return ret;
+ }
+diff --git a/src/protocol/codec/transport.c b/src/protocol/codec/transport.c
+index 894fb41d..51830cd1 100644
+--- a/src/protocol/codec/transport.c
++++ b/src/protocol/codec/transport.c
+@@ -217,11 +217,12 @@ z_result_t _z_init_encode(_z_wbuf_t *wbf, uint8_t header, const _z_t_msg_init_t
+ }
+ 
+ z_result_t _z_init_decode_ext(_z_msg_ext_t *extension, void *ctx) {
++    _ZP_UNUSED(ctx);
+     z_result_t ret = _Z_RES_OK;
+-    _z_t_msg_init_t *msg = (_z_t_msg_init_t *)ctx;
+     if (false) {
+ #if Z_FEATURE_FRAGMENTATION == 1
+     } else if (_Z_EXT_FULL_ID(extension->_header) == _Z_MSG_EXT_ID_INIT_PATCH) {
++        _z_t_msg_init_t *msg = (_z_t_msg_init_t *)ctx;
+         msg->_patch = (uint8_t)extension->_body._zint._val;
+ #endif
+     } else if (_Z_MSG_EXT_IS_MANDATORY(extension->_header)) {
+diff --git a/src/protocol/config.c b/src/protocol/config.c
+index 1cfcff9c..245e7c3d 100644
+--- a/src/protocol/config.c
++++ b/src/protocol/config.c
+@@ -21,6 +21,7 @@
+ 
+ #include "zenoh-pico/collections/string.h"
+ #include "zenoh-pico/utils/pointers.h"
++#include "zenoh-pico/utils/string.h"
+ 
+ z_result_t _z_config_init(_z_config_t *ps) {
+     _z_str_intmap_init(ps);
+@@ -142,15 +143,12 @@ size_t _z_str_intmap_strlen(const _z_str_intmap_t *s, uint8_t argc, _z_str_intma
+ void _z_str_intmap_onto_str(char *dst, size_t dst_len, const _z_str_intmap_t *s, uint8_t argc,
+                             _z_str_intmapping_t argv[]) {
+     size_t len = dst_len;
+-    const char lsep = INT_STR_MAP_LIST_SEPARATOR;
+-    const char ksep = INT_STR_MAP_KEYVALUE_SEPARATOR;
+-
+     dst[0] = '\0';
+     for (size_t i = 0; i < argc; i++) {
+         char *v = _z_str_intmap_get(s, argv[i]._key);
+         if (v != NULL) {
+             if (len > (size_t)0) {
+-                (void)strncat(dst, &lsep, 1);  // List separator
++                _z_str_append(dst, INT_STR_MAP_LIST_SEPARATOR);  // List separator
+                 len = len - (size_t)1;
+             }
+ 
+@@ -159,7 +157,7 @@ void _z_str_intmap_onto_str(char *dst, size_t dst_len, const _z_str_intmap_t *s,
+                 len = len - strlen(argv[i]._str);
+             }
+             if (len > (size_t)0) {
+-                (void)strncat(dst, &ksep, 1);  // KeyValue separator
++                _z_str_append(dst, INT_STR_MAP_KEYVALUE_SEPARATOR);  // KeyValue separator
+                 len = len - (size_t)1;
+             }
+             if (len > (size_t)0) {
+diff --git a/src/session/rx.c b/src/session/rx.c
+index d85f9d38..8556ce1d 100644
+--- a/src/session/rx.c
++++ b/src/session/rx.c
+@@ -93,6 +93,8 @@ static z_result_t _z_handle_declare(_z_session_t *zn, _z_n_msg_declare_t *decl,
+ 
+ static z_result_t _z_handle_request(_z_session_rc_t *zsrc, _z_session_t *zn, _z_n_msg_request_t *req,
+                                     z_reliability_t reliability) {
++    _ZP_UNUSED(reliability);
++    _ZP_UNUSED(zsrc);
+     switch (req->_tag) {
+         case _Z_REQUEST_QUERY:
+ #if Z_FEATURE_QUERYABLE == 1
+@@ -158,6 +160,7 @@ static z_result_t _z_handle_response(_z_session_t *zn, _z_n_msg_response_t *resp
+     }
+ #else
+     _z_n_msg_response_clear(resp);
++    _ZP_UNUSED(zn);
+ #endif
+     return _Z_RES_OK;
+ }
+diff --git a/src/transport/multicast/rx.c b/src/transport/multicast/rx.c
+index 121406d0..47269b1a 100644
+--- a/src/transport/multicast/rx.c
++++ b/src/transport/multicast/rx.c
+@@ -294,6 +294,10 @@ static z_result_t _z_multicast_handle_fragment_inner(_z_transport_multicast_t *z
+         *dbuf_state = _Z_DBUF_STATE_NULL;
+     }
+ #else
++    _ZP_UNUSED(ztm);
++    _ZP_UNUSED(header);
++    _ZP_UNUSED(msg);
++    _ZP_UNUSED(entry);
+     _Z_INFO("Fragment dropped because fragmentation feature is deactivated");
+ #endif
+     return ret;
+diff --git a/src/transport/unicast/rx.c b/src/transport/unicast/rx.c
+index c5ccf932..43e1b4c8 100644
+--- a/src/transport/unicast/rx.c
++++ b/src/transport/unicast/rx.c
+@@ -248,6 +248,10 @@ static z_result_t _z_unicast_handle_fragment_inner(_z_transport_unicast_t *ztu,
+         *dbuf_state = _Z_DBUF_STATE_NULL;
+     }
+ #else
++    _ZP_UNUSED(ztu);
++    _ZP_UNUSED(header);
++    _ZP_UNUSED(msg);
++    _ZP_UNUSED(peer);
+     _Z_INFO("Fragment dropped because fragmentation feature is deactivated");
+ #endif
+     return ret;
+-- 
+2.50.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
