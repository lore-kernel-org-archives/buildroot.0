Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B46C79FBB
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 13:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A0D94071C;
	Wed,  9 Sep 2026 13:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avyDQkGgCYkP; Wed,  9 Sep 2026 13:28:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0A7CA4071F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788960492;
	b=KbxbYJ65UTttSWENZfrQg2kaR7neUPRk+CJtdcMid0IPAAznYOD0NhhiqA0wtD2c+EXs
	 PKt8HcK04/IlXYPchTIoUAYa7yTr/4mxFvPJFRRVqPiXO5tNx84YkDfe0DWDGydOIv+IJ
	 LvbgrIw0YJZsfVKA7gEng6y0+eZT+VFWtAfHvHavvDaHRuwX9D8HqlSpO3qBqUWqM2Vux
	 aElBR8/TJ7XMWKWq5OZvwAzgYAXv4WWuVs86S3cHg1hJ9lSnU2GqZoeDv2IoWlFTJeGGD
	 1g+Z+n+n9JbPTW/7OgLcYGN0t3uD6otBNmVH4g4U5eGNeRJRoyDzVQ2JjWSNrZZcw9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788960492;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ph0abAL4UCkJu4W3Vgfvz3Kq/ffabsdvgbjl2h2g3sY=;
	b=X+malJw5liWrAhDDlAguS18gSMKWzTYa/zfHZqJSlLYIe1NRxDAB2gRDz2wTCggbi6yu
	 DQYserLbu9B2DwXYAV7sRcCZj06awCn9UhNtxhyp6daM97r03LO0JKzt0BFpcy0AaIU1K
	 DrNIvpx7PjaE5sCKE2XE1c2J3mHHSerYDnDVNxFXmEs+hJk5gn+f/aboV+6R5RkRi06dO
	 8wU2pgiJsm6faHptXAPc1C0nkE/UshVxMev0MG+sUif9zeBT4RIL9HWr0Nxz5XFikdC3Q
	 2eBrbmJtCv3uKVMLOFhroq4YYjN5i0mki8yoJGiqOHzI8xjd/OV7rXAJsVy724QL4KQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788960492;
	bh=ph0abAL4UCkJu4W3Vgfvz3Kq/ffabsdvgbjl2h2g3sY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DotC6Dn3QLBPhGRvmpzxQenjpFpUXbZF01OZqDiyVgRulap+asrD6/3sEjFdaXx+6
	 goiWaE3/EhpQ/fcsGEhgbubPSk2k4cR+mNMCC9tXsMOwLfzdVOje0da7S9bMVsne+L
	 V23Cp8fiSyGgwr8HfTI2UiVOw17M7tTfhGW3MKFfl+sZw0tAI/MRCHoxlYY4PjHffv
	 ds6UX6HAoSjrNr4fnfMZSR4vaoY9sbPnjjsygVm7nN6W9VcbdJILZuUREHdlH+UDTZ
	 BML16CqCGI7EaVtfaFSyG49yIWaVZ4i57E6r2HTBfP0DjfFGNfRYNejS8VK+HayiSr
	 6ba+4958df2Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A7CA4071F;
	Wed,  9 Sep 2026 13:28:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA71D2D2
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E680D808BD
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2fnuBAmO5_E for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 13:28:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 82D8A80887
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788960487;
 b=s42IvqjV5wf5MTkEZ0a7fP6/pNjTLqVwfS3tmQwWO6kjQH55vEqQKx24w9WqIksIUlJS
 TgtuYH+3BGhxYUNpGHEHd2p1oNVtpi01O+NnCntZddaaf+xTtPGbmIpaPlswQx3UXoWZ8
 JAMIrh8oGrEqB71iFY3LFN4TnzSyoZ4Aa/yEm6ksrtrQenTLCi0wkopwAiQ7ogF0HFZy2
 +m5I/Z0a8xDgnmLePTJ/E/ileoYdZrO4GX5kxDuMxvnGehtG7lRQqrDj0Sfd2y94Ukfrj
 v+6BpkV2EpcCDpusnoARbZr1HYCDM0elZ7NHjCG+6iUE2NJk6/8QXR2LnJaN0iDZjIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788960487;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=hdzdvyD2iaLyvQSpYNUoES3zcJqLg1ZNiy4b98WoAK4=;
 b=r7ONzB1i2PdiWjfw8c47GHKSJXabc60BJXdtlQoN0tAyA/V4kxpJT/0uCi5bLNUoHBK+
 qVJrTIjA/MzfmsPFZwi0PQNS6clWc5ZZlJujVC07KQtpuvv9rgoaXVzeQbfRN9bIz3X8l
 KUC13kUzu1A+fl0LuzrUk11FS0nGLxyieu6sh3yUe706+YWug8yc3gT/6gQSKgEqkMXdB
 9y875v6G8AZbSgoduqqcwL10kd1a4HoRePD5LqWw7CgpsMt9hDk9zZ3ybvvMGeOfUT4oU
 Bfak7ukT/S0eE2B/fN3gG1bb2fblKdM2z6gfNqDphZvtPuyT4bbanrwyp78fsIzk/ew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=vrgUGGjr; 
 arc=none smtp.remote-ip="2a00:1450:4864:38::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:38::10; helo=mail-lr2-x10.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-lr2-x10.google.com (mail-lr2-x10.google.com
 [IPv6:2a00:1450:4864:38::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82D8A80887
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:28:06 +0000 (UTC)
Received: by mail-lr2-x10.google.com with SMTP id
 38308e7fff4ca-3a34473d51fso9717041fa.1
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 06:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788960484; x=1789565284;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hdzdvyD2iaLyvQSpYNUoES3zcJqLg1ZNiy4b98WoAK4=;
 b=XKyuUgt+HiFQ5APdN7h4hpQ0vr/BEYgGVZF6b4wo6zB6Cm9+wNE7dNVt8bJq2iokVN
 KxYXCyHpn3fatQA0x6rbeJcLryYI9Zyx8UagKyUhpQv4cg16bmXTBXKfDwUzoM3Ebhqe
 F02Ma8w0xRx4sh7eHAS+Vvk2jF3Dpe3XWOzdg4BIdglQTXbukVHH0i9G53ZAx7XzyeN0
 c6JQu61r3z8CIfP2rXTRATygFQpZRgXZzNPEyI6w3qYIUzjwKbpaoe41m1mU8oZS+Rhw
 TExYf4zuTGe2HOetQuzB/RPvC4YlXLEHcjcGn6+6Y7dVVAm0+SgApjw+JaWtuc9RR9JS
 frPg==
X-Forwarded-Encrypted: i=1;
 AKwUvByslUHCHSaam1pQ9z02Oks7vAsonICZ7BzVGDEt3O3ZIqeCWdNrvRLyzDzZI6wbxiqYxEepz+xTIA0=@buildroot.org
X-Gm-Message-State: AFuF++k7oh2CRUFCieqC4kPg2B/OY57oG7bLBDmt0pX2mJCnQcHmhc9l
 6zGO7Axb25FgrAUdoKxOJzq0kvYZ9AAmYXv2VjEk87xAuqBD2qzIRCvSmuFK9oT3DPU=
X-Gm-Gg: AYBFou3ci0e59c2gMwfRnjytvbd6vK21AoT1vxiZfRvtO1+xM0wvEvBRB+za/NOqy2j
 1cWGaLXeHGpyTJ/9OXkgw97EHtymjeVNVPP6R76weDZ9QBIR4s8/H7v+3RNNsfnodiM+HuNqlX8
 hLF1p/4ySRRtoEw/mO0qpWHExmDuKCL/RF2dqQYJei7F5BISXYCmRrC5I1Ml+SP9gVxnrLOLYy9
 AkBdjxniB0YR/tvW4jKFtNOb0ANXwWbGDxDYL5ucVEinjWQE9jCfkn2Fba/LKh0Oma29qYsidOq
 aohZMfb+Lu0eW2njhpZSbK2rJA7uDKlrCBrw5o7JIMnnkptAFvQOjEbFXT8bM0MkPBonSfJc7fh
 AHbvUv9Zm4vLcofdqlvZQLVMiUcZt5cNMqw0dMZhsnM3a6s6T8tvI1GOOMlUBPi0SGuOImWkWc5
 OlWOWuNiblFW6iuo0LE6fbKNSWMMhNhvY8OZRJJL/v9cpop/dtymYJG2F3sYqdMMxFnbpdyjfc6
 SfU/ZxHrTiW3TJTz+WHyOqLRHTPrZHXp+B5zpxSzorwrH6luyPklP0OKCLciUo2LhUbNFSrHwg=
X-Received: by 2002:a2e:a988:0:b0:3a1:ab57:ea2c with SMTP id
 38308e7fff4ca-3a49760daf1mr12541681fa.2.1788960483572; 
 Wed, 09 Sep 2026 06:28:03 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a37059b0c3sm47192001fa.30.2026.09.09.06.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 06:28:03 -0700 (PDT)
Message-ID: <35c51ddc-b9df-43b8-8050-c2898d0f0ee1@smile.fr>
Date: Wed, 9 Sep 2026 15:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
References: <20260906233048.692559-1-bernd@kuhls.net>
Content-Language: fr, en-US
In-Reply-To: <20260906233048.692559-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/6] package/mesa3d: rework OpenCL handling
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

SGkgQmVybmQsIEFsbCwKCkxlIDA3LzA5LzIwMjYgw6AgMDE6MzAsIEJlcm5kIEt1aGxzIGEgw6lj
cml0wqA6Cj4gTWVzYTNEIHJlbW92ZWQgdGhlIG9sZCBDbG92ZXIgT3BlbkNMIGltcGxlbWVudGF0
aW9uIGluIHZlcnNpb24gMjUuMi4wCj4gYW5kIGtlcHQgb25seSBSdXN0aUNMOgo+IAo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNS1BdWd1
c3QvMDAwODE1Lmh0bWwKPiAiWy4uLl0gdGhlIENsb3ZlciBPcGVuQ0wgaW1wbGVtZW50YXRpb24g
aGFzIGJlZW4gZGVsZXRlZC4gUnVzdGlDTCBpcyBub3cKPiAgdGhlIG9ubHkgT3BlbkNMIGltcGxl
bWVudGF0aW9uIGF2YWlsYWJsZSBbLi4uXSIKPiAKPiBTaW5jZSB0aGVuIHRoZSBvcHRpb24gQlIy
X1BBQ0tBR0VfTUVTQTNEX09QRU5DTCBzZXJ2ZWQgbm8gb3RoZXIgcHVycG9zZQo+IHRoYW4gYWxs
b3dpbmcgYWNjZXNzIHRvIHRoZSBSdXN0aUNMIHN1Yi1vcHRpb24uIFRoaXMgY29tbWl0IG1lcmdl
cyBib3RoCj4gb3B0aW9ucyBhbmQgdGhlaXIgZGVwZW5kZW5jaWVzLgo+IAo+IEZpeGVzIGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL3dvcmtfaXRlbXMvMTgwI25v
dGVfMzUwMTc0MDAzMgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+Cj4gLS0tCj4gIENvbmZpZy5pbi5sZWdhY3kgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDkgKysrKysrCj4gIHBhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgICAgIHwgMzIgKysrKystLS0tLS0tLS0tLS0tLS0KPiAgcGFja2FnZS9tZXNhM2QvbWVzYTNk
Lm1rICAgICAgICAgICAgICAgICAgICAgfCAgNyArKystLQo+ICBzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X21lc2EzZC5weSB8ICAxIC0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvQ29uZmlnLmlu
LmxlZ2FjeSBiL0NvbmZpZy5pbi5sZWdhY3kKPiBpbmRleCA2YzIyMmMwZTU3Li42ZGFhZjU2ZjIy
IDEwMDY0NAo+IC0tLSBhL0NvbmZpZy5pbi5sZWdhY3kKPiArKysgYi9Db25maWcuaW4ubGVnYWN5
Cj4gQEAgLTE0Niw2ICsxNDYsMTUgQEAgZW5kaWYKPiAgCj4gIGNvbW1lbnQgIkxlZ2FjeSBvcHRp
b25zIHJlbW92ZWQgaW4gMjAyNi4xMSIKPiAgCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0Rf
T1BFTkNMCj4gKwlib29sICJNZXNhM0QgT3BlbkNMIHN1cHBvcnQgaXMgbm93IHByb3ZpZGVkIGJ5
IFJ1c3RpQ0wiCj4gKwlzZWxlY3QgQlIyX0xFR0FDWQo+ICsJaGVscAo+ICsJICBNZXNhM0QgcmVt
b3ZlZCB0aGUgb2xkIENsb3ZlciBPcGVuQ0wgaW1wbGVtZW50YXRpb24gYW5kCj4gKwkgIHJlcGxh
Y2VkIGl0IGJ5IFJ1c3RpQ0wuIFRoaXMgb3B0aW9uIHNlcnZlZCBubyBvdGhlciBwdXJwb3NlCj4g
KwkgIHRoYW4gYWxsb3dpbmcgYWNjZXNzIHRvIHRoZSBSdXN0aUNMIHN1Yi1vcHRpb24gd2hpY2gg
d2FzIG1vdmVkCj4gKwkgIHRvIHRoZSBtYWluIG9wdGlvbnMgc2VjdGlvbi4KPiArCj4gIGNvbmZp
ZyBCUjJfQklOVVRJTFNfVkVSU0lPTl8yXzQ0X1gKPiAgCWJvb2wgImJpbnV0aWxzIDIuNDQgaGFz
IGJlZW4gcmVtb3ZlZCIKPiAgCXNlbGVjdCBCUjJfTEVHQUNZCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbWVzYTNkL0NvbmZpZy5pbiBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+IGluZGV4IGUx
ODQwMzkxNTAuLmNiODZlNmEyYTQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmln
LmluCj4gKysrIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4gQEAgLTIzLDcgKzIzLDYgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9ORUVEU19FTEZVVElMUwo+ICAKPiAgY29uZmlnIEJS
Ml9QQUNLQUdFX01FU0EzRF9ORUVEU19QUkVDT01QX0NPTVBJTEVSCj4gIAlib29sCj4gLQlzZWxl
Y3QgQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5DTAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1NQSVJW
X0xMVk1fVFJBTlNMQVRPUgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1NQSVJWX1RPT0xTCj4gIAo+
IEBAIC01NiwzNSArNTUsMjAgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9MRUdBQ1lfQklO
RF9XQVlMQU5EX0RJU1BMQVkKPiAgCWhlbHAKPiAgCSAgTGVnYWN5IFdheWxhbmQgRUdMX1dMX2Jp
bmRfd2F5bGFuZF9kaXNwbGF5IHN1cHBvcnQuCj4gIAo+IC1tZW51Y29uZmlnIEJSMl9QQUNLQUdF
X01FU0EzRF9PUEVOQ0wKPiAtCWJvb2wgIk9wZW5DTCBzdXBwb3J0Igo+IC0JZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9NRVNBM0RfTExWTQo+IC0JZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9NRVNBM0Rf
R0FMTElVTV9EUklWRVJfUjYwMCB8fCBcCj4gLQkJQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1f
RFJJVkVSX1BBTkZST1NUIHx8IFwKPiAtCQlCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklW
RVJfUkFERU9OU0kgfHwgXAo+IC0JCUJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9J
UklTIHx8IFwKPiAtCQlCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9BTUQgfHwgXAo+
IC0JCUJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0lOVEVMIHx8IFwKPiAtCQlCUjJf
UEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9JTUFHSU5BVElPTiB8fCBcCj4gLQkJQlIyX1BB
Q0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfUEFORlJPU1QgfHwgXAo+IC0JCShCUjJfUEFDS0FH
RV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTICYmIFwKPiAtCQkgQlIyX1BBQ0tBR0Vf
TUVTQTNEX1JVU1RJQ0xfU1VQUE9SVEVEX0RSSVZFUikKPiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9M
TFZNX1JUVEkKPiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9DTEFORwo+IC0Jc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQkNMQwo+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX0hBU19MSUJPUEVOQ0wKPiAtaWYgQlIy
X1BBQ0tBR0VfTUVTQTNEX09QRU5DTAo+IC0jIGxpYmNsYyBkZXBlbmRlbmN5IGlzIHNhdGlzZmll
ZCBieQo+IC0jIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9N
RVNBM0RfUlVTVElDTAo+IC0JYm9vbCAiUnVzdGlDTCIKPiArCWJvb2wgIlJ1c3RpQ0wgT3BlbkNM
IHN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCj4gIAlkZXBl
bmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPiAgCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfTUVTQTNEX1JVU1RJQ0xfU1VQUE9SVEVEX0RSSVZFUgo+ICAJ
c2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUlVTVEMKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MTFZN
X0RVTVAKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MTFZNX1JUVEkKPiArCXNlbGVjdCBCUjJfUEFD
S0FHRV9DTEFORwo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkNMQwo+ICAJc2VsZWN0IEJSMl9Q
QUNLQUdFX1NQSVJWX1RPT0xTCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfU1BJUlZfTExWTV9UUkFO
U0xBVE9SCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTkNMX0lDRF9MT0FERVIKPiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9IQVNfTElCT1BFTkNMCj4gIAloZWxwCj4gIAkgIFJ1c3RpQ0wgaXMgYW4g
T3BlbkNMIGltcGxlbWVudGF0aW9uIHdyaXR0ZW4gaW4gUnVzdC4KPiAgCSAgQnkgZGVmYXVsdCwg
ZGV2aWNlcyBhcmUgZGlzYWJsZWQgaW4gUnVzdGlDTC4gSWYgeW91IHdhbnQKPiBAQCAtOTMsOCAr
NzcsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX1JVU1RJQ0wKPiAgCj4gIAkgIGh0dHBz
Oi8vZG9jcy5tZXNhM2Qub3JnL2VudnZhcnMuaHRtbCNlbnZ2YXItUlVTVElDTF9FTkFCTEUKPiAg
Cj4gLWVuZGlmICMgQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5DTAo+IC0KPiAgY29uZmlnIEJSMl9Q
QUNLQUdFX01FU0EzRF9SVVNUSUNMX1NVUFBPUlRFRF9EUklWRVIKPiAgCWJvb2wKPiAgCj4gQEAg
LTU1NCw3ICs1MzYsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUFJPVklERVNfTElCR0xFUwo+ICAJ
ZGVmYXVsdCAibWVzYTNkIiBpZiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VTICYmICFCUjJf
UEFDS0FHRV9MSUJHTFZORAo+ICAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQk9Q
RU5DTAo+IC0JZGVmYXVsdCAibWVzYTNkIiBpZiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkNMCj4g
KwlkZWZhdWx0ICJtZXNhM2QiIGlmIEJSMl9QQUNLQUdFX01FU0EzRF9SVVNUSUNMCj4gIAo+ICBl
bmRpZiAjIEJSMl9QQUNLQUdFX01FU0EzRAo+ICAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNh
M2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4gaW5kZXggODdjN2Y0Mjdl
NC4uOGM3ODE2NzY4NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiAr
KysgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiBAQCAtNTAsMTMgKzUwLDE0IEBAIGVsc2UK
PiAgTUVTQTNEX0NPTkZfT1BUUyArPSAtRGxsdm09ZGlzYWJsZWQKPiAgZW5kaWYKPiAgCj4gLWlm
ZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5DTCkseSkKPiAtTUVTQTNEX1BST1ZJREVTICs9
IGxpYm9wZW5jbAo+IC1NRVNBM0RfREVQRU5ERU5DSUVTICs9IGNsYW5nIGxpYmNsYwo+ICtpZmVx
ICgkKEJSMl9QQUNLQUdFX01FU0EzRF9SVVNUSUNMKSx5KQo+ICBlbmRpZgoKVGhlcmUgaXMgbm90
aGluZyBsZWZ0IGhlcmUsIHRoaXMgY2FuIGJlIHJlbW92ZWQuCgpSZXZpZXdlZC1ieTogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
IAo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9SVVNUSUNMKSx5KQo+ICtNRVNBM0RfUFJP
VklERVMgKz0gbGlib3BlbmNsCj4gIE1FU0EzRF9ERVBFTkRFTkNJRVMgKz0gXAo+ICsJY2xhbmcg
XAo+ICsJbGliY2xjIFwKPiAgCWhvc3QtcnVzdGMgXAo+ICAJaG9zdC1ydXN0LWJpbmRnZW4gXAo+
ICAJc3BpcnYtdG9vbHMgXAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X21lc2EzZC5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rf
bWVzYTNkLnB5Cj4gaW5kZXggMjRmYzZkZjU5ZS4uMTkzYWE3YTM3MyAxMDA2NDQKPiAtLS0gYS9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X21lc2EzZC5weQo+ICsrKyBiL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbWVzYTNkLnB5Cj4gQEAgLTE3LDcgKzE3LDYg
QEAgY2xhc3MgVGVzdE1lc2EzRFJ1c3RpY2woaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiAgICAg
ICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRT0iYm9hcmQvcWVtdS9hYXJj
aDY0LXZpcnQvbGludXguY29uZmlnIgo+ICAgICAgICAgIEJSMl9QQUNLQUdFX01FU0EzRD15Cj4g
ICAgICAgICAgQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk09eQo+IC0gICAgICAgIEJSMl9QQUNLQUdF
X01FU0EzRF9PUEVOQ0w9eQo+ICAgICAgICAgIEJSMl9QQUNLQUdFX01FU0EzRF9SVVNUSUNMPXkK
PiAgICAgICAgICBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfTExWTVBJUEU9eQo+
ICAgICAgICAgIEJSMl9QQUNLQUdFX0NMSU5GTz15CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
