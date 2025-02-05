Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939CDC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A2FF81747;
	Wed,  5 Feb 2025 08:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTIXZMnuWuTW; Wed,  5 Feb 2025 08:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AFA88194A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AFA88194A;
	Wed,  5 Feb 2025 08:25:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48D82CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 393338194A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NE5Wj8jHOkFf for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:25:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A52BE81747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A52BE81747
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A52BE81747
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:25:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38db0146117so696007f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 00:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738743932; x=1739348732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=42MEkqs98au9dOSIe5SYHyp7k5XFNleG77HDm0S4Cuo=;
 b=YheVZ4vz9IHDfhOBCOzD0mIhTQ262FCBMBmtKlKKhjQoboITR+azQ4usczJ+zONQ6w
 u2zDPJw4OKDs2e5HZyIM2mbWZuME58dCjczp7KhMZ3Ej+wvAh+js2z8PUZ9NbNUKVl70
 TuBZzqA4nOuqCPbBnS7MhX8rKqeQoreX9LB32jD2iWMKBvFBTJoFXHwiahMi0N9XrYPp
 tdMOstrJ4Rstm4pPjcu7hjVWck2zNg5288pST6fJ+7LOH0flR+YACllenCyaKG3SR5mC
 yEnpNZUvx8sKpws4Bzi/tNZxQCRVBBkp7VqCstnNcZJWW182djPxn8WLJwNPSLmYGC3q
 dxxQ==
X-Gm-Message-State: AOJu0Ywz6xBBBwnLd3r8FzYvc7wMLr7ie+vNakLcLnpAswst28fYC8KT
 yIlfyDDtp4/ef9q3gZgkHJYzyeFVL9TdYnse1safEJEerXti+1BXo3+t7ToepxLB745gp2D/A2I
 jX/E=
X-Gm-Gg: ASbGncsIEzKZhuDn1YWUDDbfs6InEXnq4OeOfxyr+3QodK8j2qxRNQMx4802HKe2+Nf
 pQ43NBp5nqmmoPuhjc01sGv6LgmZrN471mEJ1JgPKWhpgieTpJ//2okBKmdKf741XwSbYYfW0aU
 z+3ctL8cRoZ+QXSgi9LfnSsg9NhkCj76X2tRGEcs2T/AgkM2a+MPJV44B7fpzQ29BBpamGfZZXj
 iJw6YZ6TyZ36+U8tjhccl1ZYuqMxtIs+pDBUiwpTsoXIdKvmjz23/SwIWQON0pbBnK7HoActv7a
 RPDB1+ExqUHI+vzD+jIdgnRrZNN3nUGlw19FZbro0hDr6CV/8q3qNTmA
X-Google-Smtp-Source: AGHT+IEoeic22DL01X8s1gK9hyg4gH+RxsC21gEaqkGReGRW55PqZzQrIjnm9IoTKDG1pxtlh8hHQw==
X-Received: by 2002:a05:6000:188f:b0:38a:86fe:52b5 with SMTP id
 ffacd0b85a97d-38db4872051mr1330745f8f.14.1738743931673; 
 Wed, 05 Feb 2025 00:25:31 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43907f1b570sm33354315e9.1.2025.02.05.00.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 00:25:31 -0800 (PST)
Message-ID: <6efb5df8-503e-429f-8b21-eabf2edeaa24@smile.fr>
Date: Wed, 5 Feb 2025 09:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250204183813.2414194-1-miquel.raynal@bootlin.com>
 <20250205005337.ibq6dgouhiqorcaa@bryanbrattlof.com>
Content-Language: fr
In-Reply-To: <20250205005337.ibq6dgouhiqorcaa@bryanbrattlof.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738743932; x=1739348732; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=42MEkqs98au9dOSIe5SYHyp7k5XFNleG77HDm0S4Cuo=;
 b=wPnEP21m+/vy+EaQJxH96Zja6/uNFUqIYOreFfMOxa/0CUcZnc2emoymD4pKKqa/1y
 Y8ckMsX1UiJMk2h2qUkVhlKMUewqutJVNFqoiPEQBBIWKZ6eGfAKpNyzA+uzLAIgkMZS
 Q47b68YFDhXd0ljkx6/lPaYIXgnGjZG9mZWEw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=wPnEP21m
Subject: Re: [Buildroot] [PATCH] configs/ti_am62ax_sk_defconfig: Fix kernel
 configuration
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWlxdWVsLCBCcnlhbiwgQWxsLAoKTGUgMDUvMDIvMjAyNSDDoCAwMTo1MywgQnJ5YW4g
QnJhdHRsb2YgYSDDqWNyaXTCoDoKPiBPbiBGZWJydWFyeSAgNCwgMjAyNSB0aHVzIHNheWV0aCBN
aXF1ZWwgUmF5bmFsIHZpYSBidWlsZHJvb3Q6Cj4+IFRoZSBrMy1hbTYyYTctc2suZHRzIGRlc2Ny
aWJlcyBhbiBJMkMgUE1JQyBUUFM2NTkzMTIgd2hpY2ggZmVhdHVyZXMgYQo+PiBudW1iZXIgb2Yg
cmVndWxhdG9ycy4gT25lIG9mIHRoZW0sIGxkbzEsIGlzIHVzZWQgYXMgcG93ZXIgc3VwcGx5IGZv
ciB0aGUKPj4gU0QgY2FyZCBob3N0IGNvbnRyb2xsZXIgcmVndWxhdG9yLiBXaGVuIHRoZSByb290
ZnMgaXMgb24gdGhlIFNECj4+IGNhcmQgKGxpa2Ugd2l0aCB0aGlzIGNvbmZpZ3VyYXRpb24pLCB3
ZSBuZWVkIHN1cHBvcnQgZm9yIHRoZXNlIHRocmVlCj4+IGNvbXBvbmVudHMgKFJlZ3VsYXRvciBk
cml2ZXIsIEkyQyBQTUlDIGdsdWUgYW5kIFBNSUMgTUZEIGRyaXZlcikgdG8gYmUKPj4gYnVpbHQt
aW4gaW4gb3JkZXIgdG8gYXZvaWQgYm9vdCBmYWlsdXJlcy4KPj4KPj4gVGVzdGVkIG9uIGFuIEFN
NjJBIExQIFNLLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgo+PiAtLQo+PiBCYWNrcG9ydCB0bzogMjAyNC4xMS54Cj4+IFRoZSBp
c3N1ZSB3YXMgcHJvYmFibHkgdGhlcmUgaW4gMjAyNC4wOC54IGFzIHdlbGwgYnV0IEkgaGF2ZW4n
dCB0ZXN0ZWQKPj4gYW5kIHRoZSBrZXJuZWwgaGFzIGJlZW4gYnVtcGVkIHNpbmNlIHRoZW4uCj4+
IC0tLQo+PiAgYm9hcmQvdGkvYW02MmF4LXNrL2xpbnV4LmNvbmZpZyB8IDMgKysrCj4+ICBjb25m
aWdzL3RpX2FtNjJheF9za19kZWZjb25maWcgIHwgMSArCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjJheC1zay9s
aW51eC5jb25maWcKPj4KPiAKPiBBaCBuaWNlIGNhdGNoLiBJIGd1ZXNzIG15IGNhcmQgaXMgdG9v
IG9sZCBvciB3b3JuIGVub3VnaCB0aGF0IEkgd2Fzbid0IAo+IGdvaW5nIGludG8gdGhlc2UgVUhT
IG1vZGVzLiBMb29raW5nIGF0IHRoZSBjb252ZXJzYXRpb24gaW4gdGhlIGtlcm5lbFswXSAKPiBp
dCBsb29rcyBsaWtlIHdlIGVpdGhlciBhZGQgdGhpcyBjb25maWcgb3IgdHJhbnNpdGlvbiB0byBh
biBpbml0cmQgc3R5bGUgCj4gYm9vdC4gSSBsaWtlIHRoaXMgb25lIGJldHRlciBmb3Igbm93Cj4g
Cj4gUmV2aWV3ZWQtYnk6IEJyeWFuIEJyYXR0bG9mIDxiYkB0aS5jb20+CgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRoYW5rcyBhZ2Fpbgo+
IH5Ccnlhbgo+IAo+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVs
LzIwMjQwODIxMTEwMDU0LjM1dTV1Ymdhb2d6anY2YzRAcm92ZXIvCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
