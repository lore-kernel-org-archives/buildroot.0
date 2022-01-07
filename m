Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F768C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D540960EB6;
	Fri,  7 Jan 2022 10:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Mti4OBi2rqj; Fri,  7 Jan 2022 10:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1952660AA8;
	Fri,  7 Jan 2022 10:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3381BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F08C2429A9
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRnN5VZe9sRG for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:45:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E13A42997
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:45:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5148:b9c:d8ec:b3b5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8E1E1780310;
 Fri,  7 Jan 2022 11:44:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641552306;
 bh=TmN15xCbVs0FBOfWVl0s9lOSCvKdGE3H4c+fSQZoPdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mz8+nQWhlxuvMoNVKH6IqcAP4YA8wvkt/RUJsqxIl0aZQ+iYSe5znjtmASaaixhvH
 tTaaSSTHYdWQUU+2QSGu1btySwy3YvuexkKwkRIN13pYs6NaWTBxFss1Mr5llifphU
 zHNy/bOVWwFjVPx4PgACXYinpG48ASeLP/anZUEp2bTGxUBzNYwFwnjJNVenkrT+Ad
 Q0tJo65kHDYEJxGp32oY3WpnE5FJKYTS86U9RIYwvRBGEoJEoY97a/zG61XC4yYeHH
 0sklAUFFyNEO8o7hvjoF9zIAqz2CgPYJWiN7vD1/onLXKoR1UHhJlK1y1XJ1hztdLs
 Fm+agTheQIAtw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jan 2022 11:44:59 +0100
Date: Fri, 7 Jan 2022 11:44:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220107104459.GD1268635@scaer>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
 <d30edd2f-9e9f-b4e7-216c-fad53c6f90f4@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d30edd2f-9e9f-b4e7-216c-fad53c6f90f4@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 05/11] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIyLTAxLTA3IDExOjI2ICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDA2LzAxLzIwMjIgw6AgMjE6NTksIFRob21hcyBQZXRhenpvbmkgYSDD
qWNyaXTCoDoKPiA+IEZyb206IFBhdHJpY2sgSGF2ZWxhbmdlIDxwYXRyaWNrLmhhdmVsYW5nZUBl
c3NlbnNpdW0uY29tPgo+ID4gSW4gb3JkZXIgdG8gYmUgcGFja2FnZSBhZ25vc3RpYywgdGhlIGlu
c3RhbGwgcGhhc2UgaXMgbm93IHVzaW5nIGNhcmdvCj4gPiBpbnN0ZWFkIG9mIGluc3RhbGwuIFRB
UkdFVF9DT05GSUdVUkVfT1BUUyBpcyBub3cgYWxzbyBzZXQgd2hlbiBydW5uaW5nCj4gPiBjYXJn
byBpbiBvcmRlciB0byBzdXBwb3J0IGNyb3NzIGNvbXBpbGluZyBDIGNvZGUgd2l0aGluIGNhcmdv
Lgo+ID4gCj4gPiBUaGlzIGNvbW1pdCBhbHNvIGFkZHMgc3VwcG9ydC9kb3dubG9hZC9jYXJnby1w
b3N0LXByb2Nlc3MgdG8gcGVyZm9ybQo+ID4gdGhlIHZlbmRvcmluZyBvbiBDYXJnbyBwYWNrYWdl
cy4KPiAKPiBEb3dubG9hZCBwb3N0LXByb2Nlc3NpbmcgZG9lcyd0IHdvcmsgd2hlbiB3ZSB1c2Ug
X09WRVJSSURFX1NSQ0RJUi4KClRoaXMgaXMgaW5kZWVkIGV4cGVjdGVkOiBfT1ZFUlJJREVfU1JD
RElSIGlzIHNraXBwaW5nIGFsbCB0aGUgZG93bmxvYWQsCmV4dHJhY3QgYW5kIHBhdGNoIHN0ZXBz
LgoKRGV2ZWxvcGVycyB0aGF0IGFyZSB1c2luZyBhbiBfT1ZFUlJJREVfU1JDRElSIGFyZSByZXNw
b25zaWJsZSBmb3IKcHJvdmlkaW5nIGFuIHNvdXJjZSB0cmVlIHRoYXQgaXMgcmVhZHkgdG8gYmUg
Y29uZmlndXJlZC4KClNvLCB0aGlzIGlzIHByb2JhYmx5IHNvbWV0aGluZyB0aGF0IHNob3VsZCBi
ZSBhZGRlZCB0byB0aGUgbWFudWFsLCBpZiBpdAppcyBub3QgYWxyZWFkeSB0aGVyZSwgb3IgdG8g
ZW1waGFzaXNlIGl0IGlmIGFscmVhZHkgdGhlcmU6CgogICAgV2hlbiB5b3UgYXJlIHVzaW5nIE9W
RVJSSURFX1NSQ0RJUiwgeW91IGFyZSByZXNwb25zaWJsZSBmb3IKICAgIHByb3ZpZGluZyBhIHNv
dXJjZSB0cmVlIHRoYXQgaXMgcmVhZHkgdG8gYmUgY29uZmlndXJlZC4KCkNhcmUgdG8gc2VuZCBh
IHBhdGNoLCBwbGVhc2U/CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBNYXliZSB3ZSBoYXZl
IHRvIG1ha2Ugc3VyZSB0aGF0IGFsbCBkb3dubG9hZCBvZiB2ZW5kb3IgbW9kdWxlcyBhcmUgYWxy
ZWFkeQo+IHByZXNlbnQgaW4gdGhlIHNvdXJjZSBkaXJlY3RvcnkgdXNlZCBieSBfT1ZFUlJJREVf
U1JDRElSLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiA+IAo+ID4gVGhlIDxwa2c+
X0xJQ0VOU0UgdmFyaWFibGUgb2YgY2FyZ28gcGFja2FnZXMgaXMgZXhwYW5kZWQgd2l0aCAiLAo+
ID4gdmVuZG9yZWQgZGVwZW5kZW5jaWVzIGxpY2Vuc2VzIHByb2JhYmx5IG5vdCBsaXN0ZWQiIGFz
IGN1cnJlbnRseSBmb3IKPiA+IGFsbCBwYWNrYWdlcywgdGhlIGxpY2Vuc2VzIG9mIHRoZSB2ZW5k
b3JlZCBkZXBlbmRlbmNpZXMgYXJlIG5vdCB0YWtlbgo+ID4gaW50byBhY2NvdW50Lgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIEhhdmVsYW5nZSA8cGF0cmljay5oYXZlbGFuZ2VAZXNz
ZW5zaXVtLmNvbT4KPiA+IFtUaG9tYXM6IGFkZCBzdXBwb3J0IGZvciBob3N0LWNhcmdvLXBhY2th
Z2UgYW5kIHZlbmRvcmluZ10KPiA+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRo
b21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
