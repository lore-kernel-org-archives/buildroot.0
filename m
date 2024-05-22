Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3331DC25B7C
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 13:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0C33400AC;
	Wed, 22 May 2024 13:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SE5l_GMxWI7O; Wed, 22 May 2024 13:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D63AA400F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D63AA400F1;
	Wed, 22 May 2024 13:30:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 584E21C5BD9
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48BA5406BF
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15Z41NljM-JQ for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 13:30:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61A9140625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61A9140625
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61A9140625
 for <buildroot@buildroot.org>; Wed, 22 May 2024 13:30:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4202ca70270so9487525e9.3
 for <buildroot@buildroot.org>; Wed, 22 May 2024 06:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716384627; x=1716989427;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gXWwngBulgi6eSEYuYkdAV4ZSgk5CuU12S7UHqwzVpY=;
 b=A2pl2g6JwPDMhqAkW2qHBzf6H8vapEdlu5DwQTrbOEJBMHP8ikBFvvUioqB9Qx4Q0v
 OP+9Ps/MpTEae4ZImzsLdruXoTaTGI1tABavE/KfyZXnAj9Fm3DlelTaVFPbQn/TfP5u
 QJLqSCXAOFx7Yv6mIMaEIhz4r+bb/LoLNBwtDlSiTnGrFyUQihSUS6KYlO4k6OztpR4i
 K9PChlAO4qou7z2WVSqYQifxXY53DbedcYWypGce2zmGjHd2oaaviq/1nJ3VJDQtC4DT
 Otb3bNayG5xvcB3prUtL2sKWyT4Odrrb1i+iOOmoTKx7ERyeDHPwRWDvqnqxa4ODe6zI
 /tSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4VSjdS7dfddaVKXhV3YCmpiTeDrufcVomYVW9e78wvArct3TklF8Zlqn4Bx+fE0ye7gEAfM29EJGLyJch+C1L3zLwO8sB1A==
X-Gm-Message-State: AOJu0YxKUlOqb3CtCSVqrJwSNfhmMSbIynDcF9d8hVbr3HpZRbOD4v9d
 YG9+ZwwxOyZs/x0zLD2fmFTh0wi9sqBRPQRlMGlOI30CIeQeE4paXiLsxNnd5UhcTah/hksTdx4
 v
X-Google-Smtp-Source: AGHT+IFeXy+p1tHeAeZYnzZjpogykjHDgWzLkkfz4U0v+DlFP6bZEUzOus0uYCsiC3d8o283GCDATA==
X-Received: by 2002:a1c:4b18:0:b0:41f:e7e6:7f27 with SMTP id
 5b1f17b1804b1-420fd35a91fmr20503285e9.26.1716384627225; 
 Wed, 22 May 2024 06:30:27 -0700 (PDT)
Received: from [10.5.0.27] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baacfc6sm34589858f8f.72.2024.05.22.06.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:30:26 -0700 (PDT)
Message-ID: <d24cbdea-e17f-4f67-a869-9c699224357f@smile.fr>
Date: Wed, 22 May 2024 15:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240520165801.2247467-1-giulio.benetti@benettiengineering.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240520165801.2247467-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716384627; x=1716989427;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gXWwngBulgi6eSEYuYkdAV4ZSgk5CuU12S7UHqwzVpY=;
 b=M5vwoNIV0kWtO8UGw8c5IvP8Y8lybAD136TiqYvpMEyeIorWPJbBWPBUiRrtnGe7DH
 xJ7mZNO8qf2mYixgbxZ2dU78/Tl7jQeoVEknf1HwA/y1RISh3w8F3la052U/Dl69fRjg
 chjozPOTm/QHmt1m+SLa6Z+cXXqokRZMeg5EnjH/TqRmdFoM+kPrL4crPmJm9e8+Xj1I
 GKvb4XpaM4cibN/Z1hJ4XbL2BBBmNsLYoAXqmalrPuZAsZ6jbbUiTQDNoZZOZsFNFWG4
 orUg1naOygxQ7LCqoxz3m+8yEb3sg4qeV7VHcBk52cvoThxCzak3JsQOnR6ATk/TbbB8
 zcYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=M5vwoNIV
Subject: Re: [Buildroot] [PATCH] configs/amarula_vyasa_rk3288_defconfig:
 bump to Linux version 6.1.91
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2l1bGlvLAoKTGUgMjAvMDUvMjAyNCDDoCAxODo1OCwgR2l1bGlvIEJlbmV0dGkgYSDD
qWNyaXTCoDoKPiBGaXhlczoKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9qb2JzLzY4NjU1OTY1NDgKCkl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjYW4gZXhw
bGFpbiBob3cgdGhlIHZlcnNpb24gYnVtcCBmaXggdGhlIGJ1aWxkIGlzc3VlLgoKSW4gdGhlIGZ1
bGwgYnVpbGQgbG9nIHdlIGNhbiBub3RpY2U6CgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gPGNvbW1h
bmQtbGluZT46CmRyaXZlcnMvYXRhL2xpYmFoY2kuYzogSW4gZnVuY3Rpb24gJ2FoY2lfbGVkX3N0
b3JlJzoKLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozNTc6NDU6IGVycm9yOiBj
YWxsIHRvCidfX2NvbXBpbGV0aW1lX2Fzc2VydF8zMDInIGRlY2xhcmVkIHdpdGggYXR0cmlidXRl
IGVycm9yOiBCVUlMRF9CVUdfT04gZmFpbGVkOgpzaXplb2YoX3MpID4gc2l6ZW9mKGxvbmcpCiAg
MzU3IHwgICAgICAgICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBp
bGV0aW1lX2Fzc2VydF8sCl9fQ09VTlRFUl9fKQoKVGhpcyBlcnJvciBzZWVtcyB0byBiZSBmaXhl
ZCBieSAiYXRhOiBhaGNpOiBmaXggZW51bSBjb25zdGFudHMgZm9yIGdjYy0xMyIgZnJvbQp2Ni4x
LjQ6CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFi
bGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9OTdlMjhkZWFiOGJmZTcwZDU2ODc2NTBmOTQ0ODRmOGY5
MTAxZTU2NgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdpdWxp
byBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IC0tLQo+
ICBjb25maWdzL2FtYXJ1bGFfdnlhc2FfcmszMjg4X2RlZmNvbmZpZyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2NvbmZpZ3MvYW1hcnVsYV92eWFzYV9yazMyODhfZGVmY29uZmlnIGIvY29uZmlncy9hbWFydWxh
X3Z5YXNhX3JrMzI4OF9kZWZjb25maWcKPiBpbmRleCA3OTc2NTM3MjI1Li4wZGQ0N2Y0OThmIDEw
MDY0NAo+IC0tLSBhL2NvbmZpZ3MvYW1hcnVsYV92eWFzYV9yazMyODhfZGVmY29uZmlnCj4gKysr
IGIvY29uZmlncy9hbWFydWxhX3Z5YXNhX3JrMzI4OF9kZWZjb25maWcKPiBAQCAtMjMsNyArMjMs
NyBAQCBCUjJfVEFSR0VUX1VCT09UX1NQTF9OQU1FPSJzcGwvdS1ib290LXNwbC1kdGIuYmluIHRw
bC91LWJvb3QtdHBsLmJpbiIKPiAgIyBLZXJuZWwKPiAgQlIyX0xJTlVYX0tFUk5FTD15Cj4gIEJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFPSI2LjEuMiIKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tl9WQUxVRT0iNi4xLjkxIgo+ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ibXVsdGlfdjci
Cj4gIEJSMl9MSU5VWF9LRVJORUxfVUlNQUdFPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9VSU1BR0Vf
TE9BREFERFI9IjB4MDIwMDAwMDAiCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
