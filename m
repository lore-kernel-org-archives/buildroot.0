Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D7CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 16:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4C2A40A58;
	Wed, 12 Jan 2022 16:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lcZGV2Cz1hYJ; Wed, 12 Jan 2022 16:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7948542464;
	Wed, 12 Jan 2022 16:48:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8991BF4E3
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CB3B6FBF3
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdlOyzMvsahE for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 16:48:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E4FD60008
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 16:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1AaYVb3ZuV8wtWahFJoTA5eOg1FBS7wq2anhbgjaieg=; b=T5KdJBfi+Hfq+Y1NU7GGy1zAnw
 Zlu0EubbCEqkXhsGAaUxATuIBfqPqu+ecLIFMt/E3xSGVPk+COpkauI2CzeXva4xvWwQwWlrGsu+8
 XCPTTNEuzHureClDoopheNIxNYKDMAFOBun8hbSjaUXqac8PDQVXxW5xOeI/tnj6llfFFSLJKIo8Y
 02LqDHANw1C07L5RA2Yirl0RLT1MD3MkOdq54uwtSvy57txh0ajP7IE0sk9ETOIs21U6/MB1OfRZ/
 fDwITLoPILfKV8hCcL91o1mEIameR2NPZxOSzTU6AS3RLJ2BS+Cc9TrbPHT/VOHDbzS83/PpLmZ0f
 TSTy+MuA==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7gmy-0002fz-OI; Wed, 12 Jan 2022 17:47:57 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id c5a001f1;
 Wed, 12 Jan 2022 16:47:33 +0000 (UTC)
Date: Wed, 12 Jan 2022 18:47:29 +0200
Message-ID: <20220112184729.GB23006@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Alexander Dahl <post@lespocky.de>
In-Reply-To: <20220112160512.GC6032@falbala.internal.home.lespocky.de>
References: <20220112132618.2634250-1-aperez@igalia.com>
 <20220112160512.GC6032@falbala.internal.home.lespocky.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH RFC 0/2] Use Ninja as build tool for
 CMake-based packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6257997326876135342=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6257997326876135342==
Content-Type: multipart/signed; boundary="LAoqGjlTZRTOxTlI"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--LAoqGjlTZRTOxTlI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgQWxleGFuZGVyLAoKT24gV2VkLCAxMiBKYW4gMjAyMiAxNzowNToxMyArMDEwMCBBbGV4YW5k
ZXIgRGFobCA8cG9zdEBsZXNwb2NreS5kZT4gd3JvdGU6CiAKPiBPbiBXZWQsIEphbiAxMiwgMjAy
MiBhdCAwMzoyNjoxNlBNICswMjAwLCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIHdyb3RlOgo+ID4g
QXMgZGlzY3Vzc2VkIHllc3RlcmRheSwgaGVyZSBpcyBhIHF1aWNrIHN0YWIgZm9yIHRlc3Rpbmcg
YW5kIGdldHRpbmcgdGhlCj4gPiBjb252ZXJzYXRpb24gc3RhcnRlZCBhYm91dCB1c2luZyBOaW5q
YSBmb3IgQ01ha2UtYmFzZWQgcGFja2FnZXMgKGhlbmNlIHRoZQo+ID4gbWlzc2luZyBkb2N1bWVu
dGF0aW9uIHVwZGF0ZXMgYW5kIHRoZSAiUkZDIiB0YWcgaW4gdGhlIHN1YmplY3QgOi1EKS4KPiAK
PiBJIG1pc3Mgc29tZSBnZW5lcmFsIG1vdGl2YXRpb24gZm9yIHN3aXRjaGluZyBmcm9tIE1ha2Vm
aWxlIHRvIE5pbmphCj4gZ2VuZXJhdG9yLiBDYW4geW91IGFkZCBzb21lIHJlYXNvbmluZyBvciBu
dW1iZXJzIHRvIHVwY29taW5nIHBhdGNoIHNldAo+IHJldmlzaW9ucz8KCk5pbmphIGlzIGdlbmVy
YWxseSBmYXN0ZXIsIHRlbmRzIHRvIG1ha2UgYmV0dGVyIHVzZSBvZiBwYXJhbGxlbGlzbSwgYW5k
CmluIG15IGV4cGVyaWVuY2UgbGVzcyBsaWtlbHkgdG8gYnJlYWsgaW4gb2RkIHdheXMuIE9uY2Ug
SSBoYXZlIGEgZGVmY29uZmlnCndpdGggYSBiaWdnZXIgc2V0IG9mIENNYWtlLWJhc2VkIHBhY2th
Z2VzIHdvcmtpbmcgSSdsbCBkbyBzb21lIG51bWJlcnMgYXMKd2VsbCB0byBjb21wYXJlIGJ1aWxk
IHRpbWVzIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIHN3aXRjaCB0byBOaW5qYS4KCkNoZWVycywK4oCU
QWRyacOhbgo=

--LAoqGjlTZRTOxTlI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYd8GIQAKCRCRxVnb5MkS
O/zHAJ9UhCDmCHe+woa2xXTAU5OmQ9mn6ACaA1hM/xptxUyMQLMULJcctr3apbk=
=XJ8p
-----END PGP SIGNATURE-----

--LAoqGjlTZRTOxTlI--

--===============6257997326876135342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6257997326876135342==--
