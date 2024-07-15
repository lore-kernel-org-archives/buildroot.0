Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C447FC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 09:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 757CA8118C;
	Mon, 15 Jul 2024 09:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLdJxKpj2045; Mon, 15 Jul 2024 09:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6910481197
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6910481197;
	Mon, 15 Jul 2024 09:06:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6E181BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A5F60765
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnQnEaTx0g8o for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 09:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F07E60764
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F07E60764
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F07E60764
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 09:06:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AF5660004;
 Mon, 15 Jul 2024 09:06:13 +0000 (UTC)
Date: Mon, 15 Jul 2024 11:06:11 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240715110611.6a872bab@windsurf>
In-Reply-To: <50c04b02-5140-4c0c-b06d-e80eca7564af@mind.be>
References: <20240704-ztext-v3-1-9195d06c8bd0@gmx.net>
 <50c04b02-5140-4c0c-b06d-e80eca7564af@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721034375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQCJU7Jh2ixFg2HX17bMLpm2J3CSqD8sXwrP1q0Y+kk=;
 b=NqC2nTnUwC1KR10ziuy8Tz020k+IzGBPU13fG4BaJIgkffW+F+LFQ/o7p1e3Nf4JVXUKOU
 OYvFz6gA9tGO4NyKeflWGOPcGPQtGQ8yQSuNQaA13j41u7i44wPpOLVo9uQLtocJQugXBs
 wu7JMPumEwIPQcJjYN0lntK1NyU+K8cnlM3PLSflbX1ouCxfUUfTSIlbLpFmI5hz5C2JEt
 whY4b9HaRz3YBNGBJjpArukM0EidmV8sLaCEAGN8oHb4BcqSyt5iF4cn1g/co+Bh+Ofrek
 +WJrWAleD11iNgVzQBBMQnpK32SOFAuqXTo4biP3EQVcjuV+4AL8m+b1RyKbOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NqC2nTnU
Subject: Re: [Buildroot] [PATCH v3] Config.in: ban textrels on musl
 toolchains
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
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Jul 2024 10:51:03 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   After some discussion, we concluded that we don't see the point of making this 
> a user-settable Config.in option. It should be completely in the Makefile.in, 
> with a comment explaining why. So something like this (untested!):
> 
> # musl's dynamic loader doesn't support DT_TEXTREL, which results in a runtime
> # crash if it gets used. The "-z text" linker option issues a build-time error
> # when DT_TEXREL is used, so we capture the problem earlier.
> ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_STATIC_LIBS),yy)
> TARGET_LDFLAGS += -#l,-z,text

                    ^^^ this should have been -Wl,-z,text of course

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
