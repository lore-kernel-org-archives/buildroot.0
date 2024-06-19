Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073BAC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA44C4157A;
	Wed, 19 Jun 2024 20:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkz0PwiL6A5U; Wed, 19 Jun 2024 20:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B03E404FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B03E404FD;
	Wed, 19 Jun 2024 20:15:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A32851BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C01B40651
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdFuiqaYVadF for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:15:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83BE1413BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83BE1413BD
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83BE1413BD
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:15:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3632a6437d7so121991f8f.0
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718828104; x=1719432904;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bVqgfaTIdqUd+l6CQijSNs4r6u1bCreRoLv/wVl/u20=;
 b=m9DAYJN7b3xCNHTEMjPuxEb+Ph380oNVLENnV5oEE/Kh2dLvUyWe0mfmd9DAYVKSUD
 D/QAfceZshU6SOZ2Tgf06uW394ruPLru0GbjjKJoC/s+hqakWXoMQLqxiOjBfUlxIuLb
 B0vaRuDteGHAduNHzwb39ng0waSVnPmTE+rlY4vj0CoWaoTD6JPKVE/H6ypqBJBWcb54
 lYctxMYGRoVKdbqjjzxbj0Qw0ZK1aQXvCsLLbpM75I0bZ/hXTb223cTNVfdD/uAHZK2h
 +pQAgld4hf3oh/SFTXIpdwDf8JYonKP31c04syd717oWUeLkwI8cZp/9dLJhzqCf6soi
 F0NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEMMtB0GMdhjmhjhKjFqxFn/OEtOniw/3v+Nq8Q8OgsPYIPQPkbLG+bJmQltenVU+dkNI3d1Y4iNqqMcx51Y4rVS3GLG3AYw==
X-Gm-Message-State: AOJu0Ywaww4IFk4uX8nCkYJ4n6+ScUHjGHZ3fMQT6voXkG7ue7mG+Abi
 0gBt/fyIHKlztnJquHmcWxiag4N4UzrnHrTy6C9nYDqf1lJbSyLmn7au6o4NYfI=
X-Google-Smtp-Source: AGHT+IGS0nhX9wKgeDeTiGXdT+QA4Nc/ZDSWgA8yX8SvNi3bX4skK+AZk3MdISVhPT3QZjniNZttPA==
X-Received: by 2002:a5d:6690:0:b0:363:776:821b with SMTP id
 ffacd0b85a97d-3630776827cmr3784747f8f.0.1718828104372; 
 Wed, 19 Jun 2024 13:15:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0b6376sm1333985e9.5.2024.06.19.13.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:15:03 -0700 (PDT)
Message-ID: <7352267e-502e-4310-a8f7-abd92f89baad@mind.be>
Date: Wed, 19 Jun 2024 22:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240604125701.26637-1-sebastien.szymanski@armadeus.com>
Content-Language: en-GB
In-Reply-To: <20240604125701.26637-1-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718828104; x=1719432904; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bVqgfaTIdqUd+l6CQijSNs4r6u1bCreRoLv/wVl/u20=;
 b=F2UKtGkDgbVGqMjCL9PPodunuur+Y0u4jsHnasi99MSVydNl4S73LgYsLZ1jUA1akb
 WqMfMJg9Og/1B8UmCECqespit7f3ibtd45uNkCtOxCRA8cVicAoSzSraoxqqjeuqWzI9
 cT2eBSr11RMxyXMKg+hIkP9PAQyfUGoWGdZMfRPUWpsx1EiS9c3Wn56F9czC+U/xqX3y
 IMq9Yf/U8JLRhmFPv4xbPiCa4yxqtbRWAQ8Efqqo+zGFOCEf8/CaaAtOU+ODLfo22Eom
 XVUsBM3bEfSqsVPRccPVZ+NiMLV+pBmBtm7y3tMCiAcQ4kDnD2eGacKmXrX+OcuQT6V5
 /ZUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F2UKtGkD
Subject: Re: [Buildroot] [PATCH 1/1] package/imx-mkimage: bump version to
 lf-6.6.3-1.0.0
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
Cc: Erik Larsson <karl.erik.larsson@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNC8wNi8yMDI0IDE0OjU3LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBTaWdu
ZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1h
ZGV1cy5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJu
b3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9pbXgtbWtpbWFnZS9pbXgtbWtpbWFnZS5oYXNoIHwgMiAr
LQo+ICAgcGFja2FnZS9pbXgtbWtpbWFnZS9pbXgtbWtpbWFnZS5tayAgIHwgMiArLQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaCBiL3BhY2thZ2UvaW14
LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaAo+IGluZGV4IDAzNGIzZDAyZWQzMy4uMzE2MWQ2NmFk
MmU1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaAo+
ICsrKyBiL3BhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaAo+IEBAIC0xLDMgKzEs
MyBAQAo+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICBmZDUzOGRjNTcxY2UwNjYw
OWQ2YTRkOWVlOGNmZDdkMGM5M2VjNDY4NWFmYTlmMTA3OWU1YTU5MzFhZDNiZGJjICBpbXgtbWtp
bWFnZS1sZi02LjEuMzZfMi4xLjAudGFyLmd6Cj4gK3NoYTI1NiAgNDhlN2JhZDRhNDllNjkzNDE1
NDE4ODU5YmIwMzMwYjYzOTM4YTc3YmJiMTI2NjBiYzY0NzYxYTVkYWE5MTVjOSAgaW14LW1raW1h
Z2UtbGYtNi42LjNfMS4wLjAudGFyLmd6Cj4gICBzaGEyNTYgIDIzMWY3ZWRjYzczNTJkNzczNGE5
NmVlZjBiODAzMGY3Nzk4MjY3OGM1MTY4NzZmY2I4MWUyNWIzMmQ2ODU2NGMgIExJQ0VOU0UKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9pbXgtbWtpbWFnZS9pbXgtbWtpbWFnZS5tayBiL3BhY2thZ2Uv
aW14LW1raW1hZ2UvaW14LW1raW1hZ2UubWsKPiBpbmRleCA2ZTcwYTk0NmJmNjQuLmE4Mjg1NGVi
NmUyZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLm1rCj4g
KysrIGIvcGFja2FnZS9pbXgtbWtpbWFnZS9pbXgtbWtpbWFnZS5tawo+IEBAIC00LDcgKzQsNyBA
QAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1JTVhfTUtJTUFHRV9W
RVJTSU9OID0gbGYtNi4xLjM2XzIuMS4wCj4gK0lNWF9NS0lNQUdFX1ZFUlNJT04gPSBsZi02LjYu
M18xLjAuMAo+ICAgSU1YX01LSU1BR0VfU0lURSA9ICQoY2FsbCBnaXRodWIsbnhwLWlteCxpbXgt
bWtpbWFnZSwkKElNWF9NS0lNQUdFX1ZFUlNJT04pKQo+ICAgSU1YX01LSU1BR0VfTElDRU5TRSA9
IEdQTC0yLjArCj4gICBJTVhfTUtJTUFHRV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
