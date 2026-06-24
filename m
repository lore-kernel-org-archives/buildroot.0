Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F364CDE002
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 15:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E7060877;
	Wed, 24 Jun 2026 15:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3jEfuS4nZ8Z; Wed, 24 Jun 2026 15:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36FC66082E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782313600;
	bh=sLu7YZBd9xXmM3c1QmUv7jH7KYMrsJfg1cuc1kdhLQQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZzpxoxXi8jf269OuT+Kuiy15RfBAoyf2mnM0UNK5WXfaf4G83WyEPyKhJoOwxUu8x
	 l2F6soRUnCAoj5rTaveXPIddpIg4nTCYqpu/WB33jHwiUYx1QwRkBjblaefI2Xqafi
	 zjPM77ak/2H3Z7z7uiaVYYTvZGpELQW9WUKJalWsGcBBTnmSetgfwGhVbkjqnPaDNg
	 4dk5/wuUQ3CwcOltSvxVxNmikVw1g/vQHqaaYFEn16ygAhBZH1VbpaV+/v4/gdlt52
	 LZ90hxHUULvDBzB+dlpKsAoioUmMr1xq+3h0rwd3p/V5L9mIHoZ+ZV37RU1J1jB8sS
	 Mk3kd6D8RBMJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36FC66082E;
	Wed, 24 Jun 2026 15:06:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF331367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 15:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B484C6082E
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 15:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMjXTdP2BBxw for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 15:06:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7955D60817
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7955D60817
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7955D60817
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 15:06:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-69532288224so2321300a12.0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 08:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782313595; x=1782918395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LvdP02mf5hGepbO7e1f22DZ9SnwBdWKoLM/5JDZF+VY=;
 b=sdSWQaCCyLiBCiKEj2UMPdeggq6ZPnMSsLEdivk78Aw0kbmwtFiXAu5N3lxmb+lQeK
 1MKlLOhF5itIeYAjPLdZLFgUYxyRN3+64XbDGF6d6SK7XvN+Ybw+CDr6Jm+XRlq4S2WV
 dhP5FgADzx2CDpMCRnWSGAR7T0F4LgvyYI6bpe5mtvthBlGH4xkqYbVhCxKFEzKN/uD3
 WAW+p8AwqA3cKNB1NOzzZb4e4xa5Svv6m1eentKx4aNABxQq13yq3cS4TXsn9zPDR1R9
 KSsVfRfHntWSMt0mS+OlDhI3qsC7tOTwlmVz3A89COdANQayhS6rzp97s73DCYlP8siS
 Hr5w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9b2UsS+hQI5klcT/Z/CA1IKAg+XVVno1RIC6WLp8SpTU2t94iYGf2HjhT/Nda8C3UD1dUZNJHitlI=@buildroot.org
X-Gm-Message-State: AOJu0YyWnoM0CNKdPcPiACNFY37PTsRZPZejI6jD0ty/wQxnlHr7BGij
 yeEh+Mwo1o+fTnfNx0fKuc5H3E6r/scLbws9EqHFtwzY0zIA40UFUwtJ/c56QY8u5U8=
X-Gm-Gg: AfdE7cmYw9+TABPHYnPfgRIJQLQs2wUk/KucrGRLXutOEL1LpC0F5FkMSw0DNO4KAwG
 /+GQPfRosH+fQZUxoN9dN9Dh493cBdAd7sPHNvN9jqDEOB9HXvqmkJ0MBbFyfJoSofKlsA2ypav
 3vPIOUleQc5X5irMn3JlpnpnPf0Kj10oklrKsg2JW4uezSr1yHgPBTnAaaSNrz0N80ipV8Z4vp5
 EKh4KMUuMnhqL2pqC8SiZYIoYhwfXePKG6jP6CMBex3boN5C7X8K7p37TFKbuHUUrNrbD9Zj8Ib
 8vpZHTaWz9DQVsVQ5ZXzTVb0fz/Zr2dw4rh//Xv+cHqvEQogCWGoSI9qh0I2lQQIvugbwmKWJtI
 rfFjqTFFxs7yDl34bV04SbYV7tcvI3DBocjtm9+KLgIsXjjvRTUdoR2fuJABTkBXnBZfxMNpl/w
 WR9qwv
X-Received: by 2002:a17:907:3e8d:b0:c08:1884:7445 with SMTP id
 a640c23a62f3a-c107d00be97mr441684166b.5.1782313594850; 
 Wed, 24 Jun 2026 08:06:34 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee01d9csm6869355f8f.12.2026.06.24.08.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 08:06:34 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Wed, 24 Jun 2026 17:06:32 +0200
Message-ID: <20260624150633.217471-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20bfb43a-815e-4d72-ae98-68e51549ea89@smile.fr>
References: <20bfb43a-815e-4d72-ae98-68e51549ea89@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782313595; x=1782918395; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LvdP02mf5hGepbO7e1f22DZ9SnwBdWKoLM/5JDZF+VY=;
 b=GoOEKp6PPcsgyZpyqOZ03vV3OzmTT2yZvvhWHWFfwOBNdjcoNjNM+nAhqsAbc7PiBf
 N4YK1agMOFKTwfMafL+NH8SPhnFO+9ubRBGE+PWBxfbrnmz1mvsUhZB9CCoRPOVOv5dV
 n1ZI6FEPxo762PNFaTJgufIgAIWU//EEOGK6KzgqzONLn3SQlZa7WsXBY2RqTddsxwGH
 3WEHlR1gru7ZtiqaCoIpSKgAQBvGz/1flnIAwJWnnlpUYlZ7HFZiQKquW18sd0kH5ey5
 hAxj2ZDwvnrMIfKdFZ60gZO1FGxKZZklgeBgIKj9oeMTkLsDxpJOzv96lHDkyqK23NyZ
 /cYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GoOEKp6P
Subject: Re: [Buildroot] [RFC PATCH 11/14] package/glibc: add vulnerability
 details
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKSW4gcmVwbHkgb2Y6Cj4gSGVsbG8gVGhvbWFzLCBBbGwsCj4gCj4gTGUgMjQv
MDYvMjAyNiDDoCAxNjowNiwgVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6
Cj4gPiBUaG9zZSB2dWxuZXJhYmlsaXRpZXMgaGFzIGFscmVhZHkgYmVlbiBhZGRyZXNzZWQgdXBz
dHJlYW0gYnV0IG5vIG5ldwo+ID4gcGFja2FnZSB2ZXJzaW9uIGhhdmUgYmVlbiByZWxlYXNlZCB3
aXRoIHRob3NlIGZpeGVzLgo+ID4gCj4gPiBUaGUgQ1ZFLTIwMTAtNDc1NiBpcyBub3QgY29uc2lk
ZXJlZCBhcyBhIHNlY3VyaXR5IGlzc3VlIGJ5IHRoZSB1cHN0cmVhbQo+ID4gcHJvamVjdCBhbmQg
aXMgdGhlbiBtYXJrZWQgYXMgZml4ZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQ
ZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvZ2xpYmMv
Z2xpYmMubWsgfCAzMiArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZ2xpYmMvZ2xpYmMubWsgYi9wYWNrYWdlL2dsaWJjL2dsaWJjLm1r
Cj4gPiBpbmRleCA0YTZiYzk0NjM0Li45ZWRhYjVlNGQyIDEwMDY0NAo+ID4gLS0tIGEvcGFja2Fn
ZS9nbGliYy9nbGliYy5tawo+ID4gKysrIGIvcGFja2FnZS9nbGliYy9nbGliYy5tawo+ID4gQEAg
LTE5LDM3ICsxOSw0NSBAQCBHTElCQ19DUEVfSURfVkVORE9SID0gZ251Cj4gPiAgIyBhbGxvdyBw
cm9wZXIgbWF0Y2hpbmcgd2l0aCB0aGUgQ1BFIGRhdGFiYXNlLgo+ID4gIEdMSUJDX0NQRV9JRF9W
RVJTSU9OID0gJCh3b3JkIDEsICQoc3Vic3QgLSwkKHNwYWNlKSwkKEdMSUJDX1ZFUlNJT04pKSkK
PiA+ICAKPiA+IC0jIEZpeGVkIGJ5IGdsaWJjLTIuNDEtNjQtZzFlMTZkMDA5NmQ4MGE2ZTEyZDVi
ZmE4ZTBhYWZkZDEzYzQ3ZWZkNjUKPiA+ICBHTElCQ19JR05PUkVfQ1ZFUyArPSBDVkUtMjAyNS04
MDU4Cj4gPiArR0xJQkNfQ1ZFLTIwMjYtODA1OF9TVEFUVVMgPSBmaXhlZAo+ID4gK0dMSUJDX0NW
RS0yMDI2LTgwNThfREVUQUlMID0gZ2xpYmMtMi40MS02NC1nMWUxNmQwMDk2ZDgwYTZlMTJkNWJm
YThlMGFhZmRkMTNjNDdlZmQ2NQo+IAo+IFdoaWxlIHVwZGF0aW5nIG15IG1haWxib3gsIEkgbm90
aWNlZCB0aGlzIHR5cG86IENWRS0yMDI1LTgwNTggdnMgQ1ZFLTIwMjYtODA1OAo+IAo+IE1heWJl
IGNoZWNrcGFja2FnZSBjb3VsZCBjaGVjayBmb3IgdGhpcz8KPiAKPiBCZXN0IHJlZ2FyZHMsCj4g
Um9tYWluCgpHb29kIGNhdGNoIHRoYW5rcyAhIEkgd2lsbCBhZGQgdGhpcyB0byB0aGUgY2hlY2tw
YWNrYWdlIGNoZWNrIEkgYWRkZWQgZm9yIHRoZQoiX1NUQVRVUyIgY29udGVudC4KCj4gPiAgCj4g
PiAtIyBGaXhlZCBieSBnbGliYy0yLjQyLTQ5LWdiMGVjOGZiNjg5ZGY4NjIxNzFmMGY3ODk5NGEz
YmRlYjUxMzEzNTQ1Cj4gPiAgR0xJQkNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjYtMDg2MQo+ID4g
K0dMSUJDX0NWRS0yMDI2LTA4NjFfU1RBVFVTID0gZml4ZWQKPiA+ICtHTElCQ19DVkUtMjAyNi0w
ODYxX0RFVEFJTCA9IGdsaWJjLTIuNDItNDktZ2IwZWM4ZmI2ODlkZjg2MjE3MWYwZjc4OTk0YTNi
ZGViNTEzMTM1NDUKPiA+ICAKPiA+IC0jIEZpeGVkIGJ5IGdsaWJjLTIuNDItNTAtZzQ1M2U2Yjhk
YmFiOTM1MjU3ZWIwODAyYjBjOTdiY2E2YjY3YmEzMGUKPiA+ICBHTElCQ19JR05PUkVfQ1ZFUyAr
PSBDVkUtMjAyNi0wOTE1Cj4gPiArR0xJQkNfQ1ZFLTIwMjYtMDkxNV9TVEFUVVMgPSBmaXhlZAo+
ID4gK0dMSUJDX0NWRS0yMDI2LTA5MTVfREVUQUlMID0gZ2xpYmMtMi40Mi01MC1nNDUzZTZiOGRi
YWI5MzUyNTdlYjA4MDJiMGM5N2JjYTZiNjdiYTMwZQo+ID4gIAo+ID4gLSMgRml4ZWQgYnkgZ2xp
YmMtMi40Mi01MS1nY2JmMzljMjZiMjU4MDFlOWJjODg0OTliNGZkMzYxYWMxNzJkNDEyNQo+ID4g
IEdMSUJDX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTE1MjgxCj4gPiArR0xJQkNfQ1ZFLTIwMjUt
MTUyODFfU1RBVFVTID0gZml4ZWQKPiA+ICtHTElCQ19DVkUtMjAyNS0xNTI4MV9ERVRBSUwgPSBn
bGliYy0yLjQyLTUxLWdjYmYzOWMyNmIyNTgwMWU5YmM4ODQ5OWI0ZmQzNjFhYzE3MmQ0MTI1Cj4g
PiAgCj4gPiAtIyBGaXhlZCBieSBnbGliYy0yLjQzLTE2LWc1YzZmY2EwYzYyY2U1YmQ2ZTY4ZTI1
OWYxMzgwOTc3NTZjYmFmZDRkCj4gPiAgR0xJQkNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjYtNDQz
Nwo+ID4gK0dMSUJDX0NWRS0yMDI2LTQ0MzdfU1RBVFVTID0gZml4ZWQKPiA+ICtHTElCQ19DVkUt
MjAyNi00NDM3X0RFVEFJTCA9IGdsaWJjLTIuNDMtMTYtZzVjNmZjYTBjNjJjZTViZDZlNjhlMjU5
ZjEzODA5Nzc1NmNiYWZkNGQKPiA+ICAKPiA+IC0jIEZpeGVkIGJ5IGdsaWJjLTIuNDMtMTctZ2Rk
OTk0NWMwYmE0MGQyZGJjOWViN2M5OTI5MWJhNmI2OWJkNjY3MTgKPiA+ICBHTElCQ19JR05PUkVf
Q1ZFUyArPSBDVkUtMjAyNi00NDM4Cj4gPiArR0xJQkNfQ1ZFLTIwMjYtNDQzOF9TVEFUVVMgPSBm
aXhlZAo+ID4gK0dMSUJDX0NWRS0yMDI2LTQ0MzhfREVUQUlMID0gZ2xpYmMtMi40My0xNy1nZGQ5
OTQ1YzBiYTQwZDJkYmM5ZWI3Yzk5MjkxYmE2YjY5YmQ2NjcxOAo+ID4gIAo+ID4gLSMgRml4ZWQg
YnkgZ2xpYmMtMi40My0yMi1nODM2MmU4Y2UxMGIyNDA2OGJhY2MxOTU1MmMxMjhkZDEwZTA4MmZk
OQo+ID4gIEdMSUJDX0lHTk9SRV9DVkVTICs9IENWRS0yMDI2LTQwNDYKPiA+ICtHTElCQ19DVkUt
MjAyNi00MDQ2X1NUQVRVUyA9IGZpeGVkCj4gPiArR0xJQkNfQ1ZFLTIwMjYtNDA0Nl9ERVRBSUwg
PSBnbGliYy0yLjQzLTIyLWc4MzYyZThjZTEwYjI0MDY4YmFjYzE5NTUyYzEyOGRkMTBlMDgyZmQ5
Cj4gPiAgCj4gPiAtIyBGaXhlZCBieSBnbGliYy0yLjQzLTI2LWcyODkwYjM1Y2QzNjFkZjI1MTc1
MjViZjJjNWY4YzYzZjZmMGQ0YTIwCj4gPiAgR0xJQkNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjYt
NTkyOAo+ID4gK0dMSUJDX0NWRS0yMDI2LTU5MjhfU1RBVFVTID0gZml4ZWQKPiA+ICtHTElCQ19D
VkUtMjAyNi01OTI4X0RFVEFJTCA9IGdsaWJjLTIuNDMtMjYtZzI4OTBiMzVjZDM2MWRmMjUxNzUy
NWJmMmM1ZjhjNjNmNmYwZDRhMjAKPiA+ICAKPiA+IC0jIEZpeGVkIGJ5IGdsaWJjLTIuNDMtMjct
ZzQwNzBkODA4YmVhMWMwNzdlYjdlN2Q1MmI1MmI5MWNhZTk4MjA1ZDUKPiA+ICBHTElCQ19JR05P
UkVfQ1ZFUyArPSBDVkUtMjAyNi01NDUwCj4gPiArR0xJQkNfQ1ZFLTIwMjYtNTQ1MF9TVEFUVVMg
PSBmaXhlZAo+ID4gK0dMSUJDX0NWRS0yMDI2LTU0NTBfREVUQUlMID0gZ2xpYmMtMi40My0yNy1n
NDA3MGQ4MDhiZWExYzA3N2ViN2U3ZDUyYjUyYjkxY2FlOTgyMDVkNQo+ID4gIAo+ID4gLSMgVGhp
cyBDVkUgaXMgY29uc2lkZXJlZCBhcyBub3QgYmVpbmcgc2VjdXJpdHkgaXNzdWVzIGJ5Cj4gPiAt
IyB1cHN0cmVhbSBnbGliYzoKPiA+IC0jICBodHRwczovL3NlY3VyaXR5LXRyYWNrZXIuZGViaWFu
Lm9yZy90cmFja2VyL0NWRS0yMDEwLTQ3NTYKPiA+ICBHTElCQ19JR05PUkVfQ1ZFUyArPSBDVkUt
MjAxMC00NzU2Cj4gPiArR0xJQkNfQ1ZFLTIwMTAtNDc1Nl9TVEFUVVMgPSBmaXhlZAo+ID4gK0dM
SUJDX0NWRS0yMDEwLTQ3NTZfREVUQUlMID0gVGhpcyBDVkUgaXMgY29uc2lkZXJlZCBhcyBub3Qg
YmVpbmcgc2VjdXJpdHkgaXNzdWVzIGJ5IHVwc3RyZWFtIGdsaWJjOiBodHRwczovL3NlY3VyaXR5
LXRyYWNrZXIuZGViaWFuLm9yZy90cmFja2VyL0NWRS0yMDEwLTQ3NTYKPiA+ICAKPiA+ICAjIGds
aWJjIGlzIHBhcnQgb2YgdGhlIHRvb2xjaGFpbiBzbyBkaXNhYmxlIHRoZSB0b29sY2hhaW4gZGVw
ZW5kZW5jeQo+ID4gIEdMSUJDX0FERF9UT09MQ0hBSU5fREVQRU5ERU5DWSA9IE5PCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
