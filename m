Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3403C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA7140555;
	Sun, 24 Mar 2024 17:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkJDhwW86LuF; Sun, 24 Mar 2024 17:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7067C405C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7067C405C2;
	Sun, 24 Mar 2024 17:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 425FA1BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E5C481A81
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d39r4-BZYnAK for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43D328146E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43D328146E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43D328146E
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:46:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABD25C0005;
 Sun, 24 Mar 2024 17:45:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1roRuw-006DIt-2W;
 Sun, 24 Mar 2024 18:45:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20240316084335.20839-1-bernd@kuhls.net>
 <20240316084335.20839-2-bernd@kuhls.net>
 <113740e8-230d-4ab3-bb9f-12e1bb66cd85@mind.be>
 <0c44fe3f-e87e-42fe-bbab-743fee1306a3@mind.be>
Date: Sun, 24 Mar 2024 18:45:58 +0100
In-Reply-To: <0c44fe3f-e87e-42fe-bbab-743fee1306a3@mind.be> (Arnout
 Vandecappelle's message of "Sun, 24 Mar 2024 17:00:31 +0100")
Message-ID: <87v85bh6ax.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/5] package/busybox: disable tc to fix
 build with kernel >= 6.8
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3
cml0ZXM6CgogPiBPbiAxNi8wMy8yMDI0IDIwOjI1LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90
ZToKID4+IAogPj4gCiA+PiBPbiAxNi8wMy8yMDI0IDA5OjQzLCBCZXJuZCBLdWhscyB3cm90ZToK
ID4+PiBGb3IgZGV0YWlscyBzZWUgaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNn
aT9pZD0xNTkzNAogPj4gCiA+PiDCoEknbSBhIGJpdCBhZnJhaWQgdG8gYXBwbHkgdGhpcy4gSG9w
ZWZ1bGx5IHRoZSBpc3N1ZSB3aWxsIGJlIGZpeGVkCiA+PiBhdCBzb21lIHBvaW50IGluIGJ1c3li
b3g7IHRoZW4sIHdlIHNob3VsZCBwcm9iYWJseSByZXZlcnQgdGhpcyBwYXRjaAogPj4gKHRob3Vn
aCBob25lc3RseSBJIGRvbid0IGtub3cgd2hhdCB0YyBpcyBkb2luZyBpbiB0aGUgbWluaW1hbAog
Pj4gY29uZmlnLi4uKS4KCgogPiDCoEkgZGlkbid0IGFwcGx5IHRoaXMgb25lIG5vciB0aGUgZm9s
bG93aW5nIHR3by4gSSdtIGhvcGluZyB0aGUgb3RoZXIKID4gbWFpbnRhaW5lcnMgY2FuIHBpcGUg
dXAgd2l0aCBpZGVhcyBvZiBob3cgdG8gYmVzdCBkZWFsIHdpdGggdGhpcz8KCkkgYWxzbyBkb24n
dCB0aGluayBoYXZpbmcgdGMgZW5hYmxlZCBieSBkZWZhdWx0IG1ha2VzIGEgbG90IG9mCnNlbnNl
LiBOb3RpY2UgdGhhdCBVd2UgcmVjZW50bHkgcG9zdGVkIGEgcGF0Y2ggdXBzdHJlYW0gdG8gZml4
IHRoZSBidWlsZAppc3N1ZToKCmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVz
eWJveC8yMDI0LU1hcmNoLzA5MDY3OC5odG1sCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
