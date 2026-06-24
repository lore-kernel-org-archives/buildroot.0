Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB418CDB47F
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 15:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4E2B60A95;
	Wed, 24 Jun 2026 15:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SksCymMQaBmW; Wed, 24 Jun 2026 15:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBB3F60AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782316297;
	bh=q5c5mXYfxDTFK6hU8OTcvT7VRXEyT+WjXWchxkSdMUQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lQYJ+EmJ8dkwmYyIdrT927eGi5GAD44u5RX7LBMqi8lHJYrJPLpZCNzg5SE9fHaTY
	 gf4qT9tOXkFbUMaS1sPKXKisx8gDGq/VVSz2K66s4vYYy00dXcwYdpXHdZDqAqiu/x
	 inOgm4LGYhsOssquFvV0qYVcOhPOC230UJGxR9Wy+0hN62S/MqMby+M6CPciQSTlJY
	 fo4mCGR3mNVpgcJvWZfwCg7ChyTocrySLivU0LWnm1wmtJ1agCBpaocSGHELkxYY6a
	 tQ9kHflNYYVLXzVM/lIUZD1jKvxU631b8skS95uj+JyVfNsNNqcGUM3t/hjAgpBmCM
	 0YBBnzxP5jO1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB3F60AE4;
	Wed, 24 Jun 2026 15:51:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78340367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 15:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5847881B98
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 15:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_q8vD-yoZZW for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 15:51:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E64981A46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E64981A46
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E64981A46
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 15:51:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso925132f8f.0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 08:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782316293; x=1782921093;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sCwqaREaNPAh6gRRy492iws9DZj+3MRolGofeJKh+04=;
 b=Pz/AB1iHc4SqPneL6q45P92ls4cWjPzyT0IFue+FcpGhVpG63WOPIpAkomyeJI/Nuh
 JZNJKFxAnsI3FpFPvzJXtEHndpddw9JkFskxlWDL+h004aq4Xhj4Mzp5FxctGwgd34hm
 xf+BMSeyl5uKAMCZPo+4Gj2GuQv53/2VLP3FbUWCu9cn512nt+gCSyh48xg7lTWkSQLZ
 qncEiQIk69OLuyf6iiHSTj9v15UjMvBrE/2FzWA8CwTsVM0Oa280RWYx0prvDYgV791R
 Z/5XQsLgHJfkuxcNm1ofmBjRHgokfeCEEDCm88omBS0O2MWDCgjAwsdD6kzFKUIda65d
 Uehg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpkpTozou36iJOQI7QBMCmTXjHfC77Nhw5UlOxJ3ChX6f+2mQbbtt5USP0EzU9mKOd347odf0Lx9jY=@buildroot.org
X-Gm-Message-State: AOJu0YzeuBD3gRjggE0MtsRdyOQIgap1vyAzFtO3EChRxlX6QW2lx6hf
 CaK6HkBd6amSmCpwfS/uuJ3p0ixThVnXwf8IiQOFkao1969uey4Q8KcLGjOg6GgCZnjZDmGH1qh
 APYY9
X-Gm-Gg: AfdE7ckqher8fZ/2Mn3XE9W1Wui9I3AEzRl3l+vgG8SLG3UjLtTtvy9RCVxeRgVuiQI
 JzzfiWYPKaJ+Pf3z8wS7K92BR+MIqMcmxoka233vJIaZiEaanVKjVWzp8DJI07O1zezyKG7SQdQ
 znc3rmRqpv7VO7D3gZosKSpZtkNsYVikG1W2YpduwUIneU26DtEJUDfEh2zbu10Do9TVyMp/b8c
 P3pWaPm6htyuSUYMjW0bPX1jxxyGV0ktYHnGhRVDe4Qfd/x/8tLxp2q2HD2jGsbObYtTNzVZNlw
 8IFcOHVFP6E42ZvOekEcZpCE3Q4RT/2Gc6DksV0i6u8IuVCNFZN9iadCZ7tToTdP7aqh3X4LaIV
 f1YWo56z/xUIBMISCjjABTVo7ZpLoxO1zwWzgmLU+5ovlX4Y7BKkudCQIL3fC5J3MMrdwe6fgMO
 v34ReLXiq1b4XWE4FOCLnnyyeLeK1aldaHUIpY+W3wEf9tJ5RqSzHYMgVm4FdqVD/b+wPvakjuv
 vL0
X-Received: by 2002:a05:6000:26d2:b0:46a:41d3:deba with SMTP id
 ffacd0b85a97d-46c0c43ceddmr6660170f8f.43.1782316292874; 
 Wed, 24 Jun 2026 08:51:32 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840efdsm7499186f8f.5.2026.06.24.08.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:51:32 -0700 (PDT)
Message-ID: <cbfb9495-35d2-447e-a9e1-22c834d07dc5@smile.fr>
Date: Wed, 24 Jun 2026 17:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260527-master-v1-1-0d975f3b3f0d@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20260527-master-v1-1-0d975f3b3f0d@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782316293; x=1782921093; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sCwqaREaNPAh6gRRy492iws9DZj+3MRolGofeJKh+04=;
 b=vzlxrqnNrWc2/76+EyNdAOSXcTB2t/9otRyMGs/arqgsZ/jAfo6wKUmmvaRZs5GMcZ
 EoavfGfuFqfZX0TzbZGY1Uy0bvt45r8rfL/cJ6e7MlMkzPD31AUmFsehXw7DJOtrx9r0
 SNWVtIYhvb5aIAOOz+v25xJTvaIBMsXDRenzs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=vzlxrqnN
Subject: Re: [Buildroot] [PATCH] package/libxkbcommon: provide xkbregistry
 when libxml2 is enabled
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

SGVsbG8gUmFwaGHDq2wsCgpMZSAyNy8wNS8yMDI2IMOgIDIxOjUzLCBSYXBoYcOrbCBHYWxsYWlz
LVBvdSBhIMOpY3JpdMKgOgo+IHhrYnJlZ2lzdHJ5IGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuICBZ
ZXQsIGl0IG9ubHkgbmVlZHMgbGlieG1sMiB0byBiZQo+IGJ1aWx0LCB3aGljaCBpcyBhbHJlYWR5
IHN1cHBvcnRlZC4KPiAKPiBBZGQgdGhlIGNvbXBpbGUgZmxhZ3MgdG8gYnVpbGQgeGticmVnaXN0
cnkgd2hlbiBwb3NzaWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBHYWxsYWlzLVBv
dSA8cmdhbGxhaXNwb3VAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2xpYnhrYmNvbW1vbi9s
aWJ4a2Jjb21tb24ubWsgfCAxMCArKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieGti
Y29tbW9uL2xpYnhrYmNvbW1vbi5tayBiL3BhY2thZ2UvbGlieGtiY29tbW9uL2xpYnhrYmNvbW1v
bi5tawo+IGluZGV4IDIxYTJiOTM3ZWYwMi4uOTgxNTQzNjliNDE5IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGlieGtiY29tbW9uL2xpYnhrYmNvbW1vbi5tawo+ICsrKyBiL3BhY2thZ2UvbGlieGti
Y29tbW9uL2xpYnhrYmNvbW1vbi5tawo+IEBAIC0xMiw4ICsxMiw3IEBAIExJQlhLQkNPTU1PTl9D
UEVfSURfVkVORE9SID0geGtiY29tbW9uCj4gIExJQlhLQkNPTU1PTl9JTlNUQUxMX1NUQUdJTkcg
PSBZRVMKPiAgTElCWEtCQ09NTU9OX0RFUEVOREVOQ0lFUyA9IGhvc3QtYmlzb24gaG9zdC1mbGV4
Cj4gIExJQlhLQkNPTU1PTl9DT05GX09QVFMgPSBcCj4gLQktRGVuYWJsZS1kb2NzPWZhbHNlIFwK
PiAtCS1EZW5hYmxlLXhrYnJlZ2lzdHJ5PWZhbHNlCgp4a2JyZWdpc3RyeSBoYXMgYmVlbiBkaXNh
YmxlZCBvbiBwdXJwb3NlIHdoZW4gbGlieGtiY29tbW9uIGhhcyBiZWVuIHVwZGF0ZWQgdG8KMS4w
LjEgWzFdLgoKSXQgc2VlbXMgdG8gcmVxdWlyZXMgeGtleWJvYXJkLWNvbmZpZyBhdCBydW50aW1l
IFsyXSwgY2FuIHlvdSB2ZXJpZnk/CgpbMV0KaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vY29tbWl0LzE3OTFiYzMwYTViMTliYjUyMzY2Mzc1ZDAzZTY2MzQ4MjQy
ZmYyNWEKClsyXQpodHRwczovL2dpdGh1Yi5jb20veGtiY29tbW9uL2xpYnhrYmNvbW1vbi9ibG9i
LzJjMjk1YjEwYWE4N2U5YmQ4YzExOTU0YWRjZjdlOTJiMDMxYjkyZjkvUEFDS0FHSU5HI0w2MQoK
QmVzdCByZWdhcmRzLApSb21haW4KCj4gKwktRGVuYWJsZS1kb2NzPWZhbHNlCj4gIAo+ICBpZmVx
ICgkKEJSMl9QQUNLQUdFX1hPUkc3KSx5KQo+ICBMSUJYS0JDT01NT05fQ09ORl9PUFRTICs9IC1E
ZW5hYmxlLXgxMT10cnVlCj4gQEAgLTIyLDYgKzIxLDEzIEBAIGVsc2UKPiAgTElCWEtCQ09NTU9O
X0NPTkZfT1BUUyArPSAtRGVuYWJsZS14MTE9ZmFsc2UKPiAgZW5kaWYKPiAgCj4gK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfTElCWE1MMikseSkKPiArTElCWEtCQ09NTU9OX0NPTkZfT1BUUyArPSAtRGVu
YWJsZS14a2JyZWdpc3RyeT10cnVlCj4gK0xJQlhLQkNPTU1PTl9ERVBFTkRFTkNJRVMgKz0gbGli
eG1sMgo+ICtlbHNlCj4gK0xJQlhLQkNPTU1PTl9DT05GX09QVFMgKz0gLURlbmFibGUteGticmVn
aXN0cnk9ZmFsc2UKPiArZW5kaWYKPiArCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCWEtCQ09N
TU9OX1RPT0xTKSx5KQo+ICBMSUJYS0JDT01NT05fQ09ORl9PUFRTICs9IC1EZW5hYmxlLXRvb2xz
PXRydWUKPiAgZWxzZQo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiAwOGYzNzU3YjBmMjEzM2IwZWQ1
MGUxZWYzZDdhNWExZDljODBkZTFjCj4gY2hhbmdlLWlkOiAyMDI2MDUyNy1tYXN0ZXItMmU1Mjk5
YWFhOGNhCj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tICAKPiBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8
cmdhbGxhaXNwb3VAZ21haWwuY29tPgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
