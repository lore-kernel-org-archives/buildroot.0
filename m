Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B185C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 11:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF0B241738;
	Thu, 26 Oct 2023 11:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF0B241738
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a71-KBAH8-17; Thu, 26 Oct 2023 11:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D866E417E1;
	Thu, 26 Oct 2023 11:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D866E417E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF16C1BF414
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA49B42726
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA49B42726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YK7aBXncNPrW for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 11:49:16 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B911342720
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 11:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B911342720
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so1054218e87.1
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 04:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698320953; x=1698925753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gm3TjthMejdeVqt44ZNYU07AJSyDTR+xPzxl4TSH1Rw=;
 b=Vu89hTHGz2BuTLbh052H0MoWT8hIR0Wreq/C96nLZXcWoFLSD4s/IWINdx+Xh5vZGG
 IW1ljAqZBgEvhAoHeKaUG4gdFI9QrgpdgYWqV+Z3wWEAIJS+YPMjWC68WQooTtF1Y6mr
 xNDmM5rE38iYdkd0ofaqu/8+QmWpwqraIT8tYsj7T69XFGTuhW9WGARRaKG6plMVgLra
 16IWctYCPMhTykrU7XntmWuKi2DpyvYO27dHoS1Zpw3VpIalbnwUOLpdtJ3BsHzs0URz
 pEPR04ogHAfJiXNYFQv9lMgJpzIrRd8oW8WBZs9WZG6/o6WOcqPat2kUmx3VWlUFhIOZ
 vxkQ==
X-Gm-Message-State: AOJu0YzYSeUxT4FLpntzEPOaVBQdsR1B4ohmSeaaFGJvT4om2YH+2BUg
 wTtp5ItG93wBjVFOlOCsIij+Ob0f8KLjaoAS7HY=
X-Google-Smtp-Source: AGHT+IFUYmySaw7ouJXpuhrwEMR3suUJ+FAkn/xupffsDoxzQ0NWEHn57txx+ZDTYVhwrdpJ7yON/Ez6LePp0ekAy1o=
X-Received: by 2002:ac2:5470:0:b0:500:a6c1:36f7 with SMTP id
 e16-20020ac25470000000b00500a6c136f7mr13817516lfn.3.1698320952898; Thu, 26
 Oct 2023 04:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-20-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-20-adam.duskett@amarulasolutions.com>
Date: Thu, 26 Oct 2023 13:49:02 +0200
Message-ID: <CAGm1_ksXvQnV=Tjs=UR9afm3h=zLi5_pEXwSqr9pMQOngWGQMg@mail.gmail.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1698320953; x=1698925753; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gm3TjthMejdeVqt44ZNYU07AJSyDTR+xPzxl4TSH1Rw=;
 b=E7yS5JRlGpWcnxsYeW/yt2J3NwR/aqhTpTXt5voFVu7whCjMktjX86c3KGR6zxW60p
 VZuHaAzB9BmcpQVlyii2FmZUnILWANHyAc7CTJtthRrB4ulGTnYyB2oS2OLYhgg1TMEd
 UkUZb6DXpZBxNFkvsKzsKCMoqh9eXwc++VFTcej+TAYchyCkyTT+9IY9s9jAN0MGxE64
 kMu4RkuBArSV4NbFiLw7BmlObxrD6wNMYz8w2HZ5/XIZpqA/Qga8uHQ3SgKtOq4h72Ot
 PjFdD06mCbXosqcRsgHiy+S6LN1fuo/bEd40Ruf2Kmm1E287svJPEM2hxNwP4IaXMJOB
 KtMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E7yS5JRl
Subject: Re: [Buildroot] [PATCH 19/30] package/libftdi: add patch to move
 from distutils to sysconfig
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWRhbSwKCk9uIFRodSwgT2N0IDI2LCAyMDIzIGF0IDExOjI34oCvQU0gQWRhbSBEdXNrZXR0
CjxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+Cj4gSW4gcHJlcGVy
YXRpb24gb2YgcHl0aG9uIDMuMTIuMCwgZGlzdHV0aWxzIGhhcyBiZWVuIHJlbW92ZWQgY29tcGxl
dGVseS4KPiBUaGlzIGlzIGEgcGF0Y2ggdGFrZW4gZnJvbSB0aGUgRmVkb3JhIDM5IFJQTTogbGli
ZnRkaS0xLjUtMTAuZmMzOS54ODZfNjQuCj4KPiBVcHN0cmVhbSBjb21taXQ6IGFiZDE5YjcyMWY3
ZTliNGQ1MTRlZDMxOWVjZTE3M2ViYzdiMWVhNzIKPgo+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRHVz
a2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICAuLi4wMDMt
bW92ZS1mcm9tLWRpc3R1dGlscy10by1zeXNjb25maWcucGF0Y2ggfCAzMiArKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2xpYmZ0ZGkvMDAwMy1tb3ZlLWZyb20tZGlzdHV0aWxzLXRvLXN5c2Nv
bmZpZy5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZnRkaS8wMDAzLW1vdmUtZnJv
bS1kaXN0dXRpbHMtdG8tc3lzY29uZmlnLnBhdGNoIGIvcGFja2FnZS9saWJmdGRpLzAwMDMtbW92
ZS1mcm9tLWRpc3R1dGlscy10by1zeXNjb25maWcucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAuLmNiMTc5YzdjZGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
cGFja2FnZS9saWJmdGRpLzAwMDMtbW92ZS1mcm9tLWRpc3R1dGlscy10by1zeXNjb25maWcucGF0
Y2gKPiBAQCAtMCwwICsxLDMyIEBACj4gK0Zyb20gODcyY2Q0ODA5OTBlNjUzNmQyY2Y0ODU2ODYy
NzkwM2ViZjVhY2JlYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogRGFuIEhvciA8
ZGFuQGRhbm55LmN6Pgo+ICtEYXRlOiBUdWUsIDI0IE9jdCAyMDIzIDEwOjM2OjA5ICswMjAwCj4g
K1N1YmplY3Q6IFtQQVRDSF0gbW92ZSBmcm9tIGRpc3R1dGlscyB0byBzeXNjb25maWcKPiArCj4g
K1RoZSBkaXN0dXRpbHMgbW9kdWxlIHdhcyBkZXByZWNhdGVkIGluIFB5dGhvbiAzLjEwLCB0aHVz
IHN3aXRjaCB0byB0aGUKPiArc3lzY29uZmlnIG1vZHVsZSBpbnN0ZWFkLgo+ICsKPiArVXBzdHJl
YW06IGNvbW1pdHRlZCBhYmQxOWI3MjFmN2U5YjRkNTE0ZWQzMTllY2UxNzNlYmM3YjFlYTcyCj4g
Kwo+ICtTaWduZWQtb2ZmLWJ5OiBEYW4gSG9yIDxkYW5AZGFubnkuY3o+Cj4gK1NpZ25lZC1vZmYt
Ynk6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ICst
LS0KPiArIHB5dGhvbi9DTWFrZUxpc3RzLnR4dCB8IDIgKy0KPiArIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3B5dGhvbi9D
TWFrZUxpc3RzLnR4dCBiL3B5dGhvbi9DTWFrZUxpc3RzLnR4dAo+ICtpbmRleCA1YjZmNDIwLi4x
OWNlNTAwIDEwMDY0NAo+ICstLS0gYS9weXRob24vQ01ha2VMaXN0cy50eHQKPiArKysrIGIvcHl0
aG9uL0NNYWtlTGlzdHMudHh0Cj4gK0BAIC00Miw3ICs0Miw3IEBAIGVuZGlmICgpCj4gKwo+ICsg
c2V0X3RhcmdldF9wcm9wZXJ0aWVzICggJHtTV0lHX01PRFVMRV9mdGRpMV9SRUFMX05BTUV9IFBS
T1BFUlRJRVMgTk9fU09OQU1FIE9OICkKPiArCj4gKy1leGVjdXRlX3Byb2Nlc3MgKCBDT01NQU5E
ICR7UFlUSE9OX0VYRUNVVEFCTEV9IC1jICJmcm9tIGRpc3R1dGlscyBpbXBvcnQgc3lzY29uZmln
OyBwcmludCggc3lzY29uZmlnLmdldF9weXRob25fbGliKCBwbGF0X3NwZWNpZmljPVRydWUsIHBy
ZWZpeD0nJHtDTUFLRV9JTlNUQUxMX1BSRUZJWH0nICkgKSIKPiArK2V4ZWN1dGVfcHJvY2VzcyAo
IENPTU1BTkQgJHtQWVRIT05fRVhFQ1VUQUJMRX0gLWMgImltcG9ydCBzeXNjb25maWc7IHByaW50
KCBzeXNjb25maWcuZ2V0X3BhdGgoICdwbGF0bGliJywgdmFycz17J3BsYXRiYXNlJzogJyR7Q01B
S0VfSU5TVEFMTF9QUkVGSVh9J30gKSApIgo+ICsgICAgICAgICAgICAgICAgICAgT1VUUFVUX1ZB
UklBQkxFIF9BQlNfUFlUSE9OX01PRFVMRV9QQVRICj4gKyAgICAgICAgICAgICAgICAgICBPVVRQ
VVRfU1RSSVBfVFJBSUxJTkdfV0hJVEVTUEFDRSApCgpEbyB5b3UgbWVhbiBsaWJmdGRpMSBwYWNr
YWdlIGFuZCBub3QgbGliZnRkaT8KClJlZ2FyZHMsClllZ29yCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
