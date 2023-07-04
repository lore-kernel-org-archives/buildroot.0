Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3A3EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 20:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B66F40524;
	Tue,  4 Jul 2023 20:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B66F40524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxWOgiJ6pPuC; Tue,  4 Jul 2023 20:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70BD4400FB;
	Tue,  4 Jul 2023 20:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70BD4400FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0628E1BF228
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAA0760A47
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA0760A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzNxRuMlJhzg for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 20:59:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78ADC60739
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78ADC60739
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 20:59:23 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1b078b34df5so5909681fac.2
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 13:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688504362; x=1691096362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dEMuCQ/0Fc9trwoLKb7Lymp1GpO785eOXSxbPJdc/Es=;
 b=Qjw1BYupDRlyd7lD5eGvCEHRbkDBH4QNzsjm2Vj2wh129RWy+s6FuCLu2FgK96aMBE
 9EwU5hTPHsIL93c0TMggrTfVKvyAokkDOllI6wYPA9T2kj4VEy8on4HZrlG05/FJ+47N
 I1CzpCHdxkKNgQ7ldcHUgdz/LOoHAmIqyEEvV753K0y+q6wn/gnOwxTE8gjLhnB0KSnX
 PXKiYlNzbry8LUUe6VFuuRwMpupuLIOFeUD4/Yn7PlAGmwEm+A+5ikYkK0X09vcE1wRF
 QBZoqhakO8zzcq3uotkWoVqWzWrtq0Q1l8IPShqfxAnQ/eF29kqnD7nB2dDQheBCDwXs
 yt0A==
X-Gm-Message-State: ABy/qLbjkbdHVrX1jAnb8Oe+ZlB/VRLIyWpVTYSOrdWXGp8rIk0Fb0w8
 bLH4x3ZkwUz+rG0zNs5nV88ZdRsGBU33Zy9smmB9hpTD9FYdfA==
X-Google-Smtp-Source: ACHHUZ4ltJY/ld7tmmJ2HR1Qn/fPvC+61OdqcsQiZC2VzX2nynwTjFNBt0qV+GAcM8zHcMcZGQd6qEnhPNpQtFXYUeU=
X-Received: by 2002:a05:6870:c214:b0:1b0:49a7:c284 with SMTP id
 z20-20020a056870c21400b001b049a7c284mr16592194oae.16.1688504362478; Tue, 04
 Jul 2023 13:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230703182930.B08CA863E5@busybox.osuosl.org>
 <20230703205631.4dd121b0@windsurf>
 <38008674-4a63-4223-84d1-c55aa52f023b@mind.be>
In-Reply-To: <38008674-4a63-4223-84d1-c55aa52f023b@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Jul 2023 14:59:09 -0600
Message-ID: <CADvTj4oGZFUCUo0kW-1cvJXXiTmGEjLmx9JNMcm7Reups_MA4g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688504362; x=1691096362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEMuCQ/0Fc9trwoLKb7Lymp1GpO785eOXSxbPJdc/Es=;
 b=f75nbe2w3hRtb0iCbPBfz4VzPL9gxsks6KYU/Duw3NuvidcbezLmO47sUT/02YH880
 d/rq0l4URP/w4RubQDcPYdPqr6AwOIWfZLRv3qi0OXCuYVWzi2ILno9X0cryqFKBKZYJ
 d53FQJYeVqvXX1FVPZMWClyEl31iIX9t/YIFd5gFe7mgdAmEU6xOSWKj3epbsmQQr8AE
 Z2YRBx6vnHXGUBzVsWFZvI7XcizehVQtrplOgUNyhMkW8WdbNSdG/m71hEi8+codUZ8/
 wnIkpSmuApYFw08La/CUlh219otTCisVUeyRse4Qb5SJMZx8IDo7lZdmmm6klxDblphi
 JI1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=f75nbe2w
Subject: Re: [Buildroot] [git commit] package/python-setuptools: add missing
 dependency on host-python-wheel
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgNCwgMjAyMyBhdCAyOjI44oCvUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4KPiBPbiAwMy8wNy8yMDIzIDIwOjU2LCBUaG9tYXMg
UGV0YXp6b25pIHdyb3RlOgo+ID4gT24gTW9uLCAzIEp1bCAyMDIzIDIwOjIwOjMxICswMjAwCj4g
PiBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290
Lm9yZz4gd3JvdGU6Cj4gPgo+ID4+IGNvbW1pdDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9i
dWlsZHJvb3QvY29tbWl0Lz9pZD0zYjI5MTM1NTJlZTRlMzA0ZDRkODZlNTc3YjIzNzY1MmE4ZjBh
OTlmCj4gPj4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21t
aXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCj4gPj4KPiA+PiBXaGlsZSBtaWdyYXRpbmcgdG8gcGVw
NTE3IGJ1aWxkIGJhY2tlbmQgdGhlIGhvc3QtcHl0aG9uLXdoZWVsCj4gPj4gZGVwZW5kZW5jeSBo
YXMgYmVlbiBhZGRlZCB0byBob3N0LXB5dGhvbi1zZXR1cHRvb2xzIGJ1dAo+ID4+IG5vdCB0byBw
eXRob24tc2V0dXB0b29scy4gTm90ZSB0aGF0IGhvc3QtcHl0aG9uLXdoZWVsIGlzIG5vdCByZWFs
bHkKPiA+PiBuZWVkZWQgZHVyaW5nIHRoZSBidWlsZCBvZiAodGFyZ2V0KSBzZXR1cHRvb2xzLCBi
dXQgdGhlIHNldHVwLnB5IHNjcmlwdAo+ID4+IGNoZWNrcyBpZiB0aGUgZGVwZW5kZW5jeSBpcyBw
cmVzZW50IGluIHRoZSBob3N0IGRpcmVjdG9yeS4KPiA+Pgo+ID4+IFRvIG1ha2UgZXZlcnl0aGlu
ZyBjb25zaXN0ZW50LCBhZGQgaG9zdC1weXRob24td2hlZWwgYXMgYSBidWlsZAo+ID4+IGRlcGVu
ZGVuY3ksIGFuZCBCUjJfUEFDS0FHRV9QWVRIT05fV0hFRUwgYXMgYSBydW50aW1lIGRlcGVuZGVu
Y3kuCj4gPgo+ID4gSHUsIHRoaXMgd2FzIG5vdCBpbiB0aGUgcGF0Y2ggZnJvbSBSb21haW4gSSBi
ZWxpZXZlLgo+ID4KPiA+PiArICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fV0hFRUwgIyBy
dW50aW1lCj4gPgo+ID4gVGhpcyBpcyBub3QgY29ycmVjdCwgdGhlcmUgaXMgbm8gc3VjaCBzeW1i
b2wgaW4gQnVpbGRyb290LCBhbmQgaXQKPiA+IGNhdXNlcyBhIGNoZWNrLXN5bWJvbCBlcnJvcjoK
PiA+Cj4gPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2Jz
LzQ1ODYxNDQ4NDgKPiA+Cj4gPiBXaGF0IHdhcyB0aGUgbW90aXZhdGlvbiBiZWhpbmQgdGhpcyBh
ZGRpdGlvbmFsIHNlbGVjdD8KPgo+ICAgQmVjYXVzZSBzZXR1cHRvb2xzIGhhcyBhIHJ1bnRpbWUg
ZGVwZW5kZW5jeSBvbiB3aGVlbC4gVGhlIHBlcDUxNwo+IGluZnJhc3RydWN0dXJlIGRvZXMgYSBi
dWlsZC10aW1lIGNoZWNrIG9mIHRoaXMgcnVudGltZSBkZXBlbmRlbmN5LCBidXQgZHVlIHRvCj4g
dGhlIHdheSB3ZSBydW4gcHl0aG9uLCB0aGUgYnVpbGQtdGltZSBjaGVjayBsb29rcyBhdCB3aGF0
IGlzIGluc3RhbGxlZCBmb3IgdGhlCj4gaG9zdCwgbm90IHdoYXQgaXMgaW5zdGFsbGVkIGZvciB0
aGUgdGFyZ2V0LiBUaGVyZWZvcmUsIHdlIGhhdmUgYSBkZXBlbmRlbmN5IG9uCj4gaG9zdC1weXRo
b24td2hlZWwgaW5zdGVhZCBvZiB0YXJnZXQgcHl0aG9uLXdoZWVsLgo+Cj4gICBTaW5jZSBzZXR1
cHRvb2xzIGNsZWFybHkgZGVmaW5lcyB0aGF0IGl0IGhhcyBhIGRlcGVuZGVuY3kgb24gd2hlZWws
IEkgdGhvdWdodAo+IGl0IGxvZ2ljYWwgdGhhdCB3ZSB3b3VsZCByZWZsZWN0IHRoYXQgZGVwZW5k
ZW5jeSBpbiBCdWlsZHJvb3QgYXMgd2VsbC4gSXQgaXMKPiByZWFsbHkgYSBydW50aW1lIGRlcGVu
ZGVuY3ksIG5vdCBhIGJ1aWxkLXRpbWUgZGVwZW5kZW5jeSwgc28gSSBhZGRlZCB0aGlzIHNlbGVj
dAo+IGxpa2Ugd2UgZG8gZm9yIHJ1bnRpbWUgZGVwZW5kZW5jaWVzLgo+Cj4gICBPZiBjb3Vyc2Us
IEkgZGlkbid0IG5vdGljZSB0aGF0IHdlIGRvbid0IGhhdmUgYSB0YXJnZXQgcHl0aG9uLXdoZWVs
IHBhY2thZ2UsCj4gc28gaXQgZG9lc24ndCBhY3R1YWxseSB3b3JrLgo+Cj4gICBTbywgZHJvcHBp
bmcgdGhpcyBzZWxlY3QgSSdtIHByZXR0eSBzdXJlIGlzIGdvaW5nIHRvIGJyZWFrIHNvbWV0aGlu
ZywgYXQgc29tZQo+IHBvaW50LiBJJ3ZlIGxvb2tlZCBhIGJpdCBjbG9zZXIgbm93LCBhbmQgaXQg
dHVybnMgb3V0IHRoYXQgd2hlZWwgaXMgYWN0dWFsbHkKPiBvbmx5IGltcG9ydGVkIGluIG9uZSBz
cGVjaWZpYyBmdW5jdGlvbiwgaW4gdGhlICJlZGl0YWJsZV93aGVlbCIgY29tbWFuZC4gU28gaXQn
cwo+IHF1aXRlIHVubGlrZWx5IGFueW9uZSB3aWxsIGV2ZXIgc2VlIHRoaXMgYnJlYWthZ2UuCj4K
PiAgIEhvd2V2ZXIsIG5vdyBJIGxvb2sgYSBiaXQgbW9yZSBpbiBkZXRhaWwgYXQgaXQsIGl0IGxv
b2tzIGxpa2UgdGhpcyBjb21taXQgaXMKPiBpbiBmYWN0IGJvZ3VzLCBhbmQgWWFubidzIG9yaWdp
bmFsIGNvbW1lbnQgdGhhdCB0aGUgd2hlZWwgZGVwZW5kZW5jeSBzaG91bGQgYmUKPiBhZGRlZCB0
byB0aGUgaW5mcmFzdHJ1Y3R1cmUgaXMgaW4gZmFjdCBjb3JyZWN0LiBGcm9tIHRoZSBkb2N1bWVu
dGF0aW9uOgo+Cj4gICAgIEhpc3RvcmljYWxseSB0aGlzIGRvY3VtZW50YXRpb24gaGFzIHVubmVj
ZXNzYXJpbHkgbGlzdGVkIGBgd2hlZWxgYAo+ICAgICBpbiB0aGUgYGByZXF1aXJlc2BgIGxpc3Qs
IGFuZCBtYW55IHByb2plY3RzIHN0aWxsIGRvIHRoYXQuIFRoaXMgaXMKPiAgICAgbm90IHJlY29t
bWVuZGVkLiBUaGUgYmFja2VuZCBhdXRvbWF0aWNhbGx5IGFkZHMgYGB3aGVlbGBgIGRlcGVuZGVu
Y3kKPiAgICAgd2hlbiBpdCBpcyByZXF1aXJlZCwgYW5kIGxpc3RpbmcgaXQgZXhwbGljaXRseSBj
YXVzZXMgaXQgdG8gYmUKPiAgICAgdW5uZWNlc3NhcmlseSByZXF1aXJlZCBmb3Igc291cmNlIGRp
c3RyaWJ1dGlvbiBidWlsZHMuCj4KPiBBbmQgaXQncyBwcmV0dHkgY2xlYXIgd2hhdCBpcyBhZGRp
bmcgdGhpcyBkZXBlbmRlbmN5OiB0aGUgcGVwNTE3IGluZnJhIGNhbGxzIHRoZQo+IGJ1aWxkIHdp
dGgKPgo+ICAgICBweXRob24gLW0gYnVpbGQgLW4gLXcKPgo+IFRoZSAiLXciIHN0YW5kcyBmb3Ig
ImJ1aWxkIGEgd2hlZWwiIGFuZCBJIGd1ZXNzIGl0J3Mgb2J2aW91cyB0aGF0IHRoYXQgaW1wbGll
cyBhCj4gZGVwZW5kZW5jeSBvbiBob3N0LXB5dGhvbi13aGVlbD8gQW5kIEkgZ3Vlc3MgdGhhdCB0
aGUgcmVsYXRpdmVseSBmZXcgcGVwNTE3Cj4gcGFja2FnZXMgd2UgaGF2ZSBhbHJlYWR5IGhhdmUg
YSBzZXR1cHRvb2xzLWJhc2VkIHBhY2thZ2UgKGFuZCB0aGVyZWZvcmUKPiBob3N0LXB5dGhvbi1z
ZXR1cHRvb2xzIGFuZCBob3N0LXB5dGhvbi13aGVlbCkgc29tZXdoZXJlIGluIHRoZWlyIGRlcGVu
ZGVuY3kgY2hhaW4uCgpTbyB3ZSBkb24ndCBuZWVkIGhvc3QtcHl0aG9uLXdoZWVsIGZvciBub24t
c2V0dXB0b29scyBwZXA1MTcgYmFja2VuZHMgYXQgYWxsLgoKVGhlIGhvc3QtcHl0aG9uLXdoZWVs
IHBhY2thZ2UgaXMgYmFzaWNhbGx5IG9ubHkgZGVzaWduZWQgdG8gYmUgdXNlZCBieQpzZXR1cHRv
b2xzLApubyBvdGhlciBwZXA1MTcgYmFja2VuZHMvZnJvbnRlbmRzIHVzZSBpdCBBRkFJVS4KCj4K
PiAgIFNvLCBJIGRvIHRoaW5rIHRoaXMgZGVwZW5kZW5jeSBzaG91bGQgbW92ZSB0aGUgdGhlIHBr
Zy1weXRob24gaW5mcmEgX2Zvcgo+IHBlcDUxNyBwYWNrYWdlc18sIGFzIFlhbm4gb3JpZ2luYWxs
eSBjb21tZW50ZWQuCgpUaGF0IGRvZXNuJ3Qgc291bmQgcmlnaHQsIG9ubHkgaG9zdC1weXRob24t
c2V0dXB0b29scyBzaG91bGQgbmVlZCB0aGUKaG9zdC1weXRob24td2hlZWwgZGVwZW5kZW5jeSBB
RkFJVS4gQWxzbyBob3N0LXB5dGhvbi13aGVlbCBkZXBlbmRzCm9uIG91ciBwZXA1MTcgaW5mcmFz
dHJ1Y3R1cmUgaXRzZWxmIHNvIGhvc3QtcHl0aG9uLXdoZWVsIGNvdWxkIG5vdCBiZSBhCmRlcGVu
ZGVuY3kgZm9yIG91ciBwZXA1MTcgaW5mcmFzdHJ1Y3R1cmUgYXMgdGhhdCB3b3VsZCBjcmVhdGUg
YSBjaXJjdWxhcgpkZXBlbmRlbmN5LgoKRllJIEkgaGF2ZSBhIHBhdGNoIG1pZ3JhdGluZyBvdXIg
c2V0dXB0b29scyBpbmZyYXN0cnVjdHVyZSB0byB1c2UgcGVwNTE3OgpodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNjI2MTgxNTMxLjIzMTIw
MDItNS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKPgo+ICAgUmVnYXJkcywKPiAgIEFybm91
dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
