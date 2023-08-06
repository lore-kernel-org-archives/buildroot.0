Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39A8C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 13:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C20E41503;
	Sun,  6 Aug 2023 13:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C20E41503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSEMyp4vrcdQ; Sun,  6 Aug 2023 13:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F425404DF;
	Sun,  6 Aug 2023 13:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F425404DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3939F1BF3C0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77368414C0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77368414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URkDox7StMwt for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 13:45:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF4FA40571
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 13:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF4FA40571
Received: by mail.gandi.net (Postfix) with ESMTPSA id B60461C0007;
 Sun,  6 Aug 2023 13:45:48 +0000 (UTC)
Date: Sun, 6 Aug 2023 15:45:47 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20230806154547.308be861@windsurf>
In-Reply-To: <878rao78e2.fsf@tarshish>
References: <20230806102554.46261-1-thomas.petazzoni@bootlin.com>
 <20230806102554.46261-3-thomas.petazzoni@bootlin.com>
 <878rao78e2.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691329549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQ0lPDc8Wc1KMjgRy03o7rHtAWnnscM49AVQjyK2Ui8=;
 b=LCAVSHfAnLY+6KdMAmQjZTgoiCLSZ8UyreBTTTBkXTy0Ep8w+y9hxxVltu/spQg3DkUDW/
 LCQxrZWe65ySdqZ2MgGwCM3oEptxBbO4kiOEmqo3Zcl9om4/YnaaA9z3VLEQXCsfJo0RwC
 gBV8FemKoeyWXUS2a7IpAS5LjIQVepla773H4zT40EvaappLuVFUprL2OonChDFfKocx8E
 +hEg8q7P9i04wbOrvJAjUfyov9GOeZIN26HZz/MPaECwm5W9FPf9Qp2ge1GSOHu1BSErp9
 U86ny19ZW95A1dA7LUcE1QaAES7UoCN0ixGGdV+BZ/RS151GehenQY5W1sK9tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LCAVSHfA
Subject: Re: [Buildroot] [PATCH 3/3] package/elf2flt: fix build with
 binutils >= 2.41 due to libbfd location
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 06 Aug 2023 13:47:41 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> > +# elf2flt needs to link against libbfd.a and libiberty.a which are
> > +# provided by host-binutils, but not installed, so we poke directory  
> 
> s/directory/directly/, I believe.
> 
> The same issue in also the commit log above.

Good point, fixed when applying! Thanks for the review.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
