Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043DCC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 14:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F63F400C4;
	Sun,  4 Feb 2024 14:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F63F400C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUitJXK1sUlV; Sun,  4 Feb 2024 14:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FD864011F;
	Sun,  4 Feb 2024 14:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD864011F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 860281BF368
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 14:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EB8C416D3
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 14:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB8C416D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdaIqfci22in for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 14:07:07 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29786402B1
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 14:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29786402B1
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-603fd31f5c2so36113987b3.0
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 06:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707055626; x=1707660426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d6R/uMw302vxK91tvpa9tXrBLZprby8wX6uTL7oOHVk=;
 b=SIz7Vgb0JnZ+3Exu7h6sRq3XOqjU3AsOL49EZYsoz9D33FDteA+RyIGlxM5zDQuP4q
 uNjuayJLN6LpnsXNYq20l8TOsF9KLiIEfcGymhPDJSsLY59lFfJNMQJyy7IrjNPAOkdj
 ts8cNXWWaGS30aGClD9SZkzOvB2kn745YcC19DN6wweLWTIoFlRFZNEGw8xQrn9thOvS
 bNbW1bvBtw6byMQKbnhx5wIs537H0uQflPp3FQUeqlyr/FJF0+c/gxJMFoKe+ixMK7sP
 gXG4CVK9y8VleCgbWQOSxnKT51IlVK4FJDO7XkmHRXvZN26ciPmmEh4Hzq9aEsZx8wze
 DuQw==
X-Gm-Message-State: AOJu0Yxdl6IxTJMRq6r7om9bK1QG46H7F1jdcvNDWqMkgcR1zYZUQw/u
 Rf+Wbw1O1DNUO9sibJIGZD6wyuDxX6GrkctFJiHTsSxecCMiu5+kFijXP4AUfGFym71kpL+vyhG
 nksoWt4YJOynq/PaSKKt/dronvm0=
X-Google-Smtp-Source: AGHT+IE/YfYGsi6TaitrV3p8kG/bVchw0nnOBtR5/75DIU0YXsfl9EjFpr9kmnZjeVhUgSqWnplzbO2xwqeEgjYzETE=
X-Received: by 2002:a81:ae52:0:b0:604:74a:513c with SMTP id
 g18-20020a81ae52000000b00604074a513cmr2085017ywk.5.1707055625979; Sun, 04 Feb
 2024 06:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20240204133557.1512951-1-fontaine.fabrice@gmail.com>
 <20240204133557.1512951-3-fontaine.fabrice@gmail.com>
 <Zb-X6P9fUI5FEWvj@landeda>
In-Reply-To: <Zb-X6P9fUI5FEWvj@landeda>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 4 Feb 2024 15:06:53 +0100
Message-ID: <CAPi7W80beUNG_Z773eTF7Jh3ybx8zOw5-pxid7F4OvXncGY1Dw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707055626; x=1707660426; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6R/uMw302vxK91tvpa9tXrBLZprby8wX6uTL7oOHVk=;
 b=CNy1lo64LOwLznhmppkFzKNdeqo2+o7A61Snq7qA+DSbdWEcTsL98rq5hiJpgAc6/E
 iD8BzXiL2Cr3nTeR9mZAZwTdjGYPY8fFOnmeAAwnR7LWxr+KAfu9PoF6qIsVo1LH3Gma
 LxCSSvb4n6L8ZRyjVCsEQjTYN0iMhBkCD3B6wSXcBifwAIz28vYgtjVA0jH0I6zdFJ6r
 49UdQL1JNz5sTENQ7YNoZQxTrQiOUIODhwXPRUZjNnoGB00vC38nHJ+tyZwbFLnOsS2G
 n9Nvpi3jaojSUSQufS4c/usmCxSAJnsMeODWg2zdc0Z0LPwk9a3/IX6JTfjyKzSoIptt
 h3Ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CNy1lo64
Subject: Re: [Buildroot] [PATCH 3/3] utils/checkpackagelib: add
 RemoveDefaultPackageCpeIdProductVariable
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
Cc: Christian Stewart <christian@aperture.us>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIGRpbS4gNCBmw6l2ci4gMjAyNCDDoCAxNDo1OCwgWWFubiBFLiBNT1JJ
TiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEZhYnJpY2UsIEFsbCwK
Pgo+IFRoYW5rcyBmb3Igd29ya2luZyBvbiBteSBzdWdnZXN0aW9uISBTb3JyeSwgSSB3YXMgbm90
IHF1aWNrIGVub3VnaCB0aGF0Cj4gSSB3YXMgdGFja2xpbmcgaXQgb24gbXkgc2lkZS4uLiBTZWUg
YmVsb3cgZm9yIHNvbWUgY29tbWVudHMuLi4KPgo+IE9uIDIwMjQtMDItMDQgMTQ6MzUgKzAxMDAs
IEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gQXMgYWR2aXNlZCBieSBZYW5uIEUu
IE1vcmluIFsxXSwgYWRkCj4gPiBSZW1vdmVEZWZhdWx0UGFja2FnZUNwZUlkUHJvZHVjdFZhcmlh
YmxlCj4gPgo+ID4gWzFdOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjQwMjA0MTAzMjA0LjE0MTU1OTItMS1mb250YWluZS5mYWJyaWNlQGdt
YWlsLmNvbQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgdXRpbHMvY2hlY2twYWNrYWdlbGliL2xp
Yl9tay5weSB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3V0aWxzL2NoZWNrcGFja2FnZWxpYi9s
aWJfbWsucHkgYi91dGlscy9jaGVja3BhY2thZ2VsaWIvbGliX21rLnB5Cj4gPiBpbmRleCA1NTFj
ODcxNjhmLi5iNWNmZGQ3ZjQxIDEwMDY0NAo+ID4gLS0tIGEvdXRpbHMvY2hlY2twYWNrYWdlbGli
L2xpYl9tay5weQo+ID4gKysrIGIvdXRpbHMvY2hlY2twYWNrYWdlbGliL2xpYl9tay5weQo+ID4g
QEAgLTIyNyw2ICsyMjcsMjQgQEAgY2xhc3MgUmVtb3ZlRGVmYXVsdFBhY2thZ2VTb3VyY2VWYXJp
YWJsZShfQ2hlY2tGdW5jdGlvbik6Cj4gPiAgICAgICAgICAgICAgICAgICAgICB0ZXh0XQo+ID4K
PiA+Cj4gPiArY2xhc3MgUmVtb3ZlRGVmYXVsdFBhY2thZ2VDcGVJZFByb2R1Y3RWYXJpYWJsZShf
Q2hlY2tGdW5jdGlvbik6Cj4gPiArICAgIGRlZiBiZWZvcmUoc2VsZik6Cj4gPiArICAgICAgICBw
YWNrYWdlLCBfID0gb3MucGF0aC5zcGxpdGV4dChvcy5wYXRoLmJhc2VuYW1lKHNlbGYuZmlsZW5h
bWUpKQo+ID4gKyAgICAgICAgcGFja2FnZV91cHBlciA9IHBhY2thZ2UucmVwbGFjZSgiLSIsICJf
IikudXBwZXIoKQo+ID4gKyAgICAgICAgc2VsZi5wYWNrYWdlID0gcGFja2FnZQo+ID4gKyAgICAg
ICAgc2VsZi5GSU5EX0NQRV9JRF9QUk9EVUNUID0gcmUuY29tcGlsZSgKPiA+ICsgICAgICAgICAg
ICByIl57fV9DUEVfSURfUFJPRFVDVFxzKj1ccyp7fSQiCj4gPiArICAgICAgICAgICAgLmZvcm1h
dChwYWNrYWdlX3VwcGVyLCBwYWNrYWdlLCBwYWNrYWdlX3VwcGVyKSkKPiA+ICsKPiA+ICsgICAg
ZGVmIGNoZWNrX2xpbmUoc2VsZiwgbGluZW5vLCB0ZXh0KToKPiA+ICsgICAgICAgIGlmIHNlbGYu
RklORF9DUEVfSURfUFJPRFVDVC5zZWFyY2godGV4dCk6Cj4gPiArCj4gPiArICAgICAgICAgICAg
cmV0dXJuIFsie306e306IHJlbW92ZSBkZWZhdWx0IHZhbHVlIG9mIF9DUEVfSURfUFJPRFVDVCB2
YXJpYWJsZSAiCj4gPiArICAgICAgICAgICAgICAgICAgICAiKHt9I2dlbmVyaWMtcGFja2FnZS1y
ZWZlcmVuY2UpIgo+ID4gKyAgICAgICAgICAgICAgICAgICAgLmZvcm1hdChzZWxmLmZpbGVuYW1l
LCBsaW5lbm8sIHNlbGYudXJsX3RvX21hbnVhbCksCj4gPiArICAgICAgICAgICAgICAgICAgICB0
ZXh0XQo+Cj4gVGhpcyBpcyBhY3R1YWxseSBhIGxpdHRsZSBiaXQgbW9yZSBjb21wbGV4IHRoYW4g
dGhhdC4gSW5kZWVkLCBpZiB0aGVyZQo+IGlzIG5vIENQRSB2YXJpYWJsZSBzZXQsIHdlIGRvIG5v
dCBjb25zaWRlciBGT09fQ1BFX0lEIHRvIGJlIHZhbGlkLCBidXQKPiBpZiB0aGUgdXNlciBkb2Vz
IHByb3ZpZGUgb25lIENQRSB2YXJpYWJsZSwgdGhlbiB3ZSBjb25uc2lkZXIgRk9PX0NQRV9JRAo+
IHRvIGJlIHZhbGlkLgo+Cj4gT2YgY291cnNlLCBpbiB0aGF0IGNhc2UsIHdlIHdhbnQgdG8gYWxs
b3cgZm9yIHRoZSBDUEUgdmFyaWFibGUgdG8gYmUgdGhlCj4gZGVmYXVsdCwgaWYgdGhhdCdzIHRo
ZSBhY3R1YWwgdmFsdWUgaXQgbmVlZHMgdG8gaGF2ZS4gQnV0IHRoaXMgaXMgb25seQo+IHZhbGlk
ICppZiogdGhlcmUgaXMgb25seSBvbmUgQ1BFIHZhcmlhYmxlIHNldC4KPgo+IFNvLCBJIGFtIGFs
bW9zdCBkb25lIG9uIG15IHNpZGUsIGJ1dCBpZiB5b3Ugd2FudCB0byBjb250aW51ZSBvbiB5b3Vy
Cj4gc2lkZSwgSSdtIHRvdGFsbHkgZmluZSB3aXRoIGxldHRpbmcgeW91IGRvIHRoZSBqb2IhIEp1
c3QgdGVsbCBtZS4KCkluZGVlZCwgSSBkaWRuJ3QgbWFuYWdlIGFsbCB0aGUgY29ybmVyIGNhc2Vz
LiBJJ2xsIGxldCB5b3UgaGFuZGxlIHRoZSByZXN0LgoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBN
T1JJTi4KPgo+ID4gKwo+ID4gIGNsYXNzIFNwYWNlQmVmb3JlQmFja3NsYXNoKF9DaGVja0Z1bmN0
aW9uKToKPiA+ICAgICAgVEFCX09SX01VTFRJUExFX1NQQUNFU19CRUZPUkVfQkFDS1NMQVNIID0g
cmUuY29tcGlsZShyIl4uKiggIHxcdCA/KVxcJCIpCj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAt
LQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwoKQmVzdCBSZWdhcmRz
LAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
