Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A12ED0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A16D81379;
	Sat, 26 Oct 2024 21:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UY6J21bdhqKE; Sat, 26 Oct 2024 21:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 796B28136A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 796B28136A;
	Sat, 26 Oct 2024 21:14:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52F3A5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3491B81371
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nxjb6IHMYXI4 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:14:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 110028136A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 110028136A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 110028136A
 for <buildroot@busybox.net>; Sat, 26 Oct 2024 21:14:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35CA91C0003;
 Sat, 26 Oct 2024 21:14:09 +0000 (UTC)
Date: Sat, 26 Oct 2024 23:14:08 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241026231408.1690b774@windsurf>
In-Reply-To: <20240920181212.3572055-3-francois.perrad@gadz.org>
References: <20240920181212.3572055-1-francois.perrad@gadz.org>
 <20240920181212.3572055-3-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729977249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMM3FKP+M9tUsnKDYTHGwnB4wFI8r+JI8HCO6fK2IwQ=;
 b=J3BgETXm9555LM9fFmTiF6n0eDLhSJew/8qbzhCW/4BoM1/51WvJvSzz/VbH2Hktmn6kB1
 L9jpSAOWfo2Z9/X3q+Af/1tG9Vsqx4UzvRWzY92kx5e00lGbp5t18lYgH6+DN7zPMyI8LF
 Mq4QR4+kd5jMh99TZpkCa1aHTzRjkONZiD/Es5cvtzy9UnFqqRVd/GB5rNmZP8MCJFgKIP
 3cTsSYHppqD1IuMQWWJ4WSXwdzT9OzXMoyU7VA/oqPh6PlSIIAz3EKbvbQOvICv4H8d57z
 LEyFvZom+B6NzbIPXJZgYAPhL7QMRymJGl0DA4FfqEpcNF8JBAYsnLe8j4gwog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J3BgETXm
Subject: Re: [Buildroot] [PATCH v2 2/2] package/lynis: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gRnJpLCAyMCBTZXAgMjAyNCAyMDoxMjoxMiArMDIwMApGcmFu
Y29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4gd3JvdGU6Cgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2x5bmlzL0NvbmZpZy5pbiBiL3BhY2thZ2UvbHluaXMvQ29uZmlnLmluCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAuLjNmNjRiYzJlMQo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2x5bmlzL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTEg
QEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xZTklTCj4gKwlib29sICJseW5pcyIKPiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9CVVNZQk9YX1NIT1dfT1RIRVJTCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
Q09SRVVUSUxTICAjIHJ1bnRpbWUgKHN0YXQpCgpUaGUgInN0YXQiIGZyb20gQnVzeWJveCBjYW5u
b3QgYmUgdXNlZD8KCj4gKyAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4gKyAgICAgICAgc2VsZi5s
b2dpbigpCj4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygibHluaXMgc2hvdyB2ZXJzaW9uIiwg
dGltZW91dD05MCkKCklzIHRoaXMgYSB1c2VmdWwgZW5vdWdoIHRlc3Q/IERvZXMgaXQgY2hlY2sg
dGhhdCBydW50aW1lIGRlcGVuZGVuY2llcwphcmUgcHJlc2VudCBhbmQgd29ya2luZz8KClRoYW5r
cyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
