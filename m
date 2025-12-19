Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A033E6689C
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A8A880B84;
	Fri, 19 Dec 2025 22:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltJ83Ah2aIEB; Fri, 19 Dec 2025 22:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 298C580B4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766182554;
	bh=gBJIDMUltJIg2i0OghJe4c/cQNJswFF5WYZUsg7kSqE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O8jvQ+VMdXE3pU/1cDaLGj+lfIlRoQigV226EHY6P1q6kEBcjkzE6mNGkqOPC6h4A
	 jNO0E4wXvSScaKilPnXfd/XlzoZBfsHMl5Jy+/VLtoD9S2QPmXRGtM8r4ZonKjO5p5
	 dqNX0BmpxOkIfBoWwiua81vyQE/WvYgSFDqX2AwWps0ycdGrX0H3InrvxEtFyELcjP
	 yn/ymWQr1kDW71yBS4TqSvf35KG/78Fr46qIXSvqiW39bltrP6cjkbrsAwmQyu8zWf
	 l01LfYKU5pS2ICQlLiyageL/JSRVIfHoA8R4YAjsQ1ELbgLl04ACkfjuzpeYWnjBDU
	 mYjljBVBnr/8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 298C580B4C;
	Fri, 19 Dec 2025 22:15:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0DF4119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7AA1402D7
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k20Viv6LVAVM for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4B1A402D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B1A402D5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4B1A402D5
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:15:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A9681780372;
 Fri, 19 Dec 2025 23:15:46 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 23:15:46 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 23:15:46 +0100
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251218234526.3317029-2-salvador.joseluis@gmail.com>
References: <20251218234526.3317029-2-salvador.joseluis@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <806522c5d45fa084020184b2b183e11d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766182547;
 bh=a1VQQ5skeJooYRfnQcYl4A31NL8h68Ftgmk4jL9EA5E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f8/AV7/etBpemK7Q6bKagSxzJLGQ3KSDLRjxjG9PbWkCCsePWypPbNb+1uPTwqvqC
 fUsiP/0RnUL6WGf2HnwyMahWC/iQK28LVGKgAirY19ReFAFNN/SbtDDjJOK+XfPMPy
 7OS9Jsy6JRD8EXmMse97LfyZ05ezoH+YyyQM4N7ybW49C1MuhZlYM9a2UaaTT1u/qz
 om76wWvhjGggCMqk44Gm+zImiVkc5JcksDU0mOkUxTuYMIUMHqYrEWwsDd8wc0oelm
 DdXEoQZdVUau17p51RKtOIjX/mN5Fz22dOC8L0ner3SX/xM+Txj4sUW2po1B4kQr/0
 yo5qDdsNWgvzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=f8/AV7/e
Subject: Re: [Buildroot] [PATCH v2 1/1] package/zfs: bump version to 2.4.0
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

T24gMTkvMTIvMjAyNSAwMDo0NSwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+IFJl
bW92ZWQgYmFja3BvcnRlZCBwYXRjaDoKPiAgLSAwMDAxLXVzZS1zeXNfc3RhdGgtaW5zdGVhZC1v
Zi1saW51eF9zdGF0aC5wYXRjaAo+IE1lcmdlZCB1cHN0cmVhbSBpbjoKPiBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvY29tbWl0L2NjZjVhOGE2ZmNmZGZiZGFhMmYwZmRjYTVkNzg3OTU4
MjI0YmYwNmQKPiAKPiBGb3IgcmVsZWFzZSBub3RlLCBzZWU6Cj4gaHR0cHM6Ly9naXRodWIuY29t
L29wZW56ZnMvemZzL3JlbGVhc2VzL3RhZy96ZnMtMi40LjAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
b3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
