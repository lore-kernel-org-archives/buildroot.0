Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06E3C54E58
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 19:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A4A608A0;
	Tue, 12 Mar 2024 19:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTWM3GPXYuYK; Tue, 12 Mar 2024 19:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C4BE60A54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C4BE60A54;
	Tue, 12 Mar 2024 19:41:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 199051BF32D
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05F1240677
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 19:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oe8-j-WeCdAE for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 19:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CA5F40673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA5F40673
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CA5F40673
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 19:41:24 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5683089d4bbso5941180a12.2
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 12:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710272482; x=1710877282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NsDCTOsE3Rn0QXjFm65W/kE9AXt9XC9wq3I/ElOmlN0=;
 b=bksml2yOq4Rc9qFPw891Bgib2JP9+c+HtPDpbiHahx35YGbBor0V8ckRER+cetOc0O
 0EEdvaA7wjYenJG65jrnr7RmtwoO3lknUPj1wyuN39mtLsxOecekwocC85e10nkX6UiG
 JWDKiOQWAWbSDSA6aw2oUsdPokRhlIPC/Px02Mj/+6qVv5dZDpHC5V33HzBgO9bSx9FW
 DixiyGlOyCoEQ2c9p+zl7qRxfQRI0+0BBsRARxz0uKNQxm4OKBp9aWDVpyHCH9x+DTQF
 eD8GyrIgWVDDvS323mKInYok4eKvYq4nKoiF0P6dE36iWfAOU0pVvhRWcc4LvAuPhyxQ
 UVxQ==
X-Gm-Message-State: AOJu0YxBo1W0RlCsXSMPDzZNZeoXOLx5D2gGVcXM4HphgYXGnsj7Tsz8
 4dGmP5gHp35DBt/1GSkIBzEYwr0XoRvGEKB9rbs0i165TYtM7o0pTAI2+XK3WOiYcTabxpMtvZ1
 2LavOxs4xoPi2ugvSWpC9FIxscF8krteg56+WIQ==
X-Google-Smtp-Source: AGHT+IG3Td5lEVCwKSirCccfv4iS1M9J8CZBcoHJogfSudMH/ggYPOyu783UNcEM+T62s2dkBUnEFRRlrA6B1LHJ7OU=
X-Received: by 2002:a17:906:abd9:b0:a46:3809:3b2f with SMTP id
 kq25-20020a170906abd900b00a4638093b2fmr2809901ejb.31.1710272482465; Tue, 12
 Mar 2024 12:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240312193140.663261-1-jeremy@jeremypeper.com>
In-Reply-To: <20240312193140.663261-1-jeremy@jeremypeper.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 12 Mar 2024 12:41:11 -0700
Message-ID: <CAHDQB6M5mm-BfrGKNJvNViHyny6He=wh+a=riyVzPhCKW39dNQ@mail.gmail.com>
To: "Jeremy J. Peper" <jeremy@jeremypeper.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1710272482; x=1710877282;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NsDCTOsE3Rn0QXjFm65W/kE9AXt9XC9wq3I/ElOmlN0=;
 b=YD7LD6KjYBqrdcAZrorqZJ5Uw5u5czNoXTM0Z4mfX+bxDfTWJElc/fpaW55L5L1jeS
 iHJ14IVadEO0hr71lz0foAmCNUwB19KEWEoLVDttZWLk3+9NZkJFeTc3JYmyA/rdMZ20
 M8x8F2U14jnlAy8nvb+nXG2pJrTusqRlY2gjk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YD7LD6Kj
Subject: Re: [Buildroot] [PATCH v2 1/3] package/targetcli-fb: needs
 python-gobject
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG87CgoKCk9uIFR1ZSwgTWFyIDEyLCAyMDI0IGF0IDEyOjMy4oCvUE0gSmVyZW15IEouIFBl
cGVyIDxqZXJlbXlAamVyZW15cGVwZXIuY29tPiB3cm90ZToKPgo+IGFkZCBweXRob24tZ29iamVj
dCB0byByZXNvbHZlICJNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ2dpJyIg
ZXJyb3IgZW5jb3VudGVyZWQgaWYgYnVpbHQgd2l0aG91dCBpdC4KPiBhZGQgcHl0aG9uLWdvYmpl
Y3QncyBkZXBlbmRlbmNpZXMgYXMgd2VsbAo+Cj4gU2lnbmVkLW9mZi1ieTogSmVyZW15IEouIFBl
cGVyIDxqZXJlbXlAamVyZW15cGVwZXIuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3RhcmdldGNsaS1m
Yi9Db25maWcuaW4gICAgICAgfCAxICsKPiAgcGFja2FnZS90YXJnZXRjbGktZmIvdGFyZ2V0Y2xp
LWZiLm1rIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGFyZ2V0Y2xpLWZiL0NvbmZpZy5pbiBi
L3BhY2thZ2UvdGFyZ2V0Y2xpLWZiL0NvbmZpZy5pbgo+IGluZGV4IDA0YzZhMWFjLi43MjJiOTQw
MCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3RhcmdldGNsaS1mYi9Db25maWcuaW4KPiArKysgYi9w
YWNrYWdlL3RhcmdldGNsaS1mYi9Db25maWcuaW4KPiBAQCAtNyw2ICs3LDcgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX1RBUkdFVENMSV9GQgpZb3UgbmVlZCB0byBhZGQgdGhlIFBZVEhPTl9HT0JKRUNU
X0RFUEVOREVOQ0lFUyBoZXJlLgpJRToKCmRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBweXRob24t
Z29iamVjdApkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0dPQkpFQ1RfSU5UUk9TUEVDVElPTl9BUkNI
X1NVUFBPUlRTICMgcHl0aG9uLWdvYmplY3QKZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19B
VF9MRUFTVF80XzkgIyBweXRob24tZ29iamVjdApkZXBlbmRzIG9uIEJSMl9IT1NUX0dDQ19BVF9M
RUFTVF84ICMgcHl0aG9uLWdvYmplY3QKZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJ
QkMgIyBweXRob24tZ29iamVjdAoKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05f
Q09ORklHU0hFTExfRkIKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUlRTTElC
X0ZCCj4gICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NJWAo+ICsgICAgICAgc2Vs
ZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9HT0JKRUNUCj4gICAgICAgICBoZWxwCj4gICAgICAgICAg
IHRhcmdldGNsaS1mYiBpcyBhIGNvbW1hbmQtbGluZSBpbnRlcmZhY2UgZm9yIGNvbmZpZ3VyaW5n
IHRoZQo+ICAgICAgICAgICBMSU8gZ2VuZXJpYyBTQ1NJIHRhcmdldCwgcHJlc2VudCBpbiAzLngg
TGludXgga2VybmVsClRoZW4sIGFkZCBhIG1lc3NhZ2UgYmVsb3cgdGhpcy4gU2luY2UgdGhlcmUg
aXNuJ3QgYW4gZXhpc3RpbmcgbWVzc2FnZSwKeW91IGNhbiBjb3B5IGFuZApwYXN0ZSBhbmQgbW9k
aWZ5IGZyb20gdGhlIHB5dGhvbi1nb2JqZWN0IHBhY2thZ2UuIElFOgoKY29tbWVudCAidGFyZ2V0
Y2xpLWZiIG5lZWRzIGEgZ2xpYmMgdG9vbGNoYWluLCBnY2MgPj0gNC45LCBob3N0IGdjYyA+PSA4
IgogICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVQogICAgICAgZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9HT0JKRUNUX0lOVFJPU1BFQ1RJT05fQVJDSF9TVVBQT1JUUwogICAgICAgZGVwZW5kcyBv
biAhQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDIHx8IFwKICAgICAgICAgICAgICAgIUJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzRfOSB8fCBcCiAgICAgICAgICAgICAgICFCUjJfSE9TVF9HQ0Nf
QVRfTEVBU1RfOAoKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGFyZ2V0Y2xpLWZiL3RhcmdldGNs
aS1mYi5tayBiL3BhY2thZ2UvdGFyZ2V0Y2xpLWZiL3RhcmdldGNsaS1mYi5tawo+IGluZGV4IGQy
Y2JmNzllLi4yZDM3NTQxNyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3RhcmdldGNsaS1mYi90YXJn
ZXRjbGktZmIubWsKPiArKysgYi9wYWNrYWdlL3RhcmdldGNsaS1mYi90YXJnZXRjbGktZmIubWsK
PiBAQCAtMTIsNyArMTIsNyBAQCBUQVJHRVRDTElfRkJfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiAg
VEFSR0VUQ0xJX0ZCX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gIFRBUkdFVENMSV9GQl9DUEVf
SURfVkFMSUQgPSBZRVMKPiAgVEFSR0VUQ0xJX0ZCX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4g
LVRBUkdFVENMSV9GQl9ERVBFTkRFTkNJRVMgPSBweXRob24tY29uZmlnc2hlbGwtZmIgcHl0aG9u
LXJ0c2xpYi1mYiBweXRob24tc2l4Cj4gK1RBUkdFVENMSV9GQl9ERVBFTkRFTkNJRVMgPSBweXRo
b24tY29uZmlnc2hlbGwtZmIgcHl0aG9uLXJ0c2xpYi1mYiBweXRob24tc2l4IHB5dGhvbi1nb2Jq
ZWN0ICQoUFlUSE9OX0dPQkpFQ1RfREVQRU5ERU5DSUVTKQpUaGlzIHdhcyBhY3R1YWxseSBjb3Jy
ZWN0IGJlZm9yZSEgWW91IG9ubHkgbmVlZCB0byBhZGQgcHl0aG9uLWdvYmplY3QsIG5vdAokKFBZ
VEhPTl9HT0JKRUNUX0RFUEVOREVOQ0lFUykuCgoKVGhhbmtzIGFnYWluIQpBZGFtCj4KPiAgZGVm
aW5lIFRBUkdFVENMSV9GQl9JTlNUQUxMX0lOSVRfU1lTVgo+ICAgICAgICAgJChJTlNUQUxMKSAt
bSAwNzU1IC1EIHBhY2thZ2UvdGFyZ2V0Y2xpLWZiL1M1MHRhcmdldCBcCj4gLS0KPiAyLjM5LjIK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
