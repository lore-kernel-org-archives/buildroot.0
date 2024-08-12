Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DFBC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 19:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 430CE60763;
	Mon, 12 Aug 2024 19:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EORErc00APUq; Mon, 12 Aug 2024 19:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B6B260783
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B6B260783;
	Mon, 12 Aug 2024 19:41:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C544D1BF59A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1BB760783
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pkyi-1zt10Zx for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 19:41:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7044360763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7044360763
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7044360763
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 19:41:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50A0AFF802;
 Mon, 12 Aug 2024 19:41:25 +0000 (UTC)
Date: Mon, 12 Aug 2024 21:41:24 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240812214124.2a7b520f@windsurf>
In-Reply-To: <20240811-aer-inject-v1-1-9cee7e3bd9b2@gmx.net>
References: <20240811-aer-inject-v1-1-9cee7e3bd9b2@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723491685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbtqcZCxzK6erD7TmbsH/MFl6rgcylrROaCHp5KXUKY=;
 b=QsKx35ThZblsro+2/kY8h/ic2WQDFsMIcnMa9i8HPFknYFB1AGefOQbUX9oFcGOSUaYwlQ
 NPdM3+wmHJdRr3WDLGxj+qpAvXXJhOcqy1hhEl5lAl4Cd1v5ayi1JpC3413HwOjyzEF0ye
 NFzlZzqTgzk7cCvV2bL/xZjHNTbGTmxWYBSdUJOL+7yzu1KHI+RaDZ84RiWZ+YCvxBLghc
 +gJsDt/acL7z3NyYfohhWIht+ndsxNc/VQ3PSYbZcQOM3+vQwP8hviO60vSs9qmJzYD2j3
 IKk9pmEPwXuV9X2njPkBCdcXC2EAxqv5y8OhD3Wd+mwEuq8ErJJFbOsyqTaKVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QsKx35Th
Subject: Re: [Buildroot] [PATCH] package/aer-inject: Fix build error due to
 missing basename() prototype
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSiwKClRoYW5rcyBhIGxvdCBmb3IgeW91ciBwYXRjaCwgd2hpY2ggSSBoYXZlIGFwcGxp
ZWQuIEkganVzdCBoYXZlIGEgZmV3CnZlcnksIHZlcnkgbWlub3Igc3VnZ2VzdGlvbnMgdG8gZnVy
dGhlciBpbXByb3ZlIHlvdXIgbmV4dCBwYXRjaGVzLgoKRmlyc3Qgb2YgYWxsLCBJIHBlcnNvbmFs
bHkgbGlrZSB0aGF0IHRoZSBjb21taXQgdGl0bGUgc3RhcnRzIHdpdGggYQpsb3dlci1jYXNlIGxl
dHRlciwgaS5lOiAicGFja2FnZS9hZXItaW5qZWN0OiBmaXggLi4uIiByYXRoZXIgdGhhbgoicGFj
a2FnZS9hZXItaW5qZWN0OiBGaXggLi4uIi4KCk9uIFN1biwgMTEgQXVnIDIwMjQgMTI6MzQ6MjUg
KzAyMDAKSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5v
cmc+IHdyb3RlOgoKPiBGaXhlcyBzZXZlcmFsIGJ1aWxkIGZhaWx1cmVzIHN1Y2ggYXM6CgpQbGVh
c2Ugd3JpdGUganVzdCAiRml4ZXM6Ii4gVGhpcyB3YXksIHBhdGNod29yayBkZXRlY3RzIGl0J3Mg
YSBwYXRjaApmaXhlcyBzb21ldGhpbmcsIGFuZCBpdCBmbGFncyBpdCBhcyBzdWNoLgpTZWUgaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lywgd2hlcmUg
dGhlIGNvbHVtbiBBL0YvUi9UIGZsYWdzIHRoZSBwYXRjaGVzIHRoYXQgaGF2ZSBhIEFja2VkLWJ5
OiwgYSBGaXhlczosIGEgUmV2aWV3ZWQtYnk6IG9yIGEgVGVzdGVkLWJ5Oi4KCj4gICBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9lNjEvZTYxM2ZjNzc3MDUxYmU2MzI1ZDdl
M2MwODhkNWY3MjNmYWI1MThmYS9idWlsZC1lbmQubG9nCgpXZSBsaWtlIHRvIGhhdmUganVzdDoK
CiAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZTYxM2ZjNzc3MDUxYmU2
MzI1ZDdlM2MwODhkNWY3MjNmYWI1MThmYS8KCmkuZSBkb24ndCBwb2ludCB0byBidWlsZC1lbmQu
bG9nLCBidXQgdG8gdGhlIGJ1aWxkIHJlc3VsdCwgYW5kIGRyb3AgdGhlCmV4dHJhIC9lNjEvIGlu
IHRoZSBVUkwuCgo+IFRoaXMgcGF0Y2ggaXMgZnJvbSBLdXBwdXN3YW15IFNhdGh5YW5hcmF5YW5h
bidzIGZvcmsgb2YgYWVyLWluamVjdC4gQW4KPiBhbHRlcm5hdGl2ZSB0byBpbmNsdWRpbmcgdGhl
IHBhdGNoIHdvdWxkIGJlIHRvIHN3aXRjaCB0byB0aGlzIGZvcmsgYXMKPiBCdWlsZHJvb3QncyBp
ZGVhIG9mIHVwc3RyZWFtLiBDdXJyZW50bHksIGl0IGlzIHRoZSBvbmx5IGNoYW5nZSBpbiB0aGUK
PiBmb3JrLCB0aG91Z2guCgpJIGd1ZXNzIGF0IHRoaXMgcG9pbnQsIGl0J3MgZmluZSB0byBrZWVw
IHRoaW5ncyBhcyB0aGV5IGFyZS4gSG93CiJvZmZpY2lhbCIgaXMgZWFjaCBvZiB0aG9zZSB0d28g
YWVyLWluamVjdCBHaXQgcmVwb3M/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
