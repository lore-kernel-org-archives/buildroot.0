Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79424C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A085818CA;
	Fri, 12 Jul 2024 22:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yP9mZ1xMX-f; Fri, 12 Jul 2024 22:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B4CD844F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B4CD844F3;
	Fri, 12 Jul 2024 22:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B780E1BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5412606A6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEjuCmcOkGwp for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DF8060656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DF8060656
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DF8060656
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:05:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B65B9E0002;
 Fri, 12 Jul 2024 22:05:37 +0000 (UTC)
Date: Sat, 13 Jul 2024 00:05:36 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240713000536.57e43cd6@windsurf>
In-Reply-To: <20240524155617.3231-1-vincent.stehle@laposte.net>
References: <20240524155617.3231-1-vincent.stehle@laposte.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720821937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hmnbu6ArKMOCZV5I6u4i985GV0d2m5QCqpUMAkfOq+Y=;
 b=Amh/loiIjhLPWCuj4QWe9q0HMtWauvB4JAbeLnyaVN3L8PGnDPF2TuUMW89bZ5v6t35GRw
 y5MGR7Be32m40vq22jJcP7d8DQMucOVCh2a1WkdEVPIWpS/ZNxxKZSOY83dTfTYJ39UMjV
 67/pzhAN02JKw7ENvSBeefLaupYthVrjNEJ4aCfh1J4/G6L/8b92Ko8bpVKmnPxJKuJB78
 6v17H0i2+MDeDyoktuPT2XeMpzxAZStTFhEM+e8hBDSq1OvAvtxuuW0MIpIKmRhUH6bupo
 WpgsUgZ9Yx2r8A67eQQVa+z5LNoQh6EA0ozl8FCSNoOP8lqq7PIUbSQukIbi/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Amh/loiI
Subject: Re: [Buildroot] [PATCH] configs/uevm5432_defconfig: bump Linux and
 U-Boot
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
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyNCBNYXkgMjAyNCAxNzo1NjoxNyArMDIwMApWaW5jZW50IFN0ZWhsw6kgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiAtIEJ1bXAgTGludXgg
a2VybmVsIHRvIHY2LjguMTAuCj4gICBUaGUgRGV2aWNldHJlZSBoYXMgbW92ZWQ7IHVwZGF0ZSBv
dXIgY29uZmlnIGFjY29yZGluZ2x5Lgo+IAo+IC0gQnVtcCBVLUJvb3QgdG8gMjAyMy4wNC4KPiAg
IFRoaXMgaXMgdGhlIG1vc3QgcmVjZW50IHZlcnNpb24gd2UgY2FuIHVzZSBhcyBVLUJvb3QgMjAy
My4wNyBkcm9wcGVkCj4gICBzdXBwb3J0IGZvciB0aGUgdWV2bS4KCkhtLCB0aGlzIG1lYW5zIHdl
IHdpbGwgaGF2ZSB0byByZW1vdmUgdGhpcyBkZWZjb25maWcgYXQgc29tZSBwb2ludCBpbgp0aGUg
ZnV0dXJlLgoKPiAgIE9wZW5TU0wgaXMgbm93IHJlcXVpcmVkIGZvciB0aGUgYnVpbGQuCj4gICBU
aGUgZGVmYXVsdCBib290IG1ldGhvZCBoYXMgY2hhbmdlZDsgc3dpdGNoIHRvIGJvb3Rpbmcgd2l0
aCBhbiBleHRsaW51eAo+ICAgY29uZmlndXJhdGlvbiB0byBvdmVyY29tZSB0aGlzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+
CgpJbiB0aGUgbWVhbiB0aW1lOiBhcHBsaWVkIHRvIG1hc3Rlci4gVGhhbmtzIQoKVGhvbWFzCi0t
IApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
