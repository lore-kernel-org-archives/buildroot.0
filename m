Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650C2C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D942841BD;
	Fri,  9 Aug 2024 22:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1dx-Fyk7LHU; Fri,  9 Aug 2024 22:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F4E84222
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F4E84222;
	Fri,  9 Aug 2024 22:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45EFA1BF865
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3474641165
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgB74mruqdbk for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:07:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 866804038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 866804038B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 866804038B
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:07:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92E21FF802;
 Fri,  9 Aug 2024 22:06:58 +0000 (UTC)
Date: Sat, 10 Aug 2024 00:06:57 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240810000657.55c57962@windsurf>
In-Reply-To: <20240809114345.693108-1-gael.portay@rtone.fr>
References: <20240809114345.693108-1-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723241219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aB9kD9Vv4i8ooK2T4u0l6qyGeE6ivbOQnKNkENAHWfU=;
 b=E/fJl/GPuhUipKMWl9DN9hbSogIH93QqNDbKhlxqf+xZvWaGnls2gQsfaVcBWrOzCzwJA6
 c50I39cYloYrP8P9vc3dUzB8wJsyz2/N10Gvtf6kivkoeD2Y+O75AtcvvpBmGjP5asucRB
 gWeuTvpSAoEIF2n2J2pRWxEx55oX+q8sAdVXdKCkZAaRsCzi22X3mVJK3Ypz0rfpnKVgXj
 o94I6yV9sxG+DkhCRSYlNpxPtOdbehDnQa0yN2oMXeugfTlxkdoVMLpFJZBHx57bxndN+J
 xGrTatK25ujNrfDcuHSlWY1fhc5gHdD8TE/gg61AsD5c3cb5JZK1G40EBOAXfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E/fJl/GP
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi5_defconfig: use
 correct CPU
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
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAgOSBBdWcgMjAyNCAxMzo0Mzo0NSArMDIwMAoiR2HDq2wgUE9SVEFZIiA8Z2FlbC5w
b3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gRnJvbTogQXRoYWFyaXEgQXJkaGlhbnN5YWggPGZv
c3NAYXRoYWFyaXEubXkuaWQ+Cj4gCj4gVGhlIFJhc3BiZXJyeSBQaSA1IHVzZXMgYSBxdWFkLWNv
cmUgQVJNIENvcnRleC1BNzYgQ1BVIGNsdXN0ZXJbMV0uCj4gCj4gVGhpcyBmaXhlcyBpbmNvcnJl
Y3QgQ1BVIGFzIGl0IGlzIG5vIGJpZy5MSVRUTEUgQ1BVLgo+IAo+IFsxXTogaHR0cHM6Ly93d3cu
cmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRpb24vY29tcHV0ZXJzL3Byb2Nlc3NvcnMuaHRtbCNi
Y20yNzEyCj4gCj4gU2lnbmVkLW9mZi1ieTogQXRoYWFyaXEgQXJkaGlhbnN5YWggPGZvc3NAYXRo
YWFyaXEubXkuaWQ+Cj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBy
dG9uZS5mcj4KPiAtLS0KPiBIZWxsbyBBdGhhYXJpcSwKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
