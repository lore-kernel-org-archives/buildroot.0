Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D4C36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 10:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2713460EC2;
	Mon,  7 Apr 2025 10:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1UrFcuMFb8n; Mon,  7 Apr 2025 10:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B94EF60F26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B94EF60F26;
	Mon,  7 Apr 2025 10:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFC541F1
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 10:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C60BA8145A
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 10:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9YA5T9U9U6H for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 10:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A77DF81285
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A77DF81285
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A77DF81285
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 10:40:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so40096655e9.2
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 03:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744022411; x=1744627211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qgQXAj1MOL96QOAM84wO9aRo3H9Wp3EkbA9z0WeN+iE=;
 b=mrxVzkGLgqrpcUaoUygW0/tEFMpUQYW/HWfnTpyDaFZGEE+q1iC6rC4ebV0/P//dzb
 y9eezwKmIRhfuORe5hIaStdgpXtXpzVzSZIy12x3NM3MnJC2ruIdDrKM+WYP79wM00pz
 VQCD97b2a6p0/S6eiXe8qy0c5rR29zOg2jpjFyfDhK4k2T42/dwbXiKWL9DmvOLv0DRw
 9zQUjm/pKDV8G3lY52T68wZDcsMp1q2KmPKOPrbbJeFj/mZoL3tfzaizkqpBLf5sHS9Y
 A55Jvk2Q3yUfhbLk+i7QYLOCawuQxK4KsdVllKvyZPR3E2rqTjLW/p3guzwdkD2RM+CX
 9YyQ==
X-Gm-Message-State: AOJu0YzCJomuwQLe/Z6XgW7wqU2t40Ahs9WK/iXDzgj+LCPPwQJC2lr3
 h6a5jxRZhhEdwfj6ivDmoMzn5Jun1r/W6cO8nYE5RLLaztKXfV0ANXLZmNYg/PkUciZDCpPcwBq
 80Q8/nrZT
X-Gm-Gg: ASbGncvxgaLLnFS3U3JKAVZWujHeqOJ9v/KRU9ONf3oz+jUlpHJIT9ckfEkETESL84m
 d76cP1EpujGm5SxbRXeFg3ZD/q6KM2c/+pSRB74KLbn0R7INQuH3kA9HF8yF1Wd8DjuRGXV+hJZ
 S3cyAn7jeiOdlxmTMsuVCHtFlC/fHcgRgwwNvuPTe87hhlGCb/XAnnAzCLJkU4jFEE40CYLMJdM
 32xGhpbT5A55H2NfvKXFLT1rS0lpDAFuHXUopLHbl/NUrT8Szs1Kwpcfr6nbWQeiLLXfpFqvUJx
 YPEjQQ6+3/zQA8NpN+iXoQXXew5i75K2blau2WkYdTcZryBSeTFOHMA0hXtDUzSS34vjRbIO5n3
 AXFlo7+iNJHwMEQK6YQLcX9j8VlFFVGQ=
X-Google-Smtp-Source: AGHT+IEfJYaiYPcm2mJ1TYSppaZY9vGuDX3H8LlX3umFlSArxxXJrpWZSmsnRSfMgqy9GlovamQHBg==
X-Received: by 2002:a05:6000:1888:b0:391:3406:b4e1 with SMTP id
 ffacd0b85a97d-39d0de16c32mr9274776f8f.15.1744022410938; 
 Mon, 07 Apr 2025 03:40:10 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a0a90sm11569858f8f.21.2025.04.07.03.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 03:40:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon,  7 Apr 2025 10:39:55 +0000
Message-Id: <20250407103959.2361659-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744022411; x=1744627211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qgQXAj1MOL96QOAM84wO9aRo3H9Wp3EkbA9z0WeN+iE=;
 b=GF2q+0rhM5376ARQ+SQnQqpPuY+QTDrzVNfQA41x9XsHDzkQeKz75tycRqeFWxGzP7
 sk10xYZ+0etw4tgcygGTSzmIkvvhYTqPaXKq2kRDaxfuR2SDxhiutwleGnbPqhA0Jlho
 DAX7pRHoJ9hSea7SETjIVnCoYF7MkpE1nt9EhQrqrrPHa5MnlOJAfOkuq0d0gT34dBFB
 f+wP4rD6gcjR0W6UVuAwbIxRAI6WfcLjEHhhUfooABNEEICKhSbm377+1Gz6lMoeELx/
 OWYnwlWNx1XNFd6xqdLj18BZGq/cVKO4WyqegMNq1qKav494C8YGIRXTLBC9Xj5yJXNl
 HXhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GF2q+0rh
Subject: [Buildroot] [PATCH 0/3] package/mupdf,
 python-pymupdf: bump to version 1.24.9, 1.24.10
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgdXBkYXRlcyBib3RoIG11cGRmIGFuZCBweXRob24tcHltdXBkZiB0byB2ZXJz
aW9ucyAxLjI0LjkKYW5kIDEuMjQuMTAgcmVzcGVjdGl2ZWx5LgoKSXQgaGFzIHRvIGJlIG5vdGVk
IHRoYXQgbmV3ZXIgdmVyc2lvbnMgZXhpc3QgdXBzdHJlYW0uClRoZXkgY3VycmVudGx5IGZhaWwg
dG8gYnVpbGQgaG93ZXZlciwgc28gdGhleSByZXF1aXJlIG1vcmUgd29yayBiZWZvcmUKd2UgY2Fu
IHVzZSB0aGVtLgoKUmFwaGHDq2wgTcOpbG90dGUgKDMpOgogIHBhY2thZ2UvbGx2bS1wcm9qZWN0
OiBhZGQgc3VwcG9ydCBmb3IgY2xhbmcgcHl0aG9uIGJpbmRpbmdzCiAgcGFja2FnZS9tdXBkZixw
eXRob24tcHltdXBkZjogYnVtcCB0byB2ZXJzaW9uIDEuMjQuOSwxLjI0LjEwCiAgcGFja2FnZS9t
dXBkZjogc2tpcCBpbnN0YWxsaW5nIGRvY3MgdG8gdGhlIHRhcmdldAoKIC4uLnNpYy1hZ2FpbnN0
LWxpYmF0b21pYy13aGVuLW5lY2Vzc2FyeS5wYXRjaCB8ICA0OCArKysrKysrCiBwYWNrYWdlL2xs
dm0tcHJvamVjdC9jbGFuZy9Db25maWcuaW4gICAgICAgICAgfCAgIDggKysKIHBhY2thZ2UvbGx2
bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1rICAgICAgICAgICB8ICAgNSArCiAuLi5MSUItdmFyaWFi
bGUtZm9yLWNvbnZlbmllbnQtbGlua2luZy0ucGF0Y2ggfCAgOTEgKysrKysrKysrKysrKwogLi4u
LWpsaWItZml4LXNldHRpbmctZmlsZW5hbWUtbG9nLWxldmVsLnBhdGNoIHwgIDQ4ICsrKysrKysK
IC4uLnktdG8tcHJvdmlkZS1saWJjbGFuZy1pbmNsdWRlLWRpcnMtZS5wYXRjaCB8ICA1MyArKysr
KysrKwogLi4uZS1ub24tdmVyc2lvbmVkLXN5bWxpbmstdG8tdGhlLWJ1aWxkLnBhdGNoIHwgIDM1
ICsrKysrCiAuLi4tbG9nLWxldmVsLXRocm91Z2gtZW52aXJvbmVtZW50LXZhcmkucGF0Y2ggfCAg
NTMgKysrKysrKysKIC4uLnJ0ZWQtb3BlcmFuZC10eXBlLXdoZW4tc2V0dGluZy1sb2ctbC5wYXRj
aCB8ICA0NCArKysrKysKIHBhY2thZ2UvbXVwZGYvQ29uZmlnLmluICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgOCArKwogcGFja2FnZS9tdXBkZi9tdXBkZi5oYXNoICAgICAgICAgICAgICAgICAg
ICAgIHwgICA0ICstCiBwYWNrYWdlL211cGRmL211cGRmLm1rICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMzkgKysrKystCiAuLi53LXByb3ZpZGluZy1weXRob24tY29uZmlnLWV4dGVybmFsbHku
cGF0Y2ggfCAxMjUgLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdlL3B5dGhvbi1weW11cGRmL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgfCAgIDMgKy0KIHBhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0
aG9uLXB5bXVwZGYuaGFzaCAgICB8ICAgNCArLQogcGFja2FnZS9weXRob24tcHltdXBkZi9weXRo
b24tcHltdXBkZi5tayAgICAgIHwgICA3ICstCiAuLi4vdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0
aG9uX3B5bXVwZGYucHkgICAgfCAgIDIgKy0KIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9u
X3B5bXVwZGYucHkgICAgICB8ICAgMiArLQogMTggZmlsZXMgY2hhbmdlZCwgNDQxIGluc2VydGlv
bnMoKyksIDEzOCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xsdm0t
cHJvamVjdC9jbGFuZy8wMDAxLUxpbmstbGliY2xhbmdCYXNpYy1hZ2FpbnN0LWxpYmF0b21pYy13
aGVuLW5lY2Vzc2FyeS5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGx2bS1wcm9q
ZWN0L2xsdm0vMDAwMS1TZXQtTExWTV9BVE9NSUNfTElCLXZhcmlhYmxlLWZvci1jb252ZW5pZW50
LWxpbmtpbmctLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tdXBkZi8wMDAxLWps
aWItZml4LXNldHRpbmctZmlsZW5hbWUtbG9nLWxldmVsLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9tdXBkZi8wMDAxLXNjcmlwdHMtYWRkLWEtd2F5LXRvLXByb3ZpZGUtbGliY2xh
bmctaW5jbHVkZS1kaXJzLWUucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRm
LzAwMDEtc2V0dXAucHktYWRkLXRoZS1ub24tdmVyc2lvbmVkLXN5bWxpbmstdG8tdGhlLWJ1aWxk
LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tdXBkZi8wMDAyLWpsaWItZml4LXNl
dHRpbmctbG9nLWxldmVsLXRocm91Z2gtZW52aXJvbmVtZW50LXZhcmkucGF0Y2gKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDMtamxpYi1maXgtdW5zdXBwb3J0ZWQtb3BlcmFu
ZC10eXBlLXdoZW4tc2V0dGluZy1sb2ctbC5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcHl0aG9uLXB5bXVwZGYvMDAwMS1waXBjbC5weS1hbGxvdy1wcm92aWRpbmctcHl0aG9uLWNv
bmZpZy1leHRlcm5hbGx5LnBhdGNoCgotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
