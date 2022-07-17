Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE0BC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 17:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2581340A63;
	Sun, 17 Jul 2022 17:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2581340A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O19oJTwRagVK; Sun, 17 Jul 2022 17:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D3324023B;
	Sun, 17 Jul 2022 17:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D3324023B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4ABC61BF3CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 17:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32836416D9
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 17:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32836416D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvDwp-hXNE_f for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 17:44:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA4FC416C4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA4FC416C4
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 17:44:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8EFF1BF204;
 Sun, 17 Jul 2022 17:44:07 +0000 (UTC)
Date: Sun, 17 Jul 2022 19:44:06 +0200
To: Ben Hutchings <ben.hutchings@mind.be>
Message-ID: <20220717194406.6112905b@windsurf>
In-Reply-To: <20220614171015.878311-1-ben.hutchings@mind.be>
References: <20220614171015.878311-1-ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658079848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3uddSkMXwH/JB4dqr6JxN7p3cioSaYe3qf4Rmdf4PY=;
 b=TU3FWkL5Kl3LiLxZP3f+Km9lQ+EgORqZG285fSynuzFBgmv9Z5TDi0iRrw+riCpJPeFO3F
 A2qjp6etI3+Zs+uWUKUCeMNe4LlsaEiOIiAJrj6DqpPFA2tjP75csg9f1OL6aWF5T9v0pd
 5jAxNMhsy2BsnfSnzKkqVof3a6xKGDrc/zUZL1S8zIUholqjHwPt3g9cF1oqUYNoX8pOH1
 /zKJHr2FqDhP3EmnFr9rT4/8B7YaYIJqPXAXeMr/bd4y9QoIz4QMoiP9ofY0MS9PkBoswr
 TtyLZDQPGkOfY/F3zzdSPfIqM9EoKieV3nPSMWwmgAVtqgBrEdrnij0D+CNQPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TU3FWkL5
Subject: Re: [Buildroot] [PATCH] package/uclibc: Prevent config with
 unsupported RISC-V float ABI
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

On Tue, 14 Jun 2022 19:10:15 +0200
Ben Hutchings <ben.hutchings@mind.be> wrote:

> uClibc currently supports RISC-V with a soft-float or 64-bit
> hard-float ABI, but not 32-bit hard-float.  Selecting
> BR2_RISCV_ABI_LP64F results in a build failure:
> 
> ./include/sys/asm.h:42:4: error: #error unsupported FLEN
>    42 | #  error unsupported FLEN
>       |    ^~~~~
> 
> Change the conditions for BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
> accordingly.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  package/uclibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks a lot for this patch! I have changed the !LP64F to a LP64 ||
LP64D, and added a reference to a build failure in our autobuilders.
Patch committed with those changes, many thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
