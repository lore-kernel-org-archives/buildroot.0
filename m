Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05E7C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 22:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9D7611A5;
	Wed,  8 Feb 2023 22:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9D7611A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5RKzTsM12D5s; Wed,  8 Feb 2023 22:22:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 474BB611A2;
	Wed,  8 Feb 2023 22:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 474BB611A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA691BF302
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 22:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46C0F4185A
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 22:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C0F4185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_UGzBUb7VBe for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 22:22:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B3141838
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17B3141838
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 22:22:01 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id hx15so1083579ejc.11
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 14:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p2GgbiMSK+wTTtWpOJUbzohEn3coK3CSytO3Sxs/2Ps=;
 b=j/J290659RfjMKyFCkReypedk4x50XiTNyQkqL6Ool2330tb4ckop1wo1KdHtm21AC
 kwWBZoBsKBmdth0tokFMKxazBAQO32KXRaPoZ8+vSiIbv19gtT6v5IBPykbLvwvbRrn3
 /9s+g+bJIkeuXDGlS4BOhRf3k0V5OvmG7jSQdgHCYYFIOf5RLKw2HNybRlRBP/6OfWbV
 gy+vlH4cjsmGtDNWI2/nCz9UCg9I7Nn+Eqcidoq6KB0M8wuiIpReG77nKOl4Di/tUCfO
 tZPVuRgRQsAXhdAEW3mOq3OEXWhGSc/RkCfufqwg/Yrsvdlb6GnWJj9OIrnI3ik/NVlT
 TaoQ==
X-Gm-Message-State: AO0yUKVfY344kkoDRKak2hp1D06IiHrLO7xqVBJy/CAekcbdLH+0k+F5
 8tiELh2wiTb3wZY9e+a8fb3N49IzLA97JJYFxlGYdYMul64=
X-Google-Smtp-Source: AK7set8WgtRmqJshqSyKrTaTF1wKwQXtlymA54U8GVDtDWBVYU1ynJmYhcVDn8VUQPNBAbA2G4tuc4EROL5/060mXco=
X-Received: by 2002:a17:906:604b:b0:889:8b2f:75d1 with SMTP id
 p11-20020a170906604b00b008898b2f75d1mr56309ejj.10.1675894919171; Wed, 08 Feb
 2023 14:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20230208094543.474237-1-fido_max@inbox.ru>
In-Reply-To: <20230208094543.474237-1-fido_max@inbox.ru>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Thu, 9 Feb 2023 01:21:47 +0300
Message-ID: <CALHCpMiPukwYdvVqR4_S2+fQjjwqkjEOY91qa4Owdc29eGyFLw@mail.gmail.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2GgbiMSK+wTTtWpOJUbzohEn3coK3CSytO3Sxs/2Ps=;
 b=WsiYX+srylMzhffsxWX9vb6hQSq4vY+3VDSR4RvE5Ml8wEleBBzisybq/GEEB8WmWp
 MEaNgXFnbiOK1DbLnQM5015lIUcCcPhxveiFZobsGChEZrMc2kGKiXSlBRcSeKI9dT4k
 Ofu85kgdx1BYOzzvxfQa36bzgHDs5CVUxGAmDfMrVNIFzhrTJJ30Q75VU2iIAjgV8L7P
 g+TAugvoGY/knen/E9RM1lnWzhb1wm4eJiILu4mcZulORHNVgGy7Tvt+/CFrRbCifO9F
 zaW9jM7hybeBB4nfjHPAHj6Hu2KKMkkhtqdRiHe6f4LykDVv02eY1Dkvbt9S51//cgRu
 mUsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WsiYX+sr
Subject: Re: [Buildroot] [PATCH 1/1] lksctp-tools: bump to version 1.0.19
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

0YHRgCwgOCDRhNC10LLRgC4gMjAyMyDQsy4g0LIgMTI6NDUsIE1heGltIEtvY2hldGtvdiA8Zmlk
b19tYXhAaW5ib3gucnU+Ogo+Cj4gUmVsZWFzZSBub3RlczogaHR0cHM6Ly9naXRodWIuY29tL3Nj
dHAvbGtzY3RwLXRvb2xzL2Jsb2IvdjEuMC4xOS9DaGFuZ2VMb2cKPgo+IFNpZ25lZC1vZmYtYnk6
IE1heGltIEtvY2hldGtvdiA8Zmlkb19tYXhAaW5ib3gucnU+Cj4gLS0tCj4gIHBhY2thZ2UvbGtz
Y3RwLXRvb2xzL2xrc2N0cC10b29scy5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvbGtzY3RwLXRv
b2xzL2xrc2N0cC10b29scy5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGtzY3Rw
LXRvb2xzL2xrc2N0cC10b29scy5oYXNoIGIvcGFja2FnZS9sa3NjdHAtdG9vbHMvbGtzY3RwLXRv
b2xzLmhhc2gKPiBpbmRleCBmYjg5MmZkYzNiLi5iM2ExZjU5ZDg2IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGtzY3RwLXRvb2xzL2xrc2N0cC10b29scy5oYXNoCj4gKysrIGIvcGFja2FnZS9sa3Nj
dHAtdG9vbHMvbGtzY3RwLXRvb2xzLmhhc2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAgIyBGcm9tIGh0
dHBzOi8vc291cmNlZm9yZ2UubmV0L3Byb2plY3RzL2xrc2N0cC9maWxlcy9sa3NjdHAtdG9vbHMv
Cj4gLW1kNSAgNjhlOWI4ZmE0ZDRlMzMxMDI5YjI0N2I3MmQ0NmQ3YTUgIGxrc2N0cC10b29scy0x
LjAuMTcudGFyLmd6Cj4gLXNoYTEgIDk0MWIwYjVjMzllMzY0YTk3MWY1MTRiYmE2NjEyMDQzNTY2
MGU1MTggIGxrc2N0cC10b29scy0xLjAuMTcudGFyLmd6Cj4gK21kNSAgMGZiYjI4OGM5Zjk2MjVi
ODhkM2FiMjFjOWVkOWYwMTEgIGxrc2N0cC10b29scy0xLjAuMTkudGFyLmd6Cj4gK3NoYTEgIGQ0
MTBhNTk2NDg1YzM4NDY0MTc3YTM4YWU3YzcwODE0NDRlNjU4OWUgIGxrc2N0cC10b29scy0xLjAu
MTkudGFyLmd6Cj4gICMgTG9jYWxseSBjb21wdXRlZAo+ICBzaGEyNTYgIGRlZTVmMzVlNTgzMTgz
YWJiOTIxMjkzODY0M2VjYjJkODU4ZmQ4OWUyZTI4NmY0YjFkOTAzZjY1ZDQ5ZDZjNzYgIENPUFlJ
TkcubGliCj4gIHNoYTI1NiAgY2MyYTY2NTFjMzE1YjIzM2ViYzExMGI0OWVhM2M2NDUyZWZmOWEy
OGY4YmMwNTFmZmQyYmI5MmE4ZGNmYTNkMiAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2xrc2N0cC10b29scy9sa3NjdHAtdG9vbHMubWsgYi9wYWNrYWdlL2xrc2N0cC10b29scy9sa3Nj
dHAtdG9vbHMubWsKPiBpbmRleCA1YWM3OTRlODQyLi5hZjg2YTI4NTE2IDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvbGtzY3RwLXRvb2xzL2xrc2N0cC10b29scy5tawo+ICsrKyBiL3BhY2thZ2UvbGtz
Y3RwLXRvb2xzL2xrc2N0cC10b29scy5tawo+IEBAIC00LDggKzQsOCBAQAo+ICAjCj4gICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4KPiAtTEtTQ1RQX1RPT0xTX1ZFUlNJT04gPSAxLjAuMTcKPiAt
TEtTQ1RQX1RPT0xTX1NJVEUgPSBodHRwOi8vZG93bmxvYWRzLnNvdXJjZWZvcmdlLm5ldC9wcm9q
ZWN0L2xrc2N0cC9sa3NjdHAtdG9vbHMKPiArTEtTQ1RQX1RPT0xTX1ZFUlNJT04gPSAxLjAuMTkK
PiArTEtTQ1RQX1RPT0xTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHNjdHAsbGtzY3RwLXRvb2xzLHYk
KExLU0NUUF9UT09MU19WRVJTSU9OKSkKPiAgTEtTQ1RQX1RPT0xTX0lOU1RBTExfU1RBR0lORyA9
IFlFUwo+ICAjIGNvbmZpZ3VyZSBub3Qgc2hpcHBlZAo+ICBMS1NDVFBfVE9PTFNfQVVUT1JFQ09O
RiA9IFlFUwo+IC0tCj4gMi4zOC4xCj4KCj4gU2lnbmVkLW9mZi1ieTogTWF4aW0gS29jaGV0a292
IDxmaWRvX21heEBpbmJveC5ydT4KVGVzdGVkLWJ5OiBNYWtzaW0gS2lzZWxldiA8YmlndW5jbGVt
YXhAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
