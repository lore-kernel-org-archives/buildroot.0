Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32456C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D8160093;
	Thu, 25 Jul 2024 15:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2f9Dn8knos2; Thu, 25 Jul 2024 15:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B19C60674
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B19C60674;
	Thu, 25 Jul 2024 15:35:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCA5B1BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC25060674
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wcIPRp4rpli for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87D0B60093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87D0B60093
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87D0B60093
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:35:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D410660003;
 Thu, 25 Jul 2024 15:35:45 +0000 (UTC)
Date: Thu, 25 Jul 2024 17:35:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240725173544.0ce4a577@windsurf>
In-Reply-To: <20240725092209.1356085-1-fontaine.fabrice@gmail.com>
References: <20240725092209.1356085-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721921746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EfY0WUV8uf1ctY3nNDWEmOLcTZAA57VeUrOm9qv1KKQ=;
 b=Cq0c2hNFdOpjGkZ2kDPcAExrxk2xbejcoVsFnOs7FYp8Ft5BwomfkpiSuRlfDcNF7JF2QR
 x+99PGuoXq5USvOzIZFW0cMSo/PRKD6fCeT916+Np4dLwW3LVxZFKSwfPzOI+NBhr8BHIm
 imRZZ8YqZGQ0X6HIr01g9noPYf2xSSZWBR9p/tp2FDoysA2MOUuD0TjlHjTc/wTnAzP8gD
 ZCLtMdtqIkbz4qGbW8beOVPwZYlmLkBk4G6aEzM0eQ1CSzRV2xpz/pPQzJiW5IS9tbwqx8
 Okz55yeEIDl0W9CzG1gI4xBjhjb6iXmYKdnvWa9tTkbusXhgzMd/ok1ny9tLvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cq0c2hNF
Subject: Re: [Buildroot] [PATCH 1/1] package/lrzsz: drop bogus
 LRZSZ_POST_CONFIGURE_HOOKS
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

On Thu, 25 Jul 2024 11:22:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As already done for LRZSZ_BUILD_HOOKS in commit
> 5fde4abc8d67ac2317b1de7a1b4cde8091f4e3c7, drop bogus
> LRZSZ_POST_CONFIGURE_HOOKS as this hook added in 2010 is also never
> called
> 
> Fixes: 4f3f291a3bfc1893cbfb4d9803c35a4f6752784d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lrzsz/lrzsz.mk | 5 -----
>  1 file changed, 5 deletions(-)

Wow, amazing, this has been around unused since 2010, and we only
notice 14 years later...

I just fixed up the commit title: it's not really "bogus" but rather
"unused", and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
