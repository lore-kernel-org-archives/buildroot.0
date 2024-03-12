Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF27C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 23:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9154481380;
	Tue, 12 Mar 2024 23:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vC6gWG8Y_2uP; Tue, 12 Mar 2024 23:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90EFB813B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90EFB813B6;
	Tue, 12 Mar 2024 23:46:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8045A1BF2C4
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 23:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C884813B6
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 23:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBGdW6p7oGKa for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 23:46:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA2D081380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA2D081380
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA2D081380
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 23:46:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3122b70439so777349766b.3
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 16:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710287173; x=1710891973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=//6F29d1yFZvYHVWv1FwOP++7UEDkwmQM0qpUJ1/YV0=;
 b=WfmkEpd1Cqi5xRX8Bymxin9r7C7he2a6vblp6mj+TYNwx759Sdi7al7Z/e9/D8ynsR
 GDBDQIYnPGz0wk9iERlI8zp2JZ54x2O9QS0pIyLwieKiIFTlhCD8OJ1TkAbuz9QCeYvD
 ij+yuGv9cS3NlLpljlWmdAWDFCKIl6GBaYEVA/TXBxnaPa8Apg05DE4ymRzHJCWMd5In
 dzdxbtJW0yA2toilHmMSx1XMcrN/yElWJ1GLDtGxeYHV1NUcWj9eQL/GqglhiuW+bSc/
 LOBXnLGphJD4hkSFJftX67nN/MHLuZX2ZaOqhYE4hh+ssIQadO3mAjDLoqmgS4aRvUXW
 3UYQ==
X-Gm-Message-State: AOJu0YxytF0Mn4zp7nXF0o2MaGq+BTlCOa+20bXLxHyHSX0nMsaT7cEN
 33ZEVnSuffzjBYxMtt4/rVP8HRZ1m77fceUNBJO8oB/pgUlXwpIQ7/ni9MFSyXh8hIZSvRpOjqA
 wUbOwWRarwufDP1KsUkken/LbOr3vilmz5RvA8Jk4CXlo1gB44NU=
X-Google-Smtp-Source: AGHT+IFHSGzzjNjmEEY7TGPMD+oN3ATY6Zi7z/OdhfrPTYqiJtNq43JXApNxWA2P6Q7sjtbYZF8UAUmyMe4QRC/5Ous=
X-Received: by 2002:a17:906:3ac2:b0:a46:3e1a:785e with SMTP id
 z2-20020a1709063ac200b00a463e1a785emr2118962ejd.75.1710287172912; Tue, 12 Mar
 2024 16:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240312201413.781109-1-jeremy@jeremypeper.com>
In-Reply-To: <20240312201413.781109-1-jeremy@jeremypeper.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 12 Mar 2024 16:46:02 -0700
Message-ID: <CAHDQB6PJ=7sPGas+2g4CSL2CPPsRq51g5XN=rmLzUEXOGzKg0Q@mail.gmail.com>
To: "Jeremy J. Peper" <jeremy@jeremypeper.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1710287173; x=1710891973;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=//6F29d1yFZvYHVWv1FwOP++7UEDkwmQM0qpUJ1/YV0=;
 b=Q1z4zusH4uFEF8rVUhkzG5FygMilXTT4cVrFhdXAGwM0DdC1LG+GfmBNNfDKebTiPh
 wk/kx1cApLEXf+9W0YfWEZ9cvHqEoo3svn51OuBGatKLg5g2hrUPN74eXtns6xnTILnv
 LFB6ijkVRpPvxFugDGIzpYS5SIlBA+VZXcnlw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Q1z4zusH
Subject: Re: [Buildroot] [PATCH v3] package/targetcli-fb: needs
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

UmV2aWV3ZWQtYnk6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgoKCgpPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCAxOjE04oCvUE0gSmVyZW15IEouIFBlcGVy
IDxqZXJlbXlAamVyZW15cGVwZXIuY29tPiB3cm90ZToKPgo+IGFkZCBweXRob24tZ29iamVjdCB0
byByZXNvbHZlICJNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ2dpJyIgZXJy
b3IgZW5jb3VudGVyZWQgaWYgYnVpbHQgd2l0aG91dCBpdC4KPiBhZGQgcHl0aG9uLWdvYmplY3Qn
cyBkZXBlbmRlbmNpZXMgYXMgd2VsbAo+IGFuZCBjb21tZW50cyB0byB0aGF0IGVmZmVjdAo+Cj4g
U2lnbmVkLW9mZi1ieTogSmVyZW15IEouIFBlcGVyIDxqZXJlbXlAamVyZW15cGVwZXIuY29tPgo+
IC0tLQo+ICBwYWNrYWdlL3RhcmdldGNsaS1mYi9Db25maWcuaW4gICAgICAgfCAxMyArKysrKysr
KysrKystCj4gIHBhY2thZ2UvdGFyZ2V0Y2xpLWZiL3RhcmdldGNsaS1mYi5tayB8ICAyICstCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3RhcmdldGNsaS1mYi9Db25maWcuaW4gYi9wYWNrYWdlL3Rhcmdl
dGNsaS1mYi9Db25maWcuaW4KPiBpbmRleCAwNGM2YTFhYy4uNTdiMWE3Y2QgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS90YXJnZXRjbGktZmIvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS90YXJnZXRj
bGktZmIvQ29uZmlnLmluCj4gQEAgLTEsMTIgKzEsMjMgQEAKPiAtY29tbWVudCAidGFyZ2V0Y2xp
LWZiIGRlcGVuZHMgb24gUHl0aG9uIgo+ICtjb21tZW50ICJ0YXJnZXRjbGktZmIgZGVwZW5kcyBv
biBQeXRob24sIG5lZWRzIGEgZ2xpYmMgdG9vbGNoYWluLCBnY2MgPj0gNC45LCBob3N0IGdjYyA+
PSA4Igo+ICAgICAgICAgZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfUFlUSE9OMwo+ICsgICAgICAg
ZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9H
T0JKRUNUX0lOVFJPU1BFQ1RJT05fQVJDSF9TVVBQT1JUUwo+ICsgICAgICAgZGVwZW5kcyBvbiAh
QlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDIHx8IFwKPiArICAgICAgICAgICAgICAgIUJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzRfOSB8fCBcCj4gKyAgICAgICAgICAgICAgICFCUjJfSE9TVF9H
Q0NfQVRfTEVBU1RfOAo+Cj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9UQVJHRVRDTElfRkIKPiAgICAg
ICAgIGJvb2wgInRhcmdldGNsaS1mYiIKPiAgICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0Vf
UFlUSE9OMyAjIHB5dGhvbi1jb25maWdzaGVsbC1mYgo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJf
VVNFX01NVSAjIHB5dGhvbi1nb2JqZWN0Cj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0dPQkpFQ1RfSU5UUk9TUEVDVElPTl9BUkNIX1NVUFBPUlRTICMgcHl0aG9uLWdvYmplY3QKPiAr
ICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85ICMgcHl0aG9u
LWdvYmplY3QKPiArICAgICAgIGRlcGVuZHMgb24gQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzggIyBw
eXRob24tZ29iamVjdAo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJ
QkMgIyBweXRob24tZ29iamVjdAo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9D
T05GSUdTSEVMTF9GQgo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9SVFNMSUJf
RkIKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fU0lYCj4gKyAgICAgICBzZWxl
Y3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0dPQkpFQ1QKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAg
dGFyZ2V0Y2xpLWZiIGlzIGEgY29tbWFuZC1saW5lIGludGVyZmFjZSBmb3IgY29uZmlndXJpbmcg
dGhlCj4gICAgICAgICAgIExJTyBnZW5lcmljIFNDU0kgdGFyZ2V0LCBwcmVzZW50IGluIDMueCBM
aW51eCBrZXJuZWwKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90YXJnZXRjbGktZmIvdGFyZ2V0Y2xp
LWZiLm1rIGIvcGFja2FnZS90YXJnZXRjbGktZmIvdGFyZ2V0Y2xpLWZiLm1rCj4gaW5kZXggZDJj
YmY3OWUuLmRiZTM2ZTU5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvdGFyZ2V0Y2xpLWZiL3Rhcmdl
dGNsaS1mYi5tawo+ICsrKyBiL3BhY2thZ2UvdGFyZ2V0Y2xpLWZiL3RhcmdldGNsaS1mYi5tawo+
IEBAIC0xMiw3ICsxMiw3IEBAIFRBUkdFVENMSV9GQl9MSUNFTlNFID0gQXBhY2hlLTIuMAo+ICBU
QVJHRVRDTElfRkJfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAgVEFSR0VUQ0xJX0ZCX0NQRV9J
RF9WQUxJRCA9IFlFUwo+ICBUQVJHRVRDTElfRkJfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAt
VEFSR0VUQ0xJX0ZCX0RFUEVOREVOQ0lFUyA9IHB5dGhvbi1jb25maWdzaGVsbC1mYiBweXRob24t
cnRzbGliLWZiIHB5dGhvbi1zaXgKPiArVEFSR0VUQ0xJX0ZCX0RFUEVOREVOQ0lFUyA9IHB5dGhv
bi1jb25maWdzaGVsbC1mYiBweXRob24tcnRzbGliLWZiIHB5dGhvbi1zaXggcHl0aG9uLWdvYmpl
Y3QKPgo+ICBkZWZpbmUgVEFSR0VUQ0xJX0ZCX0lOU1RBTExfSU5JVF9TWVNWCj4gICAgICAgICAk
KElOU1RBTEwpIC1tIDA3NTUgLUQgcGFja2FnZS90YXJnZXRjbGktZmIvUzUwdGFyZ2V0IFwKPiAt
LQo+IDIuMzkuMgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
