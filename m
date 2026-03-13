Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC3C107BCE5
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B7D40D4B;
	Fri, 13 Mar 2026 20:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHRlKOdNJjKV; Fri, 13 Mar 2026 20:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FEF740D28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434138;
	bh=iiM2BdYxWnpjRSoSU1360iMjDbOfZXFjw074aBFBfCg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GdaNBqOncKcCFR1rnA6HZQCGebiwzRc375WUPXk2J64r6lIfanbAdBqo9/97b/fu8
	 CkcGd/QniPzPeD3j2zJwjy/hYraqmWdssbFCV4ex//dV9D2UU0z9OUXsOPjqV86edM
	 KdIwbxqIOdduDthM09LjSO5hbeqfCp+c/TFgd5GvGl6k50jxSksUNfGQ6oxtxBQ2a6
	 THnoHb2JvWhOIxrzwyeQFoay24gtt5vq53Uu71ROQ4KiWuHq6tuohoDi0haxwbw8lO
	 BkYl1LmhEkoMcoukbjBoXLFEwLWqmZdLk/Ku8y/mxx3kVuPjrMZUmOEPcgIL0AYzBI
	 PoUAGTOVZS5Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FEF740D28;
	Fri, 13 Mar 2026 20:35:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D01C8201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF6AE60DE5
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufsJovloIFbx for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:35:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B378260DE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B378260DE4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B378260DE4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:35:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4853c3c2fe7so15872315e9.0
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 13:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773434133; x=1774038933;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3FfDy6Fcw/OYB6AIJ7lmGwtfVCQtbqDEeu0x9Oh3tnA=;
 b=PyIli1gwP1sx4wv6H6XdeV7ON4AysDfGs//VGxaV+TGuCGpZKnVSFo4/gnfmuoYPfj
 JhjANw098vlAXLoN1vXpVith2WDsCBiXJ3fFRHGhhgJDjbOKVC92hvuqAPSuCXvQT9tv
 Aiveud+964kU0uzY/4DRRMHZcQAUfz8H6rKrGbQSx1E3B2M8uF6NxOF4jCsu0+ebGiY1
 T4QR3KK6nvgFbaQqrIMbRHQwX5OEdYzn0nzrHFrQFLSR3raTFSknSSF3l9kpbFNp2h72
 BKDFBYyxlHswhIkSqcnYqtn2A5saHFo1Tnj5t/U6RaYBHR5pM2B2AwOySw5TiBpKkLeS
 Jw6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYhySlUMk0CLBuQ0qp4L8SCW7shUov1pPvZfil92eL4ediz8YyAx8KXKZJLmsEkRkHn5j9xlVtULQ=@buildroot.org
X-Gm-Message-State: AOJu0YzPu++U48TvZG+gM4YGFcLY0dmTQa3xwbI+dV9LHDaATUQ3hMik
 UvxOFf7wOYF2du8S+rSyWNmfE3lsgZhXasCgH2/3pW8kTIrRbSlx6H9OYIiQq1lqZEZJuAZPAW6
 Dh7X6
X-Gm-Gg: ATEYQzw30o9ESYuEWcEcpPmDTh2SZG+GMVjENrTQ8TUgjX0Yb7qwQjTr6a9TWPTtTlU
 iOcTHK2M0Agpd1VSNYYpqxGGYQ8vhStpCgDTo1CxHj15XsKoRvg+JzW9DlYiKwSrn/gE4dOY6tS
 JuP3lwcKQqLCYZRAKKVfcN4Gh2gQhORgrvXB09sihjtdyFQoXVGurj2u3+15F85n8QZAENeYquH
 mIQ+r1x3T5zVs7rUgIo1A0xQgkRdBQRGpWTfVpSq5yOb+qS4KDWNJNXZhLZ+9E7avzkpT0BFJWh
 PpmIGMlZZ3UpKitjqiDWoHGvxmgv9chH94SiqZdeJid2M3yhJLWncEO7CinbuaKV7Iw5hUh44sj
 q1Oj8xr1VZEo/cqOQr071mAEfwG/XmrR01KO2kaLqvEamk87KTulQhkd8s55Yd7H+YT7KDW8G/A
 Yd5F1v2HHBT1QXQwSO/2w5x1/AqU3jm8r9SHsVmyUfVxl1uzAHxbt98XlEVGZdGeUBUOygi8q0T
 rzJR4cSrckqA3AiA0OOcjt1gEC59v9OcR9m57r8AaYZO6YfYaUgGkuhQG5RFdl4QQ==
X-Received: by 2002:a05:6000:22c3:b0:439:bcb8:54b7 with SMTP id
 ffacd0b85a97d-43a04d81618mr9165305f8f.15.1773434133225; 
 Fri, 13 Mar 2026 13:35:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fdf09abesm20429364f8f.0.2026.03.13.13.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 13:35:32 -0700 (PDT)
Message-ID: <3d5751ac-011c-47ea-abaf-c81ef433c497@smile.fr>
Date: Fri, 13 Mar 2026 21:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <cover.1772121240.git.yann.morin@orange.com>
 <5cec881be3d44fb6d5b4fae4b90ef1a6a191d594.1772121240.git.yann.morin@orange.com>
Content-Language: fr
In-Reply-To: <5cec881be3d44fb6d5b4fae4b90ef1a6a191d594.1772121240.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773434133; x=1774038933; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3FfDy6Fcw/OYB6AIJ7lmGwtfVCQtbqDEeu0x9Oh3tnA=;
 b=uhqUxNmfbjc8Dhy8xmbe3hLSK2nOWSdCc7aZLf0AyNTMWSaNC61ROLOXTPrx1sC6jN
 Ir1W56B1mTsu5XOlWtq8BxJMTpfGTct7xsTtsMowFIBooP+HH511l7rYXPKFCyiDfWHH
 /AVHgm17PsVppEwWSY0Nzhlnz6PijeODPy9k8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=uhqUxNmf
Subject: Re: [Buildroot] [PATCH 08/11 v3] package/mosquitto: add option to
 enable the persist-sqlite plugin
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

SGVsbG8gWWFubiwgQWxsLAoKTGUgMjYvMDIvMjAyNiDDoCAxNjo1NCwgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIGEgw6ljcml0wqA6Cj4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Cj4gCj4gVGhhdCBwbHVnaW4gY2FuIGJlIHVzZWQgaW5zdGVhZCBvZiB0aGUgYnVp
bHRpbiBzdXBwb3J0IHRvIHBlcnNpc3QgdGhlCj4gbW9zcXVpdHRvIHN0YXRlIGFjcm9zcyByZXN0
YXJ0cy4KPiAKPiBOb3RlIHRoYXQgdGhpcyBwbHVnaW4gaGFzIGEgZGVwZW5kZW5jeSwgc28gd2Ug
ZG9uJ3QgdXNlIHRoZSAkKGlmKQo+IG9uZS1saW5lci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5u
IEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+Cj4gQ2M6IFBldGVyIEtvcnNnYWFyZCA8
cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiBDYzogVGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNo
cmlzdG9waGVAbWluZC5iZT4KPiAtLS0KPiAgcGFja2FnZS9tb3NxdWl0dG8vQ29uZmlnLmluICAg
IHwgNyArKysrKysrCj4gIHBhY2thZ2UvbW9zcXVpdHRvL21vc3F1aXR0by5tayB8IDggKysrKysr
Ky0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW9zcXVpdHRvL0NvbmZpZy5pbiBiL3BhY2thZ2UvbW9z
cXVpdHRvL0NvbmZpZy5pbgo+IGluZGV4IDFkN2NkOTZhYmEuLjAyYTMwYzAzZTUgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9tb3NxdWl0dG8vQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9tb3NxdWl0
dG8vQ29uZmlnLmluCj4gQEAgLTEwOSw2ICsxMDksMTMgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01P
U1FVSVRUT19CUk9LRVJfRFlOQU1JQ19TRUNVUklUWV9QTFVHSU4KPiAgCSAgQnVpbGQgYW5kIGlu
c3RhbGwgdGhlIGR5bmFtaWMgc2VjdXJpdHkgcGx1Z2luIGZvcgo+ICAJICBtb3NxdWl0dG8gYnJv
a2VyIG9udG8gdGFyZ2V0Lgo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX01PU1FVSVRUT19CUk9L
RVJfUExVR0lOX1BFUlNJU1RfU1FMSVRFCj4gKwlib29sICJwZXJzaXN0LXNxbGl0ZSBwbHVnaW4i
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfU1FMSVRFCj4gKwloZWxwCj4gKwkgIEFkZCB0aGUgcGVy
c2lzdC1zcWxpdGUgcGx1Z2luLCB0byBwZXJzaXN0IHRoZSBicm9rZXIKPiArCSAgc3RhdGUgYWNy
b3NzIHJlc3RhcnRzLgo+ICsKPiAgZW5kaWYKPiAgCj4gIGNvbW1lbnQgIm1vc3F1aXR0byBicm9r
ZXIgbmVlZHMgYSB0b29sY2hhaW4gdy8gZHluYW1pYyBsaWJyYXJ5Igo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL21vc3F1aXR0by9tb3NxdWl0dG8ubWsgYi9wYWNrYWdlL21vc3F1aXR0by9tb3NxdWl0
dG8ubWsKPiBpbmRleCBkOTU1ODNkNzY4Li4yNDZkY2I4MjI3IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvbW9zcXVpdHRvL21vc3F1aXR0by5tawo+ICsrKyBiL3BhY2thZ2UvbW9zcXVpdHRvL21vc3F1
aXR0by5tawo+IEBAIC04OSw3ICs4OSw2IEBAIE1PU1FVSVRUT19DT05GX09QVFMgKz0gXAo+ICAJ
LURXSVRIX0JST0tFUj1PTiBcCj4gIAktRFdJVEhfUExVR0lOUz1PTiBcCj4gIAktRFdJVEhfUExV
R0lOX0VYQU1QTEVTPU9GRiBcCj4gLQktRFdJVEhfUExVR0lOX1BFUlNJU1RfU1FMSVRFPU9GRiBc
Cj4gIAktRFdJVEhfUExVR0lOX1NQQVJLUExVR19BV0FSRT1PRkYgXAo+ICAJLURXSVRIX1BMVUdJ
Tl9QQVNTV09SRF9GSUxFPSQoaWYgJChCUjJfUEFDS0FHRV9NT1NRVUlUVE9fQlJPS0VSX1BMVUdJ
Tl9TVEFUSUNfUEFTU1dEKSxPTixPRkYpIFwKPiAgCS1EV0lUSF9QTFVHSU5fQUNMX0ZJTEU9JChp
ZiAkKEJSMl9QQUNLQUdFX01PU1FVSVRUT19CUk9LRVJfUExVR0lOX1NUQVRJQ19BQ0wpLE9OLE9G
RikgXAo+IEBAIC0xMDIsNiArMTAxLDEzIEBAIGVsc2UKPiAgTU9TUVVJVFRPX0NPTkZfT1BUUyAr
PSAtRFdJVEhfSFRUUF9BUEk9T0ZGCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdF
X01PU1FVSVRUT19CUk9LRVJfUExVR0lOX1BFUlNJU1RfU1FMSVRFKSx5KQo+ICtNT1NRVUlUVE9f
REVQRU5ERU5DSUVTICs9IHNxbGl0ZQo+ICtNT1NRVUlUVE9fQ09ORl9PUFRTICs9IC1EV0lUSF9Q
TFVHSU5fUEVSU0lTVF9TUUxJVEU9T00KCkkgZml4ZWQgdG8gJ09OJwoKQmVzdCByZWdhcmRzLApS
b21haW4KCgo+ICtlbHNlCj4gK01PU1FVSVRUT19DT05GX09QVFMgKz0gLURXSVRIX1BMVUdJTl9Q
RVJTSVNUX1NRTElURT1PRkYKPiArZW5kaWYKPiArCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfU1lT
VEVNRCkseSkKPiAgTU9TUVVJVFRPX0RFUEVOREVOQ0lFUyArPSBzeXN0ZW1kCj4gIE1PU1FVSVRU
T19DT05GX09QVFMgKz0gLURXSVRIX1NZU1RFTUQ9T04KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
