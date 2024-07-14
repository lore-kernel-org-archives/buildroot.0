Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E443C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30A5860611;
	Sun, 14 Jul 2024 15:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKOGredHandE; Sun, 14 Jul 2024 15:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40AF860621
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40AF860621;
	Sun, 14 Jul 2024 15:03:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7311BF3D5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BB3A402E6
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFm7ct8MBHNI for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:03:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7EE9402DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7EE9402DE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7EE9402DE
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:03:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFB7DC0004;
 Sun, 14 Jul 2024 15:03:34 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:03:33 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20240714170333.5de6d806@windsurf>
In-Reply-To: <20240531093006.1763204-1-vincent.stehle@arm.com>
References: <20240531093006.1763204-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUhGZTbrv37F9nenA5n9BsVbxfb2w8ER7Q+Y18ito6Y=;
 b=EzFNXj1USHmp05izABggQu7eE2h+7IAXUW6ZCeiE+sRoJVg0DChSQSXCcxcNJDjkQjqMVm
 MwnYi295QRvfnW2G0gackFfSazrwAb7Xoc5A+7Rxs4IDHFlmMFTOF0xWI76HIh9KIDEXRM
 k5UMr8+Ny7rHHjYhh/ncLqXRT8tkDHZ1DWWWw28UQW//l72COAkeFb612AVBl47IKRXZi8
 lGDD1rSFIsqBozhSut9I37A+MeDvk3cWKAVAHR7/IvVLcxS+tvw1UkOLS5TVoI1178Ri+h
 jTc1ucT9Vb2tOancDDXCSHN76ijZb8RnCTZO9E+BLqpPPciMMEySRO29HjFVBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EzFNXj1U
Subject: Re: [Buildroot] [PATCH] configs/arm_fvp_ebbr: new defconfig
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

SGVsbG8gVmluY2VudCwKCk9uIEZyaSwgMzEgTWF5IDIwMjQgMTE6MzA6MDYgKzAyMDAKVmluY2Vu
dCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPiB3cm90ZToKCj4gQWRkIGEgZGVmY29u
ZmlnIHRvIGJ1aWxkIGFuIEFBcmNoNjQgVS1Cb290IGJhc2VkIGZpcm13YXJlIGltcGxlbWVudGlu
Zwo+IHRoZSBzdWJzZXQgb2YgVUVGSSBkZWZpbmVkIGJ5IEVCQlJbMV0sIGFzIHdlbGwgYXMgYSBM
aW51eCBPUyBkaXNrIGltYWdlCj4gYm9vdGluZyB3aXRoIFVFRkksIHRvIHJ1biBvbiB0aGUgQXJt
IEEtUHJvZmlsZSBCYXNlIFJldkMgQUVNIEZWUC4KPiAKPiBUaGUgZ2VuZXJhdGVkIGZpcm13YXJl
IGJpbmFyaWVzIGNhbiBhbHNvIGJlIHVzZWQgdG8gcnVuIGFub3RoZXIgT1MKPiBzdXBwb3J0aW5n
IHRoZSBFQkJSIHNwZWNpZmljYXRpb24uCj4gCj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vQVJN
LXNvZnR3YXJlL2ViYnIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+CgpUaGFua3MsIEkndmUgYXBwbGllZCEgSSBhZGp1c3RlZCB0d28g
dGhpbmdzOgoKIC0gVGhlIFRGLUEgcGF0Y2ggd2FzIG1pc3NpbmcgYW4gVXBzdHJlYW06IHRhZwoK
IC0gVGhlIGRlZmNvbmZpZ3MgbXVzdCBub3cgcHJvdmlkZSBoYXNoZXMgZm9yIGFsbCB0YXJiYWxs
cywgdXNpbmcKICAgQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15LCBzbyBJIGFkZGVk
IHRob3NlIGhhc2hlcwoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
