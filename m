Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA8DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 20:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 356E44036E;
	Tue, 25 Jan 2022 20:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtWthOO0R-NC; Tue, 25 Jan 2022 20:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 358FB401C8;
	Tue, 25 Jan 2022 20:57:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F73E1BF5A1
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D23B401C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oa3aGjwBzrJs for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 20:57:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 177974012B
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 20:57:40 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ah7so33327653ejc.4
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 12:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=RHK/Ut1CfEt0f0IuKXDBbsXz+RY6u5TWFHgsZx5nJVw=;
 b=Bqq2DMthz2ZCxyGOgZdpZvROkuFjlgJoZU8yvODbEvBvcCCyeBhfPa5+5yNtvtE2a5
 X32MJnjIST0I46LI2Qs9RJ3yfVffBxzOZzdjb69vhA7IGQDji1i3QmQaJvmejF2IkLuH
 75+Cz4nPBxKfO1Ax7UpjzB4Z00P1b23T8tJbSZkrDnvcar2Ut2nGKRio/MXc1QJtxgCc
 kUfmSQ0CndxxNlEHvDTMrSsYipdr71Q0oHJ/u7VWry30NLRQ3TLrgFZ9kkILgn6GeACy
 oEy/9QYsrMp/YyMuiSjmqQCxopJn2nwgUbBUa1DXFR3bm5MY4++Nmg1xN+M5AFnC+I/p
 ToQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RHK/Ut1CfEt0f0IuKXDBbsXz+RY6u5TWFHgsZx5nJVw=;
 b=v7BJfAPYbLRRljWWJbh7Z0FUF6/gLvMA/sdEckFBv219O/1C9PwlOumertZfwcoV1Q
 GMXoKtUYMjSs0w7LB/4rjOtYYMJ3+uWiNUzTysIn+UA05ffEgvx7ylG+dpoQ01o+JVzc
 PmA33whhyilN7dfA4HyfqX+abRH4XRqy5AUbMluGl2rRFtsdKXJk3VLK1y+yAZVhkdkZ
 V0/z+m/ZZj72M19E61UZp5MOn2qj1pVd7k1++5UAG3I1yomC00hBeUb+VErLU5rOOSAd
 VK/IyFOHKJGs5B8QbRgJHRmqgE6PlKKU9ICbxi2SsnvVdJ+7lQYy0u9bM7wvamvM8CIY
 p/Qw==
X-Gm-Message-State: AOAM5315j8aIWq2yHIY+jiAkdg+9CnX44PGOdKS53Wxzm2MS9cyr/zIe
 ZTslbfQOLhmBYkGVPTYgkKP3Lw==
X-Google-Smtp-Source: ABdhPJxWKKo/WcjGQnV4X/4erfX86rR4gneYP5UebbuGpRenZyEgPecOqbkwFtmxPoPs12YJwF7aGQ==
X-Received: by 2002:a17:907:7208:: with SMTP id
 dr8mr18051210ejc.503.1643144258295; 
 Tue, 25 Jan 2022 12:57:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u1sm6532990ejj.215.2022.01.25.12.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 12:57:37 -0800 (PST)
Message-ID: <73fe7aba-588b-133b-f0a6-960cbefb162f@mind.be>
Date: Tue, 25 Jan 2022 21:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 buildroot@buildroot.org
References: <20211106181424.299041-1-peron.clem@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211106181424.299041-1-peron.clem@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] configs/beelink_gs1: increase rootfs
 size to 120M
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

ICBIaSBDbGXMgW1lbnQsCgpPbiAwNi8xMS8yMDIxIDE5OjE0LCBDbMOpbWVudCBQw6lyb24gd3Jv
dGU6Cj4gRm9yIHRoZSBtb21lbnQgQmVlbGluayBHUzEgdXNlIGEgZGVmYXVsdCByb290ZnMgc2l6
ZSBvZiA2ME0KPiB3aGljaCBtYWtlIHNvbWV0aW1lcyB0aGUgYnVpbGQgZmFpbGVkIGR1ZSB0byBt
aXNzaW5nIHNwYWNlLgoKICBUaGF0J3Mgc3VycHJpc2luZy4uLiBUaGUgb25seSB0aGluZyBpbiB0
aGUgcm9vdGZzIGlzIGJ1c3lib3gsIHNvIHRoZSByb290ZnMgCnNpemUgc2hvdWxkIGJlIHdheSBs
ZXNzIHRoYW4gMU1CLCBsZXQgYWxvbmUgNjBNQi4uLgoKICBBbHNvLCAic29tZXRpbWVzIiBpcyBz
dXNwaWNpb3VzLiBUaGUgcm9vdGZzIHNob3VsZCBiZSBhbG1vc3QgYmluYXJ5IGlkZW50aWNhbCAK
YmV0d2VlbiB0d28gYnVpbGRzICh0aGVyZSBhcmUgc29tZSBkYXRlcyBhbmQgcGF0aHMgaW4gdGhl
cmUgaWYgeW91IGRvbid0IGVuYWJsZSAKQlIyX1JFUFJPRFVDSUJMRSkuCgogIERvIHlvdSBoYXZl
IGEgYml0IG1vcmUgZGV0YWlsL2V4YW1wbGUgb2YgaG93IGl0IGZhaWxzPwoKICBSZWdhcmRzLAog
IEFybm91dAoKPiAKPiBJbmNyZWFzZSB0aGUgcm9vdGZzIHNpemUgdG8gMTIwTS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgo+IC0tLQo+
ICAgY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL2JlZWxpbmtfZ3MxX2Rl
ZmNvbmZpZyBiL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnCj4gaW5kZXggZTg4ZjNlM2I2
OS4uMTg3MmFhYmRmMCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZp
Zwo+ICsrKyBiL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnCj4gQEAgLTI0LDYgKzI0LDcg
QEAgQlIyX1BBQ0tBR0VfQVVUT1NTSD15Cj4gICBCUjJfUEFDS0FHRV9EUk9QQkVBUj15Cj4gICBC
UjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPiAgIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4g
K0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKPiAgIAo+ICAgIyBGaXJtd2FyZQo+
ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
