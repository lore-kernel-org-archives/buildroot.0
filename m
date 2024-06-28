Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30790C3064D
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 09:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D177D40167;
	Fri, 28 Jun 2024 09:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3LOfDepJmej; Fri, 28 Jun 2024 09:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9907C402C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9907C402C3;
	Fri, 28 Jun 2024 09:59:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2876F1BF20D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 09:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1630A81FDB
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 09:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gW7JV1AqdO9r for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 09:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4A0881FD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A0881FD3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4A0881FD3
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 09:59:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6160EFF80B;
 Fri, 28 Jun 2024 09:59:48 +0000 (UTC)
Date: Fri, 28 Jun 2024 11:59:47 +0200
To: buildroot@buildroot.org
Message-ID: <20240628115947.1fd34cb8@kmaincent-XPS-13-7390>
In-Reply-To: <20240627160910.3545859-5-kory.maincent@bootlin.com>
References: <20240627160910.3545859-1-kory.maincent@bootlin.com>
 <20240627160910.3545859-5-kory.maincent@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719568788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSeEs9elh5bkT30FxyQi6QvFWmuYEb7MDbdQuXwzrY4=;
 b=nU5BFYczQNalL3J3a9W6txTgZ50oisu037VLU61IkvJR1UmXeDgO7mTey3AKv+eQ/oUUUM
 oKPjdTWDFGewO0vNt0PwaBmu2N937R+rOmpMIQa0/n9qlcA/6rUNTAR8CBCrpNYdUfCbdz
 C1zH04v0xjO0dsgH2HNFnNEdOsUvmu5fyPQg+kRHxSeFYxKM8jGZDkzMDmEbdDbf4L8Rm+
 2v72XZkbHIGBouAeH1dC6N449shv8Ua/KIwryRsTpIvBapk4LDDNca3Yp+8dsK/aFLxdm8
 MsxvlG+ZVSwcSOsP3N6n7j9ve+/StfULa+aFYQz8sj6j51AxY2j6z0zrwIhbBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nU5BFYcz
Subject: Re: [Buildroot] [PATCH v2 4/4] boot: Add support for
 TrustedFirmware-M package
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, thomas.petazzoni@bootlin.com,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyNyBKdW4gMjAyNCAxODowOTowOSArMDIwMApLb3J5IE1haW5jZW50IDxrb3J5Lm1h
aW5jZW50QGJvb3RsaW4uY29tPiB3cm90ZToKCj4gQWRkIHN1cHBvcnQgZm9yIFRydXN0ZWRGaXJt
d2FyZS1NOgo+IGh0dHBzOi8vdHJ1c3RlZGZpcm13YXJlLW0ucmVhZHRoZWRvY3MuaW8KPiBodHRw
czovL2dpdC50cnVzdGVkZmlybXdhcmUub3JnL1RGLU0vdHJ1c3RlZC1maXJtd2FyZS1tLmdpdAo+
IAo+IFRydXN0ZWQgRmlybXdhcmUtTSAoVEYtTSkgaW1wbGVtZW50cyB0aGUgU2VjdXJlIFByb2Nl
c3NpbmcgRW52aXJvbm1lbnQKPiAoU1BFKSBmb3IgQXJtdjgtTSwgQXJtdjguMS1NIGFyY2hpdGVj
dHVyZXMgKGUuZy4gdGhlIENvcnRleC1NMzMsCj4gQ29ydGV4LU0yMywgQ29ydGV4LU01NSwgQ29y
dGV4LU04NSBwcm9jZXNzb3JzKSBvciBkdWFsLWNvcmUgcGxhdGZvcm1zLgo+IAo+IFVzZSBzdWJw
YWNrYWdlcyB0byBkb3dubG9hZCB0aGUgdGhpcmQtcGFydHkgcHJvamVjdCBzb3VyY2VzIHRvIGJl
IGFibGUgdG8KPiBhcHBseSBwYXRjaGVzIGxvY2F0ZWQgaW4gdGhlIFRGLU0gc291cmNlcy4gVGhp
cyBhcHByb2FjaCBpcyBhbHNvIG5lY2Vzc2FyeQo+IGJlY2F1c2UgdGhlIHRmbS10ZXN0cyBnaXQg
aG9zdCBwcm9kdWNlcyBub24tcmVwcm9kdWNpYmxlIHRhcmJhbGxzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpJIHdpbGwgc2Vu
ZCBhIHYzIHRvIGZpeCBhIGJ1aWxkIGlzc3VlIHdpdGggYSB0b28gb2xkIGNtYWtlIHZlcnNpb24u
CgpSZWdhcmRzLAotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
