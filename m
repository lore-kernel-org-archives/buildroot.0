Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35F6C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C6734071E;
	Fri, 16 May 2025 14:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZ2xYvmO_o22; Fri, 16 May 2025 14:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE6EE405A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE6EE405A3;
	Fri, 16 May 2025 14:16:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7656D185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C6FD80E10
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Am25HSGcnSmU for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C40C80E95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C40C80E95
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:16:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B33C86AC2; Fri, 16 May 2025 14:16:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:14:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9868ca6ec98afa28a94aea50cc940db7df860396
X-Git-Newrev: 0814b614c255abedefe5f65564f0871dbcafab9e
X-Patchwork-Hint: ignore
Message-Id: <20250516141650.2B33C86AC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: fix build with GCC 15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0814b614c255abedefe5f65564f0871dbcafab9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A set of `unterminated-string-initialization` errors appeared when
building the micropython package with GCC15 on the host.
The autobuilder failed to build the package micropython with the
following error:

```
CC ../py/emitinlinethumb.c
../py/emitinlinethumb.c:153:9: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (4 chars into 3 available) [-Werror=unterminated-string-initialization]
  153 |     {0, "r0\0"},
      |         ^~~~~~
../py/emitinlinethumb.c:154:9: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (4 chars into 3 available) [-Werror=unterminated-string-initialization]
  154 |     {1, "r1\0"},
      |         ^~~~~~
...
```

This patch adds the set of upstream commits to fix the compatbility with
GCC15 (see [1]).
The patches were backported to micropython v1.22.2. The main difference
with the upstream version is that since the v1.23, the project removed the
use of the `STATIC` macro (see [2]).

Also, in the codebase of v1.22.2 the 'unterminated-string-initialization'
error occured in another file that was reworked in the patch [3] and
included in v1.25. This patch is included as well to remove the error in
v1.22.2.

[1] package/micropython/0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch
[2] https://github.com/micropython/micropython/commit/decf8e6a8bb940d5829ca3296790631fcece7b21
[3] package/micropython/0002-py-emitinlinextensa-Simplify-register-name-lookup.patch

Fixes: https://autobuild.buildroot.org/results/fdf/fdf1d7c3e3a51e6fc7fa5abea57de6c9ce792015

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...nlinextensa-Simplify-register-name-lookup.patch |  85 ++++++++
 ...-15-1-unterminated-string-literal-warning.patch | 234 +++++++++++++++++++++
 2 files changed, 319 insertions(+)

diff --git a/package/micropython/0002-py-emitinlinextensa-Simplify-register-name-lookup.patch b/package/micropython/0002-py-emitinlinextensa-Simplify-register-name-lookup.patch
new file mode 100644
index 0000000000..1d18db8235
--- /dev/null
+++ b/package/micropython/0002-py-emitinlinextensa-Simplify-register-name-lookup.patch
@@ -0,0 +1,85 @@
+From 7d9fcfcd1b0ef9f20e703037eba6a49a4fc4cb0c Mon Sep 17 00:00:00 2001
+From: Alessandro Gatti <a.gatti@frob.it>
+Date: Tue, 28 Jan 2025 14:58:29 +0100
+Subject: [PATCH] py/emitinlinextensa: Simplify register name lookup.
+
+This commit changes the Xtensa inline assembly parser to use a slightly
+simpler (and probably a tiny bit more efficient) way to look up register
+names when decoding instruction parameters.
+
+Signed-off-by: Alessandro Gatti <a.gatti@frob.it>
+Upstream: https://github.com/micropython/micropython/commit/50fab08e6b861adf65905d6adacd74201c87ddb9
+[tperale: backport 1.22.2]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ py/emitinlinextensa.c | 49 +++++++++----------------------------------
+ 1 file changed, 10 insertions(+), 39 deletions(-)
+
+diff --git a/py/emitinlinextensa.c b/py/emitinlinextensa.c
+index 5dac2ae39..e59146047 100644
+--- a/py/emitinlinextensa.c
++++ b/py/emitinlinextensa.c
+@@ -115,50 +115,21 @@ STATIC bool emit_inline_xtensa_label(emit_inline_asm_t *emit, mp_uint_t label_nu
+     return true;
+ }
+ 
+-typedef struct _reg_name_t { byte reg;
+-                             byte name[3];
+-} reg_name_t;
+-STATIC const reg_name_t reg_name_table[] = {
+-    {0, "a0\0"},
+-    {1, "a1\0"},
+-    {2, "a2\0"},
+-    {3, "a3\0"},
+-    {4, "a4\0"},
+-    {5, "a5\0"},
+-    {6, "a6\0"},
+-    {7, "a7\0"},
+-    {8, "a8\0"},
+-    {9, "a9\0"},
+-    {10, "a10"},
+-    {11, "a11"},
+-    {12, "a12"},
+-    {13, "a13"},
+-    {14, "a14"},
+-    {15, "a15"},
++STATIC const qstr_short_t REGISTERS[16] = {
++    MP_QSTR_a0, MP_QSTR_a1, MP_QSTR_a2, MP_QSTR_a3, MP_QSTR_a4, MP_QSTR_a5, MP_QSTR_a6, MP_QSTR_a7,
++    MP_QSTR_a8, MP_QSTR_a9, MP_QSTR_a10, MP_QSTR_a11, MP_QSTR_a12, MP_QSTR_a13, MP_QSTR_a14, MP_QSTR_a15
+ };
+ 
+-// return empty string in case of error, so we can attempt to parse the string
+-// without a special check if it was in fact a string
+-STATIC const char *get_arg_str(mp_parse_node_t pn) {
+-    if (MP_PARSE_NODE_IS_ID(pn)) {
+-        qstr qst = MP_PARSE_NODE_LEAF_ARG(pn);
+-        return qstr_str(qst);
+-    } else {
+-        return "";
+-    }
+-}
+-
+ STATIC mp_uint_t get_arg_reg(emit_inline_asm_t *emit, const char *op, mp_parse_node_t pn) {
+-    const char *reg_str = get_arg_str(pn);
+-    for (mp_uint_t i = 0; i < MP_ARRAY_SIZE(reg_name_table); i++) {
+-        const reg_name_t *r = &reg_name_table[i];
+-        if (reg_str[0] == r->name[0]
+-            && reg_str[1] == r->name[1]
+-            && reg_str[2] == r->name[2]
+-            && (reg_str[2] == '\0' || reg_str[3] == '\0')) {
+-            return r->reg;
++    if (MP_PARSE_NODE_IS_ID(pn)) {
++        qstr node_qstr = MP_PARSE_NODE_LEAF_ARG(pn);
++        for (size_t i = 0; i < MP_ARRAY_SIZE(REGISTERS); i++) {
++            if (node_qstr == REGISTERS[i]) {
++                return i;
++            }
+         }
+     }
++
+     emit_inline_xtensa_error_exc(emit,
+         mp_obj_new_exception_msg_varg(&mp_type_SyntaxError,
+             MP_ERROR_TEXT("'%s' expects a register"), op));
+-- 
+2.49.0
+
diff --git a/package/micropython/0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch b/package/micropython/0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch
new file mode 100644
index 0000000000..31775bdbc0
--- /dev/null
+++ b/package/micropython/0003-Fixes-for-GCC-15-1-unterminated-string-literal-warning.patch
@@ -0,0 +1,234 @@
+From 531d4839d44a90447c232d51d1bee0cae45add9a Mon Sep 17 00:00:00 2001
+From: Angus Gratton <angus@redyak.com.au>
+Date: Fri, 9 May 2025 13:34:37 +1000
+Subject: [PATCH] extmod/moductypes: Refactor string literal as array
+ initializer.
+
+Avoids the new Wunterminated-string-literal when compiled with gcc 15.1.
+
+Also split out the duplicate string to a top-level array (probably the
+duplicate string literal was interned, so unlikely to have any impact.)
+
+This work was funded through GitHub Sponsors.
+
+Signed-off-by: Angus Gratton <angus@redyak.com.au>
+Upstream: https://github.com/micropython/micropython/pull/17269
+[tperale: backport 1.22.2]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ extmod/moductypes.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/extmod/moductypes.c b/extmod/moductypes.c
+index f56567107..87fd5fb69 100644
+--- a/extmod/moductypes.c
++++ b/extmod/moductypes.c
+@@ -277,15 +277,18 @@ STATIC mp_obj_t uctypes_struct_sizeof(size_t n_args, const mp_obj_t *args) {
+ }
+ STATIC MP_DEFINE_CONST_FUN_OBJ_VAR_BETWEEN(uctypes_struct_sizeof_obj, 1, 2, uctypes_struct_sizeof);
+ 
++static const char type2char[16] = {
++    'B', 'b', 'H', 'h', 'I', 'i', 'Q', 'q',
++    '-', '-', '-', '-', '-', '-', 'f', 'd'
++};
++
+ static inline mp_obj_t get_unaligned(uint val_type, byte *p, int big_endian) {
+     char struct_type = big_endian ? '>' : '<';
+-    static const char type2char[16] = "BbHhIiQq------fd";
+     return mp_binary_get_val(struct_type, type2char[val_type], p, &p);
+ }
+ 
+ static inline void set_unaligned(uint val_type, byte *p, int big_endian, mp_obj_t val) {
+     char struct_type = big_endian ? '>' : '<';
+-    static const char type2char[16] = "BbHhIiQq------fd";
+     mp_binary_set_val(struct_type, type2char[val_type], val, p, &p);
+ }
+ 
+
+From 0398873d8c8096d2054db130efd1fcecba2a426d Mon Sep 17 00:00:00 2001
+From: Angus Gratton <angus@redyak.com.au>
+Date: Fri, 9 May 2025 13:36:05 +1000
+Subject: [PATCH] py/emitinlinethumb: Refactor string literal as array
+ initializer.
+
+Avoids the new Wunterminated-string-literal when compiled with gcc 15.1.
+
+This work was funded through GitHub Sponsors.
+
+Signed-off-by: Angus Gratton <angus@redyak.com.au>
+---
+ py/emitinlinethumb.c | 108 +++++++++++++++++++++----------------------
+ 1 file changed, 54 insertions(+), 54 deletions(-)
+
+diff --git a/py/emitinlinethumb.c b/py/emitinlinethumb.c
+index 29487f104..0b9efa1da 100644
+--- a/py/emitinlinethumb.c
++++ b/py/emitinlinethumb.c
+@@ -150,27 +150,27 @@ typedef struct _reg_name_t { byte reg;
+                              byte name[3];
+ } reg_name_t;
+ STATIC const reg_name_t reg_name_table[] = {
+-    {0, "r0\0"},
+-    {1, "r1\0"},
+-    {2, "r2\0"},
+-    {3, "r3\0"},
+-    {4, "r4\0"},
+-    {5, "r5\0"},
+-    {6, "r6\0"},
+-    {7, "r7\0"},
+-    {8, "r8\0"},
+-    {9, "r9\0"},
+-    {10, "r10"},
+-    {11, "r11"},
+-    {12, "r12"},
+-    {13, "r13"},
+-    {14, "r14"},
+-    {15, "r15"},
+-    {10, "sl\0"},
+-    {11, "fp\0"},
+-    {13, "sp\0"},
+-    {14, "lr\0"},
+-    {15, "pc\0"},
++    {0, {'r', '0' }},
++    {1, {'r', '1' }},
++    {2, {'r', '2' }},
++    {3, {'r', '3' }},
++    {4, {'r', '4' }},
++    {5, {'r', '5' }},
++    {6, {'r', '6' }},
++    {7, {'r', '7' }},
++    {8, {'r', '8' }},
++    {9, {'r', '9' }},
++    {10, {'r', '1', '0' }},
++    {11, {'r', '1', '1' }},
++    {12, {'r', '1', '2' }},
++    {13, {'r', '1', '3' }},
++    {14, {'r', '1', '4' }},
++    {15, {'r', '1', '5' }},
++    {10, {'s', 'l' }},
++    {11, {'f', 'p' }},
++    {13, {'s', 'p' }},
++    {14, {'l', 'r' }},
++    {15, {'p', 'c' }},
+ };
+ 
+ #define MAX_SPECIAL_REGISTER_NAME_LENGTH 7
+@@ -368,20 +368,20 @@ typedef struct _cc_name_t { byte cc;
+                             byte name[2];
+ } cc_name_t;
+ STATIC const cc_name_t cc_name_table[] = {
+-    { ASM_THUMB_CC_EQ, "eq" },
+-    { ASM_THUMB_CC_NE, "ne" },
+-    { ASM_THUMB_CC_CS, "cs" },
+-    { ASM_THUMB_CC_CC, "cc" },
+-    { ASM_THUMB_CC_MI, "mi" },
+-    { ASM_THUMB_CC_PL, "pl" },
+-    { ASM_THUMB_CC_VS, "vs" },
+-    { ASM_THUMB_CC_VC, "vc" },
+-    { ASM_THUMB_CC_HI, "hi" },
+-    { ASM_THUMB_CC_LS, "ls" },
+-    { ASM_THUMB_CC_GE, "ge" },
+-    { ASM_THUMB_CC_LT, "lt" },
+-    { ASM_THUMB_CC_GT, "gt" },
+-    { ASM_THUMB_CC_LE, "le" },
++    { ASM_THUMB_CC_EQ, { 'e', 'q' }},
++    { ASM_THUMB_CC_NE, { 'n', 'e' }},
++    { ASM_THUMB_CC_CS, { 'c', 's' }},
++    { ASM_THUMB_CC_CC, { 'c', 'c' }},
++    { ASM_THUMB_CC_MI, { 'm', 'i' }},
++    { ASM_THUMB_CC_PL, { 'p', 'l' }},
++    { ASM_THUMB_CC_VS, { 'v', 's' }},
++    { ASM_THUMB_CC_VC, { 'v', 'c' }},
++    { ASM_THUMB_CC_HI, { 'h', 'i' }},
++    { ASM_THUMB_CC_LS, { 'l', 's' }},
++    { ASM_THUMB_CC_GE, { 'g', 'e' }},
++    { ASM_THUMB_CC_LT, { 'l', 't' }},
++    { ASM_THUMB_CC_GT, { 'g', 't' }},
++    { ASM_THUMB_CC_LE, { 'l', 'e' }},
+ };
+ 
+ typedef struct _format_4_op_t { byte op;
+@@ -389,21 +389,21 @@ typedef struct _format_4_op_t { byte op;
+ } format_4_op_t;
+ #define X(x) (((x) >> 4) & 0xff) // only need 1 byte to distinguish these ops
+ STATIC const format_4_op_t format_4_op_table[] = {
+-    { X(ASM_THUMB_FORMAT_4_EOR), "eor" },
+-    { X(ASM_THUMB_FORMAT_4_LSL), "lsl" },
+-    { X(ASM_THUMB_FORMAT_4_LSR), "lsr" },
+-    { X(ASM_THUMB_FORMAT_4_ASR), "asr" },
+-    { X(ASM_THUMB_FORMAT_4_ADC), "adc" },
+-    { X(ASM_THUMB_FORMAT_4_SBC), "sbc" },
+-    { X(ASM_THUMB_FORMAT_4_ROR), "ror" },
+-    { X(ASM_THUMB_FORMAT_4_TST), "tst" },
+-    { X(ASM_THUMB_FORMAT_4_NEG), "neg" },
+-    { X(ASM_THUMB_FORMAT_4_CMP), "cmp" },
+-    { X(ASM_THUMB_FORMAT_4_CMN), "cmn" },
+-    { X(ASM_THUMB_FORMAT_4_ORR), "orr" },
+-    { X(ASM_THUMB_FORMAT_4_MUL), "mul" },
+-    { X(ASM_THUMB_FORMAT_4_BIC), "bic" },
+-    { X(ASM_THUMB_FORMAT_4_MVN), "mvn" },
++    { X(ASM_THUMB_FORMAT_4_EOR), {'e', 'o', 'r' }},
++    { X(ASM_THUMB_FORMAT_4_LSL), {'l', 's', 'l' }},
++    { X(ASM_THUMB_FORMAT_4_LSR), {'l', 's', 'r' }},
++    { X(ASM_THUMB_FORMAT_4_ASR), {'a', 's', 'r' }},
++    { X(ASM_THUMB_FORMAT_4_ADC), {'a', 'd', 'c' }},
++    { X(ASM_THUMB_FORMAT_4_SBC), {'s', 'b', 'c' }},
++    { X(ASM_THUMB_FORMAT_4_ROR), {'r', 'o', 'r' }},
++    { X(ASM_THUMB_FORMAT_4_TST), {'t', 's', 't' }},
++    { X(ASM_THUMB_FORMAT_4_NEG), {'n', 'e', 'g' }},
++    { X(ASM_THUMB_FORMAT_4_CMP), {'c', 'm', 'p' }},
++    { X(ASM_THUMB_FORMAT_4_CMN), {'c', 'm', 'n' }},
++    { X(ASM_THUMB_FORMAT_4_ORR), {'o', 'r', 'r' }},
++    { X(ASM_THUMB_FORMAT_4_MUL), {'m', 'u', 'l' }},
++    { X(ASM_THUMB_FORMAT_4_BIC), {'b', 'i', 'c' }},
++    { X(ASM_THUMB_FORMAT_4_MVN), {'m', 'v', 'n' }},
+ };
+ #undef X
+ 
+@@ -428,10 +428,10 @@ typedef struct _format_vfp_op_t {
+     char name[3];
+ } format_vfp_op_t;
+ STATIC const format_vfp_op_t format_vfp_op_table[] = {
+-    { 0x30, "add" },
+-    { 0x34, "sub" },
+-    { 0x20, "mul" },
+-    { 0x80, "div" },
++    { 0x30, {'a', 'd', 'd' }},
++    { 0x34, {'s', 'u', 'b' }},
++    { 0x20, {'m', 'u', 'l' }},
++    { 0x80, {'d', 'i', 'v' }},
+ };
+ 
+ // shorthand alias for whether we allow ARMv7-M instructions
+
+From bfd5a0350a0d53f52695d373dae6ee367971b145 Mon Sep 17 00:00:00 2001
+From: Angus Gratton <angus@redyak.com.au>
+Date: Fri, 9 May 2025 14:34:09 +1000
+Subject: [PATCH] lib/littlefs: Fix string initializer in lfs1.c.
+
+Avoids the new Wunterminated-string-literal when compiled with gcc 15.1.
+
+It would be preferable to just disable this warning, but Clang
+-Wunknown-warning-option kicks in even when disabling warnings so this
+becomes fiddly to apply.
+
+This work was funded through GitHub Sponsors.
+
+Signed-off-by: Angus Gratton <angus@redyak.com.au>
+---
+ lib/littlefs/lfs1.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/littlefs/lfs1.c b/lib/littlefs/lfs1.c
+index 6a3fd670012cc..ec18dc470258c 100644
+--- a/lib/littlefs/lfs1.c
++++ b/lib/littlefs/lfs1.c
+@@ -2141,7 +2141,7 @@ int lfs1_format(lfs1_t *lfs1, const struct lfs1_config *cfg) {
+             .d.elen = sizeof(superblock.d) - sizeof(superblock.d.magic) - 4,
+             .d.nlen = sizeof(superblock.d.magic),
+             .d.version = LFS1_DISK_VERSION,
+-            .d.magic = {"littlefs"},
++            .d.magic = {'l', 'i', 't', 't', 'l', 'e', 'f', 's'},
+             .d.block_size  = lfs1->cfg->block_size,
+             .d.block_count = lfs1->cfg->block_count,
+             .d.root = {lfs1->root[0], lfs1->root[1]},
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
