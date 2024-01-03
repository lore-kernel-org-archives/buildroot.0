Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE87C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 08:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 834CB60F3B;
	Wed,  3 Jan 2024 08:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 834CB60F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Y_2dqjau2y8; Wed,  3 Jan 2024 08:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1EB460EE9;
	Wed,  3 Jan 2024 08:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1EB460EE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2761BF471
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 08:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08CB4401C4
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 08:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08CB4401C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fghJ6wb-X227 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 08:12:51 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9178F4014B
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 08:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9178F4014B
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ccbded5aa4so78390581fa.1
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 00:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704269569; x=1704874369;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XeSHjCa2v3qd6F9neRbo804QnRs9cj+brMPy7X+tVNo=;
 b=E8k5j+VqbevZQNaN+gQDwWpSOE60cHwNGqAW8e0+jn2bvXbf3nAwInql3yyhqQ+kIq
 aBrMqWcEwW1fgOE6VfMgby8DyUnw1rV2W40rrJyrWYl7pIEUksTltCxiADkz2cs7mZ71
 sStGuOJ+fbSUo76db3VTvDwYbSrhSFa1x5NOKxPaC4OR5bpz9i8YQ3sHNrxwcQQgR6TC
 /bDukeNdZscLDrMwz6i+drLlp0AspRD4JjGyjvvPWBG7pU7TXcITdEFlKP5CmMEu2H/c
 2d9tS3w8EJab1uZipUuWgj0PnoWTAq7aqZdnfi9hgCMOEtGKj4sqJa0bn9URdSy+KKSy
 LYfA==
X-Gm-Message-State: AOJu0Ywh9OnGCWtTPzrQTubF8ZSowu4IZnWHpjm5s5BPOofuAFquzHAV
 m5z8yGId/Om2XfHsu5cNY3IIZqwVhn5s9x9ftxc=
X-Google-Smtp-Source: AGHT+IFFQ6LQJ/jkg+S23flksvUln7UQQ9I/2J96+WK7b6i0yxjEMKxrujDs27mRi+ntn+uolIfXq0+4/8MmMBsOBLU=
X-Received: by 2002:a05:651c:516:b0:2cc:f1aa:8a39 with SMTP id
 o22-20020a05651c051600b002ccf1aa8a39mr3557894ljp.15.1704269569206; Wed, 03
 Jan 2024 00:12:49 -0800 (PST)
MIME-Version: 1.0
References: <20240102132618.1255329-1-fontaine.fabrice@gmail.com>
 <BN0P110MB16731E7120325FCC63EBD321EB60A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB16731E7120325FCC63EBD321EB60A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 3 Jan 2024 09:12:37 +0100
Message-ID: <CAPi7W81dAo-A6YFEWyn6_0s9ndgbM6Xqd2W5G=xdXcW4-MbLzw@mail.gmail.com>
To: Brandon.Maier@collins.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704269569; x=1704874369; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XeSHjCa2v3qd6F9neRbo804QnRs9cj+brMPy7X+tVNo=;
 b=bvIyanRl55wQzrWMJ0BJR36Xgk9MxsNir5aHL09JC4KYVPvr5sJIih5tk/6/cZXRzS
 hBCo8CN50POtGt98akS4RXr9djHr5iWnkPKoilYWk0AWAWCkC9F/WDFsDBShiupmDXss
 izvPHQDNlKdSkF1TkOpwlRlnK182OkLb6ys0KvI0c6bjGO04x+v4Arbfve3qVUcZJFSH
 fqBgUQ0gaX8M/VmXwV9j9yNYjol5Dmq/lGIksDZyxM4ncLnHDAqMBepY2FxIzT4Vy5v2
 kS9+zF0URjyFLMZbTirLFk5gDZz9OlLrt6f0U1r4kPz33lHy6SyjwRHoUq6cz5PgYgkL
 wkMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bvIyanRl
Subject: Re: [Buildroot] [External] [PATCH 1/1] package/python-pysensors:
 add lm-sensors dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJhbmRvbiwKCkxlIG1lci4gMyBqYW52LiAyMDI0IMOgIDAxOjM0LCBNYWllciwgQnJhbmRv
biBMIENvbGxpbnMKPEJyYW5kb24uTWFpZXJAY29sbGlucy5jb20+IGEgw6ljcml0IDoKPgo+IEhp
IEZhYnJpY2UsCj4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IFNlbnQ6IFR1ZXNk
YXksIEphbnVhcnkgMiwgMjAyNCA3OjI2IEFNCj4gPiBUbzogYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiA+IENjOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT47IFll
Z29yIFllZnJlbW92Cj4gPiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+OyBBc2FmIEthaGxv
biA8YXNhZmthN0BnbWFpbC5jb20+OyBNYWllciwKPiA+IEJyYW5kb24gTCBDb2xsaW5zIDxCcmFu
ZG9uLk1haWVyQGNvbGxpbnMuY29tPjsgRmFicmljZSBGb250YWluZQo+ID4gPGZvbnRhaW5lLmZh
YnJpY2VAZ21haWwuY29tPgo+ID4gU3ViamVjdDogW0V4dGVybmFsXSBbUEFUQ0ggMS8xXSBwYWNr
YWdlL3B5dGhvbi1weXNlbnNvcnM6IGFkZCBsbS1zZW5zb3JzCj4gPiBkZXBlbmRlbmN5Cj4gPgo+
ID4gQ29tbWl0IGM4ZmY4ZDQxYzA2ZjZiMWNiYzVjZjg3MDJhNTE2NDExMDg0ZWFkMTYgZm9yZ290
IHRvIGFkZCBsbS0KPiA+IHNlbnNvcnMKPiA+IGRlcGVuZGVuY3kgcmVzdWx0aW5nIGluIHRoZSBm
b2xsb3dpbmcgYnVpbGQgZmFpbHVyZToKPiA+Cj4gPiAgIEZpbGUgIi9ob21lL2J1aWxkcm9vdC9h
dXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9idWlsZC9weXRob24tCj4gPiBweXNlbnNvcnMt
MC4wLjQvc2V0dXAucHkiLCBsaW5lIDMsIGluIDxtb2R1bGU+Cj4gPiAgICAgaW1wb3J0IHNlbnNv
cnMKPiA+ICAgRmlsZSAiL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1
dC0xL2J1aWxkL3B5dGhvbi0KPiA+IHB5c2Vuc29ycy0wLjAuNC9zZW5zb3JzL19faW5pdF9fLnB5
IiwgbGluZSAyMCwgaW4gPG1vZHVsZT4KPiA+ICAgICByYWlzZSBJbXBvcnRFcnJvcigiY2FuJ3Qg
ZmluZCB0aGUgc2Vuc29ycyBsaWJyYXJ5LiIpCj4KPiBJIHRlc3RlZCB0aGlzIHBhdGNoLCBidXQg
SSBzdGlsbCBnZXQgYW4gSW1wb3J0RXJyb3IuIEl0IGFwcGVhcnMgcHl0aG9uLXB5c2Vuc29ycyBj
YWxscyBQeXRob24ncyBjdHlwZXMudXRpbC5maW5kX2xpYnJhcnkoJ3NlbnNvcnMnKSB0byBsb2Nh
dGUgbGlic2Vuc29ycywgd2hpY2ggc2VhcmNoZXMgaW4gdGhlIGhvc3QgZGlyZWN0b3JpZXMgYW5k
IHNvIG1pc3NlcyB0aGUgdGFyZ2V0IGxpYnNlbnNvcnMgZW50aXJlbHkuCgpUaGFua3MgZm9yIHRl
c3RpbmcgbXkgcGF0Y2ggYW5kIHNwb3R0aW5nIHRoaXMgaXNzdWUuCkknbGwgc2VuZCBhIHYyIHdo
aWNoIHdpbGwgYWRkIGEgZGVwZW5kZW5jeSBvbiBob3N0LWxtLXNlbnNvcnMgYW5kIHdpbGwKc2V0
IFNFTlNPUlNfTElCLgoKPgo+IFRoYW5rcywKPiBCcmFuZG9uCj4KCkJlc3QgUmVnYXJkcyBhbmQg
aGFwcHkgbmV3IHllYXIsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
