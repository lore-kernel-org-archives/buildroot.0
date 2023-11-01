Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D60DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0266431BA;
	Wed,  1 Nov 2023 16:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0266431BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ReYe6GxiJlvB; Wed,  1 Nov 2023 16:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E79B417C1;
	Wed,  1 Nov 2023 16:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E79B417C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 711771BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F69D417C1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F69D417C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G69jt7pNBZla for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:52:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5578F4172D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5578F4172D
Received: by mail.gandi.net (Postfix) with ESMTPSA id A83D3E0003;
 Wed,  1 Nov 2023 16:52:15 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:52:14 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101175214.7f0fcfc3@windsurf>
In-Reply-To: <20231022202433.33149-1-fontaine.fabrice@gmail.com>
References: <20231022202433.33149-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698857535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8FPsyQ/AuJ7pAplns2CboHMbxn08tJ2SP8UCjfCv28=;
 b=XYQ1kiFRKiM8tKvIOjtVUsLfFcbJovgLsS1zDS4A0kD3lkr8MslX4Eq+cXEk0H8LfiFs95
 jB9NK2h3kaAh058dKxcRHAbGwuj6mhrCX2fKe92K1habBTDFL94Zmf1bVdQHa0pacLAMZ0
 o5BMzRm8WzLLZOc9hwK0vqNFDaAkD8rkPMAXO75WN7uplCeDezI5xg+lA0/0nOOd3w9zYQ
 vcJ4Eg4RX4djamk4Mfts1b3+vnDehCpTrsE+Kf+p3PnM1qnZm2M69YGfu77eKvZfFAUNsI
 uozZtQHgHCMHjUwLU+aV5ZrX8yh0N6xoMWvNlw3aZjlJlayCQrtU08MkFBNp6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XYQ1kiFR
Subject: Re: [Buildroot] [PATCH 1/1] package/reproc: fix build with gcc >= 13
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 22 Oct 2023 22:24:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 13:
> 
> In file included from /home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/src/reproc.cpp:1:
> /home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/include/reproc++/reproc.hpp:95:5: error: declaration of 'reproc::options::<unnamed struct> reproc::options::env' changes meaning of 'env' [-Wchanges-meaning]
>    95 |   } env = {};
>       |     ^~~
> /home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/include/reproc++/reproc.hpp:91:5: note: used here to mean 'class reproc::env'
>    91 |     env::type behavior;
>       |     ^~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/11feca3698154c255938ab3b25a34429135c31f8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-reproc-Try-to-fix-gcc-13-build.patch | 37 +++++++++++++++++++
>  package/reproc/0002-Fix-gcc-13-build.patch    | 28 ++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 package/reproc/0001-reproc-Try-to-fix-gcc-13-build.patch
>  create mode 100644 package/reproc/0002-Fix-gcc-13-build.patch

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
