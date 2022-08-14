Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D9FC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06E2460BA3;
	Sun, 14 Aug 2022 10:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06E2460BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RL3eSevNZ_VW; Sun, 14 Aug 2022 10:16:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AB9360AF1;
	Sun, 14 Aug 2022 10:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AB9360AF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 181741BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9D7660AF1
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9D7660AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hG8UQ_AAWe_e for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:16:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA1B6608B7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA1B6608B7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:16:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E1DE01BF205;
 Sun, 14 Aug 2022 10:16:29 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:16:28 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814121628.046914c0@windsurf>
In-Reply-To: <20220813184448.2303650-1-fontaine.fabrice@gmail.com>
References: <20220813184448.2303650-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660472190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o63ethUfaOOLpTcNFmMdUs8EiJvzpI7/0EblDIt6TLI=;
 b=pZuOJiH6zTrikgQzRmVbz/gxZ2Jq51pgoWrESPLsnmD1AxMzNglYp1WEmvbfMRaEGv01W9
 zoGmhGFpb6nsmKkqQ+8iw4SMDswp3UScbpGM82n82wBDKrNXJTqTMXyfx9DMsK15R0Y0t4
 ytFSQBAd1nfDsmuuxiVchZbSmHFqqh2q0JSCO2FAkdcJGkg1CJ5PRil7Fc8donaA8RUa4H
 OlvtkcoTZr7pNUCPLF+azZwDyjW09h5avbsk2WOHZUer83UUrj/0FfnRbGpVpcOHWf2toG
 j8sx25+75xmEqSVeklJc50Kpp2vNyCLbEkMel8Jnny2L7VIXv8ZsRYt7p91SGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pZuOJiH6
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: fix build with
 kernel >= 5.1 and < 5.6
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Aug 2022 20:44:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with kernel >= 5.1 and < 5.6 (i.e.
> before
> https://github.com/torvalds/linux/commit/9e3aa61ae3e01ce1ce6361a41ef725e1f4d1d2bf)
> raised since bump to version 0.12.02 in commit
> e551fe76e2073f15b0fcf92a73bb6b7334b017b3 and
> https://github.com/ColinIanKing/stress-ng/commit/3d6fccdbe53d0cbcb75dd4b91571aaaae7ee1ad4:
> 
> In file included from stress-io-uring.c:26:
> io-uring.h:1:9: error: macro names must be identifiers
>     1 | #define #define HAVE_IORING_OP_NOP 0
>       |         ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1bf3f2bbc849bdce531d56b1024fa87f0c1ae667
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-Makefile-fix-build-with-kernel-5.6.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch

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
