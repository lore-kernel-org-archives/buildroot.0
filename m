Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D18AC79FBB
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 14:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 155B560799;
	Wed,  9 Sep 2026 14:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ea9yBr6I7JtT; Wed,  9 Sep 2026 14:12:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 271F860756
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788963179;
	b=kkdj8LaHZfsBjGUJAJ0gzXayLcdGaBXVO3d+G1CPBN0jJwFIY3jW2qRcvI52uq5AWMNN
	 Zy3gBAqwd/FIFyvg1LCZY009W6ai/H0ZT4yl9LnUMlW5bqGybaVslUcTTvmgkvR+uR9QU
	 dhlzsXt9/Cu49hC+QlpsrUOeeZ2IJwdzMM7ynquw5X+vSrDyJ/o9QGYLhrx8f3pmTstzW
	 VYoM9S7p73gJDTo75oEneA92R4eBzEKCbybfwwnKoN5NjfF0W2oZl4uw8mXLwujJuoId1
	 3/CTmEyRXxOVz7Eu7m7OxlsJrUL9bisgDi1nevlJgflpT9QWUxrl85JBhEg3tg1gW0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788963179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8LHCDG+xDjh3CItjA74mZamxIe/1pFU2eJB1oCdeZ0M=;
	b=lVt4t0SLI78XqVnROQZHboRcouq+YKAXF0AKhRvLkIh6MGzqoPpB3gA5uf4WxwgdMtXM
	 +OZAu6Lgwr01vvfE0beXyOmd3fa8efMLBY5HGQgU330lLjOs6yuu1daY6aL5aau435jI3
	 3aVKlQ9NJDSRJrwm99f/jTDAynwUc60yfBWYS0Q/xrag2h6K63qXR67Lo8AQstZlwhNt6
	 s1KUXbJu0xFSiuBjNLXWmStxCP250zIr1qUyQX8GgFnJnyO6jvrUUCrIGbzouktb1iH9b
	 +XE+qMYUZ7wIGHtiK6Y2bzOB/UpbpczGNM8h9u8wjtJjJwpWUmKWhM2H5JQ4BSulnww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788963179;
	bh=8LHCDG+xDjh3CItjA74mZamxIe/1pFU2eJB1oCdeZ0M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GJymby0HJRF2EM7WRJCyjlChRyRm0kNXtkZv9kcqEu10J1u2HY/oWQo8RW6xB1Jv4
	 uDm+SyEhBtjd3RY3YhZA+2G5Z0Y6rnMeaeVmHiLATripO/wVuURn7H9AN+y4zaAcMK
	 boaMAhyMCkda62lAaS7e0vqcgrbToShvUsSMpXKPucDd9ZdCtDxwhEDf2pYK6SbTYM
	 4kmbnQyD60Li6setaBBcPB5k3kevw8nik1hdk1EfvvLqvnclpa5ZnyR3j7BpORoBDY
	 lmfp/2W4Na0dPQtE8vOKEis2EOJ25vi+2Geog3DE+iQ0JNknsfn4yiSN1/sTiWf40L
	 zpwzRfJx11nLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271F860756;
	Wed,  9 Sep 2026 14:12:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DAA0755
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F67240737
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdNhxLAMbSjO for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 14:12:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 267C14071B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788963176;
 b=HLx9bbYdf+vu65451cHsrAjP4Glgr36NY7UrZGYyFf3zGJx4EFcTh8SVjxxPNvut4QC9
 vXPMkGWr105/vkSq5BP9SMcQP/0Ydgi7yvpRFutvw3R/TtJIoUfIxtdGBA3yzFXe2j7ch
 d+5kFJmG7bis8He9DCL76kQ4u/v7rDz+s5ejHw9vQ5zT994nS6lo9lOb7L+bYytj4fXe4
 Del8RhQrYV1X4J1juTw9tfqOmh6MRyxJeYzZE8+eUyS2JajzlDgaMHNCLdGcBMB5FoxJt
 DRxJxZqtzvZ+MHOUvdICLIrOcrx2lzpSf/8CYXr+6C1hmuWPbyVupNCm3mcqS4PC5Hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788963176;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=/siw1EfK+aIPda8Nvuaa//VgBZFP40zoO24tgo78B00=;
 b=ZM0/O9Plg8O/BGiHvF+72oNCJupfZqujtWndg6cwVYvarkzB7yU341k3esho3XdqCeZw
 mNkDuG317xUvDmG8jSslxin6D4Pap3BD76afH1dGPyVDJK55pSJJxDU+iwAlYiiw5zvfm
 WwnjNCpw94h8QR4cJWateuHrSBOITYe7VZIchYXgpStaKmBVYQBXQ5dPhbEkC21JKgEl7
 ELepMf5v1+XWDgrllcyPap6eM6WXbBMMEliRhLYwP9gpz8aRzWujrVJLGsn/aDyKef9s3
 F5BUzmHAQhHWKPDy7f2SfVyweRxjdOpbYMinF8pXHcP/y0LCXaiO9U3K/fCw3DwmbNw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=3wA7RKEx; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 267C14071B
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:12:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so35914035e9.2
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 07:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788963173; x=1789567973;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/siw1EfK+aIPda8Nvuaa//VgBZFP40zoO24tgo78B00=;
 b=DmYoKvf7NQuLqmizfQKKuDw+Pc4zF8fg7GLOQqFnJ+FsBOQ5U/4ggStzhwOAzfKAdF
 K/N4uP7U9NHnzkMgXX825qeqT83FyNhHmmFD0+mDUL9mQMyFrfXN6wfpEks/baTBP5oE
 DWDa7mIT9d1CY01WwR9QmMOro+8JfdfCmteYi//RbuEfYM293iyxbiW4Ck1DIC9lbpxU
 APZafDw43Ins0g95oFdWBG5t949JaOeTBhF0QcAWHlFUTfP5vtOueRFLfTqSoZgTZ8JW
 /x4A2woBOhV+PYwisUmYm+p5TydVRYd2XH+OlPptIcNo/KnV8t2iF71q8n05C4Slly3Y
 290g==
X-Forwarded-Encrypted: i=1;
 AKwUvByYolHiJd5zxehuejvkVsRqvjX3QyIp/5HdLiwnCrdxSFXwblze9b0c/Lf3+F23B6CJf8ToShqzsCc=@buildroot.org
X-Gm-Message-State: AFuF++ka9KOMI93uk1KqMJLBGLrG68KX1Y6yiBXGjVfM2ucXotpLhphn
 1G1LbP5y1s3qWXHerAim3BtSVfzO0ewMCiK9Y0gAtT0wYW+8hGMBOICDVUpCFgP0hAOK1vt0LT/
 rnoOpoPU=
X-Gm-Gg: AYBFou0UWb/zLAGSM7hZCzzuCKJ98gcL+T0qvXZNRu6Kur+x8lb/IPnUhmmzRYLX8rZ
 oYOyw7TmvqPfgGnZPLj2NLdgMVX74iP0A2O1DXz1p81NhEZkEXW68GqjXwuW1a/17EjYJvPxeZl
 SIp9aHnScRArlYi5oBFcTU/7oZUW3RTc4dgeA7KONMtsgcUceCoiSloA7BYGmGuDEN6U9hElC7d
 Bs0BR4QxEj5gbGZSiPooAwPJQVBjl/c1O9DfxmxyK12aHdUHBC31xfvW73qWn8yxfk0EibrrbsF
 OBGyXtebeK5UbqyQ1pbMTyLPNok6BvF/L+J2Ozug2GLVpJwWpXPWivJkL7nREOZcdt9D1YHi8CG
 LW3PuGWfekDwtFb1sYU+d1P61xZj/ICqNBGENl2HqqnXUm4BIWpCYzi48thXYR2O/u2ZgZCKDFH
 crcYYBkz99M+cdVvP6qshgTytZD1CItdnRbLZAzF0r/u5nhQujmk0qNBlPRhyJ4B7mDtOsyJ698
 LaEjX/5dSRhUwsAXgbgj3TeVIrtLHjMMAlWl9oE6TVb3Aty+MuNBxFMwFrZ2+tSVnM0qSFnoQ==
X-Received: by 2002:a05:600c:4ec9:b0:49c:fc6e:a3d2 with SMTP id
 5b1f17b1804b1-49cfff39708mr307142565e9.17.1788963173348; 
 Wed, 09 Sep 2026 07:12:53 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7736132sm467094035e9.12.2026.09.09.07.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:12:52 -0700 (PDT)
Message-ID: <ff5ec373-fd9e-43bd-9015-e0c072e025e5@smile.fr>
Date: Wed, 9 Sep 2026 16:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
References: <20260906233048.692559-1-bernd@kuhls.net>
 <20260906233048.692559-4-bernd@kuhls.net>
Content-Language: fr
In-Reply-To: <20260906233048.692559-4-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 4/6] package/mesa3d: i915 Gallium driver
 needs llvm
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

QmVybmQsIEFsbCwKCkxlIDA3LzA5LzIwMjYgw6AgMDE6MzAsIEJlcm5kIEt1aGxzIGEgw6ljcml0
wqA6Cj4gQnVpbGRyb290IGNvbW1pdCAzZTI5NmExNTExOTVmOWQzMmRiZmQ2MmQ2Yzc1ZDA4Yjgy
MmJlNmRkIGJ1bXBlZCB0aGUKPiBwYWNrYWdlIHRvIDI1LjMuMCB3aGljaCBpbmNsdWRlcyB1cHN0
cmVhbSBjb21taXQKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0v
Y29tbWl0L2I4YjM4ZDM4YjFjMTRiNjBkZTAzMjRhYzJmOThmZjdmMWY0Y2MzYzUKPiB0aGF0IGVu
Zm9yY2VzIGxsdm0gZm9yIHRoZSBpOTE1IGdhbGxpdW0gZHJpdmVyIGNhdXNpbmcgY29uZmlndXJl
IGVycm9ycwo+IGluIGJ1aWxkcm9vdDoKPiAKPiAuLi9vdXRwdXQtMS9idWlsZC9tZXNhM2QtMjYu
MS42L21lc29uLmJ1aWxkOjI0MTozOiBFUlJPUjogRmVhdHVyZSBsbHZtCj4gY2Fubm90IGJlIGRp
c2FibGVkOiBpOTE1IEdhbGxpdW0gZHJpdmVyIHJlcXVpcmVzIExMVk0gZm9yIHZlcnRleCBzaGFk
ZXJzCj4gCj4gUGxlYXNlIG5vdGUgdGhhdAo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9tZXNhL21lc2EvLS9jb21taXQvNDIzNWMzOWE5YTgzNzhmMWUyZGMwODk5ZGQ0YzNjOTQxZjI3
Yjg4Nwo+IGxhdGVyIHJlbW92ZWQgdGhlIGxsdm0gZGVwZW5kZW5jeSBmb3IgdGhlIHIzMDAgZHJp
dmVyIGludHJvZHVjZWQgYnkgdGhlCj4gY29tbWl0IG1lbnRpb25lZCBhYm92ZSBzbyB3ZSBvbmx5
IG5lZWQgdG8gYWRkIHRoZSBkZXBlbmRlbmN5IHRvIHRoZSBpOTE1Cj4gZHJpdmVyLgo+IFRoZSBj
b25maWd1cmUgb3B0aW9uIGRyYXctdXNlLWxsdm0gaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCB3aGVu
IGxsdm0gaXMKPiBub3QgYXZhaWxhYmxlOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9tZXNhL21lc2EvLS9jb21taXQvMzdjN2QxOWU0NmE0ODYzYzEyMDE4NmE5OWFjMDM0NGMyZGQz
MTI2MAo+IAo+IEZpeGVzOgo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0
cy9hY2Q5MDM5OTAxY2Y0MTY4ZTYzMThjNjIyNTJkZGFlNmVhMGVjOTNkLwoKUmV2aWV3ZWQtYnk6
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRzLApSb21h
aW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAt
LS0KPiAgcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvQ29uZmln
LmluIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4gaW5kZXggZTE4ZDI1ZWI4ZS4uZjQ1YTY3
NTQ0NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPiArKysgYi9wYWNr
YWdlL21lc2EzZC9Db25maWcuaW4KPiBAQCAtMTQ3LDExICsxNDcsMTUgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9GUkVFRFJFTk8KPiAgY29uZmlnIEJSMl9QQUNL
QUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9JOTE1Cj4gIAlib29sICJHYWxsaXVtIGk5MTUgZHJp
dmVyIgo+ICAJZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0Cj4gKwlkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0dB
TExJVU1fRFJJVkVSCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRFJNX0lOVEVMCj4gIAloZWxw
Cj4gIAkgIFN1cHBvcnQgZm9yIGk5MTUtYmFzZWQgSW50ZWwgR1BVcy4KPiAgCj4gK2NvbW1lbnQg
Imk5MTUgZHJpdmVyIG5lZWRzIGxsdm0iCj4gKwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9NRVNB
M0RfTExWTQo+ICsKPiAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9J
UklTCj4gIAlib29sICJHYWxsaXVtIGlyaXMgZHJpdmVyIgo+ICAJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9MTFZNX0FSQ0hfU1VQUE9SVFMgIyBob3N0LWxsdm0KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
