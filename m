Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F08CDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9077403BE;
	Tue, 22 Oct 2024 20:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cg3d21IQxhwV; Tue, 22 Oct 2024 20:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A82A1403D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A82A1403D3;
	Tue, 22 Oct 2024 20:55:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91FAA2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 806F380D62
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T407BgyFWFDM for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B02780C1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B02780C1B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B02780C1B
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:55:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24413240002;
 Tue, 22 Oct 2024 20:55:29 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:55:28 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Anand
 Gadiyar <gadiyar@ti.com>
Message-ID: <20241022225528.1e4f17e7@windsurf>
In-Reply-To: <20241010-uboot-bump-v1-2-287ffa07e49e@ti.com>
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
 <20241010-uboot-bump-v1-2-287ffa07e49e@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729630530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LP23a08Xx3qJbNoK7TMWhz+MjOCAM9oO5e+k6dAMO0=;
 b=j/gi++VKG3rcoQXtaww+uV9LjgklFIajgH3wRn70kGJ+Gcc5UPrsT8C8GTTT6rlp4F8KwM
 jN5baa01FH8UoE97mS806hu/YTB5dQ5u/6Dszj5uWw2XP+J9LAVi2bQiDMbzqIoEntJ5hq
 WtXp2O/Di0rNIFEW0QiPcL8f3uqlnHVIqb2Cnq8mKD16Py5fNW+aayc3D6KCsALNfHc92/
 mT99SBmNofw2T3wvkhMyPK5ZfkIr75RxIf4kPVtIOM6K2VQyR5t5ENf3yHTgT0/IryDUkD
 wNYEMiDecYoB3WqdcMjWryxjiORgM3ZLDkkuaZPVSWRFZim1Lk1t2MvI7qQyzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j/gi++VK
Subject: Re: [Buildroot] [PATCH 2/3] boot/ti-k3-r5-loader: add option to
 include GnuTLS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryan,

On Thu, 10 Oct 2024 18:39:23 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> Newer versions of U-Boot may require the GnuTLS library to be installed
> on the host machine before building. Add in an option to select GnuTLS
> as a dependency to the ti-k3-r5-loader package

Do you really expect to enable CONFIG_TOOLS_MKEFICAPSULE in the
Cortex-R5 U-Boot stage? I'm just trying to understand if this commit is
"let's do exactly like U-Boot does" or "there is really a use-case for
this".

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
