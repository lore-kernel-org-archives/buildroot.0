Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F9DC87FCE
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 11:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0894F8412B;
	Sun, 27 Jul 2025 11:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ff6uKi572lgt; Sun, 27 Jul 2025 11:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBB6F83C4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB6F83C4E;
	Sun, 27 Jul 2025 11:00:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 409F4231
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 11:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2757041350
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 11:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwOeMLYfe0fp for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 11:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C78A640FA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C78A640FA1
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C78A640FA1
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 11:00:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so330184f8f.0
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 04:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753614033; x=1754218833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H/u3q1jfCvyYjqIjOs8AdLQA+xbzO453LN4LwHk0nK0=;
 b=Y1jfU9uGZPhjbzrPAlfqHAA94YFmp+4i6iJR7ouJVUXKkhQNjsLpPmsPhFUJMDAHux
 SsYaWzVrvoVW4+OoRvczR2t2SfcqKnOQe0DJ2nEaA5vPMc44CQWOap5R1fuMBMZLRXrC
 zp99v+kghfCsBnXNNJrd1sojtUopzudC3WMD2Z0EdtHOElVmk0qKhfzWdayUs6o4dXaG
 WarVVFqg4IqTZ8YBo9BBaBSbstTU62/BG+Jm8wjlLmrnCQpUByHBPT1zfb6QPfIAUA6O
 NTr29HGnf7qNA0Xi1MHLHQge0nn8Mo89FwPgAQ25jjfwca3/N6JGAPkuEVNzmyXHAbKB
 tkdA==
X-Gm-Message-State: AOJu0Yyh8VzklKF5T9hCm+Ymb9aZk+ME4jfGxKslmBwbkUsnXn+pnk7L
 J5DdNwW96w/9BA8BsyNfmS5+eWmct6oUT3tnjm1jhJSyb1q5xKPOSq/0DCqnOMUxpx1DOu39Hye
 HHAQg
X-Gm-Gg: ASbGncsrFerAdPfJZKgcFk/yOYX7apR6or91BUq59uMXEm9uRy0v//4jv6JcofEopfC
 AFcy+h3X2V2rYzLBrgSk/1jB9ULPxYPb9117QyLr01A3oRugM1vW2okNfuax2jcEb2jeccKronv
 pAtsQ3DaCW5R4s74nqK49m6zxYMHipkYfQOqizX1/q45inSXHVZaMeKs2stf0wivdffWbkdUVLy
 qwC/igQ6Ov1tTIx7BspzyveiMQlPdXnr7WAC3bz78vUE+0UH7vliMr7dMrqPbcvlNvUZGu2zxJu
 DL3pt+Gnv9NKf595j9aisP4Whm6ZTJHHK6nbhll4Wz0ADmQGEQA4LmydXQYLrrdaD/9rwOx4rfr
 yPTpY3Mdrftife4fFehtOj5P4
X-Google-Smtp-Source: AGHT+IEGbE04Qa35aXBcp2T8hHpeJO+wJGrRzx3LDnmgsZh+sIBSIpt4GIYlMXT7dF3pTnsXbOzWmw==
X-Received: by 2002:adf:a2db:0:b0:3b7:7936:e7f1 with SMTP id
 ffacd0b85a97d-3b77936edd9mr2712803f8f.47.1753614033099; 
 Sun, 27 Jul 2025 04:00:33 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705ce685sm114879955e9.30.2025.07.27.04.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 04:00:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>
Date: Sun, 27 Jul 2025 13:00:31 +0200
Message-ID: <20250727110031.1126248-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753614033; x=1754218833; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H/u3q1jfCvyYjqIjOs8AdLQA+xbzO453LN4LwHk0nK0=;
 b=FcaqPwRQPTcLu5bt1cF09qXOj8EmUdwUF5+aS1q0bJh/q+8WDhfARyDSPvWkHReRlG
 32kcAVrL6lABf/opYpeYZ8jAkcqd2rDLkegxfUOVgrBsnHD4svd/RqNUmXEe8PqS+w/2
 grb7IuYyUqtU1/96fHwb2MzD9hbRCsIMq49HaD7y7yx/fluVvrgIrGKCIDzTlYKfv3OA
 r9aLY0l4vUkRGINmVCxLPxgMyn6d2iI74CFdRrlfnEGdB4oBdWRHQQvawhBzRsKJ4K3S
 Ub2jiipUtshAlZ7LMElHCmIrmjlyTwa3Xb/tZfQKsKxyDiuzhgWxCympc8RJqZ+ZnU8T
 uXZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FcaqPwRQ
Subject: [Buildroot] [PATCH] package/micropython: add patch for CVE-2024-8947
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:

- CVE-2024-8947

 A vulnerability was found in MicroPython 1.22.2. It has been declared
 as critical. Affected by this vulnerability is an unknown functionality
 of the file py/objarray.c. The manipulation leads to use after free.
 The attack can be launched remotely. The complexity of an attack is
 rather high. The exploitation appears to be difficult. Upgrading to
 version 1.23.0 is able to address this issue. It is recommended to
 upgrade the affected component. In micropython objarray component, when
 a bytes object is resized and copied into itself, it may reference
 memory that has already been freed.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2024-8947
  - https://github.com/micropython/micropython/commit/4bed614e707c0644c06e117f848fa12605c711cd

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
Tested with `support/testing/run-tests -d dl -o output_folder -k tests.package.test_micropython`
---
 ...if-extending-a-bytearray-from-itself.patch | 183 ++++++++++++++++++
 package/micropython/micropython.mk            |   3 +
 2 files changed, 186 insertions(+)
 create mode 100644 package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch

diff --git a/package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch b/package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
new file mode 100644
index 0000000000..90a795a6c3
--- /dev/null
+++ b/package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
@@ -0,0 +1,183 @@
+From 4bed614e707c0644c06e117f848fa12605c711cd Mon Sep 17 00:00:00 2001
+From: Angus Gratton <angus@redyak.com.au>
+Date: Tue, 13 Feb 2024 09:24:36 +1100
+Subject: [PATCH] py/objarray: Fix use-after-free if extending a bytearray from
+ itself.
+
+Two cases, one assigning to a slice.
+Closes https://github.com/micropython/micropython/issues/13283
+
+Second is extending a slice from itself, similar logic.
+
+In both cases the problem occurs when m_renew causes realloc to move the
+buffer, leaving a dangling pointer behind.
+
+There are more complex and hard to fix cases when either argument is a
+memoryview into the buffer, currently resizing to a new address breaks
+memoryviews into that object.
+
+Reproducing this bug and confirming the fix was done by running the unix
+port under valgrind with GC-aware extensions.
+
+Note in default configurations with GIL this bug exists but has no impact
+(the free buffer won't be reused while the function is still executing, and
+is no longer referenced after it returns).
+
+Signed-off-by: Angus Gratton <angus@redyak.com.au>
+CVE: CVE-2024-8947
+Upstream: https://github.com/micropython/micropython/commit/4bed614e707c0644c06e117f848fa12605c711cd
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ py/objarray.c                          | 20 ++++++++++++++++----
+ tests/basics/bytearray_add.py          |  9 ++++++++-
+ tests/basics/bytearray_add_self.py     |  8 ++++++++
+ tests/basics/bytearray_add_self.py.exp |  1 +
+ tests/basics/bytearray_slice_assign.py | 18 ++++++++++++------
+ 5 files changed, 45 insertions(+), 11 deletions(-)
+ create mode 100644 tests/basics/bytearray_add_self.py
+ create mode 100644 tests/basics/bytearray_add_self.py.exp
+
+diff --git a/py/objarray.c b/py/objarray.c
+index 1fff234822521..803af2cd270c7 100644
+--- a/py/objarray.c
++++ b/py/objarray.c
+@@ -424,6 +424,13 @@ static mp_obj_t array_extend(mp_obj_t self_in, mp_obj_t arg_in) {
+     if (self->free < len) {
+         self->items = m_renew(byte, self->items, (self->len + self->free) * sz, (self->len + len) * sz);
+         self->free = 0;
++
++        if (self_in == arg_in) {
++            // Get arg_bufinfo again in case self->items has moved
++            //
++            // (Note not possible to handle case that arg_in is a memoryview into self)
++            mp_get_buffer_raise(arg_in, &arg_bufinfo, MP_BUFFER_READ);
++        }
+     } else {
+         self->free -= len;
+     }
+@@ -456,7 +463,8 @@ static mp_obj_t array_subscr(mp_obj_t self_in, mp_obj_t index_in, mp_obj_t value
+                 #if MICROPY_PY_ARRAY_SLICE_ASSIGN
+                 // Assign
+                 size_t src_len;
+-                void *src_items;
++                uint8_t *src_items;
++                size_t src_offs = 0;
+                 size_t item_sz = mp_binary_get_size('@', o->typecode & TYPECODE_MASK, NULL);
+                 if (mp_obj_is_obj(value) && MP_OBJ_TYPE_GET_SLOT_OR_NULL(((mp_obj_base_t *)MP_OBJ_TO_PTR(value))->type, subscr) == array_subscr) {
+                     // value is array, bytearray or memoryview
+@@ -469,7 +477,7 @@ static mp_obj_t array_subscr(mp_obj_t self_in, mp_obj_t index_in, mp_obj_t value
+                     src_items = src_slice->items;
+                     #if MICROPY_PY_BUILTINS_MEMORYVIEW
+                     if (mp_obj_is_type(value, &mp_type_memoryview)) {
+-                        src_items = (uint8_t *)src_items + (src_slice->memview_offset * item_sz);
++                        src_offs = src_slice->memview_offset * item_sz;
+                     }
+                     #endif
+                 } else if (mp_obj_is_type(value, &mp_type_bytes)) {
+@@ -504,13 +512,17 @@ static mp_obj_t array_subscr(mp_obj_t self_in, mp_obj_t index_in, mp_obj_t value
+                         // TODO: alloc policy; at the moment we go conservative
+                         o->items = m_renew(byte, o->items, (o->len + o->free) * item_sz, (o->len + len_adj) * item_sz);
+                         o->free = len_adj;
++                        // m_renew may have moved o->items
++                        if (src_items == dest_items) {
++                            src_items = o->items;
++                        }
+                         dest_items = o->items;
+                     }
+                     mp_seq_replace_slice_grow_inplace(dest_items, o->len,
+-                        slice.start, slice.stop, src_items, src_len, len_adj, item_sz);
++                        slice.start, slice.stop, src_items + src_offs, src_len, len_adj, item_sz);
+                 } else {
+                     mp_seq_replace_slice_no_grow(dest_items, o->len,
+-                        slice.start, slice.stop, src_items, src_len, item_sz);
++                        slice.start, slice.stop, src_items + src_offs, src_len, item_sz);
+                     // Clear "freed" elements at the end of list
+                     // TODO: This is actually only needed for typecode=='O'
+                     mp_seq_clear(dest_items, o->len + len_adj, o->len, item_sz);
+diff --git a/tests/basics/bytearray_add.py b/tests/basics/bytearray_add.py
+index a7e2b57374255..1f30a3b740e95 100644
+--- a/tests/basics/bytearray_add.py
++++ b/tests/basics/bytearray_add.py
+@@ -15,4 +15,11 @@
+ 
+ # this inplace add tests the code when the buffer doesn't need to be increased
+ b = bytearray()
+-b += b''
++b += b""
++
++# extend a bytearray from itself
++b = bytearray(b"abcdefgh")
++for _ in range(4):
++    c = bytearray(b)  # extra allocation, as above
++    b.extend(b)
++print(b)
+diff --git a/tests/basics/bytearray_add_self.py b/tests/basics/bytearray_add_self.py
+new file mode 100644
+index 0000000000000..94ae8689fd16c
+--- /dev/null
++++ b/tests/basics/bytearray_add_self.py
+@@ -0,0 +1,8 @@
++# add a bytearray to itself
++# This is not supported by CPython as of 3.11.18.
++
++b = bytearray(b"123456789")
++for _ in range(4):
++    c = bytearray(b)  # extra allocation increases chance 'b' has to relocate
++    b += b
++print(b)
+diff --git a/tests/basics/bytearray_add_self.py.exp b/tests/basics/bytearray_add_self.py.exp
+new file mode 100644
+index 0000000000000..5ef948157ac0f
+--- /dev/null
++++ b/tests/basics/bytearray_add_self.py.exp
+@@ -0,0 +1 @@
++bytearray(b'123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789')
+diff --git a/tests/basics/bytearray_slice_assign.py b/tests/basics/bytearray_slice_assign.py
+index fa7878e10ddbb..4de0819042a13 100644
+--- a/tests/basics/bytearray_slice_assign.py
++++ b/tests/basics/bytearray_slice_assign.py
+@@ -18,7 +18,7 @@
+ l[1:3] = bytearray()
+ print(l)
+ l = bytearray(x)
+-#del l[1:3]
++# del l[1:3]
+ print(l)
+ 
+ l = bytearray(x)
+@@ -28,7 +28,7 @@
+ l[:3] = bytearray()
+ print(l)
+ l = bytearray(x)
+-#del l[:3]
++# del l[:3]
+ print(l)
+ 
+ l = bytearray(x)
+@@ -38,7 +38,7 @@
+ l[:-3] = bytearray()
+ print(l)
+ l = bytearray(x)
+-#del l[:-3]
++# del l[:-3]
+ print(l)
+ 
+ # slice assignment that extends the array
+@@ -61,8 +61,14 @@
+ print(b)
+ 
+ # Growth of bytearray via slice extension
+-b = bytearray(b'12345678')
+-b.append(57) # expand and add a bit of unused space at end of the bytearray
++b = bytearray(b"12345678")
++b.append(57)  # expand and add a bit of unused space at end of the bytearray
+ for i in range(400):
+-    b[-1:] = b'ab' # grow slowly into the unused space
++    b[-1:] = b"ab"  # grow slowly into the unused space
++print(len(b), b)
++
++# Growth of bytearray via slice extension from itself
++b = bytearray(b"1234567")
++for i in range(3):
++    b[-1:] = b
+ print(len(b), b)
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 558ef86534..949abe3b0b 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -15,6 +15,9 @@ MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-python3
 MICROPYTHON_CPE_ID_VENDOR = micropython
 
+# 0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
+MICROPYTHON_IGNORE_CVES += CVE-2024-8947
+
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
