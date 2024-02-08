Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A401BC48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 22:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648A8841C7;
	Thu,  8 Feb 2024 22:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8knWhxoFp4d; Thu,  8 Feb 2024 22:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84974841E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84974841E1;
	Thu,  8 Feb 2024 22:40:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 244621BF3CE
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 22:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10E9C42D58
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 22:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRhAn0lrrbIZ for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 22:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DFC642D4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DFC642D4F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DFC642D4F
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 22:39:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4105a6be071so2022695e9.1
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 14:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707431995; x=1708036795;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E/hPK1uqVn0exPHb9WXy42x6LUZ4h4P541wUMhYezzY=;
 b=b51DtNo4oGxIt7uu9O30ID24hhxerGV6ekeJsPqMoJf0m/66M/dnNyfxJBDWc0BYJx
 4a5n4Q0A0JXC9naptyx+DOkLHbMkAdYH95fnjIe8+Je65qM6SxBLsd/TEN1zFmcp+vsD
 h7jqpUfJZ24xZcaHIO7hpV3Qbpqrm//5R053rVKRLH59NDfAshFuOn8iYegnDomNciek
 /4LCNnAZpdGrZoPBm9ZY1I6mOdIagLN7fmYW+D6+XuAQxYW/lwDGzWrqJ1JMUhk8lClK
 Mgi1JgaOHyTOcGo9b82yj0wXpSqZUA56qcQGVk5HlW06bMybP41ABFigp874+T0vgx+p
 px/g==
X-Gm-Message-State: AOJu0YxY/5v/igiglkVksWdHYvkSaYQEScDh4qRVRTcoAv9ckHCnAhGs
 X3aaeC/5sVSmWCmThroMw/aElgtt/2aKIWPqiwu+lrrsDN+glUPJhYnTp9duWqq4jJuc/wEMthW
 Y
X-Google-Smtp-Source: AGHT+IF3yNVI+tZ8mgoThLKqHcQUVb2NxRGRoNdABh51IGmvLbfjURMzvldfbhisGJGxxZsDIMS2Lg==
X-Received: by 2002:a05:600c:3507:b0:410:62ae:44c4 with SMTP id
 h7-20020a05600c350700b0041062ae44c4mr278861wmq.15.1707431995618; 
 Thu, 08 Feb 2024 14:39:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWrjMASlZ6CFAmZ/lS5SwvsK4A4BF/Od6/maNhPbC7/b/np3XSe3EhTNajrAcjQsvtWA9Zcax/jJGeBDOvRmfh5CduJZqC+4vZ3YAqaPpmULAsx0tfJyagO3maycEQjS7RXqeazz0ntXpMGpaYRxzxAheke0RfW7DMM4rwlFdRqF5NXI2pPE9l06x0abkfClscSg/ZA1aCkAvbG4sl4A6Kkpv3XFdQpJBiowRYk86zkDFDr
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d5268000000b0033b278cf5fesm311779wrc.102.2024.02.08.14.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 14:39:55 -0800 (PST)
Message-ID: <41227294-6a3d-42d7-a3cd-fefa713a3546@mind.be>
Date: Thu, 8 Feb 2024 23:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240115-imx93-support-v5-0-c2c950104c58@armadeus.com>
 <20240115-imx93-support-v5-1-c2c950104c58@armadeus.com>
 <d1b5f5a0-8c85-425c-95f6-6504a6e9ceac@mind.be>
In-Reply-To: <d1b5f5a0-8c85-425c-95f6-6504a6e9ceac@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707431995; x=1708036795; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E/hPK1uqVn0exPHb9WXy42x6LUZ4h4P541wUMhYezzY=;
 b=gRpotKDgyUBGhPBrxuLMNlWwiH+Q9CMJ4SxBoPzUEDLDZG/U4fA5NUIRGjb77TBKRd
 sQEmibEkaNzmU5yLQZ6+w94iI6Wh+74QHxq4/iCq4STVg4x+vlkLb88le8/lo8F/lO5V
 eqHWBssyeYFYaUEwhO8mbxGsqd8P37R9knNdbRUa5YHSfwa3s0dcqwbR6wLdL//wBpxW
 LDzY2SqDxnQ6FqpGmS2V+kARyql7DCBWb0M5FZB9HLa8VCgyrxeGUgRaJ0d65s6UCYfd
 nxmKf17Vzu0uaSrI1Zr4ObqG1DPvcjG6w8yjifSJ4Wi/91UPqWLwbxUtH/0U/F+G0lGr
 sHQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gRpotKDg
Subject: Re: [Buildroot] [PATCH v5 1/3] package/freescale-imx: add i.MX91
 and i.MX93 SoC support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA4LzAyLzIwMjQgMjM6MzYsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgVG8g
bWFrZSB0aGUgY29uZGl0aW9ucyBtb3JlIHN5bW1ldHJpY2FsL3JlZ3VsYXIsIHBlcmhhcHMgaXQn
cyBiZXR0ZXIgdG8gCj4gY3JlYXRlIGEgbmV3IEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0lNWF9MUERE
UjRfSU1YOVggb3B0aW9uIGFuZCBlbmNvZGUgdGhlIAo+IHBsYXRmb3JtIGNvbmRpdGlvbnMgdGhl
cmUuIFRoZSBwcm9tcHQgd291bGQgYmUgdGhlIHNhbWUgZm9yIAo+IEJSMl9QQUNLQUdFX0ZJUk1X
QVJFX0lNWF9MUEREUjQgYW5kIGZvciBCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVhfTFBERFI0X0lN
WDlYIAo+ICgibHBkZHI0IiBmb3IgYm90aCkuwqAgQnV0IHBlcmhhcHMgSSdtIG92ZXJ0aGlua2lu
ZyB0aGluZ3MuIAoKIMKgVGhhdCB3b3VsZCBiZSBCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVhfTFBE
RFI0X0lNWDksIG5vdCBJTVg5WC4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
