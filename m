Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD11C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E53941525;
	Thu,  2 May 2024 07:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 076OvGi4saXG; Thu,  2 May 2024 07:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D679E41522
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D679E41522;
	Thu,  2 May 2024 07:49:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 188491BF990
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBF8B410B0
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eP203o8n9QMJ for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 667A5410D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 667A5410D4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 667A5410D4
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A05F12000D;
 Thu,  2 May 2024 07:49:04 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094903.1703669e@windsurf>
In-Reply-To: <20240411205941.2127766-1-bernd@kuhls.net>
References: <20240411205941.2127766-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfpgXl/ECFuiZ5kDyA++8aAh0OQpzMr2JvtVS0FiQRs=;
 b=NbkbF6AklqeJAYI56xS2zsR/Yx0Q9aTkpJpytLmmvNPXOmkpSmizxJMvNb8VKnkOrDkyc7
 A3OVLEU7NEPBunc4S/O7QxOcs4+eHqC4jckNXq9C/v1iXuEZN0T/WmZtMRvJAzW9saBJXz
 odCBQGUxrcW6w0LgPNHpq044rQdN3+TN67dYc+UJ43Nl9F44uaDgCpkartHCxFd0ITIYJk
 wT2U37i3H5zLlMMd+/zrQQ9KqXIKKHOKk6yoPHZMqtFXeW9dHp8vbvxSuZypylPmyw8Wi6
 BmhgMbZVRgeztFtDekNnT8H1rwIPqSQeCvLm72LN1bPwKD6Na/kiPcPABdl2/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NbkbF6Ak
Subject: Re: [Buildroot] [PATCH] package/tor: bump version to 0.4.8.11
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

On Thu, 11 Apr 2024 22:59:41 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
> https://forum.torproject.org/t/stable-release-0-4-8-11/12265
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
