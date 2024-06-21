Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B010C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 07:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 215C780D01;
	Sun, 23 Jun 2024 07:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkwT4chXPJEi; Sun, 23 Jun 2024 07:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 334D081DFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 334D081DFB;
	Sun, 23 Jun 2024 07:42:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 958041BF59E
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83C13607FB
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FN124upESJmH for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 07:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57CD5607E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57CD5607E2
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57CD5607E2
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 07:41:03 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42278f3aea4so28778875e9.1
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 00:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719128461; x=1719733261;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fJFwLdOMRhn4ZvJPS8p3ic4+oVHVyVWnT4ODRQyrmpA=;
 b=scJjbUxSIfFDgRt9yr9ZrIbRxdYj6NEw2qHryZiBR83wwfz2rFBJScnN6C2n1aW3Zx
 duaqS3TB6o9QDBwjBPgFEzBfG/kQiwxlFH9m+Oh10hv7R/dv9EIeieVkK2tE6D+QjYut
 nMnjuKsewmNnCmY2pwIf0EOxiJ7A8YPo7QlQd4mygxXVKUuB1AJ8bTBW+HwqOJzXKAy5
 G3RIl5CJ1yDQ9N8D4Uc8kBYHccSi2YD531LLxCltkEW0qIpqZCJCbdvbgXSNAIhYAFsA
 AJ90y9lDDAjhhCLCNM/c25Gb4dYjLoU/dYKXB2qMjrZ+EhcEC9IiUhOE/8l03FMmjSrN
 pkdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViZfqhcSr8PtXuu6I2bimleAukQW8fFs7tu5/wRs3PFnsuBsIQo7ce6pQBrJp+8ZdqeqLXsnSnxqxm3T3g/uH4fjoKniY/Zw==
X-Gm-Message-State: AOJu0Yzgf+fiDn//gb8x/auQ0CmNO9LLl1EN4ql7D1WyDdXHSWVvHlQo
 1pk6PVrUWJLJyKYC0bx8qbBghbFjIwWcmojp1rxyvEE0FRhTEcdvrfvsezmPQYxsC/MPGQWxabs
 h
X-Google-Smtp-Source: AGHT+IFaHBmbIbNGWIL59q1/I5vJyKiC5bszaznG1LY/8BnVQy9PtARplWkN1HRhSVrtCb8+9S6liA==
X-Received: by 2002:a05:600c:2d55:b0:421:f68f:a144 with SMTP id
 5b1f17b1804b1-4248cc66c9bmr10675685e9.36.1719128461292; 
 Sun, 23 Jun 2024 00:41:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c789esm6683167f8f.91.2024.06.23.00.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jun 2024 00:41:00 -0700 (PDT)
Message-ID: <89da691d-0f62-4e00-803d-4bfe49641ffd@mind.be>
Date: Fri, 21 Jun 2024 23:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 buildroot@buildroot.org
References: <20240607071359.767329-1-gael.portay@rtone.fr>
 <20240607071359.767329-3-gael.portay@rtone.fr>
Content-Language: en-GB
In-Reply-To: <20240607071359.767329-3-gael.portay@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719128461; x=1719733261; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fJFwLdOMRhn4ZvJPS8p3ic4+oVHVyVWnT4ODRQyrmpA=;
 b=AUFNqe6BPlx6eOoD+RtUlROpcajcgQKD5G2PJKDRCeo0tSXdblDVI6dm/IZQuy256E
 tb1wSvBlrvVqxX9ctYIfvRTFeoGTOMdLSj1wxCqBJFtg89Pv3T8VDjqcxkoY1yhTxKHS
 dgE0FO25K0f7P3N5TvtjGIae1btpea8N8KamtTOO/eWBn/7Yyilz8oqlfb+fEukLP5s6
 BQIT4+ieONV/dolEjdGMAabc0B/JYvcr7YnnbKEvPkEztJd1QPA6vnaACV5ajzmFIwVu
 ZycXYi/egqQzUWl6XEZm8p+yRuDoXDNwuLQXwQCyBodtpQ1GtxNZzQ/rurs9my1rdXLZ
 uD0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AUFNqe6B
Subject: Re: [Buildroot] [next v2 2/2] package/rpi-firmware: bump version to
 5476720
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Athaariq Ardhiansyah <foss@athaariq.my.id>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wNi8yMDI0IDA5OjEzLCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gVmVyc2lvbiA1NDc2
NzIwIG1hdGNoIHRoZSB3aXRoIGtlcm5lbCA2LjYuMjguCj4gCj4gU2lnbmVkLW9mZi1ieTogR2HD
q2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KCiAgRWFybGllciwgQXRoYWFyaXEgc2Vu
dCBhIHBhdGNoIFsxXSB0aGF0IHVwZGF0ZXMgdG8gYSBtb3JlIHJlY2VudCB2ZXJzaW9uIGFuZCAK
YWxzbyBtb3ZlcyB0byB0aGUgc3RhYmxlIGJyYW5jaC4gSSB0aGluayBJIHByZWZlciB0aGF0IG9u
ZS4KCiAgUmVnYXJkcywKICBBcm5vdXQKClsxXSAKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDYwMzIzMDk0MC41MTc0Ni0xLWZvc3NAYXRo
YWFyaXEubXkuaWQvCgoKPiAtLS0KPiAgIHBhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2Fy
ZS5oYXNoIHwgMiArLQo+ICAgcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rICAg
fCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLmhh
c2ggYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaAo+IGluZGV4IDMzZTA1
YTJmNGEuLjQ1MDFkYjczOWMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBp
LWZpcm13YXJlLmhhc2gKPiArKysgYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUu
aGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1NiAg
ZGQ0M2U3N2NhMWE4OTY5Y2RiN2YwNWRkNzJhNTdmOTA4NjIwNzFkNWE5M2JkZDZhZWE4MjQ2YWJh
ODU2ODljZiAgcnBpLWZpcm13YXJlLTgzZGFmYmM5MmMwZTYzZjc2Y2EyZWNkZDQyNDYyZDU2NDg5
ZDFjNzcudGFyLmd6Cj4gK3NoYTI1NiAgMDBmZTU0ODczNzZlOWQ1ZWQxNGNiYzcyYTliN2E1YmQ4
ZDY5MDBjODRhZWUxMGY2ZDY1NmYxOTJhMjZkMTYxYyAgcnBpLWZpcm13YXJlLTU0NzY3MjBkNTJj
ZjU3OWRjMTYyNzcxNTI2MmIzMGJhMTI0MjUyNWUudGFyLmd6Cj4gICBzaGEyNTYgIGM3MjgzZmY1
MWY4NjNkOTNhMjc1YzY2ZTNiNGNiMDgwMjFhNWRkNGQ4YzFlN2FjYzQ3ZDg3MmZiZTUyZDNkNmIg
IGJvb3QvTElDRU5DRS5icm9hZGNvbQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2Fy
ZS9ycGktZmlybXdhcmUubWsgYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsK
PiBpbmRleCAxMTE3N2FlZTAyLi43YWU5ZmY2YzI4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnBp
LWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawo+ICsrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3Jw
aS1maXJtd2FyZS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiAgIAo+IC1SUElfRklSTVdBUkVfVkVSU0lPTiA9IDgzZGFmYmM5MmMwZTYzZjc2
Y2EyZWNkZDQyNDYyZDU2NDg5ZDFjNzcKPiArUlBJX0ZJUk1XQVJFX1ZFUlNJT04gPSA1NDc2NzIw
ZDUyY2Y1NzlkYzE2Mjc3MTUyNjJiMzBiYTEyNDI1MjVlCj4gICBSUElfRklSTVdBUkVfU0lURSA9
ICQoY2FsbCBnaXRodWIscmFzcGJlcnJ5cGksZmlybXdhcmUsJChSUElfRklSTVdBUkVfVkVSU0lP
TikpCj4gICBSUElfRklSTVdBUkVfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ICAgUlBJX0ZJUk1X
QVJFX0xJQ0VOU0VfRklMRVMgPSBib290L0xJQ0VOQ0UuYnJvYWRjb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
