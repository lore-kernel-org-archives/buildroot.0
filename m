Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27453C43217
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 07:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAF9240A90;
	Tue, 18 Oct 2022 07:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF9240A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odE-3rQYrQa9; Tue, 18 Oct 2022 07:05:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D728540A8B;
	Tue, 18 Oct 2022 07:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D728540A8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9035F1BF354
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 07:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B39D82E5F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 07:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B39D82E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIjUQvpmaMKh for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 07:05:10 +0000 (UTC)
X-Greylist: delayed 00:05:16 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58D0D828DF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58D0D828DF
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 07:05:10 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3104F240016;
 Tue, 18 Oct 2022 07:05:06 +0000 (UTC)
Date: Tue, 18 Oct 2022 09:05:05 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221018090505.6bd09c80@booty>
In-Reply-To: <20221017071002.48266-2-neal.frager@amd.com>
References: <20221017071002.48266-1-neal.frager@amd.com>
 <20221017071002.48266-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666076708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDUm9Lrh/gJCTM0iTQIuZPf72g6+NrczLos67tiUdFw=;
 b=mLh5u46IkedP1GUcYDnF4ZC4fH9Q3NlPzOoxSRHLu+Xv8d78MuSsQzF42ibss/c9DFr5Wh
 z0ADVNsyivMnXflDeanRIgppPM2u3x+avMi1ak76Ei8IyUT3VqV1VkGvF6p7rM7j43b0kb
 AxlQ7fdwZQzzeLsVj9Gwl9Ke0IBzLl99WuBDtmeVy76zCikh6AjuBr95KuMo+phpDK9DlG
 R8TW27jvy3W615FWPOMHhplBtSVWNuekVB5lscTxPZhS5ZEazSBIpZ8FfDogIKqHXy6QjK
 J9hrAMVVUOcxR7iFEqt0Q2eaYEih9L1vkci4UgQ3QEOS+DVsKkFEOPeeaF/6xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mLh5u46I
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: fix
 pmufw sw reset
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org, kris.chaplin@amd.com, wesley@sonifex.co.uk,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Oct 2022 01:10:02 -0600
Neal Frager <neal.frager@amd.com> wrote:

> This patch will solve the problem of the pmufw built by the
> zynqmp-pmufw-builder where soft resets crash for the zcu106.
> Details of the issue can be found here:
> 
> https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
