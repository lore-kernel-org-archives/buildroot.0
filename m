Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A20C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 13:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3BF4176F;
	Wed,  5 Feb 2025 13:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRsU6eWynBMJ; Wed,  5 Feb 2025 13:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C5C74177A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C5C74177A;
	Wed,  5 Feb 2025 13:50:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC9BB12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC33A80DF8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXSf-BRrQ28K for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 13:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2F5180DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F5180DC1
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2F5180DC1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:50:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso46693205e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 05:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738763422; x=1739368222;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Um88/A05A8cDi8nPsZ0HhKYpha76uJSqtu6dISzn+Ls=;
 b=J6TPklApSrwfbHpdC71ARLNoKZ62odJb5wTH+bVhmf3cZ+EcaV1+0NUCMwRlAivzcZ
 FXUTP9LV+Z+uvquSmifmA8lM3BKaVaoeAyM1wG9QZJ+U2W0tyB4nBUXvCYwuHrm5BcST
 tioEODc4Nt9elpr/dPl2Xy+V1Pl0/FMUSXWZlmRkQorCS/NENhw7VVAlu1khBVHHiXUX
 ZPxdTaoVX9PfyqFrWBRN+piF8bmt7/6EluiZ+97ZuQiroZkh0rw812DnUVlcKGdvdn+W
 yiyToeQuXG41njBhAVMnpKXOaF8Ya2s9wZiUvVpgCGBo14bqecyTwNag1kKRgOQpJCHz
 VnGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcdg2aMXHwHG1qt7AXlogSSFd7aX2PCoqOgdfvuY12HCd1/SnBFhcqF3tkXBEX9ddlcfCM6fHzMmc=@buildroot.org
X-Gm-Message-State: AOJu0YwtnknDLVRKrrW0ldv6qHqLTJrH4TtMfh+yHzcpJHfjAT8kD0++
 qeOORQxm16uZDTsxdMMhvudMZa3e/BNmSyFUE7dD82GraK4xlkH0GUiYevMB566TiavqO3/fADt
 pppvbkw==
X-Gm-Gg: ASbGncuFGMnshZ0k/IOZfbSt0OzyAt46k+Fkcw36CVyxR9/xRt147N7xKw/3dYgn1P2
 0FfKxGU6H4EVSCFTkAJmxnIbdTVhtYJplp8yi9wq1uGSXnDwW2q/CGAmgWzV9oDVmbOoDfJMAqk
 o42sCLDvcLF04cdNghJ/u/1/jUplrVL93kFWxYIdMyHDn5glUa8kXXlYvTkVOsreVkNGypqNv0N
 eSed75om1zNRot4aVVgAd7URDUG4t9Ac/SAoRtNjhdDFxeQPoUV/wVEuNkuzhKQOEi9imaoJoHR
 4jh1dVh2oGQePYmL1z1OFxv54t2T6MOYJBgCo2/iT2by/5FBn/78WCS+
X-Google-Smtp-Source: AGHT+IGPLXMddmhjGE4Fv1HmTr6+iSc0tnxHfRPcTx1aJe2q3MbDemvZ/O73FIO/5/MULLDIbZxnUA==
X-Received: by 2002:a05:600c:1c87:b0:434:f7e3:bfbd with SMTP id
 5b1f17b1804b1-4390d5611fcmr21478125e9.23.1738763421866; 
 Wed, 05 Feb 2025 05:50:21 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390da710f9sm21859845e9.25.2025.02.05.05.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 05:50:21 -0800 (PST)
Message-ID: <786b4e4a-c5e1-442c-9eda-6f4aa8f79921@smile.fr>
Date: Wed, 5 Feb 2025 14:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
Cc: Gary Bisson <bisson.gary@gmail.com>
References: <20250205-update-developers-v1-1-711afa54260e@armadeus.com>
Content-Language: fr
In-Reply-To: <20250205-update-developers-v1-1-711afa54260e@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738763422; x=1739368222; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Um88/A05A8cDi8nPsZ0HhKYpha76uJSqtu6dISzn+Ls=;
 b=Euj/kagSQhZQldWZ1NbxuINkUMGspYZfafpgAcCgyEzvk1vVVq3AJ0lUue8NjRYyei
 DCNH2G9rQWukY585JH9BFva7rBil4JgJBd3mLppmT2+/0er52vbTtyZFuyhrQJzGAG0Q
 Cfr2/LhGw5YUi22QR6llZ5n0eB45mMXiLwxD4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Euj/kagS
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Chris Dimich
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

SGVsbG8gU8OpYmFzdGllbiwKCkxlIDA1LzAyLzIwMjUgw6AgMTM6MDgsIFPDqWJhc3RpZW4gU3p5
bWFuc2tpIGEgw6ljcml0wqA6Cj4gQ2hyaXMgZW1haWwgYWRkcmVzcyBhdCBib3VuZGFyeWRldmlj
ZXMgaXMgYm91bmNpbmc6Cj4gCj4gQ2hyaXMgRGltaWNoIGlzIG5vIGxvbmdlciB3aXRoIEV6dXJp
by4gUGxlYXNlIGNvbnRhY3QgR2FyeSBCaXNzb24gYnkKPiBlbWFpbCBhdCBHYXJ5LkJpc3NvbkBl
enVyaW8uY29tLiBUaGFuayB5b3UhIgo+IAo+IE1vdmUgaGlzIHBhY2thZ2UgdG8gR2FyeSBCaXNz
b24gYXMgc3VnZ2VzdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tp
IDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIERFVkVMT1BFUlMgfCA0ICst
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGYyMGJkNWNlM2Y3
NzVlNWQ5OTI3NGQ2YjVhN2NmYWI0YTgxYzZhZTQuLjc1YTRiMjc0OWQxYWQ3OGUxMDFhMzFhMmFh
ODMzMGE3MzVjYmI1NGQgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BF
UlMKPiBAQCAtNTk5LDkgKzU5OSw2IEBAIEY6CXBhY2thZ2UvYWxzYS1wbHVnaW5zLwo+ICBOOglD
aGFuZ21pbmcgSHVhbmcgPGplcnJ5Lmh1YW5nQG54cC5jb20+Cj4gIEY6CXBhY2thZ2UvcW9yaXEt
Y2FkZW5jZS1kcC1maXJtd2FyZS8KPiAgCj4gLU46CUNocmlzIERpbWljaCA8Y2hyaXMuZGltaWNo
QGJvdW5kYXJ5ZGV2aWNlcy5jb20+Cj4gLUY6CXBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1
LWhhbnRyby1kYWVtb24vCj4gLQo+ICBOOglDaHJpcyBQYWNraGFtIDxqdWRnZS5wYWNraGFtQGdt
YWlsLmNvbT4KPiAgRjoJcGFja2FnZS9jb3JlbWFyay8KPiAgRjoJcGFja2FnZS9jb3JlbWFyay1w
cm8vCj4gQEAgLTEyMTksNiArMTIxNiw3IEBAIE46CUdhcnkgQmlzc29uIDxiaXNzb24uZ2FyeUBn
bWFpbC5jb20+Cj4gIEY6CWJvYXJkL2JvdW5kYXJ5ZGV2aWNlcy8KPiAgRjoJY29uZmlncy9uaXRy
b2dlbioKPiAgRjoJcGFja2FnZS9mcmVlc2NhbGUtaW14Lwo+ICtGOglwYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvaW14LXZwdS1oYW50cm8tZGFlbW9uLwo+ICBGOglwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0
MS1pbXgvCj4gIEY6CXBhY2thZ2UvbGliaW14dnB1YXBpLwo+ICBGOglwYWNrYWdlL21mZ3Rvb2xz
Lwo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiBjMzlmNjc3ZTZhNzE0MjM5NGJiMjcxMzE4MWJjYTY5
Yjc2OGU5ZjllCj4gY2hhbmdlLWlkOiAyMDI1MDIwNS11cGRhdGUtZGV2ZWxvcGVycy0wNmRiYWNh
ZmRmZDgKPiAKPiBCZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
