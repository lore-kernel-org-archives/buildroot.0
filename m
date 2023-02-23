Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73618C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20246403A4;
	Thu, 23 Feb 2023 22:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20246403A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HOrl9GCWH4Ku; Thu, 23 Feb 2023 22:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50CFF405B5;
	Thu, 23 Feb 2023 22:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50CFF405B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91DEB1BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BD9460AB3
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BD9460AB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRYHG3qu510N for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:34:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 214C560A98
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 214C560A98
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:34:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E0E0240003;
 Thu, 23 Feb 2023 22:34:46 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:34:45 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223233445.47f2a4af@windsurf>
In-Reply-To: <20230223162847.9247-1-fontaine.fabrice@gmail.com>
References: <20230223162847.9247-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677191686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dEsEgw8I/vjEzwlkx2bUazrxUSUMWxdyWKD89V48aQo=;
 b=Q87sGGBm+nrZnn70IYLW6dkxD9WgAiPXJyiJCc2Ec7YV4rdFkXWGyhMriIw6Qzcwlv6dBl
 bXj8WcUQqiuwfOk4mRe2J2KPlrz961ro2JAmKzZ2dmDw2kKTeOVRPgkS0Xwt6M6pBTfeP9
 KKwL/Po6/Q1nw0GSVcQ8xJO0adUwv8VKVDKVuAh7pYVoGdA8/0hNrs1xsy591OVnDhqCvT
 CrD9EDS3m1uibzbs2fcbrxdx0kB0710cnqhtaG/Zm3ebQcG0UFuKquOUDwwLv4jar/niPh
 V6fWmi9iOH7M5WEEakiGOyY2HGM7rzpCYxVmpsNUuGCPWX3PCA51P31Q1JOJuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q87sGGBm
Subject: Re: [Buildroot] [PATCH v2,1/1] package/efivar: needs threads
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

On Thu, 23 Feb 2023 17:28:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a thread dependency as Upstream quickly closed
> https://github.com/rhboot/efivar/pull/238 to fix the following build
> failure without threads raised since bump to version 38 in commit
> f24029b561fbda0953c7dbd93d2485b03873996d and
> https://github.com/rhboot/efivar/commit/cff88dd96b9d43e2c5875a24ba6180b196890ded:
> 
> thread-test.c:14:10: fatal error: pthread.h: No such file or directory
>    14 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f2da14f91dc602a32dd5b2b7bdf3d3aa43afa7f4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add a thread dependency

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
