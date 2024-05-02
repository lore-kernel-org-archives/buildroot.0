Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F87AC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1963E4086E;
	Thu,  2 May 2024 08:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pu7q67MZMVJn; Thu,  2 May 2024 08:30:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9F9410EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F9F9410EA;
	Thu,  2 May 2024 08:30:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8D41BF47A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58C004086E
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifhgISWLCHCQ for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC237414D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC237414D1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC237414D1
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:30:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD0D21BF205;
 Thu,  2 May 2024 08:30:49 +0000 (UTC)
Date: Thu, 2 May 2024 10:30:49 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240502103049.3a143975@windsurf>
In-Reply-To: <CAPi7W838wL-EiUvd6ShK7=__WbCBKu2SNVj3S8aCYPa9f3dY4g@mail.gmail.com>
References: <20240420185853.4134260-1-thomas@devoogdt.com>
 <20240502095605.32987057@windsurf>
 <CAPi7W838wL-EiUvd6ShK7=__WbCBKu2SNVj3S8aCYPa9f3dY4g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714638650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPvjWF5edNatumWFFAugxUgDQClDFu2881f8NaGWx2o=;
 b=jtmxgrKNOBomi8uvoUImN/gjols73oBVaRnhSbaJfT201hMAa4f7nUlOOp9xp8OEir2lSg
 zGLY0WpeE55FwGQSKxmWjK/kELo5FnZa/zY88avKNiXNcn0+r/ckUy771JMaZtLoxh7+JP
 eSL1jfW+n+BLxuGYRDtx4qIcvY3/3Vr9jui51bhyMhsqj3zxHFOWACmGrz7m0WhiKhBRLZ
 aKhIi0b7UYs72J5Y+tqrOiLkRa8Up21/zZCDAMquNhPDBEWhV4XxU2Gu34BJF8S0d1ENiu
 fOx2dxyQ3qS9e/9q7hG+g38BxvKAhRJ01jwnmPx+1BTcNZDOgO1JsB0SR4BZyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jtmxgrKN
Subject: Re: [Buildroot] [PATCH v1 1/8] package/libsoup3: fix reference to
 atomic
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2 May 2024 10:15:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Could you have a look at fixing glib-2.0.pc instead?  
> 
> This patch is available since September 2023:
> https://patchwork.ozlabs.org/project/buildroot/patch/20230917185116.182810-1-fontaine.fabrice@gmail.com/

Awesome, I went ahead and applied this patch!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
