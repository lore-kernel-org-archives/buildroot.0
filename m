Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96BDCD4F26
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 08:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FBBF409EE;
	Tue, 23 Jun 2026 08:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqhxM9EjIcLW; Tue, 23 Jun 2026 08:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6157240A07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782202786;
	bh=I4urZPKexUxHv+FQ7ZyEgTvcopM+nGLWncisziX0aME=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=lJUOnze0tb+kZ74CG6QCq+rHavdaPjo3zWqjldyxH/wjUy/HFwIpttFAtb48Zlo3P
	 Wb+W4A1Ffs/mUIwy+ZC9h22m0l2Keq1R/n1YkdykY+He1ncuOLrJI2WyHsGlGd7nmE
	 NwmGIKdD2RsxngS1gnf5fAP3d/SJJyoGb+16OwAt6K+ExWtm/agKIozKixvoSBxRIF
	 02aXT/fyXMsDi7Lga71OHbgQwoPrpdbPnD6F0GVDq6yvWQsLfZIofiwLFZ8jk9fFTN
	 A+Ala9WPJXyWJNw2fkiKSXOo/RfgSe7iOaRBm0Kr1ogDrvZdxb81DbKiqS9lABYTI9
	 vC7+sMz3TbzKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6157240A07;
	Tue, 23 Jun 2026 08:19:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 979EA367
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D2B1409EE
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eC4yL-6Kfqik for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 08:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF640409CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF640409CA
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF640409CA
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:19:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-463f1165e16so5245891f8f.0
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 01:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782202780; x=1782807580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GG4aR1WVtwkAChPYNz9kfHivx0YvxHwZGurjX0kIyJk=;
 b=VfBnFzQYn1GWoxMFCyAOW+OlkKtIYJEWfITzwGXKp79IcurUECxyb5W8MwjTXKj8WV
 fv2+Yk3LnTB3oDVsQUXCqSisvSrXwwhtp4OyWqrng4W3q9lvMP5OWxGKB18lBl1RFq/k
 t48trcbnMJGSSaTl0cn4KLzdRRT5z5UM0teHghbqldp7zN0qJ1jzgnh/s37kCeHxxAwl
 TbmHs6IysGl91WBAD25MUGuiw1+C3C5/U3EqapixvLemcEC8+ZCBP7DR+ybM7h4r9hWj
 KWaJCr3Ol8FMcvSjAFnLumqq4xFR6q3BG3opO4aOfEGXLDqs1sVEbP33YSeKYKkYbJMV
 VXYQ==
X-Gm-Message-State: AOJu0Yx2E6b0MXzO+JTFE25SFQY+ll1ZdqwSo1FHpi6sP/cKVamBpxdX
 KAB62FbrFr0CmG9Ag1evobVrTLFePGaoEOaS12G4HKhbx2RT2eG9mWrM+SFZ2NgA/VDM9alMad0
 K9/2z
X-Gm-Gg: AfdE7ckO38NC/F6+/dV+xtRzQkuvSkGgY+BfVzrhLLv43tztG4WILz1T0Jirc6691vC
 ib759YANDH06ol2RVrsB4MdtettKk6ejIGnAggLdo4X4cEvf5PyW2ZOQjAPGYCgqCoQAvDKBh8F
 UufApL1E1zK+KhLufjarzjrXDbdxiFmZfQ70Nbvf6+IPLf0gShC2xlbPow8pvJyG/3ToB4Qs8rB
 Wp/AAAC8hbw18/ItnVsIOAuZX69IBeL0wa34yJrqHgMtGGXAG56O2XobeZqeD6ElVTxBh6+cqeZ
 BAtS8WNOLN20sw9mfTrLuGadsWs+cI0oNnxv40CfNOyOs9Y5FZH1juqFuBKUwKTFVX+e/0yym9X
 hFyInRFl3Dq5ZcAHWy7EnOg0xVk441AK9AbsJs4eI7ly3CTQSuF6aOvLF/51/pRIg6v/22kpaL9
 7GLanFYXPRWyZ6jJjmAOZYg4RMpbT0Rj1UgsSlBiff3OJiVGguttEBzBfpz2i+t/hWtGTw7htf7
 LAP
X-Received: by 2002:adf:fe89:0:b0:460:67e0:563e with SMTP id
 ffacd0b85a97d-46508afa904mr22053153f8f.35.1782202780272; 
 Tue, 23 Jun 2026 01:19:40 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5de7sm32889353f8f.15.2026.06.23.01.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 01:19:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 23 Jun 2026 10:19:19 +0200
Message-ID: <20260623081919.2342535-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782202780; x=1782807580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GG4aR1WVtwkAChPYNz9kfHivx0YvxHwZGurjX0kIyJk=;
 b=eRRsSBRj5vYKUW7gNy5QGZUhjDGiTM4iddc042seJ3C9VsSc+XbnCfppfZC08TLXjG
 V3AB5dhhElbc2ZWALLHBb+A9K8kkECNE1nmZrE3ZbvGChBDCy9MXoDFuzLq6tv0avj59
 g6vVf3wtKzstRbfwWRqgtl+mix3QVfHEsPCVugoVN7aXpWO8IX7ncrN5ORR1J7s/eoOq
 doOKwGxKzv+b0CmNSAtnYDO5tWNfcWcfKneTTmafzkDnilmN4mHB5VsiEP/hymd93HdU
 ot7rDYBHhtyM37Fd51fBW/u4uq4MYi9WtGf6n3Hhm6vGlZfaV6mL26sGRXaitQ9zJIWC
 EoFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eRRsSBRj
Subject: [Buildroot] [PATCH for 2025.02.x] package/python3: add patch for
 CVE-2026-9669
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2026-9669:
    bz2.BZ2Decompressor objects could be reused after a decompression
    error. If an application caught the resulting OSError and retried with
    the same decompressor, crafted input could cause the decompressor to
    resume from an invalid internal state and perform out-of-bounds writes
    to a stack buffer. This could crash the process when processing
    untrusted data.
    https://www.cve.org/CVERecord?id=CVE-2026-9669

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...-bz2-decompressor-reuse-after-errors.patch | 108 ++++++++++++++++++
 package/python3/python3.mk                    |   2 +
 2 files changed, 110 insertions(+)
 create mode 100644 package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch

diff --git a/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch b/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch
new file mode 100644
index 0000000000..3fecf86ab7
--- /dev/null
+++ b/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch
@@ -0,0 +1,108 @@
+From c36ef35e7e5601739755d883f5dab5c6e02b2e30 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Sun, 7 Jun 2026 19:37:10 +0100
+Subject: [PATCH] [3.12] gh-150599: Prevent bz2 decompressor reuse after
+ errors (#150600) (#151054)
+
+(cherry picked from commit 5755d0f083949ff3c5bf3a37e673e24e306b036e)
+
+Upstream: https://github.com/python/cpython/pull/151057
+CVE: CVE-2026-9669
+[Titouan: Squash fixup commit 0c2466a0fc2270c87e9f67c250c9454c28c09c3
+          from the upstream PR in the patch below]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ Lib/test/test_bz2.py                           | 15 +++++++++++++++
+ ...6-05-30-09-36-20.gh-issue-150599.nlHqU-.rst |  3 +++
+ Modules/_bz2module.c                           | 18 +++++++++++++++---
+ 3 files changed, 33 insertions(+), 3 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
+
+diff --git a/Lib/test/test_bz2.py b/Lib/test/test_bz2.py
+index cb730a1a46e25a1..dcbf6a298264a40 100644
+--- a/Lib/test/test_bz2.py
++++ b/Lib/test/test_bz2.py
+@@ -958,6 +958,21 @@ def test_failure(self):
+         # Previously, a second call could crash due to internal inconsistency
+         self.assertRaises(Exception, bzd.decompress, self.BAD_DATA * 30)
+ 
++    def test_decompress_after_data_error(self):
++        data = bytes.fromhex(
++            "425a6839314159265359000000000000007fffff000000000000000000000000"
++            "00000000000000000000000000000000000000e0370000000000000000000000"
++            "000000000000000000000000000000000000000000000000000083f3"
++        )
++        bzd = BZ2Decompressor()
++        with self.assertRaisesRegex(OSError, "Invalid data stream"):
++            bzd.decompress(data)
++        # Previously, a second call could crash due to internal inconsistency
++        self.assertFalse(bzd.needs_input)
++        self.assertFalse(bzd.eof)
++        with self.assertRaisesRegex(ValueError, "previous error"):
++            bzd.decompress(b'\x00' * 18)
++
+     @support.refcount_test
+     def test_refleaks_in___init__(self):
+         gettotalrefcount = support.get_attribute(sys, 'gettotalrefcount')
+diff --git a/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst b/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
+new file mode 100644
+index 000000000000000..a37d86cf423f820
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
+@@ -0,0 +1,3 @@
++Fix a possible stack buffer overflow in :mod:`bz2` when a
++:class:`bz2.BZ2Decompressor` is reused after a decompression error.
++The decompressor now becomes unusable after libbz2 reports an error.
+diff --git a/Modules/_bz2module.c b/Modules/_bz2module.c
+index 97bd44b4ac96944..0b0916142f575be 100644
+--- a/Modules/_bz2module.c
++++ b/Modules/_bz2module.c
+@@ -114,6 +114,7 @@ typedef struct {
+ typedef struct {
+     PyObject_HEAD
+     bz_stream bzs;
++    int bzerror;
+     char eof;           /* T_BOOL expects a char */
+     PyObject *unused_data;
+     char needs_input;
+@@ -453,8 +454,11 @@ decompress_buf(BZ2Decompressor *d, Py_ssize_t max_length)
+ 
+         d->bzs_avail_in_real += bzs->avail_in;
+ 
+-        if (catch_bz2_error(bzret))
++        if (catch_bz2_error(bzret)) {
++            d->bzerror = bzret;
++            d->needs_input = 0;
+             goto error;
++        }
+         if (bzret == BZ_STREAM_END) {
+             d->eof = 1;
+             break;
+@@ -621,10 +625,17 @@ _bz2_BZ2Decompressor_decompress_impl(BZ2Decompressor *self, Py_buffer *data,
+     PyObject *result = NULL;
+ 
+     ACQUIRE_LOCK(self);
+-    if (self->eof)
++    if (self->eof) {
+         PyErr_SetString(PyExc_EOFError, "End of stream already reached");
+-    else
++    }
++    else if (self->bzerror) {
++        // Re-entering BZ2_bzDecompress() after an error can write out of bounds.
++        PyErr_SetString(PyExc_ValueError,
++                        "Decompressor is unusable after a previous error");
++    }
++    else {
+         result = decompress(self, data->buf, data->len, max_length);
++    }
+     RELEASE_LOCK(self);
+     return result;
+ }
+@@ -658,6 +669,7 @@ _bz2_BZ2Decompressor_impl(PyTypeObject *type)
+         return NULL;
+     }
+ 
++    self->bzerror = 0;
+     self->needs_input = 1;
+     self->bzs_avail_in_real = 0;
+     self->input_buffer = NULL;
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 52f06e08df..1c181f0d33 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -19,6 +19,8 @@ PYTHON3_IGNORE_CVES += CVE-2026-3276
 PYTHON3_IGNORE_CVES += CVE-2026-7774
 # 0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch
 PYTHON3_IGNORE_CVES += CVE-2026-8328
+# 0016-prevent-bz2-decompressor-reuse-after-errors.patch
+PYTHON3_IGNORE_CVES += CVE-2026-9669
 
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
