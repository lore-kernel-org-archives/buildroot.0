Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70441C624D4
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 21:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B235608C6;
	Wed,  2 Sep 2026 21:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLNNc8mo54Cm; Wed,  2 Sep 2026 21:24:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4B8E5607F5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788384293;
	b=M25LxC8VR1c2xTVWsaKXOTIJTHA+GIyZ/mhxfzILXpIHywaTsTnsas8/EQAm8PWxAIpM
	 IyR+6t9QZd6qbc09QtdliIhFTFqhkJhdPNgoMjws/ZmUE94gFo4B94oCXas573nNtixuR
	 vubHb6rNdzm05l3pOaxawDEFCy718YZCjPa/e1ITNZT60k4ZckAz7S2XZsdpl10Km3EmF
	 hFYIGGY6L+3ThwuZtcpWqKcx/qrrTkejiuM4ykvnnZX/cEruGhDPeUkMUwHrzlxRcqKZ6
	 gy+EgII3P9ujPkAahmfKDhqruf3edAZwaDMYIrnP+6UgFcK11+VOndM5we8/p7gVgFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788384293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H/LWVEvwaluxoTjAU+BGNhnOJ0vJeuQo0KZyqKvZVwE=;
	b=MpJal/2dutFwN2cYv2XZBHlbiRA9zGhk5/IJ+uqWlTjU1BGwnNICIMr/Qs+FQTPVZ523
	 xTw1y7tDqEJoO63si/ANWufdj/8JCZZwwAZ1PDtXAgzcLMOEwV8y/FyNR8Rod4u7JD7Oo
	 FnpalZNsmgHF6NK11t7uLZrzavJcUOCVZrKLGuq/HNV1W8NYL3PSK2JCaAONwcaVzjg14
	 gsdFINLHc2av4bXv4y67URGKzxUoK8hykO0mOQAnbBz6AxmrGEVS203IPi01HIR8yBN8t
	 NS6JO8F2QXNYF+vxcPzdlOIJoBOxmyhahgm/QH7wATHv7pvxClARYasRofWctvLUcHg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788384293;
	bh=H/LWVEvwaluxoTjAU+BGNhnOJ0vJeuQo0KZyqKvZVwE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mZwiWMm1eVvtJTRS/AQglxS/7lDbpDd/Jr/BsyLm6h1owUTiY1UrIg98N0dqSNxG4
	 HsYmxAm76tjWMS1kT9ADRGyZJnof/+GPwN6NLRkaQ+16kIEp+T/DWL8rG2K2MlZl11
	 ag7hciNfP3DENvxKYo8tBD+jnnmxuurzuf65oZTR2JvNjabQmYeykoLgH8aqC3GmXX
	 eFY3je+nCJngaE4Ojzw7n1ok1x/ma+H7V6HaQYQMiBwlJ8esLsCBMGQnT7nKY9VuJ6
	 LJbPMkVv9twKdLa1iCpyUuz7TkHB3JqEbNUWuLlwOyjGhz8mKVjmAo+lVMLELVsnjT
	 yIvuic+GYpkyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B8E5607F5;
	Wed,  2 Sep 2026 21:24:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D90C22F
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 21:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2C7E607F5
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 21:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2DxYm1gcpKC for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 21:24:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EA89560679
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788384291;
 b=HKbN9pNxAN50zPzzziGbYiMAFl9+YjJBoKkB0QJpE9tRgrgthivKMeAL/HkZr/jqMX3l
 McMtJKA/pIy6w2C717tw9qvX7vzcWQq835ERN5TiQFV3u4RBYONwrV2B2u2NQaLWTS8s+
 64gH0Ro4v5epnUssVc4J+eSoNHmW9erFZOaIoR0nWtN4nwyAYThYxNxs72mjwxrdFFeL7
 SH+9x5gDlAVjalmt842W0pt9RS+xxxwrKBuq6O6GLannY/3YcChbbXV2pwwBQBmgsOlPd
 CdQt2L/CuawwHthDbHznST1WGhjgZ4JuSAQRmKEXoxCY+11Q4AFJyV1KAT1YnFon6uQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788384291;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=gzSlcomJhwhUB1RSyv6Wg/xJxUk78ZIAu0SsYYlo4KY=;
 b=IQRXXMRUnMzVCOoq1YQUozmHjGxqrBI3n5bydC2sx7I7XFlzIpzc7tI6ZV9DTZdIBWcs
 kn/OEEIk7w4wTwZilbSQ+6BlUGbQl3ukWkzN29B0s7z6gLLK1bKjzzi8Sevue+eY313ul
 B+SccU9/TWLzvybfPgLKeKpAQos/YSZtyYrZLdkOZEY1CXztfV/QfMvLgDf1eCwb5+wkw
 tBe/F2GB55vBctiaP6rVQixEKMudentkGgdWl4Hzj+Ix3+H9iq6KzNv6K+Gsvg33AJiiH
 9qwNrYNwR9OZmnnHp1x0UKoyNVC4T7tOQKwb0Vtia0MTK3v19TwzXxNcsPtZmyr9k0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Qhbq4hlD; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA89560679
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 21:24:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4843e397f74so472492f8f.1
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 14:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788384288; x=1788989088;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gzSlcomJhwhUB1RSyv6Wg/xJxUk78ZIAu0SsYYlo4KY=;
 b=kwpiq+92YZi9pt9eHLFeXZOmR7+nxzlA6CbJzXE/GDQSw4b+k/5sXZELWCrzx14flD
 67sMeBpsHIDMt2TEkb//IL+OmvEgHEfryM+LIhKKK7r0GozIZQVmztiUEC07RmpQg/uU
 VsfRTXLBRc1SAJw8neHxB2dosYSyU9Sb7q8J6jZiLXjGbiwET2shIo9zYjje5FntBx3I
 cDLRvlvhhUOFggL1HppOwNgNsCAIev8Bitll0U0sbnVFGi7sJuC4V/M4xJM66MczoAlz
 LLYyQT8lMYpxzeXH8/JJHjZaKBfGD9r2WZc1lU6Xogb8YIeeGRX+eYBIQxxWaBXyMmlu
 gJBQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxdNMafRYT5ySrF+3FdH5SFmFAWodaweI7gkx3Nn3tcKUIQfhbWL59aeE5I3OcCRphoPKyc5G5SyJE=@buildroot.org
X-Gm-Message-State: AFuF++knLNY/GJXWEsa029w0IzTS0Qovgjw4SWTuCEkzp+KEwk+asrfc
 QY8EeZqwwYS7FK2ziZrDg6Piu+lAhvbCL8c/OtmwzYwXvttl6MVsifU7q1LGRQa3ximRfeQcnvm
 DosacwkE=
X-Gm-Gg: AYBFou2nwarS0veqHebRKdwyKwcm0mQcEdmm10jW/vhW45M8Ryx3wAENYvRv4R1CPSg
 4CaqVW2UVkGXqsiB0R+fWP0efhawK+UHzzGpox77npEGdpN0yPB759KvC36ywWtTZ+M+FjEgSHI
 Mz5D84E/wMqG0vwLlM/CF6klJwWf/iHw71h1F+ycwfzg0ZuhRZCV8noJamhwueWP+sqiTxBWMXS
 vG5x1seUX25V0bMxeWvMAQKjJ49RNwblvC3w1nR0B4qQsdyuoly4vJ4hiY0tu9V1/d0urL7FNAs
 6x7iIsR0Ym5Fnj1NqyBV7dbut8J9ZdWFAn0udE9HWNm+tWXfstWixnlonAGXSIS0lLg0crDHEpD
 r3Q/9CnaFN4gx2dfg9+0wXNz/cPRm9WK6FPmrWYuon9f9UgBdsIQNbw2R34Y4EfZEYmcTJBp3Mr
 ws4xLu8IlgHls/vdQg+BrBxSoEZEfGz4Sym7q4qcMVYaROF1Lf0dgcqi+0QL+pFHdHWne9KpcFw
 qHMDfok1a/sJ0rzEmlKEbxRq/czBajkwU9MI8cs0Z9pY1NHh3ilgcyB4l8peBr6LTo8dSH1z5y6
 UyaUyD+7kOoMZcKtnzyjvIfdayI=
X-Received: by 2002:a05:6000:4698:b0:484:3147:49c9 with SMTP id
 ffacd0b85a97d-4857e3cafcemr2996678f8f.2.1788384288193; 
 Wed, 02 Sep 2026 14:24:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eea96csm7335962f8f.29.2026.09.02.14.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 14:24:47 -0700 (PDT)
Message-ID: <4d6becee-42df-46d3-bb2d-7d2fdc18c13c@smile.fr>
Date: Wed, 2 Sep 2026 23:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>, buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
References: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
 <20260831-wip-obbardc-package-dtui-fix-armv5-v2-1-42eceaa12f55@oss.qualcomm.com>
Content-Language: fr
In-Reply-To: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-1-42eceaa12f55@oss.qualcomm.com>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/rustc: add
 BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64
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

SGVsbG8gQ2hyaXN0b3BoZXIsIEFsbCwKCkxlIDMxLzA4LzIwMjYgw6AgMTc6NDksIENocmlzdG9w
aGVyIE9iYmFyZCB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gUnVzdCBkb2VzIG5vdCBwcm92
aWRlIDY0LWJpdCBhdG9taWNzIG9uIGV2ZXJ5IHRhcmdldCBCdWlsZHJvb3QgY2FuCj4gZ2VuZXJh
dGUuIHJ1c3RjIHNldHMgbWF4X2F0b21pY193aWR0aCA9IDMyIGZvciB0aHJlZSBvZiB0aGUgMjUg
dGFyZ2V0cwo+IGxpc3RlZCBpbiBSVVNUX1RBUkdFVFMgaW4gdXRpbHMvdXBkYXRlLXJ1c3QsIHNv
Cj4gY29yZTo6c3luYzo6YXRvbWljOjpBdG9taWNVNjQgYW5kIEF0b21pY0k2NCBzaW1wbHkgZG8g
bm90IGV4aXN0IHRoZXJlOgo+IAo+ICAgJCBydXN0YyAtLXByaW50IGNmZyAtLXRhcmdldCA8dGFy
Z2V0PiB8IGdyZXAgdGFyZ2V0X2hhc19hdG9taWMKPiAgIGFybXY1dGUtdW5rbm93bi1saW51eC1n
bnVlYWJpICAgICAiMTYiICIzMiIgIjgiICJwdHIiCj4gICBhcm12NXRlLXVua25vd24tbGludXgt
bXVzbGVhYmkgICAgIjE2IiAiMzIiICI4IiAicHRyIgo+ICAgcG93ZXJwYy11bmtub3duLWxpbnV4
LWdudSAgICAgICAgICIxNiIgIjMyIiAiOCIgInB0ciIKPiAKPiBFdmVyeSBvdGhlciBzdXBwb3J0
ZWQgdGFyZ2V0LCBpbmNsdWRpbmcgYXJtdjYsIGFybXY3LCBhYXJjaDY0LCBhbGwgdGhlCj4geDg2
IHZhcmlhbnRzLCByaXNjdjY0LCBzMzkweCwgc3BhcmM2NCBhbmQgYm90aCA2NC1iaXQgcG93ZXJw
Y3MsIGhhcwo+IHRoZW0sIGUuZy46Cj4gCj4gICBhcm0tdW5rbm93bi1saW51eC1nbnVlYWJpICAg
ICAgICAgIjE2IiAiMzIiICI2NCIgIjgiICJwdHIiCj4gICBhcm12Ny11bmtub3duLWxpbnV4LWdu
dWVhYmloZiAgICAgIjE2IiAiMzIiICI2NCIgIjgiICJwdHIiCj4gCj4gQSBjcmF0ZSB0aGF0IHVz
ZXMgNjQtYml0IGF0b21pY3Mgd2l0aG91dCBhIGNmZyh0YXJnZXRfaGFzX2F0b21pYyA9ICI2NCIp
Cj4gZ3VhcmQgdGhlcmVmb3JlIGZhaWxzIHRvIGJ1aWxkIG9uIHRob3NlIHRocmVlIHRhcmdldHMg
d2l0aDoKPiAKPiAgIGVycm9yW0UwNDMyXTogdW5yZXNvbHZlZCBpbXBvcnQgYHN0ZDo6c3luYzo6
YXRvbWljOjpBdG9taWNVNjRgCj4gICAgICB8Cj4gICAgICB8ICAgICAgICAgYXRvbWljOjp7QXRv
bWljVTY0LCBBdG9taWNVOCwgQXRvbWljVXNpemUsIE9yZGVyaW5nfSwKPiAgICAgIHwgICAgICAg
ICAgICAgICAgICBeXl5eXl5eXl4gbm8gYEF0b21pY1U2NGAgaW4gYHN5bmM6OmF0b21pY2AKPiAK
PiBUaGlzIGhhcyBiZWVuIGhpdCBhdCBsZWFzdCB0d2ljZSBhbHJlYWR5OiBieSBwYWNrYWdlL2R1
c3QsIHdvcmtlZCBhcm91bmQKPiBpbiBjb21taXQgM2FiYzNiOTdiYWQ5ICgicGFja2FnZS9kdXN0
OiBidW1wIHRvIHZlcnNpb24gMS4xLjIiKSBieSBtb3ZpbmcKPiB0byBhIHJlbGVhc2UgaW4gd2hp
Y2ggdXBzdHJlYW0gaGFkIGFkZGVkIHRoZSBndWFyZCBhbmQgYnkgcGFja2FnZS9kdHVpLAo+IHdo
aWNoIGhhcyBubyBzdWNoIHJlbGVhc2UgYXZhaWxhYmxlIGFuZCBoYWQgdG8gb3Blbi1jb2RlIHRo
ZSBhZmZlY3RlZAo+IGFyY2hpdGVjdHVyZXMgaW5zdGVhZC4KClRoZSBjb21taXQgM2FiYzNiOTdi
YWQ5ICgicGFja2FnZS9kdXN0OiBidW1wIHRvIHZlcnNpb24gMS4xLjIiKSB3YXMgYWJvdXQgdGhl
CmFybXY3IGFyY2hpdGVjdHVyZSBidXQgaXQgc2VlbXMgdG8gYmUgYSBtaXN0YWtlIHNpbmNlIHRo
ZSB0b29sY2hhaW4gdXNlZCBieQpkZWZhdWx0IGlzIGluZGVlZCBmb3IgYXJtdjUKKEJSMl9UT09M
Q0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WNV9FQUJJX0dMSUJDX1NUQUJMRSkuCgo+IAo+IEl0
IGlzIGxpa2VseSB0byBrZWVwIHJlY3VycmluZzogaW5mcmEuYmFzZXRlc3QuQkFTSUNfVE9PTENI
QUlOX0NPTkZJRwo+IGJ1aWxkcyB3aXRoIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9B
Uk1WNV9FQUJJX0dMSUJDX1NUQUJMRSwgc28KPiBldmVyeSBydW50aW1lIHRlc3QgdGhhdCBkb2Vz
IG5vdCBvdmVycmlkZSB0aGUgdG9vbGNoYWluIGNvbXBpbGVzIGZvcgo+IGFybXY1dGUsIG9uZSBv
ZiB0aGUgdGhyZWUgYWZmZWN0ZWQgdGFyZ2V0cy4gVGhhdCBpcyBleGFjdGx5IGhvdyB0aGUgdHdv
Cj4gZmFpbHVyZXMgYWJvdmUgd2VyZSBmb3VuZC4KPiAKPiBBZGQgYSBoaWRkZW4gc3ltYm9sIHNv
IHBhY2thZ2VzIGNhbiBleHByZXNzIHRoaXMgY29uc3RyYWludCBvbmNlLCByYXRoZXIKPiB0aGFu
IGVhY2ggb3Blbi1jb2RpbmcgQlIyX0FSTV9DUFVfQVJNVjUgYW5kIEJSMl9wb3dlcnBjIGFuZCBu
ZWVkaW5nIHRvCj4gdXBkYXRlIHdoZW5ldmVyIHJ1c3QgZ2FpbnMgb3IgY2hhbmdlcyBhIHRhcmdl
dC4KPiAKPiBOb3RlIHRoYXQgYXJtdjV0ZSBhbmQgMzItYml0IHBvd2VycGMgYXJlIG9ubHkgc3Vw
cG9ydGVkIGJ5IHJ1c3QgZm9yCj4gZ2xpYmMgYW5kIG11c2wsIHNvIHRoZSB1Y2xpYmMgdmFyaWFu
dHMgb2YgdGhvc2UgYXJjaGl0ZWN0dXJlcyBhcmUKPiBhbHJlYWR5IGV4Y2x1ZGVkIGJ5IEJSMl9Q
QUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMuCj4gCgpWZXJ5IGdvb2QgY29t
bWl0IGxvZyEKClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5m
cj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBP
YmJhcmQgPGNocmlzLm9iYmFyZEBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBwYWNrYWdlL3J1
c3RjL0NvbmZpZy5pbi5ob3N0IHwgMTYgKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J1c3RjL0NvbmZp
Zy5pbi5ob3N0IGIvcGFja2FnZS9ydXN0Yy9Db25maWcuaW4uaG9zdAo+IGluZGV4IDljZDkxMmZj
NzQuLjUzOTkyNjE0NGIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ydXN0Yy9Db25maWcuaW4uaG9z
dAo+ICsrKyBiL3BhY2thZ2UvcnVzdGMvQ29uZmlnLmluLmhvc3QKPiBAQCAtMTEyLDYgKzExMiwy
MiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUwo+
ICAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgIUJSMl9UT09MQ0hBSU5fVVNF
U19NVVNMCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQT1JU
Uwo+ICAKPiArIyBOb3QgYWxsIHRoZSB0YXJnZXRzIGFib3ZlIHByb3ZpZGUgNjQtYml0IGF0b21p
Y3M6IHJ1c3RjIHNldHMKPiArIyBtYXhfYXRvbWljX3dpZHRoID0gMzIgZm9yIGFybXY1dGUtdW5r
bm93bi1saW51eC17Z251LG11c2x9ZWFiaSBhbmQgZm9yCj4gKyMgcG93ZXJwYy11bmtub3duLWxp
bnV4LWdudSwgc28gY29yZTo6c3luYzo6YXRvbWljOjp7QXRvbWljVTY0LEF0b21pY0k2NH0KPiAr
IyBkbyBub3QgZXhpc3QgdGhlcmUuIFRoaXMgY2FuIGJlIGNoZWNrZWQgd2l0aDoKPiArIyAgIHJ1
c3RjIC0tcHJpbnQgY2ZnIC0tdGFyZ2V0IDx0YXJnZXQ+IHwgZ3JlcCB0YXJnZXRfaGFzX2F0b21p
Ywo+ICsjIFRhcmdldCBydXN0IHBhY2thZ2VzIHdob3NlIGNyYXRlcyB1c2UgNjQtYml0IGF0b21p
Y3MgdW5jb25kaXRpb25hbGx5LAo+ICsjIGkuZS4gd2l0aG91dCBhIGNmZyh0YXJnZXRfaGFzX2F0
b21pYyA9ICI2NCIpIGd1YXJkLCBzaG91bGQgZGVwZW5kIG9uCj4gKyMgdGhpcyBvcHRpb24uCj4g
K2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9IQVNfQVRPTUlDXzY0Cj4gKwli
b29sCj4gKwkjIEV4Y2x1ZGVzIGFybXY1dGUtdW5rbm93bi1saW51eC17Z251LG11c2x9ZWFiaSBh
bmQKPiArCSMgcG93ZXJwYy11bmtub3duLWxpbnV4LWdudS4gQlIyX3Bvd2VycGMgaXMgMzItYml0
IG9ubHk6Cj4gKwkjIEJSMl9wb3dlcnBjNjQgYW5kIEJSMl9wb3dlcnBjNjRsZSBhcmUgc2VwYXJh
dGUgc3ltYm9scywgYm90aAo+ICsJIyBzZWxlY3RpbmcgQlIyX0FSQ0hfSVNfNjQsIGFuZCBhcmUg
bm90IGFmZmVjdGVkLgo+ICsJZGVmYXVsdCB5IGlmICFCUjJfQVJNX0NQVV9BUk1WNSAmJiAhQlIy
X3Bvd2VycGMKPiArCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX0FSQ0gKPiAgCXN0
cmluZwo+ICAJZGVmYXVsdCAiYXJtdjV0ZSIgaWYgQlIyX0FSTV9DUFVfQVJNVjUKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
