Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96BCC0015E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 15:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A6EC817A8;
	Mon, 17 Jul 2023 15:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A6EC817A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IKAWNUF6PnH; Mon, 17 Jul 2023 15:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA9518177A;
	Mon, 17 Jul 2023 15:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA9518177A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D30C1BF341
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4496A4098B
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4496A4098B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mZOroVYEJHz for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 15:31:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B8D44019D
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B8D44019D
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 15:31:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-992b66e5affso654898266b.3
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 08:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689607881; x=1692199881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6G386ormfeScWVE7G+KZpOY6upUM7JhkVgdCsiRNjKQ=;
 b=I8G2gcAa8+pxg4HFN2SdB6UaKM97kHiC93XyzpwUtNfdgxKa6/XKYDyQsgspO8XPFh
 RGLaXDkaDO0gLU6KUEU+cCBGpNGoW7fd32QCGIrJ6Tz5KA1OPqRB1ptIQmuaQpq+eoHA
 e1nMsDhJg8OJAri7rzqwyMtTCPOjQIzgSU7jbQMYNMfgKcAsS7x/NgbaARXYOF2he0Oj
 q3j0c2cEn7GLEjWUb/d1HyPNqdvNwix9NbIjYhO0r0TlCbxm1j4ysrmPJkjYbMNE2uD9
 nV4O4lVaNjjRqV9Dt1IhtO7exOUXAlDAwxzTTxNy7WwEEhXe9lSu4rFmvDNgB7TqAjd1
 4s1Q==
X-Gm-Message-State: ABy/qLY67x+gT/gxE2QCiplx3KnyrwO0ds4tgw7CG+4IGTJlyG43FOh1
 tIGesaDPlDnt8X5EL4qlxFBZwA==
X-Google-Smtp-Source: APBJJlFdifQfCMlUU6ydHZu4c5kapsgUt2A/X14btW5v4ubrQBXPGkr3NtXuV+7oSmS/IaAXDArjOg==
X-Received: by 2002:a17:906:77cf:b0:994:4095:3abf with SMTP id
 m15-20020a17090677cf00b0099440953abfmr11323775ejn.14.1689607881461; 
 Mon, 17 Jul 2023 08:31:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a1709065a8f00b00991d54db2acsm9268470ejq.44.2023.07.17.08.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 08:31:20 -0700 (PDT)
Message-ID: <bc55ba52-133a-d350-a935-432e852f19f6@mind.be>
Date: Mon, 17 Jul 2023 17:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: =?UTF-8?Q?Ignacy_Gaw=c4=99dzki?= <ignacy.gawedzki@green-communications.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20230714090804.kaid6vdlxiubf632@zenon.in.qult.net>
 <20230714121834.22742681@windsurf>
 <20230717140932.s3yxrzyqdjf2ljcd@zenon.in.qult.net>
In-Reply-To: <20230717140932.s3yxrzyqdjf2ljcd@zenon.in.qult.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1689607881; x=1692199881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6G386ormfeScWVE7G+KZpOY6upUM7JhkVgdCsiRNjKQ=;
 b=L/G+Fd9ViiUFt7PBnEPr3Zz2Ei8xBhWbu3Ksc/BVSxcB8G+X3AaqXLdzhHDd0m0xqu
 swKPwGZTXI8DJSl6T9hMPU1FopeMEAu9ydTMifVZuqDtVm6n6VnHyktJ0KLB+GzyvBkg
 CX7Cpm+eUNeN8S5XY7ZltoCnwQb2yHgmsJPQ3QTQy89tVf6bsfEhzS011rH7tPvTlgWP
 /DUTDoOMQ0N0I7P+z9J7SwyG0GvnMJHOKHu1/RLVpixaICk1b87n6VQzhXzzbBXR6658
 KvpJvPs1n1SabGlFHWxMtJZ7J0cRqaESR/eFZgy4zU8EneX3VDe8GWTz25trUv0lkNGL
 sjwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L/G+Fd9V
Subject: Re: [Buildroot] [PATCH] package/elfutils: enable building with
 musl-based toolchains
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8wNy8yMDIzIDE2OjA5LCBJZ25hY3kgR2F3xJlkemtpIHdyb3RlOgo+IE9uIEZyaSwg
SnVsIDE0LCAyMDIzIGF0IDEyOjE4OjM0UE0gKzAyMDAsIHRodXMgc3Bha2UgVGhvbWFzIFBldGF6
em9uaToKPj4gSGVsbG8gSWduYWN5LAo+Pgo+PiBbLi4uXQo+Pgo+PiBBbmQgdGhlIGZ1biBnYW1l
IGlzIHRoYXQgdGhpcyB3b3JrIG5lZWRzIHRvIGJlIGRvbmUgcmVjdXJzaXZlbHk6IG9uY2UKPj4g
eW91IGhhdmUgY2hlY2tlZCBpZiBmb3IgZXhhbXBsZSBsaWJicGYgY2FuIG5vdyBidWlsZCB3aXRo
IG11c2wsIHlvdQo+PiBuZWVkIHRvIGxvb2sgYXQgdGhlIHJldmVyc2UgZGVwZW5kZW5jaWVzIG9m
IGxpYmJwZiAoaW4gdGhpcyBjYXNlLCBvbmx5Cj4+IHBhY2thZ2Uva21lbWQpLgo+Pgo+PiBDb3Vs
ZCB5b3UgaGF2ZSBhIGxvb2sgYXQgZG9pbmcgdGhpcz8KPiAKPiBTdXJlLiAgSSBzdGFydGVkIGhh
dmluZyBhIGxvb2sgYW5kIHN0dW1ibGVkIHVwb24gYW4gaXNzdWUgd2hpbGUKPiB0ZXN0LXBrZydp
bmcgbGliYnBmLiAgQXNpZGUgZnJvbSBtYW55IHRvb2xjaGFpbnMganVzdCBiZWluZyBza2lwcGVk
Cj4gKHN1cHBvc2VkbHkgYmVjYXVzZSBvZiB0aGVpciBsYWNrIG9mIHRoZSBtaW5pbXVtIGtlcm5l
bCBoZWFkZXJzCj4gdmVyc2lvbiksIGl0IHN1Y2NlZWRlZCB3aXRoIHRob3NlIGdsaWJjIGFuZCBt
dXNsIHRvb2xjaGFpbnMgdGhhdCBpdAo+IGRpZG4ndCBza2lwLCBhbmQgZmFpbGVkIHdpdGggYnIt
bWlwczY0LW42NC1mdWxsLiAgVGhlIGxhdHRlciBpcyBiYXNlZAo+IG9uIHVDbGliYyB2MS4wLjM2
IGFuZCBpdCB0dXJucyBvdXQgdUNsaWJjIHByaW9yIHRvIHYxLjAuMzggaGFzIG5vCj4gd29ya2lu
ZyBkZWZpbml0aW9uIG9mIEZfRFVQRkRfQ0xPRVhFQywgcmVxdWlyZWQgYnkgbGliYnBmLgo+IAo+
IE5vdyBJIGhhdmUgdGhlIGZvbGxvd2luZyBwcm9ibGVtOiBob3cgY2FuIEkgZGV0ZXJtaW5lLCBm
cm9tIHRoZQo+IENvbmZpZy5pbidzIHBvaW50LW9mLXZpZXcsIHRoYXQgdGhlIHVDbGliYyB1c2Vk
IGJ5IHRoZSB0b29sY2hhaW4gaXMKPiB0b28gb2xkPyAgVGhlcmUgYXJlIHZhcmlhYmxlIHRoYXQg
YXJlIHNldCB3aGVuIHRoZSB0b29sY2hhaW4gaXMKPiB1Y2xpYmMtYmFzZWQsIGJ1dCBpbiB0aGlz
IGNhc2UgSSBoYXZlCj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9DVVNUT01fVUNMSUJDPXkgYW5k
IG5vIHdheSB0byBrbm93IHRoZSBhY3R1YWwKPiB2ZXJzaW9uLiAgRm9yYmlkZGluZyBsaWJicGYg
YXMgc29vbiBhcwo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQ1VTVE9NX1VDTElCQz15IHNlZW1z
IG92ZXJraWxsLgoKICBZZWFoLCB3ZSBoYXZlIHZlcnNpb24gY2hlY2tpbmcgZm9yIEdDQyBhbmQg
a2VybmVsIGhlYWRlcnMsIGJ1dCBub3QgZm9yIGxpYmMuIApJdCdzIGZhaXJseSByYXJlIHRoYXQg
YSB2ZXJzaW9uIGRlcGVuZGVuY3kgaXMgbmVlZGVkIG9uIGxpYmMuIFNvIHdlIGJhc2ljYWxseSAK
anVzdCBhc3N1bWUgdGhhdCBsaWJjIGlzIHVwIHRvIGRhdGUuCgogIFdoYXQgd2Ugc29tZXRpbWVz
IGRvIGluIHN1Y2ggYSBjYXNlIGl0IHRvIGFkZCBhbiBleGNlcHRpb24gaW4gdGhlIApnZW5yYW5k
Y29uZmlnIHNjcmlwdCwgdG8gbWFrZSBzdXJlIHRoYXQgdGhhdCBjb21iaW5hdGlvbiBpc24ndCB0
cmllZC4KCiAgSWRlYWxseSwgdGhvdWdoLCB0aGF0IHRvb2xjaGFpbiBjb25maWd1cmF0aW9uIHNo
b3VsZCBqdXN0IGJlIHJlcGxhY2VkIHdpdGggdGhlIAplcXVpdmFsZW50IGJvb3RsaW4gdG9vbGNo
YWluLiBPbmx5LCB0aGVyZSBpcyBubyBib290bGluIHRvb2xjaGFpbiBmb3IgCm1pcHM2NC1uNjQu
IEFueSBpZGVhIHdoeSBub3QsIFRob21hcz8KCiAgUmVnYXJkcywKICBBcm5vdXQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
