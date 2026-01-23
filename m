Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C54D7235E
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 09:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00F3A607DB;
	Fri, 23 Jan 2026 09:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFeZLAaHK-8J; Fri, 23 Jan 2026 09:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 797A760639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769159096;
	bh=JlZc+p4nXY9l8IFJHNjNJDghAPfh25ZyFCWAS5/uQf0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=qv8LobyfOm242kM8f6XdZ3/SiCNhsdM50Fwve3GKwvnwkNg/GYNz+4yoA55zRFCbf
	 kTnZGUIcm6igd1iPCxr/LKZ9O/NnvKLK+l9qoylG+AH9ZJXD+gv0S8vzBJjLeIhA8S
	 BsKRUocdggaRiN69n5r9fRsP1+qMM2bp58Mt8XxyVKkX7riiJ1X91w7MFCjlxV0Iu+
	 ScgrHyyVYuLxRSQeUmvRWVdyYUfcoDs5Do+Jax2PB6KRe3noIG7yeDcN2CRqoIvjXZ
	 HVvu5ya7eRc6ysO3iJr0UR3ES9rnT4wEtqkCDI3BI8siNMFcnQJUY+0tPPTGjiUTQ5
	 zPQl6iDZbjKgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 797A760639;
	Fri, 23 Jan 2026 09:04:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 584AB358
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 09:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C937407E2
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 09:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRxlJPAcED6E for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 09:04:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2569B406EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2569B406EF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2569B406EF
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 09:04:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F11E6C21AB9;
 Fri, 23 Jan 2026 09:04:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B626D6070A;
 Fri, 23 Jan 2026 09:04:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D13DD119A8790; Fri, 23 Jan 2026 10:04:46 +0100 (CET)
Mime-Version: 1.0
Date: Fri, 23 Jan 2026 10:04:46 +0100
Message-Id: <DFVUK04XCWZ4.13SUB7SBJ0KGU@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
 <DEB1EVAFW4Z3.3332HVBE1P80H@bootlin.com>
In-Reply-To: <DEB1EVAFW4Z3.3332HVBE1P80H@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1769159090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8am5nGs4aOmCZMZq2TDum5OSVcsauPe6i8cIudVRa4o=;
 b=fKu2ObDukWBfE9yid3zHQ0SDdW0DiyigjCYVwXdYBH9mIReqkGR++MfB+wofs7tvfjyTTK
 QQ1mLP54JMbVobn1T4PIc2n4p87XMEF7+ujr/W6sUVbh5rDmq14fEGR7WqkzesTDJi3rhz
 Akn+BvYRtn4RUuHsuxgPXJvwW+3L3Xn7kW/JwpMNcyOUncBv7cl5/XZsk/cRPyHnrouX36
 BpsiTvzXiJ5MxYsfpN3zqcbwDAUifjWv9B3f7oj1u9tWVnuYEnGL0GQfd3HVr6tL93YJpb
 J/yA6MwyYn+lcTRJgLnVHDCmBe0+gRDji6gbRKzTjSE4nMJGJVC9sp+vsbuqwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fKu2ObDu
Subject: Re: [Buildroot] [PATCH v3 0/5] package/compliance-as-code:
 introduce new package
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gYnVpbGRyb290IG1haW50YWluZXJzLAoKT24gTW9uIE5vdiAxNywgMjAyNSBhdCAzOjI1
IFBNIENFVCwgQWxleGlzIExvdGhvcsOpIHdyb3RlOgo+IEhlbGxvLAo+Cj4gT24gVGh1IE9jdCAx
NiwgMjAyNSBhdCA0OjQ2IFBNIENFU1QsIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPj4gSGVsbG8s
Cj4+IHRoaXMgaXMgdGhlIHYzIG9mIHRoZSBzZXJpZXMgYnJpbmdpbmcgaW4gQ29tcGxpYW5jZSBB
cyBDb2RlIHBvbGljaWVzIFsxXQo+PiAoQ2FDKSBvbiBhIHRhcmdldC4gdjIgaGFzIG5vdCByZWNl
aXZlZCBhbnkgbmV3IHJldmlldyBzaW5jZSBpdCBoYXMgYmVlbgo+PiBzZW50LCBidXQgaW4gdGhl
IG1lYW4gdGltZSwgSSBmb3VuZCBzb21lIHNtYWxsIGlzc3VlcyAoZWl0aGVyIGF0IGJ1aWxkCj4+
IHRpbWUgb3IgcnVudGltZSwgZHVlIHRvIGEgbGFjayBpbiBteSB0ZXN0aW5nIHNldHVwKSBzbyB0
aGlzIG5ldyByZXZpc2lvbgo+PiBhY3RzIGJvdGggYXMgYW4gdXBkYXRlIGFuZCBhIHJlc2VuZC4K
Pgo+IEl0J3MgYmVlbiBhIG1vbnRoIHNpbmNlIGxhc3QgcmV2aXNpb24sIGFuZCBhc2lkZSBmcm9t
IGEgUi1CLCBubyBuZXcgcmVxdWVzdAo+IGZvciBjaGFuZ2UgaGFzIGJlZW4gcG9zdGVkLiBBbnkg
bmV3IG9waW5pb24gb24gdGhvc2UgYWRkaXRpb25zID8gSWYgbm90LAo+IGNvdWxkIHdlIHBsZWFz
ZSBtb3ZlIGZvcndhcmQgd2l0aCB0aGlzIHNlcmllcyA/CgpJdCdzIGJlZW4gbm93IG1vcmUgdGhh
biB0d28gbW9udGhzIHNpbmNlIGJ5IGxhc3QgcGluZywgd2l0aG91dCBhbnkKY29tbWVudCBvciBj
aGFuZ2UgcmVxdWVzc3Qgb24gdGhlIHNlcmllcy4gV2hhdCBpcyBwcmV2ZW50aW5nIGl0IGZyb20K
YmVpbmcgbWVyZ2VkID8KClRoYW5rcywKCkFsZXhpcwoKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
