Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A6CC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54A480D96;
	Fri,  2 Aug 2024 17:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvDElRzKD2o7; Fri,  2 Aug 2024 17:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86EE80F37
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86EE80F37;
	Fri,  2 Aug 2024 17:28:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 931851BF387
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DAA680F37
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFXunQnQw23p for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:28:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6165D80D96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6165D80D96
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6165D80D96
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:28:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BD701C0005;
 Fri,  2 Aug 2024 17:28:07 +0000 (UTC)
Date: Fri, 2 Aug 2024 19:28:06 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240802192806.6935dda1@windsurf>
In-Reply-To: <20240726085352.1238297-1-fontaine.fabrice@gmail.com>
References: <20240726085352.1238297-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722619687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uU+aMpSihZCriYGfNVilKgGwncPzOVe2uASG96i0fbM=;
 b=eauyaUOmet9O803bd8EsqQkDIuZnJdeXe0qN2GepXeZNC02K77I6xHEdTBLnq+iq6A828c
 +BzVDWJVZnUian22LALoBoW4zinDMFt+vmsjQ3ozgtv0atRd8eliFCyNwc2H9b2xhO8fCD
 61LzeCdlmv6Gx45EaQ4O/vZujyg3RDz8KZ13F6y2JhxCv8DVdkP388tO8iO0//GwGq9t8T
 4biMSz/gB5jBJmvApZyk3Bx9zUu/GuDTRBKQH8I8v37A4YtR/AK/THXVnh3Cqt5hFlB2Gu
 BVd24XkwtaFRvqReSace0UDwSJBLZQBzZ7jOK+xFLbiGB7DaIrMvb+Ba03gh9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eauyaUOm
Subject: Re: [Buildroot] [PATCH 1/1] package/cairo: fix build without NPTL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Fri, 26 Jul 2024 10:53:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)

As pointed out during my review, and clarified by Waldemar, uClibc
linuxthreads now has everything needed to build the cairo mutex code.
So I changed this to:

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)

and updated the commit log accordingly.

Applied with this change. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
