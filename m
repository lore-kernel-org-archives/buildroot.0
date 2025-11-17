Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EBCCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 14:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7650B60657;
	Mon, 17 Nov 2025 14:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In2A1qbOWUnU; Mon, 17 Nov 2025 14:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1CA960860
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1CA960860;
	Mon, 17 Nov 2025 14:25:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 997F91A9
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 14:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7863C811F7
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 14:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhVr_3z1UV8o for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 14:25:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67B8F81194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B8F81194
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67B8F81194
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 14:25:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2147D1A1B76;
 Mon, 17 Nov 2025 14:25:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E92ED606B9;
 Mon, 17 Nov 2025 14:25:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 935A410371C4A; Mon, 17 Nov 2025 15:25:14 +0100 (CET)
Mime-Version: 1.0
Date: Mon, 17 Nov 2025 15:25:13 +0100
Message-Id: <DEB1EVAFW4Z3.3332HVBE1P80H@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
In-Reply-To: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1763389517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xROJ2c2eFGLyEnmZNfxznRqXaZJ0dgEDcYwvxF7StiI=;
 b=FaOgambJllAcy/bNPmrAR75n2XzPnn0cUXRxB3IIWV/DeRUBhX+oudfD97kjNy4eM3talz
 4GZHVH7Fh7G6BLfVX4YKpZOyjRsXTOa0LUZ44HsgN7+X5dW2ro0sP/5W5cWSuCi11XE7bx
 CDsD54zIvwHzHjSM0QCQCbESg2LINxxzHIiLH51vOsMN0WSNJhLXZIB8gZ6X32En/4xcy8
 IOnARh7lwWlO0z12siOsllv3sfBsFEVwfU0O5L+g87+6gl1MhJmx7ugfagtEvQ8xljzbxB
 aSZHR+ACDFT8sV5I65Zji2rOIx+sCkqL3wUSgs+Rb5rB80L43a2Lj4/Wdomu7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FaOgambJ
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

SGVsbG8sCgpPbiBUaHUgT2N0IDE2LCAyMDI1IGF0IDQ6NDYgUE0gQ0VTVCwgQWxleGlzIExvdGhv
csOpIHdyb3RlOgo+IEhlbGxvLAo+IHRoaXMgaXMgdGhlIHYzIG9mIHRoZSBzZXJpZXMgYnJpbmdp
bmcgaW4gQ29tcGxpYW5jZSBBcyBDb2RlIHBvbGljaWVzIFsxXQo+IChDYUMpIG9uIGEgdGFyZ2V0
LiB2MiBoYXMgbm90IHJlY2VpdmVkIGFueSBuZXcgcmV2aWV3IHNpbmNlIGl0IGhhcyBiZWVuCj4g
c2VudCwgYnV0IGluIHRoZSBtZWFuIHRpbWUsIEkgZm91bmQgc29tZSBzbWFsbCBpc3N1ZXMgKGVp
dGhlciBhdCBidWlsZAo+IHRpbWUgb3IgcnVudGltZSwgZHVlIHRvIGEgbGFjayBpbiBteSB0ZXN0
aW5nIHNldHVwKSBzbyB0aGlzIG5ldyByZXZpc2lvbgo+IGFjdHMgYm90aCBhcyBhbiB1cGRhdGUg
YW5kIGEgcmVzZW5kLgoKSXQncyBiZWVuIGEgbW9udGggc2luY2UgbGFzdCByZXZpc2lvbiwgYW5k
IGFzaWRlIGZyb20gYSBSLUIsIG5vIG5ldyByZXF1ZXN0CmZvciBjaGFuZ2UgaGFzIGJlZW4gcG9z
dGVkLiBBbnkgbmV3IG9waW5pb24gb24gdGhvc2UgYWRkaXRpb25zID8gSWYgbm90LApjb3VsZCB3
ZSBwbGVhc2UgbW92ZSBmb3J3YXJkIHdpdGggdGhpcyBzZXJpZXMgPwoKVGhhbmtzLAoKQWxleGlz
CgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
