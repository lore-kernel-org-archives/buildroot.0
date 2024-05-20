Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB370C04FFE
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 08:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 262B240AE4;
	Mon, 20 May 2024 08:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZPFWJEMorny; Mon, 20 May 2024 08:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 912CB40A39
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 912CB40A39;
	Mon, 20 May 2024 08:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1C6E1BF379
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 08:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEB2F60697
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 08:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbM019XcaGWu for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 08:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D92460680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D92460680
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D92460680
 for <buildroot@buildroot.org>; Mon, 20 May 2024 08:05:47 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-61e0c1ec7e2so16500587b3.0
 for <buildroot@buildroot.org>; Mon, 20 May 2024 01:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716192346; x=1716797146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJgoUr7YEbmsSIw1/tfGaj2Lh+XjFi4GzI85EdDxwR0=;
 b=ZIsVdN1c93CEIn4AWvuPKhFx1nM+VSMwbN6ivkw7nljMcH7BhotcAXLLXHyWXIpXza
 LSrWHFQmq5EIgkN+jkXMMkJbsLxPEdxwXPmKquAy3MLtr/sKxJYoLWRfsAq0tzgRha88
 Slw6sGyQU0pES/EfKpzfcqRbmtfs3xzoqMN3+dhK9SPMiFakMfeuRAluBJPp7nyib4ZE
 7bRZo+SAzx26+Lhuw+sXhnaKWgJ0B8mLu4/SV/TvIRc+Pupt9kS6Oxj9yIq4tmLTp33Z
 BcuQtTZzeMZZUOzyqHP95Z49KWmFdnTuZlWpvfgK+85K3AsK4a7nxO3U8+8J/OGqizPT
 1MtQ==
X-Gm-Message-State: AOJu0YxMQernoSy6s948cHPysMX3pfvfVbn4yxGX7e+BMVkFdG/QOrwU
 BYq1Gu1rzcRRz/DzXGabzGJp/ygcPfMkMsH0jsCdRLoo/7Jo/S/CQj2uHWfg/33P8htfSUnbxxn
 kxX7trOIoDkyosyPBSPwmY9FnTqiqs+8+eiVjUw==
X-Google-Smtp-Source: AGHT+IE+Ms2ud36qlaPXDKWJWioJ4Xl6EYD+LHTjyH1xIknjPU7qmyHyhMQmi3Tf/KBcdiaNjiCM6b40xYmwOnf92qE=
X-Received: by 2002:a25:b2a2:0:b0:de3:c613:b805 with SMTP id
 3f1490d57ef6-df490219fe3mr3901588276.0.1716192345824; Mon, 20 May 2024
 01:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
In-Reply-To: <20240510215442.3475120a@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 20 May 2024 10:05:34 +0200
Message-ID: <CABGWkvqz7-bnCJ6JBjp3rpbeSnDEZw55jNNHOmpbyGA772xDvA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716192346; x=1716797146;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJgoUr7YEbmsSIw1/tfGaj2Lh+XjFi4GzI85EdDxwR0=;
 b=Ftzg+uL1T0V78disIW+u1fmWYxsaOzAEBIIxIan0U1+LLX+Zuh3DPkP9I6HvA+xHS6
 niXzet+qym0UHN8Bnn2LpWL4VCzdn15xSK5CXCSLyJXDN058mvskLqJJk3Z1A7cZhHvD
 0oCYaRKGQM6BRnVZeQtlrg1TbdnmUYpbfPEBQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ftzg+uL1
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: quentin.schulz@theobroma-systems.com, Xuanhao Shi <X15000177@gmail.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBHZXJvIGFuZCBBbGwKCk9uIEZyaSwgTWF5IDEwLCAyMDI0IGF0IDk6NTTigK9Q
TSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToK
Pgo+IEhlbGxvIERhcmlvLAo+Cj4gT24gU3VuLCAyMSBBcHIgMjAyNCAxMTo1Mzo1MiArMDIwMAo+
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3Jv
dGU6Cj4KPiA+IFRoZSBwYXRjaCBhZGRzIGFuIG9wdGlvbiB0byBjcmVhdGUsIGluIGFkZGl0aW9u
IHRvIHRoZSB1c3VhbCBpbWFnZSwgYW4KPiA+IGltYWdlIG9mIHR5cGUgYm1hcCB0aGF0IGRyYXN0
aWNhbGx5IHJlZHVjZXMgdGhlIGFtb3VudCBvZiBkYXRhIHRoYXQKPiA+IG5lZWRzIHRvIGJlIHdy
aXR0ZW4gdG8gYW4gU0QgY2FyZCwgcmVzdWx0aW5nIGluIHRpbWUgc2F2aW5ncy4KPiA+Cj4gPiBU
aGlzIG1ha2VzIGl0IHBvc3NpYmxlIHRvIGFjdGl2YXRlIHRoaXMgb3B0aW9uIGVhc2lseSBhbmQg
bWFpbnRhaW4KPiA+IGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgZm9yIGFsbCBjb25maWd1cmF0aW9u
cyBhbHJlYWR5IHVzaW5nIHRoZSBnZW5pbWFnZQo+ID4gdG9vbCBmb3IgY3JlYXRpbmcgdGhlIGlt
YWdlIHRvIGJlIHdyaXR0ZW4gdG8gdGhlIFNEIGNhcmQ6Cj4gPgo+ID4gQlIyX1JPT1RGU19QT1NU
X0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+ID4gK0JSMl9ST09U
RlNfUE9TVF9JTUFHRV9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvPG1hbnVmYWN0dXJlcj4vPGJvYXJk
bmFtZT4vZ2VuaW1hZ2UuY2ZnIC1iIgo+ID4gK0JSMl9QQUNLQUdFX0hPU1RfQk1BUF9UT09MUz15
Cj4gPgo+ID4gSXQgZm9sbG93cyB0aGF0IHRoZSBzY3JpcHQgbm93IGFzc3VtZXMgYSBicm9hZGVy
IGZ1bmN0aW9uYWxpdHkgdGhhdAo+ID4gZXh0ZW5kcyBiZXlvbmQganVzdCBiZWluZyBhbiBpbnRl
cmZhY2UgZm9yIHRoZSBnZW5pbWFnZSB0b29sLgo+ID4KPiA+IEFuIGFsdGVybmF0aXZlIGltcGxl
bWVudGF0aW9uIGNvdWxkIGhhdmUgYmVlbiB0byBjcmVhdGUgYW5vdGhlciBzY3JpcHQsCj4gPiBz
dWNoIGFzIHN1cHBvcnQvc2NyaXB0cy9ibWFwLnNoLCBjYXBhYmxlIG9mIGNyZWF0aW5nIHRoZSBi
bWFwIGltYWdlCj4gPiB1c2luZyB0aGUgc2FtZSBwYXJhbWV0ZXJzIHBhc3NlZCB0byBzdXBwb3J0
L3NjcmlwdHMvZ2VuaW1hZ2Uuc2ggKGkuIGUuCj4gPiAtYyBib2FyZC88bWFudWZhY3R1cmVyPi88
Ym9hcmRuYW1lPi9nZW5pbWFnZS5jZmcpLiBIb3dldmVyLCBpbiB0aGlzIGNhc2UsCj4gPiB0aGUg
c2NyaXB0IHdvdWxkIGFsc28gbmVlZCB0byBrbm93IHRoYXQgdGhlIGltYWdlIGlzIGxvY2F0ZWQg
aW4gdGhlCj4gPiAke0JJTkFSSUVTfSBkaXJlY3RvcnkuIFRoaXMgY291bGQgYmUgYWNoaWV2ZWQg
YnkgYWRkaW5nIGFuIGFkZGl0aW9uYWwKPiA+IHBhcmFtZXRlciwgYnV0IGl0IG1pZ2h0IGNhdXNl
IGdlbmltYWdlLnNoIHRvIGZhaWwgZHVlIHRvIGFuIHVucmVjb2duaXplZAo+ID4gcGFyYW1ldGVy
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBh
bWFydWxhc29sdXRpb25zLmNvbT4KPgo+IFRoYW5rcyBmb3IgdGhpcyBwcm9wb3NhbCEgQWN0dWFs
bHksIEkgdmVyeSBtdWNoIGxpa2UgdGhlIGlkZWEgb2YKPiBleHRlbmRpbmcgdGhlIHVzYWdlIG9m
IGJtYXAtdG9vbHMgaW4gQnVpbGRyb290LiBJIHRoaW5rIGl0J3MgYSBncmVhdAo+IHRvb2wsIGFu
ZCBpdCBtYWtlcyBhIGxvdCBvZiBzZW5zZSB0byBlbmNvdXJhZ2UgbW9yZSBvZiBpdHMgdXNlLgo+
Cj4gTm93IHRoZSBxdWVzdGlvbiBpcyBob3cgdG8gZG8gdGhpcy4gVG8gbWUgeW91ciBwcm9wb3Nh
bCBsb29rcwo+IHJlYXNvbmFibGUsIHRob3VnaCBzb21lIHBlb3BsZSBoYWQgdGhlIGZlZWRiYWNr
IHRoYXQgYm1hcC10b29scyB3aWxsCj4gbm90IHdvcmsgaW4gYWxsIGNhc2VzIChzaG91bGQgd2Ug
dGhlbiBncmFjZWZ1bGx5IGhhbmRsZSB0aGlzIGZhaWx1cmUKPiBjYXNlPykuCgpJZiBJIHVuZGVy
c3RhbmQgY29ycmVjdGx5LCB0aGUgZmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmllcyBzZWVtcwpyZWFz
b25hYmxlIHRvIEdlcm8gYXMgd2VsbC4KVGhlcmVmb3JlLCBib3RoIG9mIHlvdSBhcmUgaW4gZmF2
b3Igb2YgbWVyZ2luZyB0aGlzIHBhdGNoLiBUaGUgaXNzdWUKYXJpc2VzIGZvciBHZXJvCnJlZ2Fy
ZGluZyB0aGUgYXBwbGljYXRpb24gb2YgdGhlIHNlY29uZCBwYXRjaCwgd2hpY2ggSSBhZGRlZCBv
bmx5IGFzCmFuIGV4YW1wbGUgdXNlIGNhc2UuCkkgdGhpbmsgbWVyZ2luZyB0aGUgZmlyc3QgcGF0
Y2ggd291bGQgZ2l2ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gdXNlCmJtYXB0b29sIGFuZCByZWFsaXpl
IGl0cwp1c2VmdWxuZXNzLiBBZnRlciBhbGwsIHRoZSBwYXRjaCBpcyBiYWNrd2FyZCBjb21wYXRp
YmxlLiBJdHMgdXNlIGNvdWxkCnRoZW4gbGVhZCB0byBzdWJzZXF1ZW50CmltcHJvdmVtZW50cy4K
ClJlZ2FyZGluZyB0aGUgc2Vjb25kIHBhdGNoLCBJIHRoZW4gYXNrIHlvdTogSXMgaXQgY29ycmVj
dCBub3QgdG8KcHJvY2VlZCB3aXRoIG1lcmdpbmcgdGhpcwpwYXRjaCBmb3IgdGhlIHJlYXNvbiBt
ZW50aW9uZWQgYnkgR2VybyAoaS5lLiwgZW5jcnlwdGVkIGRpcmVjdG9yeSk/IEl0CnNlZW1zIHRv
IG1lIHRoYXQKYm1hcHRvb2wgaXMgdXNlZCBpbiBZb2N0bywgc28gaXMgaXQgY29ycmVjdCB0byBz
YXkgdGhhdCB5b3Ugd291bGQgaGF2ZQp0aGUgc2FtZSBwcm9ibGVtCndpdGggWW9jdG8/IEkgaG9w
ZSwgR2VybywgeW91IGRvIG5vdCBtaXN1bmRlcnN0YW5kIG1lLgoKVGhhbmtzIGFuZCByZWdhcmRz
LApEYXJpbwoKPgo+IEFybm91dCwgWWFubiwgUGV0ZXIsIFJvbWFpbiwgd2hhdCBkbyB5b3UgdGhp
bms/IERvIHlvdSBzZWUgb3RoZXIKPiBhcHByb2FjaGVzIHRvIGVhc2lseSBhbGxvdyBnZW5lcmF0
aW5nIGJtYXAtY29tcGF0aWJsZSBpbWFnZXM/Cj4KPiBBbm90aGVyIHF1ZXN0aW9uLCBwZXJoYXBz
IGZvciBEYXJpbywgb3Igb3RoZXIgcGVvcGxlIGZhbWlsaWFyIHdpdGgKPiBnZW5pbWFnZTogaWYg
dGhlIHJvb3Rmcy5leHQ0IGdlbmVyYXRlZCBieSBCdWlsZHJvb3QgaXMgc3BhcnNlLCBpcwo+IGdl
bmltYWdlIGFibGUgdG8gcHJlc2VydmUgdGhlICJob2xlcyIgd2hlbiBnZW5lcmF0aW5nIHRoZSBz
ZGNhcmQuaW1nCj4gdGhhdCBpbmNsdWRlcyB0aGUgcm9vdGZzLmV4dDQgPwo+Cj4gVGhhbmtzIQo+
Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
PiBodHRwczovL2Jvb3RsaW4uY29tCgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJl
ZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29t
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMg
U1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICsz
OSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1
dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
