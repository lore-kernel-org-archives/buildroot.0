Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14343C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDECE60F41;
	Fri, 26 Jun 2026 14:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXS7xomQ12Tf; Fri, 26 Jun 2026 14:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E13A460F99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485712;
	bh=uydw1KtJuyxPOtjL4CGrh03qlABjL84ONeukPa0sMgI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M0oNqhGcRTEULwpPo0/B6Xnyfbv+eoUXtD0EM0DfdHOsgYCYP1rsmGXTGgScb75DU
	 wUc5RAd5lBjKUeq8RnXPRXMFjaI/eIKOWrqhAcWcLuj8GGaiiDzctdgG+hPLBmR7JX
	 DBzVfzLxck/JHLGInG8zQq97fmOU0cT798D3Eou50joYWf7s9ergvpY7AbW/AFc4b3
	 cSZKNsmgDfbY/CYt3VN1D8SeTwEk73AqOmPhEdXAZ5Tlt/heVbbn0nCZf8pU6vz6uy
	 KIm68Q/5knSbBXu3Ns775huOe4XD39gjaG9CGlRTmPWhfUyRwXypWCLhWYuCkSVVQ9
	 NceZYmCtB1DOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E13A460F99;
	Fri, 26 Jun 2026 14:55:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52F2A231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3876340FF6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_FRfW-MW9Ok for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B51641066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B51641066
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B51641066
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so15908545e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485707; x=1783090507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xvqs4FS5PfPUrEdFxEr8i6a/mvN4fzhANDgblu4MjRI=;
 b=F41ib6mLFmMgypBRtaQIvXLQ5sw8uI1t69pOBEDF7Y3F9mBHA+Z9cuZaMPNOOMwu3+
 CVMJ0mRj/iMRy7AkC1m9FNPbi7B8kpOjVk+UN4Z0dfWCwH511FDczWpypgRz0Xs98/vj
 9PSLJE0n8EPIAfktgicw3+g8Fnhk/dxGfShrDWcxTXqRYUNjLE3Yr9u4n5GIEOLD2pes
 7QwxxCo+Kb1xMe9D96RWF7IHCzih/uYk+HKNSjv6FlgPkkify0tXAdev7XMTKlXLHzvP
 O56AQwS4Q2VcNxDWvdPry5FdDozbgCTfWs1Y8urbeBYETGCuduwC9cx2WUENXYHS8xBY
 /BnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/hFs8ICPjM0SfCb/E3SHBAAwYxHj+aFd9g5XNeYFvasOjdVwSGRQk8VtIUFLjJEw2b9Q1yFz8El54=@buildroot.org
X-Gm-Message-State: AOJu0YxowMhDLt/VmGhtYjzMawOSJIkAyi+8/5nzroQv4nZwLEMKjNuE
 0bu+5+TQj7Hyy5TiKS8Sf0FrrAs+pkxB4mnm/AipJSZDJklWaAJkqhfqgcq+xaJW7mU=
X-Gm-Gg: AfdE7cnE8TVR4/Sdrs0Z2j3V7sX9GIO32Df2LXuumlY/Xp/0MFDKYBOdYJwssDOF0BK
 NCHm5zeQOXAqdll0A+bc3EQnk7eQCLFr/iuj/TodJZQAYmfOSFpfLaGujSXPrtLrGlL9b1Wpn96
 yY9t6VFLVzfN/3oviP3ZJ9jtXsuDR7jMamJC4j6yV85xOrqZ+vOBY/o6t7+BxLbUkQSas7a7oGa
 3PzAQcX5eqlnx2bw3f3o1aRie8Dsauuaevz+kahWktJyvMRuFF/2r/CQBSxvp42PwqhgGN2yaFr
 nwNWE1mRPu86foHpIhoaLFgfkDLQoxCL6pbXIeXpbkyPqA1xI6KRfclMWgHWxH5REw1QpYOo33l
 fQTNPYPq+XS7Y493U2x98FTHC0HaowVTbMsYy5qT8t3aRMsZ/5Elr+J+2iboEutEzUdZjexTMlb
 x0LakU0setC7zrLVs=
X-Received: by 2002:a05:600c:e54a:20b0:492:3fb5:3a17 with SMTP id
 5b1f17b1804b1-492663f5bc7mr67439365e9.2.1782485706892; 
 Fri, 26 Jun 2026 07:55:06 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c9f240c3dsm24271172f8f.35.2026.06.26.07.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:06 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:06 +0200
Message-ID: <20260626145506.342531-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623081919.2342535-1-titouan.christophe@mind.be>
References: <20260623081919.2342535-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485707; x=1783090507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xvqs4FS5PfPUrEdFxEr8i6a/mvN4fzhANDgblu4MjRI=;
 b=HofJi5TXVNcmJPNn/vWTgXp6I1pArdEWE/vZPdyPFZMQl9CLwqCHJefYob9NspT9Eq
 fHfyqnu9DDodR/Sb6tCJLkLBqczSgu0Ybs6d9AJZ+P7l59v824pwWJ5/cDTLSsj1HHPt
 TYQ7pdOyrpcNUa6cdwwzMflbPdPGAVsfjXrQ3fT2LoVB5nzxdHzCoA5LAiOUqI5jVvZn
 yOKWv508NNugUg34Bu0ELBCsyQe5G2PD9Pcz3JvmdeNjVCitK+ELdDPQGzXvExfAxgT8
 xWkd7axiSN91dzPI6a+HpoT+YGUpbJb4d1BwLAiwmIwbYo1eY/CBX5kxrI6hHzRVR+aH
 zR9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HofJi5TX
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python3: add patch
 for CVE-2026-9669
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
> - CVE-2026-9669:
>     bz2.BZ2Decompressor objects could be reused after a decompression
>     error. If an application caught the resulting OSError and retried with
>     the same decompressor, crafted input could cause the decompressor to
>     resume from an invalid internal state and perform out-of-bounds writes
>     to a stack buffer. This could crash the process when processing
>     untrusted data.
>     https://www.cve.org/CVERecord?id=CVE-2026-9669
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...-bz2-decompressor-reuse-after-errors.patch | 108 ++++++++++++++++++
>  package/python3/python3.mk                    |   2 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch
> 
> diff --git a/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch b/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch
> new file mode 100644
> index 0000000000..3fecf86ab7
> --- /dev/null
> +++ b/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch
> @@ -0,0 +1,108 @@
> +From c36ef35e7e5601739755d883f5dab5c6e02b2e30 Mon Sep 17 00:00:00 2001
> +From: Stan Ulbrych <stan@python.org>
> +Date: Sun, 7 Jun 2026 19:37:10 +0100
> +Subject: [PATCH] [3.12] gh-150599: Prevent bz2 decompressor reuse after
> + errors (#150600) (#151054)
> +
> +(cherry picked from commit 5755d0f083949ff3c5bf3a37e673e24e306b036e)
> +
> +Upstream: https://github.com/python/cpython/pull/151057
> +CVE: CVE-2026-9669
> +[Titouan: Squash fixup commit 0c2466a0fc2270c87e9f67c250c9454c28c09c3
> +          from the upstream PR in the patch below]
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + Lib/test/test_bz2.py                           | 15 +++++++++++++++
> + ...6-05-30-09-36-20.gh-issue-150599.nlHqU-.rst |  3 +++
> + Modules/_bz2module.c                           | 18 +++++++++++++++---
> + 3 files changed, 33 insertions(+), 3 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
> +
> +diff --git a/Lib/test/test_bz2.py b/Lib/test/test_bz2.py
> +index cb730a1a46e25a1..dcbf6a298264a40 100644
> +--- a/Lib/test/test_bz2.py
> ++++ b/Lib/test/test_bz2.py
> +@@ -958,6 +958,21 @@ def test_failure(self):
> +         # Previously, a second call could crash due to internal inconsistency
> +         self.assertRaises(Exception, bzd.decompress, self.BAD_DATA * 30)
> + 
> ++    def test_decompress_after_data_error(self):
> ++        data = bytes.fromhex(
> ++            "425a6839314159265359000000000000007fffff000000000000000000000000"
> ++            "00000000000000000000000000000000000000e0370000000000000000000000"
> ++            "000000000000000000000000000000000000000000000000000083f3"
> ++        )
> ++        bzd = BZ2Decompressor()
> ++        with self.assertRaisesRegex(OSError, "Invalid data stream"):
> ++            bzd.decompress(data)
> ++        # Previously, a second call could crash due to internal inconsistency
> ++        self.assertFalse(bzd.needs_input)
> ++        self.assertFalse(bzd.eof)
> ++        with self.assertRaisesRegex(ValueError, "previous error"):
> ++            bzd.decompress(b'\x00' * 18)
> ++
> +     @support.refcount_test
> +     def test_refleaks_in___init__(self):
> +         gettotalrefcount = support.get_attribute(sys, 'gettotalrefcount')
> +diff --git a/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst b/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
> +new file mode 100644
> +index 000000000000000..a37d86cf423f820
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
> +@@ -0,0 +1,3 @@
> ++Fix a possible stack buffer overflow in :mod:`bz2` when a
> ++:class:`bz2.BZ2Decompressor` is reused after a decompression error.
> ++The decompressor now becomes unusable after libbz2 reports an error.
> +diff --git a/Modules/_bz2module.c b/Modules/_bz2module.c
> +index 97bd44b4ac96944..0b0916142f575be 100644
> +--- a/Modules/_bz2module.c
> ++++ b/Modules/_bz2module.c
> +@@ -114,6 +114,7 @@ typedef struct {
> + typedef struct {
> +     PyObject_HEAD
> +     bz_stream bzs;
> ++    int bzerror;
> +     char eof;           /* T_BOOL expects a char */
> +     PyObject *unused_data;
> +     char needs_input;
> +@@ -453,8 +454,11 @@ decompress_buf(BZ2Decompressor *d, Py_ssize_t max_length)
> + 
> +         d->bzs_avail_in_real += bzs->avail_in;
> + 
> +-        if (catch_bz2_error(bzret))
> ++        if (catch_bz2_error(bzret)) {
> ++            d->bzerror = bzret;
> ++            d->needs_input = 0;
> +             goto error;
> ++        }
> +         if (bzret == BZ_STREAM_END) {
> +             d->eof = 1;
> +             break;
> +@@ -621,10 +625,17 @@ _bz2_BZ2Decompressor_decompress_impl(BZ2Decompressor *self, Py_buffer *data,
> +     PyObject *result = NULL;
> + 
> +     ACQUIRE_LOCK(self);
> +-    if (self->eof)
> ++    if (self->eof) {
> +         PyErr_SetString(PyExc_EOFError, "End of stream already reached");
> +-    else
> ++    }
> ++    else if (self->bzerror) {
> ++        // Re-entering BZ2_bzDecompress() after an error can write out of bounds.
> ++        PyErr_SetString(PyExc_ValueError,
> ++                        "Decompressor is unusable after a previous error");
> ++    }
> ++    else {
> +         result = decompress(self, data->buf, data->len, max_length);
> ++    }
> +     RELEASE_LOCK(self);
> +     return result;
> + }
> +@@ -658,6 +669,7 @@ _bz2_BZ2Decompressor_impl(PyTypeObject *type)
> +         return NULL;
> +     }
> + 
> ++    self->bzerror = 0;
> +     self->needs_input = 1;
> +     self->bzs_avail_in_real = 0;
> +     self->input_buffer = NULL;
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 52f06e08df..1c181f0d33 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -19,6 +19,8 @@ PYTHON3_IGNORE_CVES += CVE-2026-3276
>  PYTHON3_IGNORE_CVES += CVE-2026-7774
>  # 0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch
>  PYTHON3_IGNORE_CVES += CVE-2026-8328
> +# 0016-prevent-bz2-decompressor-reuse-after-errors.patch
> +PYTHON3_IGNORE_CVES += CVE-2026-9669
>  
>  # This host Python is installed in $(HOST_DIR), as it is needed when
>  # cross-compiling third-party Python modules.
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
