Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEDEC531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B8F740B38;
	Tue, 20 Aug 2024 21:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmWEwsIOllZB; Tue, 20 Aug 2024 21:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07E3740B9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07E3740B9A;
	Tue, 20 Aug 2024 21:41:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 803831BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DAE860725
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGIcOlOsIbOI for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:41:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E422606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E422606FF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E422606FF
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:41:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 872E5FF802;
 Tue, 20 Aug 2024 21:41:44 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:41:43 +0200
To: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>
Message-ID: <20240820234143.0d665272@windsurf>
In-Reply-To: <20240820165115.53193-1-flavio.tapajos@newtesc.com.br>
References: <20240820165115.53193-1-flavio.tapajos@newtesc.com.br>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724190105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7l3/Q8oeTQerFj8KvIc/eevoqdyQRyfLod2VIVhF4U=;
 b=UkI/+HOWctVJ/hvpBrpJbu3qvbiyq949Q7EecXR95rzUfgyW0Eq9+7/RfBr0DhPriu8FXm
 U0AX5WzQ6KBHNzT5bFuYuShGQ6Th9YpjBTeqas2SsG5RnnaytqxKmQS20FYcE1gJssmtDE
 GICyu+MnepzdZg7wLm1Y/kNTwYFAnVXA0G74UPILodbfWpu/YPs0s7ZMf/TQiRJ5QZo1R8
 bidClHkvpOaIBkQLCzs4OUCDjQwhGP/A+M019AVNQtWhPx9WGwVAQFLTdUKO4y466ENeUA
 XotH0HaxO9Sry8qMRNODLvQncuUSuoo0Tbq16u4SWKpk0wwUOy1URpnjsOv6Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UkI/+HOW
Subject: Re: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to
 8.2408.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMCBBdWcgMjAyNCAxMzo1MToxNSAtMDMwMApGbMOhdmlvIFRhcGFqw7NzIDxmbGF2
aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgo+IC0tLQo+ICBwYWNr
YWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL3JzeXNsb2cvcnN5c2xv
Zy5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCllvdXIgcGF0Y2ggd2FzIG5vdCBhcHBseWluZyBjbGVhbmx5IHRvIHRoZSBuZXh0
IGJyYW5jaCwgYmVjYXVzZSB0aGVyZQpoYXMgYWxyZWFkeSBiZWVuIGFub3RoZXIgYnVtcCBvZiBy
c3lzbG9nLCBzbyBJIGZpeGVkIHRoYXQgdXAgd2hlbgphcHBseWluZy4gQWZ0ZXIgLXJjMSBpcyBy
ZWxlYXNlZCwgdmVyc2lvbiBidW1wcyBhcmUgYXBwbGllZCBpbiB0aGUKIm5leHQiIGJyYW5jaCwg
c28gdGhhdCB3ZSBjYW4gc3RvcCB1cGRhdGluZyB0aGluZ3MgaW4gIm1hc3RlciIgYW5kCnN0YWJp
bGl6ZSBmb3IgdGhlIHJlbGVhc2UsIHNvIGR1cmluZyB0aGF0IHBlcmlvZCwgeW91IHNob3VsZCBp
ZGVhbGx5CmJhc2VkIHRoZSBwYXRjaGVzIHRoYXQgdGFyZ2V0IHRoZSAibmV4dCIgYnJhbmNoLi4u
IG9uIHRoZSBuZXh0IGJyYW5jaCA6LSkKClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhvbWFz
IFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
