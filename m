Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5489C27C5E
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 19:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A3F3605FC;
	Mon, 10 Jun 2024 19:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQ4EUZgxFjaX; Mon, 10 Jun 2024 19:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5923605A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5923605A2;
	Mon, 10 Jun 2024 19:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9B91BF3B8
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 19:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8629940185
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 19:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhZmW75xU-Ct for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 19:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79C3F40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79C3F40137
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79C3F40137
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 19:18:31 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GkXEsTrfBmsStGkXEsc2NQ; Mon, 10 Jun 2024 21:18:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 10 Jun 2024 21:18:28 +0200
Message-Id: <4B8DB477-14EB-45DC-B282-1EDDE76D4AA0@benettiengineering.com>
References: <20240610190816.vq3vmlpzeaomecvk@bryanbrattlof.com>
In-Reply-To: <20240610190816.vq3vmlpzeaomecvk@bryanbrattlof.com>
To: Bryan Brattlof <bb@ti.com>
X-Mailer: iPhone Mail (21F90)
X-CMAE-Envelope: MS4xfBG/LEYTsK/pRZwhLOO3EWGhM76E4kYRuKo3pIniZDUDNKTnZM4YpZJ9V6FkefBPx9NQ0/8EtbbN38kmh5RTZiD1bzsyUa+8WjvdfzOnUYuHttpvm26S
 O9AMWp9NdYoBOZJGWT8Zh+qa7nK0GAr3XUJR+9JswkYnq78NUEvx2jToClTWELX5Rk3k8usQd31aL2veEq5lz/IR36SAoOubJMWSkdJZBVH4pWXopv9aOjq3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1718047108; bh=HRm7xkORZI3J06G0c8ivQqTEymJZBPXeamSKYiqhAk8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Vuydr5rMQUBqOh5DtY870/KJQyEeLrCcK2iy1YZztq6hV71YUsH0VrcBiw9gXWKbC
 RDlZiOta9gGHZGUMtTMUGRgd/OxC3lotPjM4VNUXRMtXT3FyM17Q+JWWTPkTKTxJnk
 SxMkktCGO8pzuuYiTX5xiZAmPCvvivQB9eIbGCZIVtUOEhroMWYYcRhRNa1EdP+MTm
 9OXqcWpSBHzGS82t9XuZefVBwgM7Vf8bjnqwxP9eb5JxaiOnsTWUjiLZCD86aNQ5uG
 gwhWQeTc9npQZFaSJYJs7ud9e1widWOiT75CL0IJeCEQocmzKye1aNS2q0pgt7RExW
 mh+5zkF3P+Hcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Vuydr5rM
Subject: Re: [Buildroot] [PATCH -next 0/2] configs/ti_am6*: move to mainline
 Linux
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDEwIGdpdSAyMDI0LCBhbGxlIG9yZSAyMTowOCwgQnJ5YW4gQnJhdHRsb2Yg
PGJiQHRpLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu79PbiBKdW5lIDEwLCAyMDI0IHRodXMgc2F5
ZXRoIEdpdWxpbyBCZW5ldHRpOgo+PiBIZWxsbyBCcnlhbiwKPj4gCj4+PiBPbiAxMC8wNi8yNCAy
MDoyMCwgQnJ5YW4gQnJhdHRsb2YgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+IEhlbGxvIGV2ZXJ5
b25lLAo+Pj4gCj4+PiBUSSBoZWF2aWx5IGVuY291cmFnZXMgZGV2ZWxvcGVycyBpbnRlcm5hbGx5
IHRvIHdvcmsgd2l0aCB0aGUgb3BlbiBzb3VyY2UKPj4+IGNvbW11bml0eSB0byBlbmFibGUgYWxs
IG91ciBTb0NzIHRoZXJlIHJhdGhlciB0aGFuIGRldmVsb3AgdGhlc2UKPj4+IGZlYXR1cmVzIG9u
IG91ciB2ZW5kb3IgdHJlZXMuIEJlY2F1c2Ugb2YgdGhpcyB0aGVyZSBhcmUgdmVyeSBmZXcKPj4+
IGZlYXR1cmVzIG9yIGJ1ZyBmaXhlcyBpbiBvdXIgdmVuZG9yIHRyZWVzIHRoYXQgaGF2ZW4ndCBi
ZWVuIHNlbnQgdG8gdGhlCj4+PiBwcm9qZWN0J3Mgc291cmNlLgo+Pj4gCj4+PiBTbyBmb3IgdGhl
IG5leHQgQnVpbGRyb290IHJlbGVhc2UgSSB3b3VsZCBsaWtlIHRvIG1pZ3JhdGUgVEkncyByZWZl
cmVuY2UKPj4+IGJvYXJkcyB0byB0cmFjayB0aGUgbGF0ZXN0IExpbnV4IHJlbGVhc2UgdG8gZW5z
dXJlIHdlIHdpbGwgYWx3YXlzIGhhdmUKPj4+IHRoZSBsYXRlc3QgZmVhdHVyZXMgYW5kIGJ1ZyBm
aXhlcyBmb3IgdGhlIHJlZmVyZW5jZSBib2FyZHMgYW5kIFNvQ3MuCj4+PiAKPj4+IFRoaXMgc21h
bGwgc2VyaWVzIG1vdmVzIHRoZSBBTTYyeCBhbmQgQU02NHggdG8gdGhlIGxhdGVzdCBMaW51eCBy
ZWxlYXNlLgo+PiAKPj4gWW91IGNhbid0IGtlZXAgZGVmY29uZmlncyB3aXRob3V0IHByZWRldGVy
bWluZWQgbGludXggdmVyc2lvbnMuIFRoZSAyIFRJCj4+IGRlZmNvbmZpZ3MgYWxyZWFkeSBwb2lu
dCB0byBtYWlubGluZSBMaW51eC4gVGhpcyBpcyBkb25lIGZvcgo+PiByZXByb2R1Y2liaWxpdHku
IEkgZG9uJ3Qga25vdyBob3cgIHlvdSBjYW4gYWNoaWV2ZSB3aGF0IHlvdSBtZWFuIHRvIGJlCj4+
IGhvbmVzdC4KPiAKPiBBaCB0aGF0IG1ha2VzIHNlbnNlLiBJIGd1ZXNzIGlmIHdlIG5lZWQgdG8g
a2VlcCBhIHZlcnNpb24gcGlubmVkLAo+IGRvIHlvdSB0aGluayBzb21lIHR5cGUgb2Ygc2NyaXB0
aW5nIGluIHV0aWxzLyB0byB1cGRhdGUgdGhlIHZhcmlvdXMKPiBiYXNlcG9ydCBwYWNrYWdlcyBi
ZSB3ZWxjb21lPwoKVGhlIG1haW4gcHJvYmxlbSBJIHNlZSBpcyBydW50aW1lIHRlc3Rpbmcgb24g
dGhlIGJvYXJkLiBTbyBldmVuIGlmIHdlIGF1dG9tYXRlIHRoZSB1cGRhdGUgcHJvY2VzcyB0aGF0
IGlzIHByZXR0eSB0cml2aWFsLCBJIGRvbuKAmXQgdGhpbmsgd2UgY2FuIGVhc2lseSBhdXRvbWF0
ZSB0aGUgcnVudGltZSB0ZXN0aW5nIHBlciB2ZXJzaW9ucyh1Ym9vdCwgTGludXggZXRjLikuCgpC
dXQgbGV04oCZcyB3YWl0IGZvciBzb21lIG1haW50YWluZXIgdG8gY29tbWVudCwgbWF5YmUgdGhl
cmXigJlzIGEgc29sdXRpb24uCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+IH5Ccnlhbgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
