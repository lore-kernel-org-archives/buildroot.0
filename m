Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12147C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05D304046B;
	Sun, 12 May 2024 10:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 411P7gdvo4ir; Sun, 12 May 2024 10:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0196D40CB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0196D40CB6;
	Sun, 12 May 2024 10:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F45E1BF290
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29B996067F
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-CqBqLaPWxA for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 258DE6066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 258DE6066F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 258DE6066F
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:23:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F0181C0002;
 Sun, 12 May 2024 10:23:12 +0000 (UTC)
Date: Sun, 12 May 2024 12:23:11 +0200
To: Jan =?UTF-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <20240512122311.55656573@windsurf>
In-Reply-To: <20240301092103.3902039-1-sairon@sairon.cz>
References: <20240301092103.3902039-1-sairon@sairon.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715509392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LY+5KF1L5VJp0MCnoLaGRe8zHxPElQAYrwRKsuhChck=;
 b=JmezX+jvGrtVPO9XLm+d7iZa+oq+SX6SdAVI4i8P2fx+S6yF4Hon42KaS0kFrVtFZPgJ2k
 2CNHDIsvrsBJ3+X3QFzd+3QCQzqbMHlZDAwVcNxMzuF9bqpxO+Sp0V7RWJKue+ay/mj26X
 ReSGzzNDSwF8K0sLrK1dqo7zw9jJcytgZSpmIFn45tQ/S2VCbGVOlc4vHcsz6d7yur/ho5
 i4J1CAn67Tz9RPtgUXa23qV3BuBei1kLczg/A7BVGjrudwxz+HlyOnLtw1fzhCdpIoF9PS
 NVzgVYq0/s04jrN32J7RjnGgZuO0sA2rvzMhVE0mPup6GysHfQj29hzUwdc1gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JmezX+jv
Subject: Re: [Buildroot] [PATCH v2] package/nfs-utils: only install fsidd
 binary and unit file with enabled nfsd
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAgMSBNYXIgMjAyNCAxMDoyMTowMiArMDEwMApKYW4gxIxlcm3DoWsgPHNhaXJvbkBz
YWlyb24uY3o+IHdyb3RlOgoKPiBGU0lEIGRhZW1vbiBhbmQgaXRzIHN5c3RlbWQgdW5pdCBmaWxl
IGJvdGggZGVwZW5kIG9uCj4gQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX1JQQ19ORlNEIGJ1dCB0aGV5
J3JlIG5vdyBhbHdheXMgaW5zdGFsbGVkLiBSZW1vdmUgdGhlbQo+IGJvdGggaWYgQlIyX1BBQ0tB
R0VfTkZTX1VUSUxTX1JQQ19ORlNEIGlzIGRpc2FibGVkLgo+IAo+IFJldmlld2VkLWJ5OiBHaXVs
aW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+Cj4gLS0tCj4gIHBhY2th
Z2UvbmZzLXV0aWxzL25mcy11dGlscy5tayB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpU
aG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
