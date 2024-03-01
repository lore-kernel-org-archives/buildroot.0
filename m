Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA693C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 14:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B8C83122;
	Fri,  1 Mar 2024 14:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VX1OniAfhM5e; Fri,  1 Mar 2024 14:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25ED783196
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25ED783196;
	Fri,  1 Mar 2024 14:04:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4ACC1BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 14:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE98D408E8
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 14:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdulugUJQEcS for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 14:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C45A414FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C45A414FA
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C45A414FA
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 14:04:00 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-608c40666e0so22439567b3.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 06:04:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709301840; x=1709906640;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzFxYLr7vF/Qn8cBFRPQbMOgs+gLvn+AOyMi4tdzszk=;
 b=Q3GqPP3yVXMvJyPD1vE28+txiOJ0DHRDx4SHa17VnGzcyiVVkjCgtrgOF+A7zLF79H
 y4Otrd1pLYzeGWAi4bdKKpR9PkV80xPc+KLkN4CdvMxBWdVFWcT1ZDqGack90IVt1UBB
 o96nKRRNmO2vheUyLUOY1VNzJj0G5x/SrqG5APtXZoCBctYpbj/RklXbYlXu5Pv07QAw
 3euW+BVKywx+PInm1bqJew4mfy7EkDkNhLQ1LyegsSNKo3P8entOufk0p0lkBDrE0kxr
 QNNwxYaJgkaFlw5FICYfffH6DsRZjZYMI/geMCVnogpFtO5uBj/Mj51DONRx5S98Sxkg
 6oIw==
X-Gm-Message-State: AOJu0Yx4ZkZ7/vZWJjlvqyCuglRuwBVlcGIRRep0ZWLDMY34DzPivIkL
 4o9+dfcziERGq6Fdi+aYBdwoC/Msw4cGoKY/dhJJAlIHsRY8nc1rOxRw0cepPrMq5fuAOBqFB2P
 k0G6oFKS6eCvZ11PTLqbEo7vzGBVi9ygOklpSjA==
X-Google-Smtp-Source: AGHT+IGeHudZPiRa3ccpDflGl7Xu6poDfjAiDxMULWBWlaSMBgdrZaUbMyvmGRoXmrn6SV5ncJ42kbIr2fFqqgCJQIY=
X-Received: by 2002:a25:6b0a:0:b0:dc7:48f8:ce2e with SMTP id
 g10-20020a256b0a000000b00dc748f8ce2emr1529200ybc.37.1709301839910; Fri, 01
 Mar 2024 06:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
 <20240227163019.2876942-16-dario.binacchi@amarulasolutions.com>
 <20240229022222.exmx2cgijdjrtnwp@dasso>
 <CABGWkvoCD4SJsRPP+uv2N0evUF8YFv9eRBHew1Lhj+UZwP9YNQ@mail.gmail.com>
 <20240301000646.kafg3dnywl2o65od@dasso>
In-Reply-To: <20240301000646.kafg3dnywl2o65od@dasso>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 1 Mar 2024 15:03:49 +0100
Message-ID: <CABGWkvqJaKeoxtJWq0rW=pD7EV5Fo7x1c0K2wa+p_yjFU_PFfg@mail.gmail.com>
To: Andreas Dannenberg <dannenberg@ti.com>,
 Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709301840; x=1709906640;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yzFxYLr7vF/Qn8cBFRPQbMOgs+gLvn+AOyMi4tdzszk=;
 b=U6CEChxzDQ9GvWSQrRiNfaFH8LPyPNpxpaAZ/xzyIEvyGgl9aQK/OUyKn2vuxgP1vd
 i5iPIZNWzJzl7GtD0BRLYntBjI3XOID4WbIMP+gqrZBuv6AjoD0aJS4wpeyy2q0ZvZVi
 OWOc5c0/VmbfHKABarzBpXTiiGQGBBfWvlmmo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=U6CEChxz
Subject: Re: [Buildroot] [PATCH v7 15/17] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcyBhbmQgUm9tYWluLAoKT24gRnJpLCBNYXIgMSwgMjAyNCBhdCAxOjA24oCvQU0g
QW5kcmVhcyBEYW5uZW5iZXJnIDxkYW5uZW5iZXJnQHRpLmNvbT4gd3JvdGU6Cj4KPiBIaSBEYXJp
bywKPgo+IE9uIFRodSwgRmViIDI5LCAyMDI0IGF0IDEyOjM3OjU3UE0gKzAxMDAsIERhcmlvIEJp
bmFjY2hpIHdyb3RlOgo+ID4gSGkgQW5kcmVhcywKPiA+Cj4gPiBPbiBUaHUsIEZlYiAyOSwgMjAy
NCBhdCAzOjIy4oCvQU0gQW5kcmVhcyBEYW5uZW5iZXJnIDxkYW5uZW5iZXJnQHRpLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IEhpIERhcmlvLAo+ID4gPgo+ID4gPiBPbiBUdWUsIEZlYiAyNywgMjAy
NCBhdCAwNTozMDoxN1BNICswMTAwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+ID4gPiBSZWNl
bnQgdmVyc2lvbnMgb2YgVS1Cb290IGFyZSBjYXBhYmxlIG9mIGJ1aWxkaW5nIHRpYm9vdDMuYmlu
IHVzaW5nCj4gPiA+ID4gQmlubWFuLiBJbiB0aGlzIGNhc2UsIGxldCdzIGNvcHkgaXQgdG8gdGhl
IGJpbmFyaWVzIGRpcmVjdG9yeS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+ID4gPgo+
ID4gPiA+IC0tLQo+ID4gPiA+Cj4gPiA+ID4gQ2hhbmdlcyBpbiB2NjoKPiA+ID4gPiAtIFJlcGxh
Y2UgYGZpbmQnIGNvbW1hbmQgd2l0aCBgY3AnIG9uZS4KPiA+ID4gPgo+ID4gPiA+IENoYW5nZXMg
aW4gdjU6Cj4gPiA+ID4gLSBSZXBsYWNlIHRpYm9vdDMtKi0kKFRJX0szX1I1X0xPQURFUl9TRUNU
WVBFKS0qLmJpbiB3aXRoCj4gPiA+ID4gICB0aWJvb3QzLSQoVElfSzNfUjVfTE9BREVSX1NPQykt
JChUSV9LM19SNV9MT0FERVJfU0VDVFlQRSktKi5iaW4KPiA+ID4gPgo+ID4gPiA+IEFkZGVkIGlu
IHY0Cj4gPiA+ID4KPiA+ID4gPiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVy
Lm1rIHwgNCArKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+
ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+ID4g
PiBpbmRleCBmZGIwNThmM2I3MmEuLmNiZGI2NTMyNzhmOCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9i
b290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+ID4gPiArKysgYi9ib290
L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+ID4gPiBAQCAtNzAsOCArNzAs
MTIgQEAgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlMRF9DTURTCj4gPiA+ID4gICAgICAgJChU
QVJHRVRfQ09ORklHVVJFX09QVFMpICQoVElfSzNfUjVfTE9BREVSX01BS0UpIC1DICQoQEQpICQo
VElfSzNfUjVfTE9BREVSX01BS0VfT1BUUykKPiA+ID4gPiAgZW5kZWYKPiA+ID4gPgo+ID4gPiA+
ICtUSV9LM19SNV9MT0FERVJfU0VDVFlQRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9U
SV9LM19TRUNUWVBFKSkKPiA+ID4gPiArVElfSzNfUjVfTE9BREVSX1NPQyA9ICQoY2FsbCBxc3Ry
aXAsJChCUjJfUEFDS0FHRV9USV9LM19TT0MpKQo+ID4gPiA+ICsKPiA+ID4gPiAgZGVmaW5lIFRJ
X0szX1I1X0xPQURFUl9JTlNUQUxMX0lNQUdFU19DTURTCj4gPiA+ID4gICAgICAgY3AgJChARCkv
c3BsL3UtYm9vdC1zcGwuYmluICQoQklOQVJJRVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbgo+ID4g
PiA+ICsgICAgIGNwICQoQEQpL3RpYm9vdDMtJChUSV9LM19SNV9MT0FERVJfU09DKS0kKFRJX0sz
X1I1X0xPQURFUl9TRUNUWVBFKS0qLmJpbiAkKEJJTkFSSUVTX0RJUikvdGlib290My5iaW4KPiA+
ID4KPiA+ID4gSGF2ZSB5b3UgdHJpZWQgZG9pbmcgYSBjbGVhbiBidWlsZCBvZiB0aV9hbTY0eF9z
a19kZWZjb25maWc/IFdoZW4gSSBkbwo+ID4gPiB0aGF0IHRoZSBjaGFuZ2UgYWJvdmUgYnJlYWtz
IHRoZSBidWlsZC4uLgo+ID4gPgo+ID4gPiA8c25pcD4KPiA+ID4gPj4+IHRpLWszLXI1LWxvYWRl
ciAyMDIyLjEwIEluc3RhbGxpbmcgdG8gaW1hZ2VzIGRpcmVjdG9yeQo+ID4gPiBjcCAvaG9tZS9h
MDc5NzA1OS9naXQvYnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1sb2FkZXItMjAyMi4x
MC9zcGwvdS1ib290LXNwbC5iaW4gL2hvbWUvYTA3OTcwNTkvZ2l0L2J1aWxkcm9vdC9vdXRwdXQv
aW1hZ2VzL3I1LXUtYm9vdC1zcGwKPiA+ID4gLmJpbgo+ID4gPiBjcCAvaG9tZS9hMDc5NzA1OS9n
aXQvYnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1sb2FkZXItMjAyMi4xMC90aWJvb3Qz
LWFtNjR4LWdwLSouYmluIC9ob21lL2EwNzk3MDU5L2dpdC9idWlsZHJvb3Qvb3V0cHV0L2ltYWdl
cy90aWJvb3QzLmIKPiA+ID4gaW4KPiA+ID4gY3A6IGNhbm5vdCBzdGF0ICcvaG9tZS9hMDc5NzA1
OS9naXQvYnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1sb2FkZXItMjAyMi4xMC90aWJv
b3QzLWFtNjR4LWdwLSouYmluJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ID4gPiBtYWtl
WzFdOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6MzY0OiAvaG9tZS9hMDc5NzA1OS9naXQv
YnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1sb2FkZXItMjAyMi4xMC8uc3RhbXBfaW1h
Z2VzX2luc3RhbGxlZF0gRXJyb3IgMQo+ID4gPiBtYWtlOiAqKiogW01ha2VmaWxlOjgyOiBfYWxs
XSBFcnJvciAyCj4gPiA+IDxzbmlwPgo+ID4gPgo+ID4gPiBMb29rcyBsaWtlIHRoZSB0aWJvb3Qz
LmJpbiBmaWxlIGlzIGFscmVhZHkgdGhlcmUsIGFuZCBub3RoaW5nIG5lZWRzIHRvCj4gPiA+IGJl
IGNvcGllZCBvciByZW5hbWVkLiBOb3Qgc3VyZSB3aGF0IGlzIGJlc3Qgd2F5IHRvIG1hbmFnZSB0
aGlzCj4gPiA+IGRlcGVuZGVuY3kgYXMgdGhpcyBpcyB0aGUgYmVoYXZpb3Igb2YgdGhlIG9sZGVy
IFUtQm9vdC4gSSdkIHByb2JhYmx5Cj4gPiA+IGp1c3QgbWlncmF0ZSB0aGUgYW02NHhfc2sgc3Vw
cG9ydCB0byBiaW5tYW4gdG9vIGFsc28gdXNpbmcgdGhlCj4gPiA+IHNhbWUvbmV3ZXIgVS1Cb290
IHlvdSBhcmUgYWxyZWFkeSB1c2luZyBmb3IgQU02MngsIG1ha2luZyBldmVyeXRoaW5nCj4gPiA+
IGVxdWl2YWxlbnQgb2YgdGhlIGFtNjJ4X3NrIHN1cHBvcnQgeW91IGFyZSBmb2N1c2VkIG9uIHdp
dGggdGhpcyBzZXJpZXMuCj4gPgo+ID4gSSBhbSBtb2RpZnlpbmcgdGhlIGNvbmZpZ3VyYXRpb24g
dGlfYW02NHhfc2tfZGVmY29uZmlnIHNvIHRoYXQsCj4gPiBzaW1pbGFybHkgdG8gd2hhdCB3YXMg
ZG9uZSBmb3IgdGlfYW02Mnhfc2tfZGVmY29uZmlnLAo+ID4gaXQgdXNlcyBhIFUtQm9vdCAyMDI0
LjAxIHRoYXQgbWFrZXMgdXNlIG9mIGJpbm1hbjoKPiA+Cj4gPiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjI0MjA1NjU0LjE1NDY3NDQt
MTctZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20vCj4KPiBBaCBvayBJIHNlZSB5
b3VyIGVhcmxpZXIgcG9zdCBvbiB0aGlzIG5vdy4gTm90aGluZyB3cm9uZyB3aXRoIHRyeWluZyB0
bwo+IHNwbGl0IHRoaW5ncyAoaXQncyBub3QgZnVuIHRyeWluZyB0byBtYWludGFpbiB+MjAgcGF0
Y2hlcyBpbiBvbmUgZ28pIGJ1dAo+IHdlIGNhbid0IGJyZWFrIHRoaW5ncyBvYnZpb3VzbHkuCgpJ
IHN1Ym1pdHRlZCB2ZXJzaW9uIDgsIHdoaWNoIGZpeGVzIHRoZSBjb21waWxhdGlvbiBlcnJvciBm
b3IgSFMgKCopIGFuZAphZGRlZCBwYXRjaGVzIHRoYXQgdXBkYXRlIHRoZSBjb25maWd1cmF0aW9u
IHRpX2FtNjR4X3NrX2RlZmNvbmZpZyBhbmQKcmVtb3ZlIHRoZSBubyBsb25nZXIgbmVjZXNzYXJ5
IHRpLWszLWltYWdlLWdlbiBwYWNrYWdlLgoKKCopIFt2OCwxNS8yM10gYm9vdC90aS1rMy90aS1r
My1yNS1sb2FkZXI6IGluc3RhbGwgdGlib290My5iaW4KPj4+IHRpLWszLXI1LWxvYWRlciAyMDI0
LjAxIEluc3RhbGxpbmcgdG8gdGFyZ2V0Cj4+PiB0aS1rMy1yNS1sb2FkZXIgMjAyNC4wMSBJbnN0
YWxsaW5nIHRvIGltYWdlcyBkaXJlY3RvcnkKY3AgL2hvbWUvZGFyaW8vcHJvamVjdHMvcGFzc2dh
dC9idWlsZHJvb3QtdGktYW02Mngtc2svYnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1s
b2FkZXItMjAyNC4wMS9zcGwvdS1ib290LXNwbC5iaW4KL2hvbWUvZGFyaW8vcHJvamVjdHMvcGFz
c2dhdC9idWlsZHJvb3QtdGktYW02Mngtc2svYnVpbGRyb290L291dHB1dC9pbWFnZXMvcjUtdS1i
b290LXNwbC5iaW4KY3AgL2hvbWUvZGFyaW8vcHJvamVjdHMvcGFzc2dhdC9idWlsZHJvb3QtdGkt
YW02Mngtc2svYnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1sb2FkZXItMjAyNC4wMS90
aWJvb3QzLWFtNjJ4LWhzLSouYmluCi9ob21lL2RhcmlvL3Byb2plY3RzL3Bhc3NnYXQvYnVpbGRy
b290LXRpLWFtNjJ4LXNrL2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzL3RpYm9vdDMuYmluCmNwOiB0
YXJnZXQgJy9ob21lL2RhcmlvL3Byb2plY3RzL3Bhc3NnYXQvYnVpbGRyb290LXRpLWFtNjJ4LXNr
L2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzL3RpYm9vdDMuYmluJwppcyBub3QgYSBkaXJlY3RvcnkK
bWFrZVsxXTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjM2NDoKL2hvbWUvZGFyaW8vcHJv
amVjdHMvcGFzc2dhdC9idWlsZHJvb3QtdGktYW02Mngtc2svYnVpbGRyb290L291dHB1dC9idWls
ZC90aS1rMy1yNS1sb2FkZXItMjAyNC4wMS8uc3RhbXBfaW1hZ2VzX2luc3RhbGxlZF0KRXJyb3Ig
MQptYWtlOiAqKiogW01ha2VmaWxlOjgyOiBfYWxsXSBFcnJvciAyCgpGb3IgSFMgY2FzZSwgdHdv
IHRpYm9vdDMgZmlsZXMgd2VyZSBmb3VuZDoKdGlib290My1hbTYyeC1ocy1ldm0uYmluIGFuZCB0
aWJvb3QzLWFtNjJ4LWhzLWZzLWV2bS5iaW4Kc28gdGhlIGNwIGNvbW1hbmQgZmFpbGVkLgoKVGhh
bmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+IElmIHRoZSBjb25jZXJuIGlzIGFyb3VuZCB0ZXN0
aW5nLCBJJ2xsIGJlIGhhcHB5IHRvIGhlbHAgd2loIHRoaXMsIEkgY2FuCj4gcmVhZGlseSBhY2Nl
c3MgR1AgYW5kIEhTLUZTIHZhcmlhbnRzIG9mIFNLLUFNNjQgYW5kIGhlbHAgdGVzdGluZyBvbgo+
IHNob3J0IG5vdGljZS4gV2lsbCBrZWVwIGEgY2xvc2UgZXllIG91dCBmb3IgYW55dGhpbmcgeW91
IG1heSBuZWVkIHRoYXQgSQo+IGNhbiBwaXRjaCBpbiBoZXJlLgo+Cj4gVGhhbmtzLAo+Cj4gLS0K
PiBBbmRyZWFzIERhbm5lbmJlcmcKPiBUZXhhcyBJbnN0cnVtZW50cyBJbmMKPgo+Cj4gPgo+ID4g
VGhhbmtzIGFuZCByZWdhcmRzLAo+ID4gRGFyaW8KPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IEFu
ZHJlYXMgRGFubmVuYmVyZwo+ID4gPiBUZXhhcyBJbnN0cnVtZW50cyBJbmMKPiA+ID4KPiA+ID4K
PiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gPiAgZW5kZWYKPiA+ID4gPgo+ID4gPiA+ICAkKGV2YWwg
JChrY29uZmlnLXBhY2thZ2UpKQo+ID4gPiA+IC0tCj4gPiA+ID4gMi40My4wCj4gPiA+ID4KPiA+
Cj4gPgo+ID4KPiA+IC0tCj4gPgo+ID4gRGFyaW8gQmluYWNjaGkKPiA+Cj4gPiBTZW5pb3IgRW1i
ZWRkZWQgTGludXggRGV2ZWxvcGVyCj4gPgo+ID4gZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0
aW9ucy5jb20KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPgo+
ID4KPiA+IEFtYXJ1bGEgU29sdXRpb25zIFNSTAo+ID4KPiA+IFZpYSBMZSBDYW5ldmFyZSAzMCwg
MzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAo+ID4KPiA+IFQuICszOSAwNDIgMjQzIDUzMTAKPiA+
IGluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KPiA+Cj4gPiB3d3cuYW1hcnVsYXNvbHV0aW9ucy5j
b20KCgoKLS0KCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVy
CgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJl
IDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9A
YW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
