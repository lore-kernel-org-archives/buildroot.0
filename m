Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485B2D5B15E
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 18:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0DC960866;
	Sat, 13 Dec 2025 18:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4bve78z3Tn3; Sat, 13 Dec 2025 18:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0927607EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765649077;
	bh=Nd05U5xwi30nYZKL4+uCAM8flKJpv7a7ugstiabaJk4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QEmMr0ophux62vwEXFEOXzbZOP9Aec+JC7hzn4wPGBbANShI8N7/Pl60OfayvTVxJ
	 ZjdxwjRVWrGYnkssRE/ZsTVFycCBNSYw2Ma/dTOKxUOi7hM6X55U0NnyVP4mljlxDF
	 4HeR7zFMyz1oSEqgpoEAR3ps6Afx1qi/NQL4Qa8saJYZ3g6T7F+oZcoXyhWm9b6wwi
	 FbvTpUGxyMMCUgwIGxIBiKJI34nicYHXAgOHpZj9P8qBlw/hv64PY6Ln4pb1b2gwf/
	 zE57dBjHv7imX/yU5EzDvE2tv3Dc6uffAAAi9+Ixgt8Fc1PT+5da/vqM6+MBBVIDL3
	 /6UswHedK9Gsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0927607EB;
	Sat, 13 Dec 2025 18:04:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C2AA117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72398607EB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VO-RYc9IBI6O for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 18:04:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 710A4607A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 710A4607A2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 710A4607A2
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:04:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2842413F880;
 Sat, 13 Dec 2025 19:04:29 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 19:04:29 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 19:04:29 +0100
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, nicolas.carrier@nav-timing.safrangroup.com
In-Reply-To: <20251209-libldns_drill-v3-1-cce588a002f4@bootlin.com>
References: <20251209-libldns_drill-v3-0-cce588a002f4@bootlin.com>
 <20251209-libldns_drill-v3-1-cce588a002f4@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <494f1a93a19a2449e1c479d7c04119a7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765649072;
 bh=NW0rrnczlP6wQ8rcyV4vyrZ3IXJ3BV1evvtapx5wHmo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k3aR2t2fahFMxlhPo6EMDLjV5/qScRah0L2GeAi2Pg6eMl3VuA5cFxlufc90z58d0
 8qBSLk+H3FkLLuMDgv+oqX+BgTAYKNg1Pyh7imUCztQT6TAz5Nvi4upXCnHuXXHSbw
 rl8wRqzETL++G99PUEjqHOT8kZABLX20mfMQUMjw8hFQ48zKe22S7r80Ka66Ij1P4t
 iqwoBVuMT3TeW9DO3CHFobjuyvnP1DpLP5i+UqPdC4K8TuRjhj3britpsKRAPbTIL4
 yfvl8L7Zjs2riD84SzYN0XCbPh4nkkyLP+OjcYFfRbJyR6vbSMAfBZSG3XIN6mAVZ0
 kxVOISESOK9sA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k3aR2t2f
Subject: Re: [Buildroot] [PATCH v3 1/2] package/libldns: add an option to
 build and install drill
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDkvMTIvMjAyNSAwOTo1NCwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gVGhlIGxpYmxkbnMgbGlicmFyeSBhbHNvIGNvbWVzIHdpdGggYSBDTEkgdG9vbCBuYW1lZCBk
cmlsbCwgYWxsb3dpbmcgdG8KPiBwZXJmb3JtIEROUyByZXF1ZXN0cy4gRHJpbGwgYnVpbGQgaXMg
Y3VycmVudGx5IGRpc2FibGVkIGJ5IGRlZmF1bHQuCj4gCj4gQWRkIGEgS0NvbmZpZyBvcHRpb24g
dG8gYWxsb3cgYnVpbGRpbmcgYW5kIGluc3RhbGxpbmcgZHJpbGwgdG9vbC4gU2V0Cj4gdGhlIGRl
ZmF1bHQgdmFsdWUgdG8gbiB0byBwcmVzZXJ2ZSB0aGUgY3VycmVudCBiZWhhdmlvci4gU2ltaWxh
cmx5IHRvCj4gbGlua3Rlc3QgKHNlZSB0aGUgY29tbWVudCBpbiB0aGUgLm1rKSwgZHJpbGwgZmFp
bHMgdG8gYnVpbGQgY29ycmVjdGx5IAo+IGFzCj4gYSBzdGF0aWMgYmluYXJ5LCBzbyBtYWtlIHRo
ZSBuZXcgb3B0aW9uIGRlcGVuZCBvbiBub24tc3RhdGljIGJ1aWxkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpTZXJpZXMg
YXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
