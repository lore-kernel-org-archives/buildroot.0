Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BD6C64EC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 07:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFEA141BB1;
	Fri,  3 Mar 2023 07:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFEA141BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtFmg9dFvmVM; Fri,  3 Mar 2023 07:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E323941A62;
	Fri,  3 Mar 2023 07:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E323941A62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E74B1BF3FC
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7662D60AE5
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7662D60AE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q_bBtsQkYPrl for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 07:37:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9439E60ACA
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9439E60ACA
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 07:37:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id o15so6623472edr.13
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 23:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677829030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VUekJ/n7NRaRWOC7RM4tslArAyUX2ohTDmmYi0MQABk=;
 b=SI5latcN6ABInIrxQrZtnZe9ojVqW9bdNMQB3NsBuOPbqeMKEf6pq7/MbXBg1onUGa
 fa+JNU+YBWUSMI1FAcMfBQ0jYujEaSjzCzfN9Buq+jwOqYjEtrkReMDQIiQf/spc4/Uf
 DQaSod7uBs+8ejJYI9G1j6WywjqAnUqnpbvDZDQ2q/6Yc40u0zG4hJj880jteqrmECxO
 M73o+pWv0B4LkrkYyeTyGVlGpIz6hCisHXxYkM2vpN0A4FJ99GT0mKobrBbw0hHM621y
 8SEdqcn/JU7Rr0NZzxFQp6dSRFyBZTt7+alFCC/YBldOqkRBneh8x0IhQuGYBc76nEnE
 qCIw==
X-Gm-Message-State: AO0yUKU1gj9fIXw52YkvR8oWZrFYe6L63663WU6QTkUWcAThVLczPD7D
 Vvrni154onFgRZ8S2zIZJXQ2X25QGj7J8Bk10mU=
X-Google-Smtp-Source: AK7set/6S9qkntjkEfLGlvjEHH7po5Kfc9jT7cyvjd4XQQqKHi/FmiHhFbP/hRGoiN54wcwgq+QOqg==
X-Received: by 2002:aa7:d814:0:b0:4ae:f496:ee2 with SMTP id
 v20-20020aa7d814000000b004aef4960ee2mr990086edq.20.1677829030316; 
 Thu, 02 Mar 2023 23:37:10 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 z92-20020a509e65000000b004bc11e5f8b9sm804867ede.83.2023.03.02.23.37.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 23:37:09 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id cy23so6633629edb.12
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 23:37:09 -0800 (PST)
X-Received: by 2002:a17:906:398a:b0:877:747e:f076 with SMTP id
 h10-20020a170906398a00b00877747ef076mr335706eje.0.1677829029452; Thu, 02 Mar
 2023 23:37:09 -0800 (PST)
MIME-Version: 1.0
References: <c5c998e135a5915b35bde46cd6c191610777aaf8.1677663986.git.stefan@agner.ch>
In-Reply-To: <c5c998e135a5915b35bde46cd6c191610777aaf8.1677663986.git.stefan@agner.ch>
Date: Thu, 2 Mar 2023 23:36:58 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pWZA1gzzb+BGHg6G_8Gi-K85_OkoThkMw82BGg95pJgw@mail.gmail.com>
Message-ID: <CA+h8R2pWZA1gzzb+BGHg6G_8Gi-K85_OkoThkMw82BGg95pJgw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google; t=1677829030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUekJ/n7NRaRWOC7RM4tslArAyUX2ohTDmmYi0MQABk=;
 b=CEr05kEG7e7vrSPnFT8FI7VSd3mBimgasBNWKKYscv9fBskIi+R78jTJOXri+shd30
 nXsXJ5+5W+jAIQK7ZRnBdDVp4EBBJUVsQrlDdAmwsEZ4zWk2b1PP2lMK4aOLh2qoaNac
 920nk87Cd+pW1r2DMUzAy/1DFolmsTeLBaRCG510c850bTh3uYeqPbGMyejSxkU5/8bF
 AOZf9pHkrqd0BVqbHv6j6C5/BFixjg3xphQXDro8Jmn2sVNVR2CdCcZopnH/6Qxkxn6o
 oTeyZcWPNIb7VzbO0DBTcZmvIQ9NM1ehvkjEsPUyXSoYRAjVrqmkuIgfddEJytwoFHb4
 WXaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=CEr05kEG
Subject: Re: [Buildroot] [PATCH] package/docker-engine: remove non-existing
 build tags
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFuLAoKT24gV2VkLCBNYXIgMSwgMjAyMyBhdCAxOjQ24oCvQU0gU3RlZmFuIEFnbmVy
IDxzdGVmYW5AYWduZXIuY2g+IHdyb3RlOgo+Cj4gVGhlIHNlY2NvbXAgYW5kIGFwcGFybW9yIGJ1
aWxkIHRhZ3MgaGF2ZSBiZWVuIHJlbW92ZWQgaW4gMjMuMC4wLiBEb24ndAo+IHVzZSB0aG9zZSBi
dWlsZHRhZ3MgYW55bW9yZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3RlZmFu
QGFnbmVyLmNoPgo+IC0tLQo+ICBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5t
ayB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsgYi9wYWNrYWdlL2RvY2tl
ci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tawo+IGluZGV4IGNhMWFhMjdiMGEuLjBlY2I1ZDIyNTEg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKPiAr
KysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tawo+IEBAIC0yOCwxMSAr
MjgsOSBAQCBET0NLRVJfRU5HSU5FX0JVSUxEX1RBUkdFVFMgPSBjbWQvZG9ja2VyZCBjbWQvZG9j
a2VyLXByb3h5Cj4KPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJBUFBBUk1PUikseSkKPiAgRE9D
S0VSX0VOR0lORV9ERVBFTkRFTkNJRVMgKz0gbGliYXBwYXJtb3IKPiAtRE9DS0VSX0VOR0lORV9U
QUdTICs9IGFwcGFybW9yCj4gIGVuZGlmCj4KPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJTRUND
T01QKSx5KQo+IC1ET0NLRVJfRU5HSU5FX1RBR1MgKz0gc2VjY29tcAo+ICBET0NLRVJfRU5HSU5F
X0RFUEVOREVOQ0lFUyArPSBsaWJzZWNjb21wCj4gIGVuZGlmCgpMR1RNLAoKUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AcGFyYWwuaW4+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
