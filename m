Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976C1C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65AC684201;
	Sun, 11 Feb 2024 21:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUpJiQUrJKCi; Sun, 11 Feb 2024 21:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B98850F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B98850F1;
	Sun, 11 Feb 2024 21:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB6D71BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E28D2846A6
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQ7B2wEnYFzq for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:37:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC01384ECD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC01384ECD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC01384ECD
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:37:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53253240002;
 Sun, 11 Feb 2024 21:37:07 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:37:06 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211223706.0199eaa9@windsurf>
In-Reply-To: <20240211183813.1164093-1-fontaine.fabrice@gmail.com>
References: <20240211183813.1164093-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqCYStHlmQHJD52ucVPN1MJyc5SD2TkPLBUSkBvkfqc=;
 b=fbr6pEJ9ilDVBuTR7VWRMnAaALepn0K+RFXcfjaqTMjFoqxMMyq8yRJrY7vgKzEuqabR2U
 QcnsK2gNmKluFd5heico9eVV5IglE4FGq33sOVJk0FDD07SfOa7e98I/nXiUFbS67ZPyQn
 cn9FVH0PclHXLZ2vjRNpSB5zlVeQQ3Jx8AfVBdehMEoa7TxQltvpNeSmEYBapRxkkg09Pw
 sB2C1+8e6aZH5z3BtISkKKQJy4Z2HCZ16gT95YBh+Y0xnOH84wEBhpRKvUjB7hS+RCwLME
 85/qGDuVPVZrkZj8c/wTVk/c+lDsLdktUc472BoppSbdlzOy0KYltTIX9qL7og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fbr6pEJ9
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: replace
 PKG_PYTHON_DISTUTILS_ENV
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 19:38:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV
> to avoid an issue with naming of python modules since commit
> 09de823cbc7bd50a40e25f4166b4e42be94b0c7b
> 
> Fixes: 09de823cbc7bd50a40e25f4166b4e42be94b0c7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/opencv4/opencv4.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
