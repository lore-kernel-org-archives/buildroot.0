Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D73CC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 18:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C75760011;
	Wed,  1 May 2024 18:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oinJjQ-ZAHMa; Wed,  1 May 2024 18:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0955360BD0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0955360BD0;
	Wed,  1 May 2024 18:53:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E75421BF418
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF94340160
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUsgl7T-P-FQ for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 18:53:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8CC3540156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CC3540156
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CC3540156
 for <buildroot@buildroot.org>; Wed,  1 May 2024 18:53:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CCA0E0006;
 Wed,  1 May 2024 18:53:48 +0000 (UTC)
Date: Wed, 1 May 2024 20:53:47 +0200
To: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Message-ID: <20240501205347.41b44d6d@windsurf>
In-Reply-To: <20240403091952.653698-2-thomas.bonnefille@bootlin.com>
References: <20240403091952.653698-1-thomas.bonnefille@bootlin.com>
 <20240403091952.653698-2-thomas.bonnefille@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714589628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xANfQp/GV5qd94uLUrxAWulie+QKtvFHR1nVEf4Kg60=;
 b=H0zVpbdmXTaGzMR1KjtWWOmr2pqm0Ok3V7wf4GnznO/kVuQcij0XZSJlN+4BmQJ08Vee2h
 emfJygxyQ0LhPptbtv6awTsDXbO/DGKa4MvIIXiKq5XeWKsYHM9gyBH56R9rNbqpaTjHJe
 93pblUrJ5HSAL0B5gzo5saJ+B5IBSIEk0uXv/70RidMlrCy4fXE6AuFejINEjPgRSPCYL5
 NRUfuQMDF0v3q+f8MgzTCWUITv+1vYf2Tnu1AhZJUPENLALgBbi4mVbUIIBiiGDSaCHdEe
 tpVitMCaJTKqywcE7p8n9f9H6H/JMWwZKCFFhV6Q/ivk9pVIRBoVOmGZ32bjBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H0zVpbdm
Subject: Re: [Buildroot] [PATCH 1/2] package/starfive_spltool: new package
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
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Apr 2024 11:14:39 +0200
Thomas Bonnefille via buildroot <buildroot@buildroot.org> wrote:

> This patch adds a new package for the Starfive SPL tool. It is used to
> add header to the Secondary Program Loader for board based on the
> Starfive JH7110 SoC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  DEVELOPERS                                    |  3 +++
>  package/Config.in.host                        |  1 +
>  package/starfive-spltool/Config.in.host       |  8 ++++++++
>  .../starfive-spltool.hash                     |  2 ++
>  package/starfive-spltool/starfive-spltool.mk  | 20 +++++++++++++++++++
>  5 files changed, 34 insertions(+)
>  create mode 100644 package/starfive-spltool/Config.in.host
>  create mode 100644 package/starfive-spltool/JH7110_VF2_515_v5.11.3/starfive-spltool.hash
>  create mode 100644 package/starfive-spltool/starfive-spltool.mk

Thanks, I've applied to master after:

- fixing the commit title starfive_spltool -> starfive-spltool

- moving the .hash file directly under package/starfive-spltool/, using
  a versioned directory is only useful for packages for which multiple
  versions are supported, which is not the case here

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
