Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B56C52D7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 20:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E45060AFD;
	Thu, 15 Aug 2024 20:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rgvxe3UpnubW; Thu, 15 Aug 2024 20:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 272DE60B21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 272DE60B21;
	Thu, 15 Aug 2024 20:19:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F35071BF3F4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED3CF60B21
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1X41z8pEPByo for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 20:19:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D05AF60B61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05AF60B61
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D05AF60B61
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 20:19:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC21B60002;
 Thu, 15 Aug 2024 20:19:12 +0000 (UTC)
Date: Thu, 15 Aug 2024 22:19:11 +0200
To: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>
Message-ID: <20240815221911.74d91831@windsurf>
In-Reply-To: <20240725153743.101494-1-flavio.tapajos@newtesc.com.br>
References: <20240725153743.101494-1-flavio.tapajos@newtesc.com.br>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723753153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ONOUfVfKll/lVT3MGVJaH4jakdZR9RHBI58eJZ/aviM=;
 b=KDNPPGXUnZuJ0Q9qrG3ZyKQlqPikN+7qgndH0Xlf0qUGz95msR5HiT7ymWgkB3sdUQmF4g
 16LKj4uE952ECNyqzP4++9i6Ip6qvhTEp10+BfZWg1lWUCjPbd2Qv+L8oJZTQnWnHEwlEZ
 nEhZjdg5vJq4lL9yH5/ATM0+DzyxT/2quZPZHk1QHKjrDpTM4j2BzQtE3ylT3eXr5kCUWb
 S8Iat9oRvrlDqQTq7WE5DGTi1tCvx7pQzqrTQZttG7EfJ3DcChD5Xw/CtSWxPZPSi6VsIB
 AgDvlR5Ftmuq+CLn45SK5SB3HjSLI9+7bIKGIJUo1aPte3d0Fq3XPAGEn+k4tA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KDNPPGXU
Subject: Re: [Buildroot] [PATCH 1/3] Revert "rsyslog: not available on musl"
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Konstantin Menyaev <KAMenyaev@salutedevices.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyNSBKdWwgMjAyNCAxMjozNzo0MCAtMDMwMApGbMOhdmlvIFRhcGFqw7NzIDxmbGF2
aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4gd3JvdGU6Cgo+IEZyb206IEtvbnN0YW50aW4gTWVu
eWFldiA8S0FNZW55YWV2QHNhbHV0ZWRldmljZXMuY29tPgo+IAo+IFRoaXMgcmV2ZXJ0cyBjb21t
aXQgY2VhODFiNjkyNWRlMTY2ZTJmZDJjNzVhNTFhZWE5NDQyMGY3ZjA2YS4KPiAKPiByc3lzbG9n
IG5vdyBidWlsZHMgc3VjY2Vzc2Z1bGx5IHdpdGggbXVzbAo+IAo+IFNpZ25lZC1vZmYtYnk6IEtv
bnN0YW50aW4gTWVueWFldiA8S0FNZW55YWV2QHNhbHV0ZWRldmljZXMuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgo+
IC0tLQo+ICBwYWNrYWdlL3JzeXNsb2cvQ29uZmlnLmluIHwgNiArKy0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKClNlcmllcyBhcHBsaWVkIHRv
IG5leHQuIEkgZGlkIHNvbWUgc21hbGwgaW1wcm92ZW1lbnRzIG9uIFBBVENIIDIvMzoKc2ltcGxp
ZmllZCB0aGUgb3B0aW9uIG5hbWUsIGZpeGVkIHRoZSBpbmRlbnRhdGlvbiwgaW1wcm92ZWQgdGhl
IGNvbW1pdApsb2cuCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
