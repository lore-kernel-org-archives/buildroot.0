Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82805C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 09:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 004DD428AA;
	Thu,  6 Jan 2022 09:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_8295LWYSKE; Thu,  6 Jan 2022 09:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A415428A4;
	Thu,  6 Jan 2022 09:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0532D1BF868
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00E4960B93
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qA43hU06ikHA for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 09:40:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A56360AFB
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 09:40:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e5so3620731wrc.5
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 01:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wUbylfm2NfQViU6pF5iF+9GmIH25o3OfT+byMDGQSVk=;
 b=FRU7MSXPj7Noke6WWK8+oYQhKY4hONQMk6T/Qt4GZkXAgh+xzN6OnIOOmQBG0YXgO0
 X1Gd7FvJtHkMqCNUoGxEzkSSgzJsWNP0D7vGGeT3h9bDUqsaoQzRHP6Dc7Phy1+bIC+5
 nWkLVN3EmVqE8QOsnS3wu2+qRft0Xi5GLb89DXm0hXMwaEKPftxP+affAjMUgNCSrFbX
 RVyId7bLAvtIgjcr83v3dv1vr6Ot3xz7YVUl+EJQne9ZXh6ZhKR7BmX1YEBN+q+QRHxx
 oHPgEuj2Gt20uDwTs08dXeLenaAgxdk7CuH1APl72z8gCmtszRviyuZUNV0GwiouXqIw
 0o9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wUbylfm2NfQViU6pF5iF+9GmIH25o3OfT+byMDGQSVk=;
 b=ABXuh/+7VChjHT56H/+9d28RShh38XYXb8LniW/BPiXGVvKi3ZOPZWUE/4hsFGHXT0
 /YV2tHWph27PUJ1xCcvB/mASTA0RO3psrQUngjYVf6H/j5xQoKEjiiGgSr4yGzo/DwDf
 9mHt2s8i051erxod7EEO/dREDZULdp1OsxxgUscvMdo81XLdsCT66ZopXG9yZ2pDObAF
 lr/52c9sCCuwYB6Q3Fh19nSrOkGTj2iXv0fkU48ukRVwoSjG0HK81Xau9iTjV7gUhxMV
 dNduzz0PIZ5NiyUT6U3Z+VpoEEk1QenPFoT2+zwXGS3SemYEX4Kh00wSiBwkWbx1YGCx
 Ae5w==
X-Gm-Message-State: AOAM531THvT3v1bcvQ/7ohTgECcxQ0uOtc/vdt4JO9l4UmROodcGWNn+
 k1v6bkYFMO5hJ/cE/hbjiGEY8Q==
X-Google-Smtp-Source: ABdhPJysAhxFRDcsAxsyGAVCdx/MBBxPGuppTokEeAcUNB+YJV3P0GAy1MPKbjoRwh9envXBn6Hpew==
X-Received: by 2002:a5d:564f:: with SMTP id j15mr48545876wrw.366.1641461998301; 
 Thu, 06 Jan 2022 01:39:58 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id w6sm795773wro.114.2022.01.06.01.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 01:39:58 -0800 (PST)
Message-ID: <cfeacd99-c264-d440-5145-009440450287@mind.be>
Date: Thu, 6 Jan 2022 10:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Danomi Manchego <danomimanchego123@gmail.com>,
 buildroot <buildroot@buildroot.org>
References: <CANxTyt77U8pvGxbjHi5MRL5Y3OgafCs_rWNSb=aAY=2BJ0X7ZA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CANxTyt77U8pvGxbjHi5MRL5Y3OgafCs_rWNSb=aAY=2BJ0X7ZA@mail.gmail.com>
Subject: Re: [Buildroot] call with hooks
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNS8wMS8yMDIyIDE3OjIwLCBEYW5vbWkgTWFuY2hlZ28gd3JvdGU6Cj4gICBIZWxsbyBh
bGwsCj4gCj4gSSBub3RpY2VkIGEgcG9zc2libGUgaW5jb25zaXN0ZW5jeSwgYW5kIHRob3VnaHQg
SSBzaG91bGQgcG9zdCBpdC4KPiBMb29raW5nIGF0IHBsYWNlcyB3aGVyZSBidWlsZHJvb3QgdXNl
cyBob29rczoKPiAKPiAkIGdyZXAgLXIgJyQoaG9vaykpJChzZXApJyAuCgpbc25pcF0KPiAKPiBO
b3RpY2UgdGhhdCB0aGUgb25lIGhpdCBpbiBNYWtlZmlsZSB1c2VzICIkKCQoaG9vaykpJChzZXAp
IiB3aGlsZSB0aGUKPiBoaXRzIGluIHBrZy1nZW5lcmljLm1rIHVzZSAiJChjYWxsICQoaG9vaykp
JChzZXApIi4gIE15IE1ha2UtZnUgaXNuJ3QKPiBwb3dlcmZ1bCBlbm91Z2ggdG8gdW5kZXJzdGFu
ZCBpZiB0aGVyZSBpcyBhbiBhY3R1YWwgcHJvYmxlbSAtIHNob3VsZAo+IHRoZXJlIGJlIGEgImNh
bGwiIGluIHRoZSBNYWtlZmlsZSBsaW5lPyAgVGhlIGdlbmVyYWwgc3ludGF4IGZvciBjYWxsCj4g
aXMgIiQoY2FsbCB2YXJpYWJsZSxwYXJhbSxwYXJhbSzigKYpIiBzbyBJIGRvbid0IGZvbGxvdyB3
aGF0IHRoZSBleHRyYQo+IGNhbGwgaW4gJChjYWxsICQoaG9vaykgaXMgZG9pbmcgZm9yIHVzLgoK
ICBIaXN0b3JpY2FsIGFjY2lkZW50LgoKICBUaGUgcGVyc29uIHdobyBmaXJzdCBpbnRyb2R1Y2Vk
IHRoZSBob29rcyBiYWNrIGluIHRoZSBkYXlzIGRpZG4ndCByZWFsaXplIHRoYXQgCiQoY2FsbCAu
Li4pIGlzIG5vdCBmb3IgInNvbWV0aGluZyB0aGF0IGxvb2tzIGxpa2UgYSBmdW5jdGlvbiIsIGJ1
dCByYXRoZXIgaXQgaXMgCmZvciAid2hlbmV2ZXIgeW91IHdhbnQgdG8gcGFzcyBhcmd1bWVudHMi
LiBSZXZpZXdlcnMgYWxzbyBkaWRuJ3QgcmVhbGl6ZSB0aGlzIAphbmQganVzdCBhcHBsaWVkLCBh
bmQgd2hlbiBtb3JlIGhvb2tzIHdlcmUgYWRkZWQgbGF0ZXIgdGhleSBjb3BpZWQgdGhlIHBhdHRl
cm4uCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IFRoYW5rcywKPiBEYW5vbWkgLQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
