Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE55C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 20:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADC838161D;
	Mon, 25 Mar 2024 20:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvKxTz2XvArZ; Mon, 25 Mar 2024 20:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7F1881755
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7F1881755;
	Mon, 25 Mar 2024 20:47:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 098871BF3E3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01D8681755
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOqDg0vkQ9Au for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 20:47:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05D2E8161D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D2E8161D
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05D2E8161D
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 20:47:25 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d4360ab3daso78668241fa.3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 13:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711399643; x=1712004443;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eYpxWldUusPMACad8ZYmlb3K6bvdaPxPbblFkIxz3Ek=;
 b=ZKJ9WMZ9anhQI7n2SM56fUn4FAKU/6b4zrQDBH6qz2P2TPhHYtQzrw7rpA0zWguxJk
 3Wy/1woIJoocgQ0OVOcVBiKmIl1wAzDmFEDTMcegGtAzAFyefBziSbBeDaOyKcochCig
 RBA3e7ILeo09+i+M/30opa1GBTu/tmT/UDHYocpNxbW5VDxsk3vH79FVbg3ZvITJSxrH
 3S46GWaxH/B96HpSjTVrQ3JEsOQx9JUOpXc3+yy2te02Yr83S8sGtjj9sYdSg4TqTa4M
 hVBk7U+OGWNGMgIYd0o10hyBYNV/5r5yhfgS5dq/U8lbhFHoiDNpIe2wKiSfjwbklPbx
 /4nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWySiAbc3GTl0gGHSKS117vniG0kvw2hbsnM2C6Q3qpxO43ya+JBUO8zMYBGoNV59+5YcOnPq3p53iDhK+vb99JhUYbUjJzew==
X-Gm-Message-State: AOJu0YxFLoXmCHjJiIhq8P6kPeZTiEzapd9qmIVUSe5QhZdPCqqvrTYR
 +Y1JL0wS/Vzrc/4a0qZtPZQhQXp9751pm+s6R9mOsz65ov972vGesfoIPNho8HoowCYW2cLqBrx
 x
X-Google-Smtp-Source: AGHT+IGVHkzZ8DlZ8aDmS2pmyd0z7bgXV4JP++7uA1ymXfGRVVRX4UwTkMm3xtuRZUOuISfMnafN3w==
X-Received: by 2002:a2e:9b86:0:b0:2d6:994f:1c9f with SMTP id
 z6-20020a2e9b86000000b002d6994f1c9fmr5041981lji.53.1711399643469; 
 Mon, 25 Mar 2024 13:47:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b00414887d9329sm5517527wmq.46.2024.03.25.13.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 13:47:22 -0700 (PDT)
Message-ID: <cf084231-a69c-4d8e-a31a-ba8368010f6c@mind.be>
Date: Mon, 25 Mar 2024 21:47:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>, buildroot@buildroot.org
References: <20240325192704.1597001-1-nerv@dawncrow.de>
Content-Language: en-GB
In-Reply-To: <20240325192704.1597001-1-nerv@dawncrow.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711399643; x=1712004443; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eYpxWldUusPMACad8ZYmlb3K6bvdaPxPbblFkIxz3Ek=;
 b=DbE9aKnJ7Hs9tIWz+Ronr9Nwf2X8gafJJrtbaiSNw1J8gkBHZQVIpvu77Kz9rbVX8t
 mli08cVe2IhhrzvXleGIUf5Kc2Sab1ga3IGomuSkllq8+oHzW4wRJgN768QSb7RRE4Vk
 5otIiDYqJd1DgLrofXmrkcgYi1xtYG2gDOJlPmHTFsT9kj0YC9hvUEfzeizsiBiSUT7I
 mBFCU6OilU/mjpZLOoVU70tJMLlvv+vkLDlYdiTJpJwoRYgm6EshnvOdfJGcaao204Io
 z6S3qUGe5YCd481gV2rIyFgARQy31QiRN1YgzK6jPLz2OT85NcSuVjfdJCRaMvHVrakB
 Ppxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DbE9aKnJ
Subject: Re: [Buildroot] [PATCH] package/p7zip: bump to version v17.05
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNS8wMy8yMDI0IDIwOjI3LCBBbmRyw6kgWndpbmcgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgo+IC0tLQo+ICAgcGFja2FnZS9wN3pp
cC9wN3ppcC5oYXNoIHwgMiArLQo+ICAgcGFja2FnZS9wN3ppcC9wN3ppcC5tayAgIHwgNCArKy0t
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wN3ppcC9wN3ppcC5oYXNoIGIvcGFja2FnZS9wN3ppcC9w
N3ppcC5oYXNoCj4gaW5kZXggMDA0ODc3N2Q4OS4uZjBiOWMyNzExMyAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3A3emlwL3A3emlwLmhhc2gKPiArKysgYi9wYWNrYWdlL3A3emlwL3A3emlwLmhhc2gK
PiBAQCAtMSwzICsxLDMgQEAKPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgZWEw
MjlhMmUyMWQyZDZhZDBhMTU2ZjY2NzliZDY2ODM2MjA0YWE3ODE0OGE0YzVlNDk4ZmU2ODJlNzcx
MjdlZiAgcDd6aXAtMTcuMDQudGFyLmd6Cj4gK3NoYTI1NiAgZDI3ODhmODkyNTcxMDU4YzA4ZDI3
MDk1YzIyMTU0NTc5ZGZlZmI4MDdlYmUzNTdkMTQ1YWIyZGRkZGVmYjFhNiAgcDd6aXAtMTcuMDUu
dGFyLmd6Cj4gICBzaGEyNTYgIDU1NTgwNjY1N2RjZjBmMWU3MjBiNTgxYzUyNjQzYzE5NWVjODZh
ZTNmMDBiZDE4Y2M2NmQyZTBmODhmZmEyMTAgIERPQy9MaWNlbnNlLnR4dAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3A3emlwL3A3emlwLm1rIGIvcGFja2FnZS9wN3ppcC9wN3ppcC5tawo+IGluZGV4
IGI2YzVhZGFlMjYuLjgwM2ZkMzhiN2YgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wN3ppcC9wN3pp
cC5tawo+ICsrKyBiL3BhY2thZ2UvcDd6aXAvcDd6aXAubWsKPiBAQCAtNCw4ICs0LDggQEAKPiAg
ICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtUDdaSVBfVkVSU0lPTiA9IDE3
LjA0Cj4gLVA3WklQX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGppbmZlaWhhbjU3LHA3emlwLHYkKFA3
WklQX1ZFUlNJT04pKQo+ICtQN1pJUF9WRVJTSU9OID0gMTcuMDUKPiArUDdaSVBfU0lURSA9ICQo
Y2FsbCBnaXRodWIscDd6aXAtcHJvamVjdCxwN3ppcCx2JChQN1pJUF9WRVJTSU9OKSkKCiAgVGhp
cyB0cmlnZ2VyZWQgbWUgdG8gYWxzbyB1cGRhdGUgdGhlIFVSTCBpbiBDb25maWcuaW4sIHdoaWNo
IHdhcyBzdGlsbCAKcG9pbnRpbmcgdG8gc291cmNlZm9yZ2UuCgoKICBBcHBsaWVkIHRvIG1hc3Rl
ciB3aXRoIHRoYXQgZml4ZWQsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gICBQN1pJ
UF9MSUNFTlNFID0gTEdQTC0yLjErIHdpdGggdW5SQVIgcmVzdHJpY3Rpb24KPiAgIFA3WklQX0xJ
Q0VOU0VfRklMRVMgPSBET0MvTGljZW5zZS50eHQKPiAgIFA3WklQX0NQRV9JRF9WRU5ET1IgPSA3
LXppcApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
