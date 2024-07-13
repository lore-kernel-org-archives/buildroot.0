Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65D3C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 961D181F84;
	Sat, 13 Jul 2024 20:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YChNXmIGHisX; Sat, 13 Jul 2024 20:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71468203E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A71468203E;
	Sat, 13 Jul 2024 20:36:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 309AB1BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C53581F84
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Igu0bGw4k79D for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0513B81F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0513B81F7C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0513B81F7C
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:36:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32123240004;
 Sat, 13 Jul 2024 20:36:17 +0000 (UTC)
Date: Sat, 13 Jul 2024 22:36:15 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20240713223615.28cd0fab@windsurf>
In-Reply-To: <20240607163208.1445715-3-raphael.melotte@mind.be>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
 <20240607163208.1445715-3-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720902977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6wzB53uKiMbEsymNfKVcFj9qp4IT6NdACqbyath/N0=;
 b=W6iOTnn2uzjE7E430BL2dFw2IbeZMLGjLdTab/tf1O+Gk3D9o+XjAUlx8lDwgURl9sL52G
 4zdnFUXf/2CEjAP9xAWansaM3qbo1bELhGK3jRqi8A8GD62MKZ7kupPOOewZnPl+UetcDB
 mdcNt8B5Y2A2LK7qEW8+CZWT+GtYO+fIYBVKImR+E5IoBXt92T87sKp3qUhCvmYLem/4Pk
 rAFg6Jb+HBm/TPIcm1NBvSb158VzSDsICQeDjxwy1feiD6S3LIYmtpcs5t6kGkxV8zLCID
 cLU72VWhE30tPTLwd8Ab9FBIgqU4WOU60CL/7vkWn6GHsO4542TsWdo+W7DQPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W6iOTnn2
Subject: Re: [Buildroot] [PATCH v2 3/5] package/mupdf: fix building shared
 libraries
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAgNyBKdW4gMjAyNCAxODozMjowNCArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+ICtpZmVxICgkKEJS
Ml9TVEFUSUNfTElCUykseSkKPiArTVVQREZfTUFLRV9PUFRTICs9IHNoYXJlZD1ubwo+ICtlbHNl
Cj4gK01VUERGX01BS0VfT1BUUyArPSBzaGFyZWQ9eWVzCj4gK2VuZGlmCgpUaGlzIGFsbG93ZWQg
dG8gYWxzbyBkcm9wIHRoZSBtYW51YWwgYWRkaXRpb24gb2YgLWZQSUMsIGJlY2F1c2UgaXQncwpk
b25lIGF1dG9tYXRpY2FsbHkgYnkgdGhlIHBhY2thZ2UgTWFrZWZpbGUgd2hlbiBzaGFyZWQ9eWVz
LgpTZWUgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0
LzQwMTE2MmQ0YTk0NzE4NDY1NGQ4MjAyMzkyNDI1YTYyNWQwMDAxNzIKCkFwcGxpZWQgd2l0aCB0
aGlzIGNoYW5nZS4gVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
