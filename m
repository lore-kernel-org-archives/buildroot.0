Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA77C83F10
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 06:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F6A60D5F;
	Sun, 27 Aug 2023 06:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F6A60D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTzD8fqTaSd4; Sun, 27 Aug 2023 06:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 338EF60E43;
	Sun, 27 Aug 2023 06:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 338EF60E43
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E227C1BF616
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 06:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBA9D40148
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 06:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBA9D40148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6agKNvYf5RS for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 06:56:31 +0000 (UTC)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2EFD400C5
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 06:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2EFD400C5
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-412137ae07aso9228821cf.2
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 23:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693119389; x=1693724189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JnOIE0lCER10JwdDUoFdk1yBfAmK0V7fgNbBmigxdYY=;
 b=j8H0F87jbXiDt0gx6GzgqsgD6weVnI/C8RD7gqAidBwiMZrF4fl4MJ7kV6muDi8a7T
 Ne+/n2zwjzWePQY/5JzdwQof8OETg6CQcaMu2zDFPbyRxrd4Oct+08neDEyDN/WTZ0NQ
 43k12t88nzf7nPBKMMfwYkEloa7HA8W9Go0rvT/6n5BqaX4jGdeQOvApBZeXIQz1Td4o
 r7/asUdq/wZdRF0aOFdCPk8cMB7DbpXNqtfC72GxI+NrSC3yDURCHJ8UPk5dVPzjoV1N
 Vo7weeNo36WDUfGTGjpGfmA1z8cW0gVP8FyG2CnIEaFFaQGMxNDkoJXlyovunKLGbBMx
 woJw==
X-Gm-Message-State: AOJu0YxGYqDjfTpbEVDuK0xSGvxSqSMF+nfhakxKicpzdyAzoIa/qfWW
 wpeBE9E0GoTEYpzKOWyiKToZ195V19p1jSWtBc2bIYJ0sKo=
X-Google-Smtp-Source: AGHT+IFl1y78k8I4ioB7MMUfYKrQDcAINCQcflcs2UP+TAF78hmAhi+itA2E8QOMlbMkzXOTY+qxC3HbR3wHcb/1YAY=
X-Received: by 2002:a05:622a:315:b0:405:402b:9d61 with SMTP id
 q21-20020a05622a031500b00405402b9d61mr24795796qtw.42.1693119389395; Sat, 26
 Aug 2023 23:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220926204505.1870869-1-james.hilliard1@gmail.com>
 <20230826235117.0d0ebbb9@windsurf>
In-Reply-To: <20230826235117.0d0ebbb9@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Aug 2023 02:56:17 -0400
Message-ID: <CADvTj4rcnvVe90L9=dr5JKG_hfy1V63By8OBmY8eJPOf5CGEXg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693119389; x=1693724189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JnOIE0lCER10JwdDUoFdk1yBfAmK0V7fgNbBmigxdYY=;
 b=lO+QIfKcboq8slkGVM1gfg0ojQeeEL2bmHCb2hrVRsF1YKLJD9z1RqIiv63UgLrstm
 enuSwtIE55alY+qEpj+VZ7C/KwjUx9Vs0f0Tn4YO/94ZdkphK+XP1SWjUKVDVo7JKPT9
 NBKHU5BDNLjj1PMtYyDiZfAQAzRGtaHY2VO+teUIX2IFPjIwgMQLBEq7AWpP879Cp5kx
 20ZAq4QzmRQ62MnW3HWS4mwEn856l5AVIrE2fuMOCOf7dKCRBJHYmvLwobP6N5wAe+ML
 6/ZtjfqYaJRsfgHtdWdUdFYOYyFoM5HxxEWmyIU1A07DwQU3bkJwsAYwR750WXKMJ2LC
 UWjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lO+QIfKc
Subject: Re: [Buildroot] [PATCH 1/1] utils/update-rust: add new util for
 updating rust/rust-bin
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

T24gU2F0LCBBdWcgMjYsIDIwMjMgYXQgNTo1MeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBN
b24sIDI2IFNlcCAyMDIyIDE0OjQ1OjA1IC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBNYW51YWxseSB1cGRhdGluZyB0aGUgcnVz
dCBwYWNrYWdlIGlzIHRlZGlvdXMgYW5kIHNsb3cgYXMgd2UgaGF2ZSB0bwo+ID4gdXBkYXRlIGFu
ZCB2YWxpZGF0ZSBoYXNoZXMgZm9yIGFsbCBzdXBwb3J0ZWQgcnVzdC1iaW4gYXJjaCBzcGVjaWZp
Ywo+ID4gdG9vbGNoYWlucy4KPiA+Cj4gPiBUbyBzaW1wbGlmeSB0aGlzIHByb2Nlc3MgYWRkIGEg
cHl0aG9uIHNjcmlwdCB3aGljaCB3aWxsIHVwZGF0ZSBhbmQKPiA+IHZhbGlkYXRlIGhhc2hlcyBh
bmQgc2lnbmF0dXJlcyBmb3IgdGhlIG5ldyBkZXNpcmVkIHJ1c3QgdmVyc2lvbi4KPiA+Cj4gPiBU
aGlzIHNjcmlwdCBpcyBhZGRpdGlvbmFsbHkgY2FwYWJsZSBvZiByZXN1bWluZyBhbiB1cGRhdGUg
aWYKPiA+IGludGVycnVwdGVkIHdoaWNoIG1heSBiZSB1c2VmdWwgb24gc2xvd2VyIG5ldHdvcmsg
Y29ubmVjdGlvbnMKPiA+IGFzIHZhbGlkYXRpbmcgZ3BnIHNpZ25hdHVyZXMgcmVxdWlyZXMgZnVs
bHkgZG93bmxvYWRpbmcgZWFjaCBydXN0Cj4gPiB0b29sY2hhaW4gZGlzdHJpYnV0aW9uIGZpbGUu
Cj4gPgo+ID4gVGhpcyBzY3JpcHQgaGFzIG5vIGV4dGVybmFsIGRlcGVuZGVuY2llcyBvdGhlciB0
aGFuIHRoZSBvcHRpb25hbAo+ID4gcHl0aG9uLWdudXBnIGxpYnJhcnkgd2hpY2ggaXMgbmVlZGVk
IGZvciBncGcgc2lnbmF0dXJlIHZhbGlkYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4KPiBTb3JyeSBmb3IgdGhl
IGxvbmcgZGVsYXkgaW4gZ2V0dGluZyBiYWNrIHRvIHlvdSBvbiB0aGlzLiBTb21lIGNvbW1lbnRz
Cj4gYmVsb3cuCj4KPiA+IGRpZmYgLS1naXQgYS91dGlscy91cGRhdGUtcnVzdCBiL3V0aWxzL3Vw
ZGF0ZS1ydXN0Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDc1NQo+ID4gaW5kZXggMDAwMDAwMDAwMC4u
MmFhZDNmZmZhMwo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvdXRpbHMvdXBkYXRlLXJ1c3QK
PiA+IEBAIC0wLDAgKzEsMjI2IEBACj4gPiArIyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwo+ID4gKyIi
Igo+ID4gKwo+ID4gK1V0aWxpdHkgZm9yIHVwZGF0aW5nIHJ1c3QKPiA+ICsKPiA+ICsiIiIKPiA+
ICtpbXBvcnQgYXJncGFyc2UKPiA+ICtpbXBvcnQgZXJybm8KPiA+ICtpbXBvcnQgdXJsbGliLnJl
cXVlc3QKPiA+ICtpbXBvcnQgdGVtcGZpbGUKPiA+ICtpbXBvcnQgc2h1dGlsCj4gPiAraW1wb3J0
IGlvCj4gPiAraW1wb3J0IG9zCj4gPiAraW1wb3J0IGhhc2hsaWIKPiA+ICtmcm9tIHBhdGhsaWIg
aW1wb3J0IFBhdGgKPiA+ICtmcm9tIG9zIGltcG9ydCBmZG9wZW4KPiA+ICsKPiA+ICt0cnk6Cj4g
PiArICAgICMgUmVxdWlyZXMgdGhlIHB5dGhvbi1nbnVwZyBsaWJyYXJ5Cj4gPiArICAgIGZyb20g
Z251cGcgaW1wb3J0IEdQRwo+ID4gK2V4Y2VwdCBJbXBvcnRFcnJvcjoKPiA+ICsgICAgcHJpbnQo
IlVuYWJsZSB0byB2ZXJpZnkgc2lnbmF0dXJlcywgcHl0aG9uLWdudXBnIHJlcXVpcmVkIikKPiA+
ICsgICAgR1BHID0gTm9uZQo+Cj4gSSBkb24ndCBsaWtlIHRoZSBmYWN0IHRoYXQgR251UEcgaXMg
b3B0aW9uYWwuIEluZGVlZCwgaW4gdGhlIC5oYXNoCj4gZmlsZSwgd2UgaW5kaWNhdGUgdGhhdCB0
aGUgdGFyYmFsbHMgaGF2ZSBiZWVuIHZlcmlmaWVkIGFnYWluc3QgdGhlaXIKPiBzaWduYXR1cmUu
IFRoaXMgc2NyaXB0IHVwZGF0ZXMgdGhlIGhhc2ggZmlsZSwga2VlcGluZyB0aG9zZSBjb21tZW50
cwo+IHRoYXQgdGhlIGhhc2hlcyBoYXZlIGJlZW4gdmVyaWZpZWQgYWdhaW5zdCB0aGUgR251UEcg
c2lnbmF0dXJlLi4uIGJ1dAo+IGluIGZhY3QgaWYgb25lIGRvZXNuJ3QgaGF2ZSBweXRob24tZ251
cGcgaW5zdGFsbGVkLCBpdCdzIG5vdCB0aGUgY2FzZS4KCkkgZGlkbid0IHdhbnQgdG8gbWFrZSBw
eXRob24tZ251cGcgbWFuZGF0b3J5IGhlcmUgaW4gY2FzZSBzb21lb25lIG5lZWRlZAp0byBjaGFu
Z2UgcnVzdCB2ZXJzaW9ucyBvbiBhIGJ1aWxkIGhvc3QgdGhhdCBkaWRuJ3QgaGF2ZSBweXRob24t
Z251cGcgaW5zdGFsbGVkCmZvciB3aGF0ZXZlciByZWFzb24uCgo+Cj4KPiA+ICtkZWYgdXBkYXRl
X2hhc2hfZmlsZV9lbnRyeShoYXNoX2ZpbGUsIG9sZF92ZXJzaW9uLCBuZXdfdmVyc2lvbik6Cj4g
PiArICAgIHRtcGZkLCB0bXBmcGF0aCA9IHRlbXBmaWxlLm1rc3RlbXAoKQo+ID4gKyAgICB1cGRh
dGVkID0gRmFsc2UKPiA+ICsgICAgd2l0aCBmZG9wZW4odG1wZmQsICJ3IikgYXMgbmV3X2ZpbGU6
Cj4gPiArICAgICAgICB3aXRoIGhhc2hfZmlsZS5vcGVuKCJyIikgYXMgb2xkX2ZpbGU6Cj4KPiBU
aGlzIGZ1bmN0aW9uIGxvb2tzIGV4dHJlbWVseSBjb21wbGljYXRlZC4gSSB3b3VsZCBzdWdnZXN0
IHRvIHRyeSBvbmUKPiBvZiB0aG9zZSBhcHByb2FjaGVzOgoKWWVhaCwgdGhpcyBmdW5jdGlvbiBp
cyBzdXBlciB1Z2x5Cgo+Cj4gLSBFbnRpcmVseSByZWdlbmVyYXRlIHRoZSBoYXNoIGZpbGUKPgo+
IC0gVXNlIHJlZ2V4cHMgdG8gbW9kaWZ5IHRoZSBoYXNoZXMgKyB2ZXJzaW9uCgpIbW0sIHllYWgg
dGhhdCBtaWdodCB3b3JrIGJldHRlciwgSSdtIHRyeWluZyB0byByZW1lbWJlciBpZiB0aGVyZSB3
YXMKYSByZWFzb24gSSB3YXMgYXZvaWRpbmcgdGhlIHJlZ2V4cHMgYXBwcm9hY2ggYnV0IGl0J3Mg
YmVlbiBhIHdoaWxlIGFuZApJIGtpbmQgb2YgZm9yZ290IHdoeSBJIGRpZCB0aGluZ3MgdGhpcyB3
YXkuIEkgdGhpbmsgSSB3YXMgdHJ5aW5nIHRvIGVuc3VyZSB0aGF0CnRoZSBzaWduYXR1cmUgYW5k
IGFyY2hpdmUgZmlsZXMgd2VyZSBwcm9jZXNzZWQgYXMgYSBncm91cCBmb3Igd2hhdGV2ZXIKcmVh
c29uIGJ1dCBJJ20gbm90IGVudGlyZWx5IHN1cmUuCgo+Cj4gQW5vdGhlciBuaXQ6Cj4KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bGVuKHdvcmRzKSA9PSA0Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbmQgd29yZHNb
MF0gPT0gIiMiCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbmQgd29yZHNbMV0gPT0g
IlZlcmlmaWVkIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kIHdvcmRzWzJdID09
ICJ1c2luZyIKPiArICAgICAgICAgICAgICAgICAgICAgICAgKToKPgo+IEl0IGlzIHF1aXRlIHVu
Y29tbW9uIGluIFB5dGhvbiB0byB1c2UgcGFyZW50aGVzaXMgYXJvdW5kIGNvbmRpdGlvbnMuCgpJ
IHRoaW5rIHRoaXMgc3R5bGUgd2FzIGdlbmVyYXRlZCBieSB0aGUgcHl0aG9uIGJsYWNrIGNvZGUg
Zm9ybWF0dGluZyB0b29sKEkKd2FzIHRyeWluZyB0byBjbGVhbiB1cCB0aGUgc3R5bGUgYXMgdGhp
cyB3YXMgcXVpdGUgdWdseSBiZWZvcmUgYXMgd2VsbCkuCgo+Cj4gPiArZGVmIHVwZGF0ZV9ta19m
aWxlKG1rX2ZpbGUsIG9sZF92ZXJzaW9uLCBuZXdfdmVyc2lvbik6Cj4gPiArICAgIHRtcGZkLCB0
bXBmcGF0aCA9IHRlbXBmaWxlLm1rc3RlbXAoKQo+ID4gKyAgICB1cGRhdGVkID0gRmFsc2UKPiA+
ICsgICAgd2l0aCBmZG9wZW4odG1wZmQsICJ3IikgYXMgbmV3X2ZpbGU6Cj4gPiArICAgICAgICB3
aXRoIG1rX2ZpbGUub3BlbigpIGFzIG9sZF9maWxlOgo+ID4gKyAgICAgICAgICAgIHZlcnNpb25f
dmFyID0gbWtfZmlsZS5zdGVtLnVwcGVyKCkucmVwbGFjZSgiLSIsICJfIikgKyAiX1ZFUlNJT04i
Cj4gPiArICAgICAgICAgICAgZm9yIGxpbmUgaW4gb2xkX2ZpbGUucmVhZGxpbmVzKCk6Cj4gPiAr
ICAgICAgICAgICAgICAgIHdvcmRzID0gbGluZS5zcGxpdCgpCj4gPiArICAgICAgICAgICAgICAg
IGlmICgKPiA+ICsgICAgICAgICAgICAgICAgICAgIGxlbih3b3JkcykgIT0gMAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgYW5kIHdvcmRzWzBdID09IHZlcnNpb25fdmFyCj4gPiArICAgICAgICAg
ICAgICAgICAgICBhbmQgd29yZHNbMV0gPT0gIj0iCj4gPiArICAgICAgICAgICAgICAgICAgICBh
bmQgd29yZHNbMl0gPT0gb2xkX3ZlcnNpb24KPiA+ICsgICAgICAgICAgICAgICAgKToKPiA+ICsg
ICAgICAgICAgICAgICAgICAgIHVwZGF0ZWQgPSBUcnVlCj4gPiArICAgICAgICAgICAgICAgICAg
ICBuZXdfZmlsZS53cml0ZShsaW5lLnJlcGxhY2Uob2xkX3ZlcnNpb24sIG5ld192ZXJzaW9uKSkK
PiA+ICsgICAgICAgICAgICAgICAgZWxzZToKPiA+ICsgICAgICAgICAgICAgICAgICAgIG5ld19m
aWxlLndyaXRlKGxpbmUpCj4KPiBTYW1lOiB1c2UgYSByZWdleHAgdG8gbW9kaWZ5IHRoZSB2ZXJz
aW9uLgo+Cj4gQ291bGQgeW91IHJld29yayB5b3VyIHNjcmlwdCBiYXNlZCBvbiB0aG9zZSBzdWdn
ZXN0aW9ucz8KClllYWgsIEknbGwgdGFrZSBhIGxvb2sgYXQgcmV3b3JraW5nIHRoaXMgd2hlbiBJ
IGdldCBzb21lIHRpbWUsIGlmIEkKY2FuIGZpZ3VyZSBvdXQKb3IgcmVtZW1iZXIgaG93IHRoaXMg
Y29kZSB3b3JrZWQuIFRoaXMgdXBkYXRlX21rX2ZpbGUgZnVuY3Rpb24gaXMgc3VwZXIKdWdseS90
ZXJyaWJsZSBidXQgaXQgYXQgbGVhc3QgaGFzbid0IGV2ZXIgYnJva2VuIHNpbmNlIEkgd3JvdGUg
aXQgZnJvbQp3aGF0IEkgY2FuCnRlbGwgd2hlbiBkb2luZyBydXN0IHZlcnNpb24gdXBkYXRlcy4K
Cj4KPiBUaGFua3MgYSBsb3QhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNv
LW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
