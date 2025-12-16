Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318BBD5CC8F
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1699E60F90;
	Tue, 16 Dec 2025 09:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jf63Cq1w8xnv; Tue, 16 Dec 2025 09:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0067C60F23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765877419;
	bh=7I8WoJcuq02dt0Vvf+oFK4ZVPgUjH3BkovIJkROm7/o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kPbP4sxeCdz1AN7PVNLbSALfsNROm6HufM1sphqiAi2GMVUXiQ2RY3lZ5dSEiRaHd
	 g3itwZL2R3SKswVPK42o7AdbknrS4oqtXwO22jZSB0W/9FsVOW2nDFb7UR/VeAkWke
	 yAdAa6iVqPAXoLHXZz+RIIb5mcAwLJ7eKDrGw4kCt7U5z4Q+pVtUTz5HeEOllL0Hxz
	 Ky0oVp0d4o+Dio5w4qEFcOo2eSqaO5TtPttWAXgc736COMba4o4oQG/Req27whR2lj
	 fYxUoN/Ht62I12JnK7g16ckSnlNhhTU6h1jtpTlCnzkJsGQA2CHIaib3gMygMFh0SK
	 +2ilz8lZNEFIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0067C60F23;
	Tue, 16 Dec 2025 09:30:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E80C372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 442FE80CAC
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxOtAHahH-Zu for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37FF58150D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FF58150D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37FF58150D
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:30:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AB64CC19D30
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:29:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0E0F46071C;
 Tue, 16 Dec 2025 09:30:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2083211943287; Tue, 16 Dec 2025 10:30:12 +0100 (CET)
Date: Tue, 16 Dec 2025 10:30:10 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, =?UTF-8?B?R2HDq2w=?= PORTAY
 <gael.portay+rtone@gmail.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Martin Bark <martin@barkynet.com>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20251216103010.0f82db79@kmaincent-XPS-13-7390>
In-Reply-To: <20251215224952.1253359-2-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
 <20251215224952.1253359-2-thomas.petazzoni@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765877413; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xQskynR6idCyb44IBSOL1rh1z3lvE+FaIf3rfdnoK/s=;
 b=lcgj1i8veV3u9AqGft9s4DDTQEd7amy5oHkXRVZa2jnz21oZclw3p+4deUJXbE7mtE7s5g
 L4mk+yx0g50k0NkH1VAA7D7wpcHk2fcY45kFFKfEGYuvyP7EE+JubiLvNsUXDhA7ueGTZW
 xsI3ylC89CLRGZKhWdiSrXAd3DvTnYyGurF84eq0oMYKGAT2/48E4LICnsD/NQvmRwBM2d
 eDyMYGA7ZukgKFKTXCAT4OmITHA3CVyVcqm1sAkFqAJBeXDGqcNOyJJjg1f5Q4LE5xwAio
 /Ko9iB9muMxL0YLUSjapCbroEQapzpX4/1r5ERUUukIQJERJAz3itzYrFDSxcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=lcgj1i8v
Subject: Re: [Buildroot] [PATCH 01/13] package/rpi-firmware: drop support
 for vcdbg
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxNSBEZWMgMjAyNSAyMzo0OTozMyArMDEwMApUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gVGhpcyB0b29sIGhhcyBiZWVuIHJl
bW92ZWQgZnJvbSB1cHN0cmVhbSBycGktZmlybXdhcmUsIHNvIGRyb3AgdGhlCj4gY29ycmVzcG9u
ZGluZyBvcHRpb24gYW5kIGxvZ2ljIGluIHJwaS1maXJtd2FyZS5tay4KPiAKPiBUaGUgdG9vbCBo
YXMgYmVlbiByZW1vdmVkIGJ5IHVwc3RyZWFtIGNvbW1pdAo+IGQxZmNjMjYwMzgxODZhZWNjMTUw
MWEwYjc0OTgzMzMwMGFmYmE4MDEgKCJvcHQ6IFJlbW92ZSBidWlsZHMgb2YKPiBkZXByZWN0YXRl
ZCB1c2VybGFuZCB0b29scyIpLgo+IAo+IEl0IGlzIEJ1aWxkb3JvdCBjb21taXQKPiAyOGU2OTUz
YmE4NGQzOWE2MDc0YWVlNDM5YTY0ZWY4NmIxMDlkY2YwICgicGFja2FnZS9ycGktZmlybXdhcmU6
IGJ1bXAKPiB2ZXJzaW9uIHRvIDU0NzY3MjAiKSB0aGF0IGRpZCBhIGJ1bXAgdG8gYSB2ZXJzaW9u
IG9mIHJwaS1maXJtd2FyZSB0aGF0Cj4gbm8gbG9uZ2VyIHByb3ZpZGVkIHZjZGJnLgo+IAo+IENj
OiBLw7ZyeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KPiBDYzogR2HDq2wg
UE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0
YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKUmV2aWV3ZWQtYnk6IEtvcnkg
TWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpUaGFuayB5b3UhCi0tIApLw7Zy
eSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
