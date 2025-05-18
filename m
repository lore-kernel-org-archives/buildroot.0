Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61DEC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5731160ADD;
	Sun, 18 May 2025 08:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmkeTNX5k3ez; Sun, 18 May 2025 08:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C7E860C16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C7E860C16;
	Sun, 18 May 2025 08:54:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C31EDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CA1C60ADD
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-ME7SGMT_Xw for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A1A360775
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A1A360775
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A1A360775
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:54:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6540E43217;
 Sun, 18 May 2025 08:54:07 +0000 (UTC)
Date: Sun, 18 May 2025 10:54:06 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>, Sen
 Hastings <sen@hastings.org>
Message-ID: <20250518105406.41cb1a2f@windsurf>
In-Reply-To: <20250423152906.1017522-1-raphael.melotte@mind.be>
References: <20250423152906.1017522-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopehsv
 ghnsehhrghsthhinhhgshdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MoK8wOkBNDZDukw5uZ7TrI8trwpXUNEU6r72SpoE3nU=;
 b=cHAlZqEjYsnsEf//MPxRNk5gahUq5XYaqv4SospnrvTUQE4YHJWD294WUZtbEUzqNED1Fc
 LcJkfWcvfvJfwSv8vcJcSIHPREd2bwhAOKobhYdyPjfxPzMLP4+Qpk9wzciwpt0Fwef1BO
 zUZKqu4Cwm9x5CwTmr36EaV+9p6IkIlo1XIJboja1NTUHqiR6D2y8vxAoIXZzYejDDvV97
 F0i/WmmTImaTSqkGbjyrDDREupUOFq/972FltQAujFVVt4anTjtyklX44cLZGs8Uoj9soX
 +l+wiP6l6BpGsU/OgNmcIQ+x5uDvmRrw0LH+Neo1unAqA4TUaiWOcTiNhEGAng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cHAlZqEj
Subject: Re: [Buildroot] [RFC PATCH 1/1] support/scripts/pkg-stats: add
 support for reporting stale CVE entries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMyBBcHIgMjAyNSAxNzoyOTowNSArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IFRoZSBOVkQgZGF0
YWJhc2UgY29udGFpbnMgc29tZSBDUEVzIHRoYXQgYXJlIHdyb25nbHkgbm90IGFzc29jaWF0ZWQK
PiB3aXRoIGFueSB2ZXJzaW9uIG51bWJlci4gVGhleSBhcmUgZm9yIGV4YW1wbGUgc29tZXRpbWVz
IGFzc29jaWF0ZWQKPiB3aXRoIHZlcnkgb2xkIENWRXMuCj4gVGhvc2UgQ1BFcyBhcmUgYW5ub3lp
bmcsIGJlY2F1c2UgdGhleSBwb2xsdXRlIG91ciBwa2ctc3RhdCBDVkUgcmVzdWx0cwo+IHdpdGgg
Q1ZFIGVudHJpZXMgd2hpY2ggYWN0dWFsbHkgZG9uJ3QgYWZmZWN0IHVzLgo+IAo+IFRoZSBwcm9w
ZXIgd2F5IHRvIHNvbHZlIGl0IGlzLCBhbmQgc2hvdWxkIHJlbWFpbiwgdG8gZml4IHRoZSBOVkQK
PiBkYXRhYmFzZSBieSByZXBvcnRpbmcgdGhlc2UgaXNzdWVzLiBIYXZpbmcgdG8gZGVhbCB3aXRo
IGEgbG90IG9mCj4gQ1ZFcy9DUEVzLCB0aGUgTlZEIGRhdGFiYXNlIGlzIGhvd2V2ZXIgc2xvdyB0
byBiZSB1cGRhdGVkLgo+IAo+IFRvIHJlZHVjZSB0aGUgbm9pc2UgaW4gb3VyIHBrZy1zdGF0cyBy
ZXN1bHRzIGluIHRoZSBtZWFudGltZSwgb25lCj4gcG9zc2liaWxpdHkgaXMgdG8gYWRkIDxQS0df
SUdOT1JFX0NWRVM+IGVudHJpZXMgZm9yIHRob3NlIENWRXMuICBUaGlzCj4gaG93ZXZlciBjb21l
cyB3aXRoIHRoZSBkb3duc2lkZSB0aGF0IGV2ZW4gb25jZSB0aGUgTlZEIGRhdGFiYXNlIGdldHMK
PiBmaXhlZCwgdGhvc2UgaWdub3JlZCBlbnRyaWVzIHJpc2sgcmVtYWluaW5nIGluIEJ1aWxkcm9v
dCBmb3JldmVyCj4gYmVjYXVzZSB0aGV5IGFyZSB1bmRldGVjdGVkLgo+IAo+IFRoaXMgY29tbWl0
IHRyaWVzIHRvIGFkZHJlc3MgdGhpcyBkb3duc2lkZSBieSBjaGVja2luZyBmb3IgYW5kCj4gcmVw
b3J0aW5nIENWRXMgdGhhdCBhcmUgaWdub3JlZCBpbiBCdWlsZHJvb3QsIGJ1dCB3aGVyZSB0aGUK
PiBOVkQgcmVwb3J0cyBvdXIgcGFja2FnZSB2ZXJzaW9uIGFzIHVuYWZmZWN0ZWQuIFRob3NlIENW
RXMgd2lsbCBhcHBlYXIKPiBpbiB0aGUgJ0NWRXMgSWdub3JlZCcgY29sdW1uIGFzICcoc3RhbGUp
JywgYW5kIHRoZSBjZWxsIHdpbGwgYmUKPiBjb2xvcmVkIHRoZSBzYW1lIHdheSB3YXJuaW5ncyBh
cmUuIFRoaXMgc2hvdWxkIGFsbG93IHVzIHRvIGRldGVjdCBhbmQKPiByZW1vdmUgdGhvc2UgZW50
cmllcy4KPiAKPiBJdCBjYW4gYmUgdGVzdGVkIGZvciBleGFtcGxlIGJ5IGFkZGluZyB0aGUgZm9s
bG93aW5nIHZhcmlhYmxlIHRvIHRoZQo+IGFwYWNoZSBwYWNrYWdlIChmb3IgYSBDVkUgdGhhdCB3
YXMgcmVjZW50bHkgZml4ZWQgaW4gdGhlIE5WRCBkYXRhYmFzZSk6Cj4gQVBBQ0hFX0lHTk9SRV9D
VkVTID0gQ1ZFLTE5OTktMDIzNgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRl
IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiAtLS0KPiAgc3VwcG9ydC9zY3JpcHRzL2N2ZS5w
eSAgICB8ICA0ICstLS0KPiAgc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cyB8IDM2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpHcmVhdCBzdHVmZiwgdGhhbmtzIGEgbG90ISBBcHBs
aWVkIHRvIG1hc3Rlci4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
