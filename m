Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB713C77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 08:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DBEE61321;
	Tue, 18 Apr 2023 08:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DBEE61321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_H1w3rHLvBt; Tue, 18 Apr 2023 08:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C2576149A;
	Tue, 18 Apr 2023 08:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2576149A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C11E1C4277
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 08:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 746E36149A
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 08:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 746E36149A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kt0Y_RKE7khy for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 08:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B1E61321
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62B1E61321
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 08:04:10 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-187b70ab997so2146846fac.0
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 01:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681805049; x=1684397049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wjt3rDcSX/deHs5cIjoB0bmXY4NANsLLkh7stf8O8KY=;
 b=fq/GlX8oCJ1LVrZccmQxl4TRAOTTHpEgBHbeV8nqJ4TzBxioMgq4ERBfZCgSeYL4D2
 4rMhbT4mHWCr+vs7tFMvPvfOHmZ9zQSDFVktjrOk0CeqnWRG3oZZKfOUPB5hR8EPA+8F
 5PrqDybu/Ch1nsuTno1JARW+Oxbl7/HeibVA8LTgqM2UULVe3aqei8B33CtAZJcC/YZN
 YqYH8kON0UyySf4KQLGDG7yOMqsWwoKvJyeM4afgFbCYQNOT060JpT7+bZqc9VPrWAGJ
 8FBf02p5Mnak6i1Zep3TQuX1XS3t9BYGCrMbiXZWOqawLoaILDOFSYWhhy5s91nNlooM
 VXUg==
X-Gm-Message-State: AAQBX9caMmU6sDNdu6RqjowPZlVXQu49e/KsD2sB6ngodUaoqr/92GrN
 jSag9S/yMsm2h1XdbU6NCIdw5pHnXvK8kPo/3Yg=
X-Google-Smtp-Source: AKy350Z8acgLc3hq98m6ItjQkt9EpUc4uYDjCR6ZlYzAGa1lS/tr4bAqTOu5ei8/HFencRp7Wvs1FArc5slgySHf8BY=
X-Received: by 2002:a05:6830:565:b0:6a5:d909:4851 with SMTP id
 f5-20020a056830056500b006a5d9094851mr478658otc.1.1681805049098; Tue, 18 Apr
 2023 01:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
 <20230415212933.GU2819@scaer>
 <CADvTj4o4dPhWnKiQ0dvm6cJSqwY+ZtbyE0Gwhh8A5Nc5dKPYOQ@mail.gmail.com>
 <20230416082556.GW2819@scaer> <20230416111659.GY2819@scaer>
In-Reply-To: <20230416111659.GY2819@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Apr 2023 02:03:57 -0600
Message-ID: <CADvTj4q-qJ6EiYxOcNfgQRL1q7UPNp9SC7s_CwBVeCk=6PrMqw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681805049; x=1684397049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wjt3rDcSX/deHs5cIjoB0bmXY4NANsLLkh7stf8O8KY=;
 b=pELweE9Y7nNVZtKeXR0+KP8bQJ+lvSFJHwtoNMChkYbLyiL65DkrviUxnEbOp2raTa
 umqKxPmN7T87sVAIkFs/ssOhZaGyVhbYyP0bPJ9wQJcsw+B9vbgR+jI4BWgEPMP+s5VV
 PGZP5jPDbo5dNU31+gpPvcNGJt7hOpk1pvWuL1oLJG+TMdFT2HbKXdFLtKBruqqJXLLS
 tjpQmJE+jxpibnoLkENXD+uK+3EXaN6+IHFahn/4OzmpO95taPJYXlNTrw/mj6RSx8e2
 Q0tr6BFSieBVZGomHGcoHNepjVqR09gHhO3qxmQyBgM+ZBotOH5kFBmhj3UyyuxRyJ0u
 xMfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pELweE9Y
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBcHIgMTYsIDIwMjMgYXQgNToxN+KAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDIzLTA0LTE2
IDEwOjI1ICswMjAwLCBZYW5uIEUuIE1PUklOIHNwYWtlIHRodXNseToKPiA+IE9uIDIwMjMtMDQt
MTUgMjA6NDQgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+ID4gT24gU2F0
LCBBcHIgMTUsIDIwMjMgYXQgMzozMOKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5
OEBmcmVlLmZyPiB3cm90ZToKPiA+IFstLVNOSVAtLV0KPiA+ID4gPiBIb3dldmVyLCBJIHdvdWxk
IHJlYWxseSBsaWtlIHRvIHVuZGVyc3RhbmQgd2h5IHdlIGRvbid0IGhhdmUgbW9yZQo+ID4gPiA+
IHBhY2thZ2VzIHRoYXQgYXJlIGJyb2tlbi4gSXMgaXQgYmVjYXVzZSBwb3BwbGVyIGlzIHRoZSBv
bmx5IG9uZSB3aXRoCj4gPiA+ID4gaW5jbHVkZSBkaXJlY3RpdmVzIGluIGhpcyBnaXIgZmlsZSwg
d2hpY2ggbWVhbnMgaXQgbmVlZHMgYWNjZXNzIHRvIHRoZQo+ID4gPiA+IGluc3RhbGxlZCBnaXIg
ZmlsZXMgZnJvbSBvdGhlciBwYWNrYWdlcyAodGhvc2UgZnJvbSBnb2kpPwo+ID4gPiA+Cj4gPiA+
ID4gT3IgaXMgaXQgYmVjYXVzZSBpdCBpcyB0aGUgb25seSBvbmUgdGhhdCBhbHJlYWR5IHBhc3Nl
cyBhbiBleHBsaWNpdAo+ID4gPiA+IC0taW5jbHVkZWRpciBvcHRpb24gdG8gZy1pci1jb21waWxl
ciwgYW5kIHRoYXQgZGlzYWJsZXMgc2VhcmNoaW5nIHRoZQo+ID4gPiA+IHN0YW5kYXJkIGRpcmVj
dG9yeT8KPiA+ID4gRnJvbSB0aGUgbG9va3Mgb2YgaXQgbW9zdCBvZiBvdXIgcGFja2FnZXMgd2l0
aCBhIGdvYmplY3QtaW50cm9zcGVjdGlvbgo+ID4gPiBkZXBlbmRlbmN5IGFyZSBtZXNvbiBiYXNl
ZCB3aGljaCB1c2UgdGhlIG5hdGl2ZSBtZXNvbiBpbnRlZ3JhdGlvbi4KPiA+IEFoLCBnb29kIHBv
aW50LCB0aGF0IHdvdWxkIGV4cGxhaW4uCj4KPiBVbmZvcnR1YW50ZWx5LCB0aGF0IGFzc3VtcHRp
b24gaXMgd3Jvbmc6IGdyYW5pdGUgdXNlcyBtZXNvbiwgYnV0IGZhaWxzCj4gaW4gdGhlIHNhbWUg
d2F5OgoKV2hpbGUgaXQncyB0cnVlIGl0IGRvZXMgdXNlIG1lc29uLi4uaXQgZG9lcyBub3QgaW4g
ZmFjdCB1c2UgdGhlIG5hdGl2ZSBtZXNvbgppbnRlZ3JhdGlvbiBidXQgcmF0aGVyIHVzZXMgYSBw
cm9qZWN0IHNwZWNpZmljIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnZW5lcmF0b3I6Cmh0dHBzOi8v
Z2l0aHViLmNvbS9lbGVtZW50YXJ5L2dyYW5pdGUvYmxvYi82LjAuMC9saWIvbWVzb24uYnVpbGQj
TDEwMi1MMTIxCgo+Cj4gICAgIFs1MS8yNzVdIEdlbmVyYXRpbmcgbGliL0dyYW5pdGUtMS4wLnR5
cGVsaWIgd2l0aCBhIGN1c3RvbSBjb21tYW5kCj4gICAgIEZBSUxFRDogbGliL0dyYW5pdGUtMS4w
LnR5cGVsaWJpCj4gICAgIC9ob21lL3ltb3Jpbi9kZXYvYnVpbGRyb290L08vbWFzdGVyL3Blci1w
YWNrYWdlL2dyYW5pdGUvaG9zdC9yaXNjdjMyLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91
c3IvYmluL2ctaXItY29tcGlsZXIgLS1zaGFyZWQtbGlicmFyeSBsaWJncmFuaXRlLnNvLjYuMC4w
IC0tb3V0cHV0IGxpYi9HcmFuaXRlLTEuMC50eXBlbGliIC9ob21lL3ltb3Jpbi9kZXYvYnVpbGRy
b290L08vbWFzdGVyL2J1aWxkL2dyYW5pdGUtNi4wLjAvYnVpbGQvbGliL0dyYW5pdGUtMS4wLmdp
cgo+ICAgICBDb3VsZCBub3QgZmluZCBHSVIgZmlsZSAnR0xpYi0yLjAuZ2lyJzsgY2hlY2sgWERH
X0RBVEFfRElSUyBvciB1c2UgLS1pbmNsdWRlZGlyCj4gICAgIGVycm9yIHBhcnNpbmcgZmlsZSAv
aG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL21hc3Rlci9idWlsZC9ncmFuaXRlLTYuMC4wL2J1
aWxkL2xpYi9HcmFuaXRlLTEuMC5naXI6Cj4gICAgIEZhaWxlZCB0byBwYXJzZSBpbmNsdWRlZCBn
aXIgR0xpYi0yLjAKPiAgICAgSWYgdGhlIGFib3ZlIGVycm9yIG1lc3NhZ2UgaXMgYWJvdXQgbWlz
c2luZyAuc28gbGlicmFyaWVzLCB0aGVuIHNldHRpbmcgdXAgR0lSX0VYVFJBX0xJQlNfUEFUSCBp
biB0aGUgLm1rIGZpbGUgc2hvdWxkIGhlbHAuCj4gICAgIFR5cGljYWxseSBsaWtlIHRoaXM6IFBL
R19NQUtFX0VOViArPSBHSVJfRVhUUkFfTElCU19QQVRIPSIkKEBEKS8ubGlicyIKPiAgICAgbmlu
amE6IGJ1aWxkIHN0b3BwZWQ6IHN1YmNvbW1hbmQgZmFpbGVkLgo+ICAgICBtYWtlWzFdOiAqKiog
W3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6MjkzOiAvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9P
L21hc3Rlci9idWlsZC9ncmFuaXRlLTYuMC4wLy5zdGFtcF9idWlsdF0gRXJyb3IgMQo+Cj4gUmVn
YXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+
IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICsz
MyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAg
XGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
