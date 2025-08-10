Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08014C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 19:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B012F60FC0;
	Sun, 10 Aug 2025 19:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ml1VLilq2B3H; Sun, 10 Aug 2025 19:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E1E60D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E1E60D50;
	Sun, 10 Aug 2025 19:57:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C44A5154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA65882868
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJq2OHNxkWrG for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 19:57:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 538D282865
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538D282865
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 538D282865
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:57:57 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 460622036; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 10 Aug 2025 19:57:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulCAw-006iCm-2j;
 Sun, 10 Aug 2025 21:57:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
 <20250810124820.2116495-2-thomas.petazzoni@bootlin.com>
 <0ead42e3-6522-4f92-8a21-a8c8352375c2@smile.fr>
 <20250810175224.788ea11f@windsurf> <875xevow94.fsf@dell.be.48ers.dk>
 <28185e62-aff8-4cad-ac61-a466c85e05a0@smile.fr>
Date: Sun, 10 Aug 2025 21:57:50 +0200
In-Reply-To: <28185e62-aff8-4cad-ac61-a466c85e05a0@smile.fr> (Romain Naour's
 message of "Sun, 10 Aug 2025 21:08:00 +0200")
Message-ID: <871ppjosox.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=usxvrmuqiBj2gYYX30KPzS4Y5LQlx/91DcvbcCzEwfbjX84DuJW5wepFKG8vOQg/fkMCa8foxDiLGJKsNkIcoODYfv3s2kIeMt/rDxU8GCJGF9V3tFnoxvcNIGIfAwOlbSCWJT7G/gjbco3P6pFBLPt0NoMDNt+yH+22FHaJroYn4U8FrW/hLGAFl05OdfzvI++nlgpsYhL1xt26lpGZqULvogM9kiSXiivd/010AsvS2/KhQkEciORUrqOvfMYjqLw493ClkOOnQq9F7vrdb3YXD1nmJk4aXX81A2ANfASADJ/okpFyBnUwqJYjRPzi1FH0kFFB9bI89R45x6zl2w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ofAS3fdsRVoN27cmvnyuLHdUh7FuowOjJUsKYXMYDEM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=usxvrmuq
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains:
 drop tweak for Microblaze bleeding-edge toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdy
aXRlczoKCiA+IEhlbGxvIFBldGVyLCBUaG9tYXMsIEFsbCwKID4gTGUgMTAvMDgvMjAyNSDDoCAy
MDo0MCwgUGV0ZXIgS29yc2dhYXJkIGEgw6ljcml0wqA6CiA+Pj4+Pj4+ICJUaG9tYXMiID09IFRo
b21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdy
aXRlczoKID4+IAogPj4gPiBPbiBTdW4sIDEwIEF1ZyAyMDI1IDE2OjExOjA5ICswMjAwCiA+PiA+
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKID4+IAogPj4gPj4g
SSBndWVzcyB5b3UgYXJlIHJlZmVycmluZyB0byB0aGUgcGVuZGluZyBwYXRjaCBmcm9tIE5lYWwg
RnJhZ2VyIFsxXS4KID4+ID4+IAogPj4gPj4gWzFdCiA+PiA+PiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwNzI4MDQ1MTQ1LjEzMjMzMy0x
LW5lYWwuZnJhZ2VyQGFtZC5jb20vCiA+PiAKID4+ID4gQ29ycmVjdC4gVGhpcyBwYXRjaCBpcyBw
ZW5kaW5nIGZvciBCdWlsZHJvb3QgbWFzdGVyLCBidXQgSSBkaWQKID4+ID4gaW50ZWdyYXRlIGl0
IGludG8gbXkgdG9vbGNoYWluIGJ1aWxkLgogPj4gCiA+PiBJIHdhbnRlZCB0byBhcHBseSB0aGlz
IGFuZCBnZXQgMjAyNS4wOC1yYzEgb3V0IC0gQnV0IGlmIEkgcmVhZCB0aGUKID4+IGRpc2N1c3Np
b24gY29ycmVjdGx5LCBnY2MgMTUueCBpcyBicm9rZW4gb24gTWljcm9ibGF6ZSBldmVuIHdpdGgg
dGhhdAogPj4gcGF0Y2gsIHNvIHdoYXQgZG8gd2UgZG8/CiA+PiAKCiA+IFllcywgd2UgbmVlZCBh
bm90aGVyIHBhdGNoIFsxXSB0byBiZSBhYmxlIHRvIHRlc3QgdGhlIHJvb3RmcyB3aXRoIFFlbXUu
CiA+IE9idmlvdXNseSB0aGlzIHBhdGNoIFsxXSBpcyBzdGlsbCB1bnN1cmUgKGV4Y2VwdCBpZiB5
b3UgbGV0IG1lIHBhdGNoIGdjYyBjb2RlIDpwKQoKID4gWzFdCiA+IGh0dHBzOi8vZ2l0aHViLmNv
bS9ib290bGluL2J1aWxkcm9vdC10b29sY2hhaW5zL2NvbW1pdC84Mzk0N2M3YmI2MTU4MDcyYmMy
ZjUyYjU4ZTkwODkxY2QzZGMwNGEyCgoKQWhoLiBzbyB0aGUgaXNzdWUgaXMgKG1vc3QgbGlrZWx5
KSBzb2x2ZWQgaW4gdGhlIGJvb3RsaW4gdG9vbGNoYWlucz8KR29vZCwgdGhlbiBsZXRzIGFkZCB0
aGVtLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
