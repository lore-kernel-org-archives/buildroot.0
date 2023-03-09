Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F70C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC6D60BCF;
	Thu,  9 Mar 2023 20:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEC6D60BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuWF-PnhQajZ; Thu,  9 Mar 2023 20:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2394C60A4F;
	Thu,  9 Mar 2023 20:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2394C60A4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8F761BF410
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F02D60A4F
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F02D60A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ab-vJWOTe7xT for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:02:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A53C6608D8
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A53C6608D8
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:02:52 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s11so11670444edy.8
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 12:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392170;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJu1IG9cAfr73Q3V7yopNTphWtk/uEO3pnps2kSrHq0=;
 b=KaX2tDYiXyV4RVmb73oyAoog4ifhQJRDfmCZJiH4qD8GrI4+3qbwfJT67hQ7JzTgX4
 H9iYIprN2pdKB1XX2qPb8mX1hdrOEPi+tixVtq+3TXCKjGaXDNMIg7t1pDfFvA1jEFI4
 T4yLiKQRiMbKP8sfAy955EdDsV2cuTwplkuYq8TvP4onL55Q+PO5GTXSp9V/2GnbDVjH
 EoaqPJiMJIY04jYTfMqh6C1UxhelbGVL5DiAUAXoQWVlG0WQ6A8F8tRfy85Zc11rgfnP
 IbDGlxEClG6kCOe+03aSLX+3aOTzg500nOjb8t7sF5fFYALPE6+P81GMQWyprx3oBD41
 Yi9A==
X-Gm-Message-State: AO0yUKUOWGsDm5DOv6GovQKaV1yZUAeuXZn4fjAzHtB4s+rUqwpZNUgp
 nQE4RvTINSf80W+pcNfF+ttW6Q==
X-Google-Smtp-Source: AK7set/0AseM7Y55anlE6YXFkG4g2ID/RAKYtcMguB+FHILsgnFHGyMrOnaFrs3rXNuO43YpAOwHwg==
X-Received: by 2002:a17:907:1b24:b0:8b1:7a86:b06f with SMTP id
 mp36-20020a1709071b2400b008b17a86b06fmr28424456ejc.63.1678392170697; 
 Thu, 09 Mar 2023 12:02:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a1709064ad500b008c979c74732sm9201481ejt.156.2023.03.09.12.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:02:50 -0800 (PST)
Message-ID: <eab56b4d-bb97-ff16-2daf-8e0f22f8bac8@mind.be>
Date: Thu, 9 Mar 2023 21:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20230306155308.477063-1-heiko.thiery@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230306155308.477063-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678392170;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OJu1IG9cAfr73Q3V7yopNTphWtk/uEO3pnps2kSrHq0=;
 b=OwsotsQRGC6ncR5ai9ZWp5uttJ5flt+ammGGARJ4bmGiVaSLe7njGAbPiGeOkHZMt4
 l0+FPkU8reLxCXfIyH4JZijgH+ijqvavhZp0XyqAM6nY9uCeQ9F0Y3ZtACK49CdLeeiM
 eZQt43Haft6kbjsW6sgEcp00QP6XCtyTyOjXLCeR3uGsD/X/GIL0HS7R54K3Avi3csDE
 l7dI+e6i39Q0/gnf7kf4TNDrHVq67R2tDmMPq3ujrIexgO2+VWkW/+A9LbaAlgsD2VwD
 xZaOxQa2J7pEzvUHUF9/7sF0J8OVc20xJ4q9RaK0Fc8H8rJwIEWKGE+cMMxS/HnDU2cS
 9SIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OwsotsQR
Subject: Re: [Buildroot] [PATCH 3/3] DEVELOPERS: add Heiko Thiery for
 package/rauc
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Andrey Yurovsky <yurovsky@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wMy8yMDIzIDE2OjUzLCBIZWlrbyBUaGllcnkgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgoKICBBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIERFVkVMT1BFUlMg
fCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDYyNTY1NzZlMDIuLjk2NzAzMDJhNzgg
MTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTI1Myw2
ICsxMjUzLDcgQEAgRjoJcGFja2FnZS9saWJuZXRjb25mMi8KPiAgIEY6CXBhY2thZ2UvbGlieWFu
Zy8KPiAgIEY6CXBhY2thZ2UvbGludXhwdHAvCj4gICBGOglwYWNrYWdlL25ldG9wZWVyMi8KPiAr
RjoJcGFja2FnZS9yYXVjLwo+ICAgRjoJcGFja2FnZS9zeXNyZXBvLwo+ICAgCj4gICBOOglIZXJ2
w6kgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
