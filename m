Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8255EC3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD8040580;
	Tue, 20 May 2025 17:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCAc0uVjgJO2; Tue, 20 May 2025 17:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58C4740B32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C4740B32;
	Tue, 20 May 2025 17:34:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7020ED4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56C7281CE1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVyIT7Nvmbp7 for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BC1D81CAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BC1D81CAF
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BC1D81CAF
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:34:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a362e099cfso634205f8f.2
 for <buildroot@buildroot.org>; Tue, 20 May 2025 10:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747762471; x=1748367271;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:sender:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ClJBdU3kH5F85h7hftOeQ1rd2zyxCNNbFq60fvcO2bc=;
 b=l9fP25To/84rC4tjV/ZbdQ2Acz2xWUfdipzDDma2125VD9KUwfoVcHHfjNCMMJMc06
 rXGAyLzwUiRC5kO/TkMDTlNyMVZ6YDGiseAeFSy0J1uio0LuSVTMknVvMffoT6rizlQy
 mt1yRg9modaHytNFZLm/Pm0UNjbkSgBHciBbnJCkzd5OTtjc6ItADc0yOZhZnoYQKkye
 IdisAyAHtMOskI7xAbiX8apneVvc1W8lhKX3y2TNzLLJCjuBSDqa7ABEgJqfHmC3GGdM
 QT8fR63DKEN7sQ8PBGML2Y1CDx5CwK6wR3H4bc5fM7mD3IpistvygfVX1fjDc5Xkewdu
 Pxnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWslRm5qtFFRnTPSIx3CB07tn9ZNISxnZE3Nn76CJeeFaH6gmK5RKCdTQ9wQdSOTObn4JyjtmG/zqM=@buildroot.org
X-Gm-Message-State: AOJu0Yz3SPiEbM68nISnriwNsowXYM5FYc77NK1e/+7/rS5sUWiggbhN
 5BGDcpvIP4ttN9icjZyrTGK2NQgsOgqVfTS7BFsNIhkX7m1+bk/33PS8
X-Gm-Gg: ASbGncsLfBoGfHm5T6+6nakKlTZNL6yd5w/L96rD9YdMM5i3iS6McbDl6UbqTftiHpu
 I4v2kH/ruCIHJyAt0w6cMS6L6xfDCrThYnmevbKezt0GuPdkK/b9R8Mp0XKVEFUCD+1IrIOFfEq
 anKAAPNZ8KN7chd9nwpu7U5AoRDIvMnTFPu5X52OVIVzB7f9Un/j1RA24bkTgCyRQA9B5sCNAvc
 QK1NZk/G6ggVzgqWQkr3FNX8T/JmuMw4k0kf4l2Jk/hckapOWIqQJsz1yeNXA325IgBd1aWKejs
 0vx1d+brNN6yHrKRAVUVU5NDp4akxTeNEwNHxf2U1h9o+yvBaRysUGb5N6OAZdI6nkHeXQ==
X-Google-Smtp-Source: AGHT+IGnKgxMtVjrPWBrDrmZN8yjUCFYlJIz1SjR3i0EJTXPWbD6U1NmZAFPGleYDwlDpECoaQZDtA==
X-Received: by 2002:a05:6000:178c:b0:3a0:b807:7433 with SMTP id
 ffacd0b85a97d-3a35c83a0dbmr5995032f8f.4.1747762471301; 
 Tue, 20 May 2025 10:34:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d26esm17337613f8f.13.2025.05.20.10.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 10:34:30 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 20 May 2025 19:34:30 +0200
Message-Id: <DA1636PHDFNL.1USIGCVFZM0UM@gmail.com>
Cc: "Mahyar Koshkouei" <mahyar.koshkouei@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
 <20250204173456.201056-3-gael.portay+rtone@gmail.com>
 <1d789bef-093d-402f-99be-5fda01b2f80c@smile.fr>
In-Reply-To: <1d789bef-093d-402f-99be-5fda01b2f80c@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747762471; x=1748367271; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:sender:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ClJBdU3kH5F85h7hftOeQ1rd2zyxCNNbFq60fvcO2bc=;
 b=SR6j0jzV1JzIDxOdIB2VapiW0Wx1218NDGBU44xVqfn0VARi0L1UJ9l4dUb4PDsyHZ
 uImFxuaO65EI8gl5UqAaNbln7wSsERo5aDvANXI+tMFZsTZjUr6r9qYL6LFS8P3ud0H+
 NH9MVsaCYdGwS+GiOdmmXnZQrfme8XsLDBljTpxfyTJOktbgo7v5QZfoj322yvXu/Eb4
 2TLC/QZy5JkqkADimgiNU3Z7bOLQzhFILwlgMNBs2rekq7FEKTDsNM0NAIHuRKzbYLNG
 ncNKWtepLysxPQL4zUC51dz1VsHxpyKqol6ocUAUxRQsOClV/C/rIIIsL5NL6InrOqv7
 AwLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SR6j0jzV
Subject: Re: [Buildroot] [PATCH v4 2/2] package/rpi-userland: package is
 deprecated
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gV2VkIEZlYiA1LCAyMDI1IGF0IDk6NDcgQU0gQ0VULCBSb21haW4g
TmFvdXIgd3JvdGU6Cj4gSGVsbG8gR2HDq2wsIEFsbCwKPgo+IExlIDA0LzAyLzIwMjUgw6AgMTg6
MzQsIEdhw6tsIFBPUlRBWSBhIMOpY3JpdMKgOgo+PiBUaGUgcGFja2FnZSBycGktdXNlcmxhbmQg
aGFzIGJlZW4gbWFya2VkIGFzIGFuY2llbnQgYW5kIGRlcHJlY2F0ZWRbMV0uCj4+IAo+PiBUaGlz
IGFkZHMgdGhlIG1lc3NhZ2UgaW4gaXRzIGhlbHAuCj4+IAo+PiBbMV06IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yYXNwYmVycnlwaS91c2VybGFuZC9jb21taXQvOTZhNzMzNGFlOWQ1ZmM5ZGI3YWM5MmU1
OTg1MjM3N2RmNjNmMTg0OAo+PiAKPgo+IFdpdGggcnBpLXV0aWxzIHBhY2thZ2UgZW5hYmxlZCwg
d2Ugc2hvdWxkIGF2b2lkIGFueSBjb25mbGljdCB3aXRoIHRoaXMgcGFja2FnZS4KPiBUaGV5IHNo
b3VsZCBub3QgYmUgZW5hYmxlZCBhdCB0aGUgc2FtZSB0aW1lIGlmIHRoZXkgcHJvdmlkZSB0aGUg
c2FtZSBiaW5hcmllcyBldGMuCj4KCkFzIHNhaWQgaW4gdGhlIG90aGVyIHBhdGNoLCBJIGd1ZXNz
IHRoYXQgcGFja2FnZSBzaG91bGQgbm90IHByb3ZpZGUgdGhlCmJpbmFyaWVzIHV0aWxzIHByb3Zp
ZGVkIGJ5IHRoZSBuZXcgcGFja2FnZS4KCkp1c3QgcmVtb3ZlIHRoZW0uIFNvIGJvdGggcGFja2Fn
ZXMgY2FuIGJlIGluc3RhbGxlZCBhdCB0aGUgc2FtZSB0aW1lLgoKPiBNYXliZSBpdCB3b3VsZCBi
ZSBlYXNpZXIgaWYgcnBpLXVzZXJsYW5kIGNhbiBiZSByZW1vdmVkPwo+Cj4gQmVzdCByZWdhcmRz
LAo+IFJvbWFpbgo+CgpSZWdhcmRzLApHYcOrbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
