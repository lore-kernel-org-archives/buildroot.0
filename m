Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44247EB64D7
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 06:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1A9560AED;
	Fri, 23 Jun 2023 06:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1A9560AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXYIZ0NkJDJr; Fri, 23 Jun 2023 06:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBD0660AA0;
	Fri, 23 Jun 2023 06:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBD0660AA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C2F41BF41C
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 06:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 167CA40150
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 06:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 167CA40150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPf9KUDHZ6EC for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 06:39:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE7674029B
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE7674029B
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 06:39:39 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1a991886254so238631fac.2
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 23:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687502379; x=1690094379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCheHrzDrL+AqOTKfTfHmVF7vxRO1pOeyCElSRoZ0aI=;
 b=I5WxkoB6dsSw+06vNnv7k3i7Xs0+nCEjJNEA6rolKZZsbVAN6CUQK5TMs6zHaqIPdn
 8r08r7Zc3PjCGq0gC8mmRioz76Dx7LjHF108gzoNHlb9ruyjS/XR2yDmz1uUMiEkkalr
 tX2Ou6JDa/yerRI3s0iAA+rJYmpd2354OjFmr3V6S1plw4ViJAdBInfiuR7Gp+GxvUTk
 obmTgRrhaQVIZdUGSES/83BuzGQwoQ6JESIMCTHNTsYMjuAtT0ebmfc/2/c5n0wn0pPv
 kPTpoMV0nV0jEAwVFpb6QB7ULhRC8FYFGD9uQzOHDJLUAXrRLasvexPEZFQ+YBMWlz6U
 kiFg==
X-Gm-Message-State: AC+VfDxecGhd2xqsF/yTZdZyDirZrvpU4VGRcRSl6nl7ssUOUHs7PMlH
 cFi4aN6BpcfcePx6pl4IzevOIuYoDd5ssbBADJA=
X-Google-Smtp-Source: ACHHUZ6G/pB2qQEsa6aAEqt/rkyQcaxwskYfpI9en2fTsx5iQ4ujTw88zZUJzkvlmEhm+wslZvdpF488ac22abz1Nv0=
X-Received: by 2002:a05:6870:c395:b0:188:1338:fbb6 with SMTP id
 g21-20020a056870c39500b001881338fbb6mr17169634oao.36.1687502378721; Thu, 22
 Jun 2023 23:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230605070859.1877231-1-james.hilliard1@gmail.com>
 <0fc72d11-35b2-b6a2-8028-89c3093567a5@mind.be>
 <1a3add30-eff5-9dfa-c4d9-3ca9122a6f08@smile.fr>
 <b698f502-2117-e0b0-7d0e-54e8ff1e6415@smile.fr>
In-Reply-To: <b698f502-2117-e0b0-7d0e-54e8ff1e6415@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Jun 2023 00:39:27 -0600
Message-ID: <CADvTj4pwNBS80PZbLxERtRg5kGn91ewYQrEh8sgO_FtHob=sSg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687502379; x=1690094379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCheHrzDrL+AqOTKfTfHmVF7vxRO1pOeyCElSRoZ0aI=;
 b=kgcqhNrrZjxc6ddObzZaQfFzEmOWC9SDs/XthsbYGXXTSKV3lqp1zdZhwIcFpoq38X
 nD8DOOgORofMqZFBya5wBSF3xspzLnwiUwuYNcvwq5Q+VKkY8NqM9hwPC8XLQOiReOy0
 XytaYzB8lZ+nfVRtqdwQGjp9ysy7NmAnGMSe2M26tbzsFgC+FaZXhBOBKZXxQgDAEAYL
 fmlHPSWHjBotbAXj5B0DHmO0qPgMH/iYPoAIFOk4cgnn8lHQGgWbLeUIFnIfVWgxOvY8
 MJtKiovx9iSAKOOgpSbn+heUJakX557b4xikcI/Akzb4hys9wvoLRtKROzOzAvEu7DGd
 HhnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kgcqhNrr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 67.8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgNzo1NuKAr0FNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIEphbWVzLAo+Cj4gTGUgMjEvMDYvMjAyMyDD
oCAxMTo1NywgUm9tYWluIE5hb3VyIGEgw6ljcml0IDoKPiA+IEhlbGxvIEphbWVzLCBBcm5vdXQs
IEFsbCwKPiA+Cj4gPiBMZSAxOC8wNi8yMDIzIMOgIDE1OjAyLCBBcm5vdXQgVmFuZGVjYXBwZWxs
ZSB2aWEgYnVpbGRyb290IGEgw6ljcml0IDoKPiA+Pgo+ID4+Cj4gPj4gT24gMDUvMDYvMjAyMyAw
OTowOCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPj4+IExpY2Vuc2UgaGFzaCBjaGFuZ2VkIGR1
ZSB0byBuYW1lIHJlbW92YWw6Cj4gPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3NldHVwdG9v
bHMvY29tbWl0LzU5NTdkNTgyNjZlNDc5ZjEyNGIzMWYzMGU0MzIyZTc5OGZkZjM4NmIKPiA+Cj4g
PiBTaW5jZSB0aGlzIGNvbW1pdCwgb25lIG9mIHRoZSBweXRob24gdGVzdCBmYWlsIChUZXN0UHl0
aG9uUHkzR3Bpb3plcm8gWzFdKToKPiA+Cj4gPiAgIEZpbGUKPiA+ICIvYnVpbGRzL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290L3Rlc3Qtb3V0cHV0L1Rlc3RQeXRob25QeTNHcGlvemVyby9ob3N0L2xp
Yi9weXRob24zLjExL3NpdGUtcGFja2FnZXMvcGtnX3Jlc291cmNlcy9fX2luaXRfXy5weSIsCj4g
PiBsaW5lIDg2OCwgaW4gX3Jlc29sdmVfZGlzdAo+ID4gICAgIHJhaXNlIERpc3RyaWJ1dGlvbk5v
dEZvdW5kKHJlcSwgcmVxdWlyZXJzKQo+ID4gcGtnX3Jlc291cmNlcy5EaXN0cmlidXRpb25Ob3RG
b3VuZDogVGhlICdjb2xvcnplcm8nIGRpc3RyaWJ1dGlvbiB3YXMgbm90IGZvdW5kCj4gPiBhbmQg
aXMgcmVxdWlyZWQgYnkgdGhlIGFwcGxpY2F0aW9uCj4gPgo+ID4gQnV0IGlmIHlvdSBsb29rIGNs
b3NlciBpbiB0aGUgYnVpbGQgbG9nLCB5b3Ugd2lsbCBub3RpY2UgbmV3IHNldHVwdG9vbCB3YXJu
aW5nOgo+ID4KPiA+IFsuLi5dc3lzcm9vdC91c3IvbGliL3B5dGhvbjMuMTEvZGlzdHV0aWxzL2Nt
ZC5weTo2MjoKPiA+IFNldHVwdG9vbHNEZXByZWNhdGlvbldhcm5pbmc6IHNldHVwLnB5IGluc3Rh
bGwgaXMgZGVwcmVjYXRlZC4KPiA+ICEhCj4gPiAqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ID4g
ICAgICAgICBQbGVhc2UgYXZvaWQgcnVubmluZyBgYHNldHVwLnB5YGAgZGlyZWN0bHkuCj4gPiAg
ICAgICAgIEluc3RlYWQsIHVzZSBweXBhL2J1aWxkLCBweXBhL2luc3RhbGxlciwgcHlwYS9idWls
ZCBvcgo+ID4gICAgICAgICBvdGhlciBzdGFuZGFyZHMtYmFzZWQgdG9vbHMuCj4gPgo+ID4gICAg
ICAgICBTZWUgaHR0cHM6Ly9ibG9nLmdhbnNzbGUuaW8vYXJ0aWNsZXMvMjAyMS8xMC9zZXR1cC1w
eS1kZXByZWNhdGVkLmh0bWwKPiA+IGZvciBkZXRhaWxzLgo+ID4KPiA+ICoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqCj4gPgo+ID4gU28sIGl0IG1lYW5zIHRoYXQgdGhlIHBhY2thZ2UgaW5mcmFzdHJ1
Y3R1cmUgZm9yIHB5dGhvbiB1c2UgYSBkZXByZWNhdGVkIGluc3RhbGwKPiA+IG1ldGhvZC4gSSdt
IG5vdCBzdXJlIHdoeSB0aGlzIGlzc3VlIGFwcGVhciBvbmx5IHdpdGggcHl0aG9uLXBpb3plcm8g
YnV0IGl0IHNlZW1zCj4gPiB0aGF0IHdlIG5lZWQgdG8gdXBkYXRlIHRoZSBweXRob24gaW5mcmFz
dHJ1Y3R1cmUuCj4gPgo+ID4gQ2FuIHlvdSBoYXZlIGEgbG9vaz8KPiA+Cj4gPiBbMV0gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy80NTA1OTc3OTA2Cj4g
PiBbMl0KPiA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Js
b2IvMjAyMy4wNS54L3BhY2thZ2UvcGtnLXB5dGhvbi5tayNMMTk1Cj4KPiBTd2l0Y2hpbmcgdG8g
c2V0dXAuY2ZnIHNlZW1zIHRvIHdvcmthcm91bmQgdGhpcyBzcGVjaWZpYyBpc3N1ZToKClN0cmFu
Z2UsIGhhdmluZyBhIHNldHVwLnB5IGJhc2VkIGluc3RhbGxhdGlvbiBpcyBub3QgYmVpbmcgZGVw
cmVjYXRlZCwgYWx0aG91Z2gKZGlyZWN0IGludm9jYXRpb24gb2Ygc2V0dXAucHkgd2lsbCBiZSBh
dCBzb21lIHBvaW50LiBGcm9tIG15CnVuZGVyc3RhbmRpbmcgcGVwNTE3CmJ1aWxkIGZyb250ZW5k
cyB3aWxsIGludm9rZSBhIHNldHVwLnB5IGlmIGZvdW5kIGZvciBwcm9qZWN0cyB3aXRob3V0IGEK
cHlwcm9qZWN0LnRvbWwgZmlsZS4KCj4KPiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA2MjExMzQ1MTguMzA0Njg5LTEtcm9tYWluLm5hb3Vy
QHNtaWxlLmZyLwo+Cj4gQnV0IHdlIGhhdmUgc3RpbGwgZGVwcmVjYXRpb24gd2FybmluZ3MuCj4K
PiBUaG91Z2h0cz8KCkxvb2tzIGxpa2Ugd2UgbWF5IG5vdyBiZSBhYmxlIHRvIG1pZ3JhdGUgc2V0
dXB0b29scyB0byBwZXA1MTcgc29vbiwgSSd2ZSBzZW50IGEKcGF0Y2ggYWRkaW5nIHdoZWVsIHdo
aWNoIHdpbGwgYmUgbmVlZGVkIGZvciB0aGF0OgpodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNjIzMDYzMzQ0LjQ2Mzc5LTEtamFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbS8KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KPgo+ID4KPiA+
IEJlc3QgcmVnYXJkcywKPiA+IFJvbWFpbgo+ID4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPj4KPiA+PiAgQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPiA+Pgo+ID4+ICBSZWdhcmRzLAo+ID4+ICBBcm5vdXQK
PiA+Pgo+ID4+PiAtLS0KPiA+Pj4gICBwYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1z
ZXR1cHRvb2xzLmhhc2ggfCA2ICsrKy0tLQo+ID4+PiAgIHBhY2thZ2UvcHl0aG9uLXNldHVwdG9v
bHMvcHl0aG9uLXNldHVwdG9vbHMubWsgICB8IDQgKystLQo+ID4+PiAgIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5oYXNoCj4gPj4+
IGIvcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5oYXNoCj4gPj4+
IGluZGV4IDc2YWQxYmExY2UuLmJlMTMwNjM3MjggMTAwNjQ0Cj4gPj4+IC0tLSBhL3BhY2thZ2Uv
cHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaAo+ID4+PiArKysgYi9wYWNr
YWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLmhhc2gKPiA+Pj4gQEAgLTEs
NCArMSw0IEBACj4gPj4+ICAgIyBGcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zZXR1cHRvb2xz
L2pzb24KPiA+Pj4gLW1kNSAgMWZkOGJkMDRiMGJlZDk1YWQ2YzgxZjAzYjFjMDgwYmMgIHNldHVw
dG9vbHMtNjUuNi4zLnRhci5nego+ID4+PiAtc2hhMjU2ICBhNzYyMDc1N2JmOTg0YjU4ZGVhZjMy
ZmM4YTQ1NzdhOWJiYzA4NTBjZjkyYzIwZTFjZTQxYzM4YzE5ZTVmYjc1Cj4gPj4+IHNldHVwdG9v
bHMtNjUuNi4zLnRhci5nego+ID4+PiAtc2hhMjU2ICBkYjNmMDI0NmIxZjkyNzhmMTU4NDViOTlm
ZWM0NzhiOGI1MDZlYjc2NDg3OTkzNzIyZjhjNmUyNTQyODVmYWY4Cj4gPj4+IExJQ0VOU0UKPiA+
Pj4gK21kNSAgNjI4YWIxYWU3ZDE0MTg1ZTVlNTM2NzQwZWEzMWI1Y2UgIHNldHVwdG9vbHMtNjcu
OC4wLnRhci5nego+ID4+PiArc2hhMjU2ICA2MjY0MjM1OGFkYzc3ZmZhODcyMzNiYzRkMjM1NGM0
YjI2ODJkMjE0MDQ4ZjUwMDk2NGRiZTc2MGNjZWRmMTAyCj4gPj4+IHNldHVwdG9vbHMtNjcuOC4w
LnRhci5nego+ID4+PiArc2hhMjU2ICA4NmRhMGYwMWFlYWU0NjM0OGEzYzNkNDY1MTk1ZGMxY2Vj
Y2RlNzlmNzllODc3NjlhNjRiOGRhMDRiMmE0NzQxCj4gPj4+IExJQ0VOU0UKPiA+Pj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPiA+
Pj4gYi9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLm1rCj4gPj4+
IGluZGV4IDIyNmVmMmI0NzkuLjZkMTAxNzJjZGMgMTAwNjQ0Cj4gPj4+IC0tLSBhL3BhY2thZ2Uv
cHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPiA+Pj4gKysrIGIvcGFja2Fn
ZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5tawo+ID4+PiBAQCAtNCw5ICs0
LDkgQEAKPiA+Pj4gICAjCj4gPj4+Cj4gPj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPj4+
ICAgLVBZVEhPTl9TRVRVUFRPT0xTX1ZFUlNJT04gPSA2NS42LjMKPiA+Pj4gK1BZVEhPTl9TRVRV
UFRPT0xTX1ZFUlNJT04gPSA2Ny44LjAKPiA+Pj4gICBQWVRIT05fU0VUVVBUT09MU19TT1VSQ0Ug
PSBzZXR1cHRvb2xzLSQoUFlUSE9OX1NFVFVQVE9PTFNfVkVSU0lPTikudGFyLmd6Cj4gPj4+IC1Q
WVRIT05fU0VUVVBUT09MU19TSVRFID0KPiA+Pj4gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQu
b3JnL3BhY2thZ2VzL2I2LzIxL2NiOWE4ZDBiMmM4NTk3YzgzZmNlOGU5YzAyODg0YmNlM2Q0OTUx
ZTQxZTgwN2ZjMzU3OTFjNmIyM2Q5YQo+ID4+PiArUFlUSE9OX1NFVFVQVE9PTFNfU0lURSA9Cj4g
Pj4+IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8wMy8yMC82MzA3ODM1
NzFlNzZlNWZhNWYzZTlmMjkzOThjYTNhY2UzNzcyMDdiODE5NmI1NGUwZmZkZjA5ZjEyYzEKPiA+
Pj4gICBQWVRIT05fU0VUVVBUT09MU19MSUNFTlNFID0gTUlUCj4gPj4+ICAgUFlUSE9OX1NFVFVQ
VE9PTFNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiA+Pj4gICBQWVRIT05fU0VUVVBUT09MU19D
UEVfSURfVkVORE9SID0gcHl0aG9uCj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiA+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKPiA+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
