Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA73C78842
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 140E384C8C;
	Fri, 20 Sep 2024 13:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsw8j_HKMoDz; Fri, 20 Sep 2024 13:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 023CB84CF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 023CB84CF5;
	Fri, 20 Sep 2024 13:39:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BACA1BF34B
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 13:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24CA742BF4
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 13:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fngydmyhefO5 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 13:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F40C42B4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F40C42B4B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F40C42B4B
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 13:39:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42ca4e0299eso16610615e9.2
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 06:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726839555; x=1727444355;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H9M9Os7npIBXWiuoielDhSfAOV20nm/3KwT6qQbIA5Q=;
 b=I/ZiT+ZM8AF/Mx/0VHOrcivzWzD8iplyGPVwJZnJqVB/LaAocuXjMgFQR8kK2o6435
 4RsTzVDGPUbTNcqbptGQVlHaTpXrBNeIHj8HS7V6hzvWZvDJkZwKCoegQVLcPj52HPS/
 /NzIVH8QmrKxD2wOfQFDs0XJcCtHgdOih7AwfCARhvsQru3t+jFMkQce8dpu2UhYIlW+
 cdopZA1cpFht38WLOyNQDxdcF1zUmfzxCUX2LDgijI4+ZPQ7QlZP79r/fA625lf/2B9t
 S8AwH3tkXdBuy3/bKaz+rJnY2QXk4WthJlMzYWh0f36i5cXIsOyaRnlX6ScjQyBM5LM9
 fRjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS5SqDTzPUArSNkEs+zgkcy5RKAwpWIGLzy5nL+fWsgRxi+5rPuoeGehnXMzN9vlCO36at9gdhHfA=@buildroot.org
X-Gm-Message-State: AOJu0YxxVsVmnYUCb7yKzF8jzJOsGKyfh29SG0AAllU3WktMTaGSFsBS
 IXAC2CsXh1kbC9WyVi6i26Ehq+4GO7trrlrnm58+EaLlV69GL6Yhx+4XMfy0zlk=
X-Google-Smtp-Source: AGHT+IHaMMdtZ+q3C4wOoanPJleAteeD76Dc+rKDjYtV27tOugjSM8gNNS2Ph3QjN3PDxTWvNki/TA==
X-Received: by 2002:a05:600c:1d1e:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-42e7c1663ddmr18722585e9.13.1726839554830; 
 Fri, 20 Sep 2024 06:39:14 -0700 (PDT)
Received: from [192.168.178.20] ([213.211.139.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e7ae5fcd5sm24032555e9.3.2024.09.20.06.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Sep 2024 06:39:14 -0700 (PDT)
Message-ID: <ae4d5cc9-8bb3-48d5-98c9-bc99a904fced@mind.be>
Date: Fri, 20 Sep 2024 15:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240919184758.655792-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20240919184758.655792-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726839555; x=1727444355; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9M9Os7npIBXWiuoielDhSfAOV20nm/3KwT6qQbIA5Q=;
 b=VrmxMGFYLInS/noHun+gl0aHpUMjy/RrcZGImtljMI39IfcyphLUqZrfk3a3RHgH7r
 QgU95C4dzrwmuAtzB3Ew+j6IFy5x76NstPGOjs2GSnV8cAjJWr582SLEiZ1pv+SRCL+r
 94xqbsGX7PBxjwenZ+X/CXu0aOJy2S/DcKLy7oH++S4eVkzEx3/hjbF3i/GktDAfGi62
 FyqyOZD3CcDkhFfFHbBdety0aciTZTDlBrx8bfVwMvUrQMQUCJqRyCTrMJ9B8jyN+5vc
 oY9AFbkHdGeefaT1ptEch1p+wrJlYyAfovS+7JtX6HroQCvVPeI1etR2rEefOci8Xozb
 iQ3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VrmxMGFY
Subject: Re: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to
 version 0.10.2
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbCwKClRoZSBwYXRjaCBMR1RNLCBhbmQgdGhlICdUZXN0UHl0aG9uUHkzUzN0
cmFuc2ZlcicgdGVzdCBpcyBwYXNzaW5nLgoKT24gOS8xOS8yNCAyMDo0NywgSmFtZXMgSGlsbGlh
cmQgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJk
MUBnbWFpbC5jb20+CgpBY2tlZC1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0
ZUBtaW5kLmJlPgoKPiAtLS0KPiAgIHBhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMz
dHJhbnNmZXIuaGFzaCB8IDQgKystLQo+ICAgcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRo
b24tczN0cmFuc2Zlci5tayAgIHwgNCArKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
czN0cmFuc2Zlci9weXRob24tczN0cmFuc2Zlci5oYXNoIGIvcGFja2FnZS9weXRob24tczN0cmFu
c2Zlci9weXRob24tczN0cmFuc2Zlci5oYXNoCj4gaW5kZXggNDhiZTZiM2E4Yi4uYzhiOGY2NWQw
YyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5z
ZmVyLmhhc2gKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5z
ZmVyLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczov
L3B5cGkub3JnL3B5cGkvczN0cmFuc2Zlci9qc29uCj4gLW1kNSAgYmE4NGU3YzA2YmMxZGNkMzE1
MWMzZDIxMzI2MjFjZmMgIHMzdHJhbnNmZXItMC4xMC4wLnRhci5nego+IC1zaGEyNTYgIGQwYzhi
YmY2NzJkNWVlYmJlNGU1Nzk0NWUyM2I5NzJkOTYzZjA3ZDgyZjY2MWNhYmY2NzhhNWM4ODgzMTU5
NWIgIHMzdHJhbnNmZXItMC4xMC4wLnRhci5nego+ICttZDUgIDg5MTczN2NlMzVhZWIyM2IwMmE0
N2E3MmM3ZjliNjM5ICBzM3RyYW5zZmVyLTAuMTAuMi50YXIuZ3oKPiArc2hhMjU2ICAwNzExNTM0
ZTkzNTZkM2NjNjkyZmRkZTg0NmI0YTFlNGIwY2I2NTE5OTcxODYwNzk2ZTZiYzRjN2FlYTAwZWY2
ICBzM3RyYW5zZmVyLTAuMTAuMi50YXIuZ3oKPiAgICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYg
Y2hlY2tzdW1zCj4gICBzaGEyNTYgIGNmYzc3NDliOTZmNjNiZDMxYzNjNDJiNWM0NzFiZjc1Njgx
NDA1M2U4NDdjMTBmM2ViMDAzNDE3YmM1MjNkMzAgIExJQ0VOU0UudHh0Cj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIubWsgYi9wYWNrYWdl
L3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5zZmVyLm1rCj4gaW5kZXggNmZhZTgyNDg2
Mi4uMTg1MWJiODQyNiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5
dGhvbi1zM3RyYW5zZmVyLm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRo
b24tczN0cmFuc2Zlci5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiAgIAo+IC1QWVRIT05fUzNUUkFOU0ZFUl9WRVJTSU9OID0gMC4xMC4wCj4g
K1BZVEhPTl9TM1RSQU5TRkVSX1ZFUlNJT04gPSAwLjEwLjIKPiAgIFBZVEhPTl9TM1RSQU5TRkVS
X1NPVVJDRSA9IHMzdHJhbnNmZXItJChQWVRIT05fUzNUUkFOU0ZFUl9WRVJTSU9OKS50YXIuZ3oK
PiAtUFlUSE9OX1MzVFJBTlNGRVJfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9y
Zy9wYWNrYWdlcy9hMC9iNS80YzU3MGIwOGNiODVmZGNjNjUwMzdiNTIyOWUwMDQxMjU4M2JiMzhk
OTc0ZWZlY2I3ZWMzNDk1ZjQwYmEKPiArUFlUSE9OX1MzVFJBTlNGRVJfU0lURSA9IGh0dHBzOi8v
ZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9jYi82Ny85NGM2NzMwZWU0YzM0NTA1YjE0
ZDk0MDQwZTJmMzFlZGYxNDRjMjMwYjZiNDllOTcxYjRmMjVmZjhmYWIKPiAgIFBZVEhPTl9TM1RS
QU5TRkVSX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gICBQWVRIT05fUzNUUkFOU0ZFUl9MSUNF
TlNFID0gQXBhY2hlLTIuMAo+ICAgUFlUSE9OX1MzVFJBTlNGRVJfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UudHh0CgpUaGFua3MsCgpSYXBoYcOrbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
