Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B636EC4338F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 07:43:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F7F61ACE
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 07:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04F7F61ACE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC580401B5;
	Mon, 16 Aug 2021 07:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTEW4uM6tI33; Mon, 16 Aug 2021 07:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 006CE4012B;
	Mon, 16 Aug 2021 07:42:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01D0E1BF316
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 07:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2599606A8
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 07:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hwxNXafM7cE for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 07:42:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A67EB606A5
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 07:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date;
 bh=pD/nvIu5ZBEmOTSTgjXNtyyDP1sl6mztxbJQjoDOCXc=; 
 b=UQMMUbsa4kr8RxbkRI1WlFsg6MZztotBIbnL3lgqDMCxwnFCu671nxW1DkzHnc/UD6yif2t3gz1OBEf1NUs/wOM4sO6POLF198LFOS/Rw42xUt6wpm/PzzzH6Et9ykwbr2W70PeTfb80Zkr5YMhmD3TG4qfk/Lv48ULHGphbDKze0C0nesnT4w9A/woCVaHn3Q5BalqMYDvbKiid8456QEehE4udNiewp1btulBduDGFUqdCU49mhMy6UQqr49KBKif9Sm47I49qgy3YMji2rZYfJ4yrtEpsKmL4bFTwJ7XOdIh3O/t4XZLYKjQGPnSsmZUHv/bpBfF0S4kxX/Vojw==;
Received: from 82-181-161-131.bb.dnainternet.fi ([82.181.161.131] helo=momiji)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mFXGc-0004K1-8y; Mon, 16 Aug 2021 09:42:42 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 931e2ccb;
 Mon, 16 Aug 2021 07:42:29 +0000 (UTC)
Date: Mon, 16 Aug 2021 10:42:25 +0300
Message-ID: <20210816104225.GD45136@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20210813151839.4ed41911@windsurf>
References: <20210811111158.2577789-1-aperez@igalia.com>
 <20210811111158.2577789-3-aperez@igalia.com>
 <20210813151839.4ed41911@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/wlroots: bump to version 0.14.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7510409097563747140=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>


--===============7510409097563747140==
Content-Type: multipart/signed; boundary="0F2aQJC4/jEPgrvl"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--0F2aQJC4/jEPgrvl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAxMyBBdWcgMjAyMSAxNToxODozOSArMDIwMCBUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiBPbiBXZWQsIDExIEF1ZyAyMDIxIDE0
OjExOjU3ICswMzAwCj4gQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+
IHdyb3RlOgo+IAo+ID4gVXBkYXRlIHRvIHZlcnNpb24gMC4xNC4xLCBhbmQgYWRhcHQgdG8gdXBz
dHJlYW0gY2hhbmdlczoKPiA+IAo+ID4gLSBzZWF0ZC9saWJzZWF0IGlzIG5vdyB1c2VkIHVuY29u
ZGl0aW9uYWxseSwgdGhlIGxvZ2luZC9lbG9naW5kIGJ1aWxkCj4gPiAgIG9wdGlvbnMgaGF2ZSBi
ZWVuIHJlbW92ZWQgKHdoaWNoIGNhbiBiZSB1c2VkIHRocm91Z2ggc2VhdGQsIG5vCj4gPiAgIGZ1
bmN0aW9uYWxpdHkgaXMgbG9zdCkuCj4gPiAtIE5vdyB3bHJvb3RzIGluY2x1ZGVzIGEgc29mdHdh
cmUtYmFzZWQgcmVuZGVyZXIgKHdoaWNoIHVzZXMgcGl4bWFuKSwKPiA+ICAgYW5kIHRoZSBPcGVu
R0wgRVMgb25lIGlzIG9wdGlvbmFsLiBGb3Igbm93IGl0IGlzIGxlZnQgYWx3YXlzIGVuYWJsZWQK
PiA+ICAgKGFzIGl0IHdhcyBiZWZvcmUpIGJ1dCB0aGlzIGNvdWxkIGJlIGNoYW5nZWQgaW4gdGhl
IGZ1dHVyZS4KPiAKPiBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gc3VwcG9ydCB0aGUgcGl4
bWFuLWJhc2VkIHNvZnR3YXJlIHJlbmRlcmVkLAo+IGFzIHRoZXJlIGFyZSBxdWl0ZSBhIGZldyBl
bWJlZGRlZCBwbGF0Zm9ybXMgdGhhdCBkb24ndCBoYXZlIGEgR1BVLgoKQWdyZWVkISBDdXJyZW50
bHkgdGhlIHBpeG1hbiByZW5kZXJlciBpcyBhbHdheXMgYnVpbHQgaW50byB3bHJvb3RzLCBhbmQg
dGhlCkdMRVMgb25lIGlzIG9wdGlvbmFsLiBJIGhhdmUgYSBoYWxmLWJha2VkIHBhdGNoIGxvY2Fs
bHkgdG8gYnVpbGQgd2xyb290cwp3aXRob3V0IHRoZSBHTEVTIHJlbmRlcmVyIGFuZCBJIGp1c3Qg
dmVyaWZpZWQgdGhhdCB0aGUgQ2FnZSBjb21wb3NpdG9yIHdvcmtzCmZpbmUgd2l0aCB0aGUgcGl4
bWFuIHJlbmRlcmVyIGJlaW5nIHRoZSBvbmx5IG9uZSBidWlsdCBpbnRvIHdscm9vdHMgWzFdLCBz
bwpJIHdpbGwgYmUgc2VuZGluZyBhIHBhdGNoIGluIHRoZSBuZXh0IGRheXMuCiAKQ2hlZXJzLAot
QWRyaWFuCgoKLS0tClsxXSBTb21lIGNvbXBvc2l0b3JzIGV4cGxpY2l0bHkgdHJ5IHRvIHVzZSB0
aGUgR0xFUyByZW5kZXJlciwgYW5kIGJlY2F1c2Ugc28KICAgIGZhciBDYWdlIGlzIHRoZSBvbmx5
IG9uZSBpbiB0aGUgdHJlZSB0aGF0IGRlcGVuZHMgb24gd2xyb290cywgSSB3YW50ZWQgdG8KICAg
IG1ha2Ugc3VyZSBhZGRpbmcgdGhlIG9wdGlvbiB0byBkaXNhYmxlIGJ1aWxkaW5nIHRoZSBHTEVT
IG9uZSB3aWxsIHdvcmsgYXMKICAgIGludGVuZGVkIDopCg==

--0F2aQJC4/jEPgrvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYRoW4QAKCRCRxVnb5MkS
OwioAJ9qK6tBar9L5/qdV7SyTjRkVSitvACfdZ+3mwI1ZNYGjAjqnP/5E7KXh68=
=7FDY
-----END PGP SIGNATURE-----

--0F2aQJC4/jEPgrvl--

--===============7510409097563747140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7510409097563747140==--
