Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20587C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE0340606;
	Thu,  7 Aug 2025 18:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTwMpLvUDhHT; Thu,  7 Aug 2025 18:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB8C0405DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8C0405DF;
	Thu,  7 Aug 2025 18:25:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 702A810A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5554040057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYDUIl9zk1oF for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13C2D40087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C2D40087
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13C2D40087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-458ba079338so9983295e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591081; x=1755195881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQrOWsQdXeWxD+64RS7oD2F+dsZ6KbnsqMMfPj0cQYM=;
 b=F8AtGYw52wnwv3q2t7/4aIt2qK3x8G9j3zrXvNjPCiB7vFhrU5oYRM2KxzmPCI5hgI
 p8SIWw09muQf6RY7utitKMHh/aX5fj94LFaM62b59baS61RQxN24shQjTbrJxFwlqENq
 tIMPDfVxbXDjGOqJMPzDVmDa0/Kx3gQglrkQ7sf2daqemqviJvby5mQxuxj74DIElcp6
 L1EcchtPHbqtVKpkz7lEqBJydDyIazVi4jnJzvzvMkVshaSJV+8+2xpHpMBSiyEXNZ75
 33qoCyji3UPfWLcq0FurwmPJwE4gej/KIBhRzpIFoY+3sZ95BqUFmw2n0KdR7bLkqwHu
 S2fg==
X-Gm-Message-State: AOJu0YwgwuoQstMwgk560SfkQPgi86WAP0/nmvFwj6TlcKnH22StR9Gt
 dgVDxcp2xcAvzAfMHuUCQjwjjOHRks5owEQknZFxYRQzjjoQK2G12WWEbQlSvgrpEGM=
X-Gm-Gg: ASbGnctjjlqXs/7rwfjsn+9nHfTDNKPL5KMKHlllrQdbmv5COgVTHq7Y9tYG+RTlN/+
 iY/kExla5ZN2OdSqKp8ceMW52cF2tWVCtzbfOd5NOq1D4LAb3+L1IfHm7M8UsyKDP80wwoW93xw
 LhXHyrELyduj7Jl4lr8aAJtzHj0+l6qy4eJiFsINjQKroXX70IeRsC6fXKB7yfXtGyFFmfqavIt
 e2X8TMWFXAbn0E5xuuolRRPMD1IQXICw4+o+PJqcNMzZguEV2HgY26Wbk9BW4cpIQHaTzLsz64p
 FZLLTYAmzS5/O61DlZWbNOeHa8LDkD8aj8aCbjtrzBzb1xbSYf+fAmQRiTILA+EYeweJ66w43Ih
 iysEcw7sHdfNsKQ==
X-Google-Smtp-Source: AGHT+IG4YQv1tuss/kyX2Hg+e7IUnEGRyH3VBV5V7XXtQ80XjY17eEqZ1S02IsxCvJ/78xBEgAPbLQ==
X-Received: by 2002:a05:600c:4f48:b0:458:6f13:aa4a with SMTP id
 5b1f17b1804b1-459ede7d697mr46678565e9.6.1754591081092; 
 Thu, 07 Aug 2025 11:24:41 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc900606sm167400495e9.15.2025.08.07.11.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:40 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:40 +0200
Message-ID: <20250807182440.726002-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250727110031.1126248-1-thomas.perale@mind.be>
References: <20250727110031.1126248-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591081; x=1755195881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQrOWsQdXeWxD+64RS7oD2F+dsZ6KbnsqMMfPj0cQYM=;
 b=FoETufD2pVWcIAnBKlOfTPD/anQq7pVbxulWugHiJVRP5PevER7MO8s8I6VLLk3a3y
 T+sMqupPfsLGMlrUEtI5vFikC39C8TxdTOYAkq0rDegtk6Y1beI2qUAh1Mwku2R2KktN
 G8eQvI15SihqWZZJDqQfMx8fr4kLL7HQgHa2jWuA7bhPFgS2A6e+oKHS61lopMuV3pQQ
 BnXqEofLOKnLlPG4R8hadg3DPbPIpOQkQHD6FlUFcn6EjRVTtoYVw/gNVLe53mFRWAdY
 X7eO88mAziWKUCrcYIkpKNwgPe4JvJTkzcF4e6HNzxM2sNaf6B5U6zk0dg18jMkACClu
 eu9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FoETufD2
Subject: Re: [Buildroot] [PATCH] package/micropython: add patch for
 CVE-2024-8947
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

In reply of:
> This fixes the following vulnerability:
> 
> - CVE-2024-8947
> 
>  A vulnerability was found in MicroPython 1.22.2. It has been declared
>  as critical. Affected by this vulnerability is an unknown functionality
>  of the file py/objarray.c. The manipulation leads to use after free.
>  The attack can be launched remotely. The complexity of an attack is
>  rather high. The exploitation appears to be difficult. Upgrading to
>  version 1.23.0 is able to address this issue. It is recommended to
>  upgrade the affected component. In micropython objarray component, when
>  a bytes object is resized and copied into itself, it may reference
>  memory that has already been freed.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2024-8947
>   - https://github.com/micropython/micropython/commit/4bed614e707c0644c06e117f848fa12605c711cd
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> Tested with `support/testing/run-tests -d dl -o output_folder -k tests.package.test_micropython`
> ---
>  ...if-extending-a-bytearray-from-itself.patch | 183 ++++++++++++++++++
>  package/micropython/micropython.mk            |   3 +
>  2 files changed, 186 insertions(+)
>  create mode 100644 package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
> 
> diff --git a/package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch b/package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
> new file mode 100644
> index 0000000000..90a795a6c3
> --- /dev/null
> +++ b/package/micropython/0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
> @@ -0,0 +1,183 @@
> +From 4bed614e707c0644c06e117f848fa12605c711cd Mon Sep 17 00:00:00 2001
> +From: Angus Gratton <angus@redyak.com.au>
> +Date: Tue, 13 Feb 2024 09:24:36 +1100
> +Subject: [PATCH] py/objarray: Fix use-after-free if extending a bytearray from
> + itself.
> +
> +Two cases, one assigning to a slice.
> +Closes https://github.com/micropython/micropython/issues/13283
> +
> +Second is extending a slice from itself, similar logic.
> +
> +In both cases the problem occurs when m_renew causes realloc to move the
> +buffer, leaving a dangling pointer behind.
> +
> +There are more complex and hard to fix cases when either argument is a
> +memoryview into the buffer, currently resizing to a new address breaks
> +memoryviews into that object.
> +
> +Reproducing this bug and confirming the fix was done by running the unix
> +port under valgrind with GC-aware extensions.
> +
> +Note in default configurations with GIL this bug exists but has no impact
> +(the free buffer won't be reused while the function is still executing, and
> +is no longer referenced after it returns).
> +
> +Signed-off-by: Angus Gratton <angus@redyak.com.au>
> +CVE: CVE-2024-8947
> +Upstream: https://github.com/micropython/micropython/commit/4bed614e707c0644c06e117f848fa12605c711cd
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + py/objarray.c                          | 20 ++++++++++++++++----
> + tests/basics/bytearray_add.py          |  9 ++++++++-
> + tests/basics/bytearray_add_self.py     |  8 ++++++++
> + tests/basics/bytearray_add_self.py.exp |  1 +
> + tests/basics/bytearray_slice_assign.py | 18 ++++++++++++------
> + 5 files changed, 45 insertions(+), 11 deletions(-)
> + create mode 100644 tests/basics/bytearray_add_self.py
> + create mode 100644 tests/basics/bytearray_add_self.py.exp
> +
> +diff --git a/py/objarray.c b/py/objarray.c
> +index 1fff234822521..803af2cd270c7 100644
> +--- a/py/objarray.c
> ++++ b/py/objarray.c
> +@@ -424,6 +424,13 @@ static mp_obj_t array_extend(mp_obj_t self_in, mp_obj_t arg_in) {
> +     if (self->free < len) {
> +         self->items = m_renew(byte, self->items, (self->len + self->free) * sz, (self->len + len) * sz);
> +         self->free = 0;
> ++
> ++        if (self_in == arg_in) {
> ++            // Get arg_bufinfo again in case self->items has moved
> ++            //
> ++            // (Note not possible to handle case that arg_in is a memoryview into self)
> ++            mp_get_buffer_raise(arg_in, &arg_bufinfo, MP_BUFFER_READ);
> ++        }
> +     } else {
> +         self->free -= len;
> +     }
> +@@ -456,7 +463,8 @@ static mp_obj_t array_subscr(mp_obj_t self_in, mp_obj_t index_in, mp_obj_t value
> +                 #if MICROPY_PY_ARRAY_SLICE_ASSIGN
> +                 // Assign
> +                 size_t src_len;
> +-                void *src_items;
> ++                uint8_t *src_items;
> ++                size_t src_offs = 0;
> +                 size_t item_sz = mp_binary_get_size('@', o->typecode & TYPECODE_MASK, NULL);
> +                 if (mp_obj_is_obj(value) && MP_OBJ_TYPE_GET_SLOT_OR_NULL(((mp_obj_base_t *)MP_OBJ_TO_PTR(value))->type, subscr) == array_subscr) {
> +                     // value is array, bytearray or memoryview
> +@@ -469,7 +477,7 @@ static mp_obj_t array_subscr(mp_obj_t self_in, mp_obj_t index_in, mp_obj_t value
> +                     src_items = src_slice->items;
> +                     #if MICROPY_PY_BUILTINS_MEMORYVIEW
> +                     if (mp_obj_is_type(value, &mp_type_memoryview)) {
> +-                        src_items = (uint8_t *)src_items + (src_slice->memview_offset * item_sz);
> ++                        src_offs = src_slice->memview_offset * item_sz;
> +                     }
> +                     #endif
> +                 } else if (mp_obj_is_type(value, &mp_type_bytes)) {
> +@@ -504,13 +512,17 @@ static mp_obj_t array_subscr(mp_obj_t self_in, mp_obj_t index_in, mp_obj_t value
> +                         // TODO: alloc policy; at the moment we go conservative
> +                         o->items = m_renew(byte, o->items, (o->len + o->free) * item_sz, (o->len + len_adj) * item_sz);
> +                         o->free = len_adj;
> ++                        // m_renew may have moved o->items
> ++                        if (src_items == dest_items) {
> ++                            src_items = o->items;
> ++                        }
> +                         dest_items = o->items;
> +                     }
> +                     mp_seq_replace_slice_grow_inplace(dest_items, o->len,
> +-                        slice.start, slice.stop, src_items, src_len, len_adj, item_sz);
> ++                        slice.start, slice.stop, src_items + src_offs, src_len, len_adj, item_sz);
> +                 } else {
> +                     mp_seq_replace_slice_no_grow(dest_items, o->len,
> +-                        slice.start, slice.stop, src_items, src_len, item_sz);
> ++                        slice.start, slice.stop, src_items + src_offs, src_len, item_sz);
> +                     // Clear "freed" elements at the end of list
> +                     // TODO: This is actually only needed for typecode=='O'
> +                     mp_seq_clear(dest_items, o->len + len_adj, o->len, item_sz);
> +diff --git a/tests/basics/bytearray_add.py b/tests/basics/bytearray_add.py
> +index a7e2b57374255..1f30a3b740e95 100644
> +--- a/tests/basics/bytearray_add.py
> ++++ b/tests/basics/bytearray_add.py
> +@@ -15,4 +15,11 @@
> + 
> + # this inplace add tests the code when the buffer doesn't need to be increased
> + b = bytearray()
> +-b += b''
> ++b += b""
> ++
> ++# extend a bytearray from itself
> ++b = bytearray(b"abcdefgh")
> ++for _ in range(4):
> ++    c = bytearray(b)  # extra allocation, as above
> ++    b.extend(b)
> ++print(b)
> +diff --git a/tests/basics/bytearray_add_self.py b/tests/basics/bytearray_add_self.py
> +new file mode 100644
> +index 0000000000000..94ae8689fd16c
> +--- /dev/null
> ++++ b/tests/basics/bytearray_add_self.py
> +@@ -0,0 +1,8 @@
> ++# add a bytearray to itself
> ++# This is not supported by CPython as of 3.11.18.
> ++
> ++b = bytearray(b"123456789")
> ++for _ in range(4):
> ++    c = bytearray(b)  # extra allocation increases chance 'b' has to relocate
> ++    b += b
> ++print(b)
> +diff --git a/tests/basics/bytearray_add_self.py.exp b/tests/basics/bytearray_add_self.py.exp
> +new file mode 100644
> +index 0000000000000..5ef948157ac0f
> +--- /dev/null
> ++++ b/tests/basics/bytearray_add_self.py.exp
> +@@ -0,0 +1 @@
> ++bytearray(b'123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789')
> +diff --git a/tests/basics/bytearray_slice_assign.py b/tests/basics/bytearray_slice_assign.py
> +index fa7878e10ddbb..4de0819042a13 100644
> +--- a/tests/basics/bytearray_slice_assign.py
> ++++ b/tests/basics/bytearray_slice_assign.py
> +@@ -18,7 +18,7 @@
> + l[1:3] = bytearray()
> + print(l)
> + l = bytearray(x)
> +-#del l[1:3]
> ++# del l[1:3]
> + print(l)
> + 
> + l = bytearray(x)
> +@@ -28,7 +28,7 @@
> + l[:3] = bytearray()
> + print(l)
> + l = bytearray(x)
> +-#del l[:3]
> ++# del l[:3]
> + print(l)
> + 
> + l = bytearray(x)
> +@@ -38,7 +38,7 @@
> + l[:-3] = bytearray()
> + print(l)
> + l = bytearray(x)
> +-#del l[:-3]
> ++# del l[:-3]
> + print(l)
> + 
> + # slice assignment that extends the array
> +@@ -61,8 +61,14 @@
> + print(b)
> + 
> + # Growth of bytearray via slice extension
> +-b = bytearray(b'12345678')
> +-b.append(57) # expand and add a bit of unused space at end of the bytearray
> ++b = bytearray(b"12345678")
> ++b.append(57)  # expand and add a bit of unused space at end of the bytearray
> + for i in range(400):
> +-    b[-1:] = b'ab' # grow slowly into the unused space
> ++    b[-1:] = b"ab"  # grow slowly into the unused space
> ++print(len(b), b)
> ++
> ++# Growth of bytearray via slice extension from itself
> ++b = bytearray(b"1234567")
> ++for i in range(3):
> ++    b[-1:] = b
> + print(len(b), b)
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index 558ef86534..949abe3b0b 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -15,6 +15,9 @@ MICROPYTHON_LICENSE_FILES = LICENSE
>  MICROPYTHON_DEPENDENCIES = host-python3
>  MICROPYTHON_CPE_ID_VENDOR = micropython
>  
> +# 0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
> +MICROPYTHON_IGNORE_CVES += CVE-2024-8947
> +
>  # Use fallback implementation for exception handling on architectures that don't
>  # have explicit support.
>  ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
