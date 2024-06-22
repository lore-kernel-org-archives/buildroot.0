Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C399C27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 17:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD708400DD;
	Sat, 22 Jun 2024 17:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlxrJryMLQ6L; Sat, 22 Jun 2024 17:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEFAF4057F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEFAF4057F;
	Sat, 22 Jun 2024 17:41:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 057C41BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E80ED606E2
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yw24uA1m8Cbx for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 17:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A681A606C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A681A606C6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A681A606C6
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 17:41:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9740560004;
 Sat, 22 Jun 2024 17:41:24 +0000 (UTC)
Date: Sat, 22 Jun 2024 19:41:23 +0200
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20240622194123.75163fad@windsurf>
In-Reply-To: <20240617075503.938411-1-titouanchristophe@gmail.com>
References: <20240617075503.938411-1-titouanchristophe@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719078084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDSfhV5fqk8MPKEiUlgscg9+Yt9Zud2crBKbKIVgiMM=;
 b=aa3I/2THX9B7tqYTpO/Lo4jku88pOx6NH1UwBti9d/v/E5C7U1nHbsg71agNqqBUeuHpkp
 tBvByzgr6URd6zim28wAodu5lvbywsaD2W9EyIeMqYBaKO3GK8ziNpFh9X15f2nks6i5O4
 5KY1OEd+Ho2X/+NhYvBSijO6gJGQErzQcMY1N4D676dLY8/yEMeHOvZHx7si48diGpDmXj
 nRfteEKguCp5h6x5AIe8t2XjZBCpm6vRmhPhDCiYOOxGIcd72wML9vHbHiDgLNgN9Oe0Vr
 M0bySebagMnM1wLr+Xr37ySMAzfE0EloVmL5gew6OTtRNkCSDv5l7v9+1fOvJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aa3I/2TH
Subject: Re: [Buildroot] [PATCH 1/1] package/waf: bump to v2.1.1
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

On Mon, 17 Jun 2024 09:55:03 +0200
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  package/waf/waf.hash | 6 +++---
>  package/waf/waf.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
