Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A95C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 20:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02419605EA;
	Fri, 26 Jun 2026 20:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzjUTd7e35a8; Fri, 26 Jun 2026 20:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F35460768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782505805;
	bh=qrWvTQkW0GsN9eLKvJRoAcBw2dq1pD39ei22PgH5xOw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AsQHYpb2gUTdsDM/SzNpUBIa7XLmTFuvEQJqkvSj81bnNz/haUP2FTBkuG59ogAQC
	 Pgzk7FUF8S/d9FOIJT2xGO1JD/eEzATF60JPM03rho32vqCMrkj+jaI7eTV0wTymqS
	 jZrelWzjIQxfjYL7hJV3KyqrRnunFAnWHC3NnaGNlmm+dDdJocq9ACW1TUVBaRY/Wa
	 qX6Le9m0o7o/xlp/xxGBYWNKiVAzrXpn00b0hwb1DswmQbLg3kFDvm40WoPGGPKCIH
	 nCMA2Fca7l/qDLzkBelEcHCzLMrRrPW8ouJCoFKbaNFyP1LUCNBWQtW4/MjDOQ+Axn
	 BrsEPuK79L48g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F35460768;
	Fri, 26 Jun 2026 20:30:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C60792F3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8A31410EE
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVESjOfvf_Vp for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 20:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9446541101
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9446541101
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9446541101
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:30:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-46cdcec58c2so1313965f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 13:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782505800; x=1783110600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1dMEKr88PGD8HilDu9pEEqotSYJPZyV6689DGDx7Kw=;
 b=fvh3uAtwU/R8IEBiAUCqLyu7nzDf2vb0oCvHuEJAJA5Y4R/FjOvVH0o7XNTsy0daRu
 kh66nqrIeA1CYH3H4/50NwEsK7AGRygvmwQQY5cTmcnMXlOAh8vDpcteSVRMxPyj34yj
 cJpmCE5VFNgVNqNR1Il1vnsx3ZdMfzUrL6YGY4PYxcRrAbIenYLfdOEWPZtYJCQ4PC8v
 NLGb65rk2V+bDwnYY2NG+tb5pzuO0jljVklH8OuAxtZSngqnnX4/AW9uKh0lzU9GF8qX
 xbk5lcJX5Ybgh0cDhXBBozDKjqTYiKuwV4kIuDQ2O98V7fQ+FhyOuubwWWlXzamJLoqS
 JN2A==
X-Gm-Message-State: AOJu0Yxt2IJ+lWotxpl/P3OKn4es7/WUHja5FKKqPKEGHt6G/KtdSjWh
 m0E6EkoXczHIUUvaTF9v4hzaPPVFq001tUbm/3zfRQICt40sOnWO6/Y9FRAKxpl+n5Cf7dbDFrr
 oG0EN
X-Gm-Gg: AfdE7ckesOmDZmhylN1sFg96zci2cvg/FAzKOkgv4kj+I/Ajh5e7/6aTf9MvfneXPch
 gIjHF0XqUf1iYiIp3ad8TvIVNVhq57HZEa/Pf1kH9m01+pJiEDMCZyA2wAt9s+V+530cPTUEsGt
 x3JLQPG68T48Dbo6yz/xNLRhCkzUMMFvSQatlgu4XEQK3EQj5P5j2zv2KBE70BK5QKPfFoFmA3K
 PtBbYmUQTcetLMQuXyhVf+hhZyQZQK5Y3rErBwnGOYinD2NkMDmjj0nXdGXsnmjOyHzGisaYaCi
 cYhpSaWwYnodnMIniyynSkrWzZQ91SqTsYI7NTBUg/+SLj4vx6qwvov3oUUgX6S7mNr4o6HFlQN
 6mLWlCzUWjem6tVCx/eb5uzUaht16QxmpPFoHvnPkDyoQYcViEhTUEfI85gbAIDWtE5XA0PN3AE
 GiOLlt
X-Received: by 2002:a05:6000:4284:b0:464:fff6:489a with SMTP id
 ffacd0b85a97d-46a7e9f3eacmr31096950f8f.6.1782505800056; 
 Fri, 26 Jun 2026 13:30:00 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46e6167c05fsm13530740f8f.25.2026.06.26.13.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 13:29:59 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri, 26 Jun 2026 22:29:59 +0200
Message-ID: <20260626202959.282713-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782505800; x=1783110600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y1dMEKr88PGD8HilDu9pEEqotSYJPZyV6689DGDx7Kw=;
 b=F9mpYfc/6Sj10FZEnhd4GBEJKGuKAop0DlC8fal0Wj50MdtUD1QqaxcUR43x3VcO7A
 IO+/O+kpLOW2qTeJL7U2kW1yGKyOcvckrcjF9ky8QGEcdjXtQO1036zr+dniyqITiarD
 U+gtqrjBil9mfFlzOYI4n7kYLwSkcSSosKAam79jaCC7fgW0aqlpuVHrwp4eWUbDm8i4
 i7E/mshrGMIxFtO1rQaRtcKb15be+rAUfUQfAh0vjY3j1JUSLgWCoq/MvI3TJj0YrI6P
 d7xojxSBFcslRzWSCQHo7cYyOLdiDlRIzLI1ZN211ME2k+X9L4mGiQqPYlR2yOedbYZO
 T1Tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F9mpYfc/
Subject: [Buildroot] [PATCH] package/cups-filters: upstream patch
 CVE-2025-64503
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHZ1bG5lcmFiaWxpdHk6CgotIENWRS0yMDI1LTY0NTAz
OgogICAgY3Vwcy1maWx0ZXJzIGNvbnRhaW5zIGJhY2tlbmRzLCBmaWx0ZXJzLCBhbmQgb3RoZXIg
c29mdHdhcmUgcmVxdWlyZWQKICAgIHRvIGdldCB0aGUgY3VwcyBwcmludGluZyBzZXJ2aWNlIHdv
cmtpbmcgb24gb3BlcmF0aW5nIHN5c3RlbXMgb3RoZXIKICAgIHRoYW4gbWFjb3MuIEluIGN1cHMt
ZmlsdGVycyBwcmlvciB0byAxLjI4LjE4LCBieSBjcmFmdGluZyBhIFBERiBmaWxlCiAgICB3aXRo
IGEgbGFyZ2UgYE1lZGlhQm94YCB2YWx1ZSwgYW4gYXR0YWNrZXIgY2FuIGNhdXNlIENVUFMtRmls
dGVyIDEueOKAmXMKICAgIGBwZGZ0b3Jhc3RlcmAgdG9vbCB0byB3cml0ZSBiZXlvbmQgdGhlIGJv
dW5kcyBvZiBhbiBhcnJheS4gRmlyc3QsIGEKICAgIFBERiB3aXRoIGEgbGFyZ2UgYE1lZGlhQm94
YCB3aWR0aCB2YWx1ZSBjYXVzZXMgYGhlYWRlci5jdXBzV2lkdGhgIHRvCiAgICBiZWNvbWUgbGFy
Z2UuICBOZXh0LCB0aGUgY2FsY3VsYXRpb24gb2YgYGJ5dGVzUGVyTGluZSA9CiAgICAoaGVhZGVy
LmN1cHNCaXRzUGVyUGl4ZWwgKiBoZWFkZXIuY3Vwc1dpZHRoICsgNykgLyA4YCBvdmVyZmxvd3Ms
CiAgICByZXN1bHRpbmcgaW4gYSBzbWFsbCB2YWx1ZS4gVGhlbiwgYGxpbmVCdWZgIGlzIGFsbG9j
YXRlZCB3aXRoIHRoZQogICAgc21hbGwgYGJ5dGVzUGVyTGluZWAgc2l6ZS4gRmluYWxseSwgYGNv
bnZlcnRMaW5lQ2h1bmtlZGAgY2FsbHMKICAgIGB3cml0ZVBpeGVsOGAsIHdoaWNoIGF0dGVtcHRz
IHRvIHdyaXRlIHRvIGBsaW5lQnVmYCBvdXRzaWRlIG9mIGl0cwogICAgYnVmZmVyIHNpemUgKG91
dCBvZiBib3VuZHMgd3JpdGUpLiBJbiBsaWJjdXBzZmlsdGVycywgdGhlIG1haW50YWluZXJzCiAg
ICBmb3VuZCB0aGUgc2FtZSBgYnl0ZXNQZXJMaW5lYCBtdWx0aXBsaWNhdGlvbiB3aXRob3V0IG92
ZXJmbG93IGNoZWNrLAogICAgYnV0IHRoZSBwcm92aWRlZCB0ZXN0IGNhc2UgZG9lcyBub3QgY2F1
c2UgYW4gb3ZlcmZsb3cgdGhlcmUsIGJlY2F1c2UKICAgIHRoZSB2YWx1ZXMgYXJlIGRpZmZlcmVu
dC4gQ29tbWl0CiAgICA1MGQ5NGNhMGYyZmE2MTc3NjEzYzk3YzU5NzkxYmRlNTY4NjMxODY1IGNv
bnRhaW5zIGEgcGF0Y2gsIHdoaWNoIGlzCiAgICBpbmNvcnBvcmF0ZWQgaW50byBjdXBzLWZpbHRl
cnMgdmVyc2lvbiAxLjI4LjE4LgoKRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZToKICAtIGh0dHBz
Oi8vd3d3LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0yMDI1LTY0NTAzCiAgLSBodHRwczovL2dp
dGh1Yi5jb20vT3BlblByaW50aW5nL2N1cHMtZmlsdGVycy9jb21taXQvNTBkOTRjYTBmMmZhNjE3
NzYxM2M5N2M1OTc5MWJkZTU2ODYzMTg2NQoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8
dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgotLS0KIC4uLngtb3V0LW9mLWJvdW5kcy13cml0ZS1pbi1w
ZGZ0b3Jhc3Rlci5wYXRjaCB8IDQxICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvY3Vwcy1m
aWx0ZXJzL2N1cHMtZmlsdGVycy5tayAgICAgICAgICB8ICAzICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDQ0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2N1cHMtZmlsdGVy
cy8wMDA1LWZpeC1vdXQtb2YtYm91bmRzLXdyaXRlLWluLXBkZnRvcmFzdGVyLnBhdGNoCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9jdXBzLWZpbHRlcnMvMDAwNS1maXgtb3V0LW9mLWJvdW5kcy13cml0
ZS1pbi1wZGZ0b3Jhc3Rlci5wYXRjaCBiL3BhY2thZ2UvY3Vwcy1maWx0ZXJzLzAwMDUtZml4LW91
dC1vZi1ib3VuZHMtd3JpdGUtaW4tcGRmdG9yYXN0ZXIucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uMWRhMDRjYTk1OQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2th
Z2UvY3Vwcy1maWx0ZXJzLzAwMDUtZml4LW91dC1vZi1ib3VuZHMtd3JpdGUtaW4tcGRmdG9yYXN0
ZXIucGF0Y2gKQEAgLTAsMCArMSw0MSBAQAorRnJvbSA1MGQ5NGNhMGYyZmE2MTc3NjEzYzk3YzU5
NzkxYmRlNTY4NjMxODY1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogVGlsbCBLYW1w
cGV0ZXIgPHRpbGwua2FtcHBldGVyQGdtYWlsLmNvbT4KK0RhdGU6IE1vbiwgMTAgTm92IDIwMjUg
MTg6MzE6NDggKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IG91dC1vZi1ib3VuZHMgd3JpdGUg
aW4gcGRmdG9yYXN0ZXIKKworUERGcyB3aXRoIHRvbyBsYXJnZSBwYWdlIGRpbWVuc2lvbnMgY291
bGQgY2F1c2UgYW4gaW50ZWdlciBvdmVyZmxvdyBhbmQgdGhlbiBhIHRvbyBzbWFsbCBidWZmZXIg
Zm9yIHRoZSBwaXhlbCBsaW5lIHRvIGJlIGFsbG9jYXRlZC4KKworRml4ZWQgdGhpcyBieSBjcm9w
cGluZyB0aGUgcGFnZSBzaXplIHRvIHRoZSBtYXhpbXVtIGFsbG93ZWQgYnkgdGhlIHN0YW5kYXJk
LCAxNDQwMHgxNDQwMHB0LCAyMDB4MjAwaW4sIDV4NW0KKworaHR0cHM6Ly9jb21tdW5pdHkuYWRv
YmUuY29tL3Q1L2luZGVzaWduLWRpc2N1c3Npb25zL21heGltdW0td2lkdGgtb2YtYS1wZGYvdGQt
cC85MjE3MzcyCisKK0NWRTogQ1ZFLTIwMjUtNjQ1MDMKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1
Yi5jb20vT3BlblByaW50aW5nL2N1cHMtZmlsdGVycy9jb21taXQvNTBkOTRjYTBmMmZhNjE3NzYx
M2M5N2M1OTc5MWJkZTU2ODYzMTg2NQorU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhv
bWFzLnBlcmFsZUBtaW5kLmJlPgorLS0tCisgZmlsdGVyL3BkZnRvcmFzdGVyLmN4eCB8IDEyICsr
KysrKysrKysrKworIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1n
aXQgYS9maWx0ZXIvcGRmdG9yYXN0ZXIuY3h4IGIvZmlsdGVyL3BkZnRvcmFzdGVyLmN4eAoraW5k
ZXggN2IzYWY5MjRmLi5iNjRiMzRjNjIgMTAwNzU1CistLS0gYS9maWx0ZXIvcGRmdG9yYXN0ZXIu
Y3h4CisrKysgYi9maWx0ZXIvcGRmdG9yYXN0ZXIuY3h4CitAQCAtMTY5OCw2ICsxNjk4LDE4IEBA
IHN0YXRpYyB2b2lkIG91dFBhZ2UocG9wcGxlcjo6ZG9jdW1lbnQgKmRvYywgaW50IHBhZ2VObywK
KyAgICAgaGVhZGVyLlBhZ2VTaXplWzBdID0gKHVuc2lnbmVkKWw7CisgICBlbHNlCisgICAgIGhl
YWRlci5QYWdlU2l6ZVsxXSA9ICh1bnNpZ25lZClsOworKyAgLyoKKysgICAgTWF4aW11bSBhbGxv
d2VkIHBhZ2Ugc2l6ZSBmb3IgUERGIGlzIDIwMHgyMDAgaW5jaGVzICh+IDV4NSBtKSwgb3IgMTQ0
MDB4MTQ0MDAgcHQKKysgICAgaHR0cHM6Ly9jb21tdW5pdHkuYWRvYmUuY29tL3Q1L2luZGVzaWdu
LWRpc2N1c3Npb25zL21heGltdW0td2lkdGgtb2YtYS1wZGYvdGQtcC85MjE3MzcyCisrICAqLwor
KyAgaWYgKGhlYWRlci5QYWdlU2l6ZVswXSA+IDE0NDAwKSB7CisrICAgIGZwcmludGYoc3RkZXJy
LCAiRVJST1I6IFBhZ2Ugd2lkdGggaXMgJWRwdCwgdG9vIGxhcmdlLCBjcm9wcGluZyB0byAxNDQw
MHB0XG4iLCBoZWFkZXIuUGFnZVNpemVbMF0pOworKyAgICBoZWFkZXIuUGFnZVNpemVbMF0gPSAx
NDQwMDsKKysgIH0KKysgIGlmIChoZWFkZXIuUGFnZVNpemVbMV0gPiAxNDQwMCkgeworKyAgICBm
cHJpbnRmKHN0ZGVyciwgIkVSUk9SOiBQYWdlIGhlaWdodCBpcyAlZHB0LCB0b28gbGFyZ2UsIGNy
b3BwaW5nIHRvIDE0NDAwcHRcbiIsIGhlYWRlci5QYWdlU2l6ZVsxXSk7CisrICAgIGhlYWRlci5Q
YWdlU2l6ZVsxXSA9IDE0NDAwOworKyAgfQorIAorICAgbWVtc2V0KHBhcGVyZGltZW5zaW9ucywg
MCwgc2l6ZW9mKHBhcGVyZGltZW5zaW9ucykpOworICAgbWVtc2V0KG1hcmdpbnMsIDAsIHNpemVv
ZihtYXJnaW5zKSk7CmRpZmYgLS1naXQgYS9wYWNrYWdlL2N1cHMtZmlsdGVycy9jdXBzLWZpbHRl
cnMubWsgYi9wYWNrYWdlL2N1cHMtZmlsdGVycy9jdXBzLWZpbHRlcnMubWsKaW5kZXggMjA3YzQz
MWJlZS4uMDllOGZhMzQzMiAxMDA2NDQKLS0tIGEvcGFja2FnZS9jdXBzLWZpbHRlcnMvY3Vwcy1m
aWx0ZXJzLm1rCisrKyBiL3BhY2thZ2UvY3Vwcy1maWx0ZXJzL2N1cHMtZmlsdGVycy5tawpAQCAt
MjEsNiArMjEsOSBAQCBDVVBTX0ZJTFRFUlNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjMtMjQ4MDUK
ICMgMDAwMi1yYXN0ZXJ0b3BjbHguYy1GaXgtaW5maW5pdGUtbG9vcC1jYXVzZWQtYnktY3JhZnRl
ZC1mLnBhdGNoCiBDVVBTX0ZJTFRFUlNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjUtNjQ1MjQKIAor
IyAwMDA1LWZpeC1vdXQtb2YtYm91bmRzLXdyaXRlLWluLXBkZnRvcmFzdGVyLnBhdGNoCitDVVBT
X0ZJTFRFUlNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjUtNjQ1MDMKKwogQ1VQU19GSUxURVJTX0RF
UEVOREVOQ0lFUyA9IGN1cHMgbGliZ2xpYjIgbGNtczIgcXBkZiBmb250Y29uZmlnIGZyZWV0eXBl
IGpwZWcKIAogQ1VQU19GSUxURVJTX0NPTkZfT1BUUyA9IFwKLS0gCjIuNTQuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
