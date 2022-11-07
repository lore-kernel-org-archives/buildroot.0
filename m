Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C6CC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12BB881911;
	Mon,  7 Nov 2022 22:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BB881911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHwgUscKqib1; Mon,  7 Nov 2022 22:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49E058146D;
	Mon,  7 Nov 2022 22:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49E058146D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6681BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6938340329
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6938340329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVloTEd978Ei for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:10:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 548C04031F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 548C04031F
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:10:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F7F31BF209;
 Mon,  7 Nov 2022 22:10:18 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:10:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221107231017.776896ab@windsurf>
In-Reply-To: <20221107172718.8203-1-fontaine.fabrice@gmail.com>
References: <20221107172718.8203-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t69M4iHTUkiK9KX9rW165IbI2Uf1LbMNMAj7BntGDwI=;
 b=Lz1maVCjzAFCA/KNOKBMjyZm8O0xj/ww9xBrvNJhy0N6x0X4+s6e+BrDi0mD1h/pxP26TV
 gHum6iIVX0f2sAMCzJ9XlN6xPiUZtO5YhTxlJrjb4LxIVYxjxhTUwQKf1dcDDvXu3FAvRL
 Lqc4vHdbtLUOToB5LYsflox+D2nONj6CTfmmPZbjxx3jD3+lSgJFL+6KWujESWSgHSNODQ
 7qVchcH/5BbcGzVBHp73cptvpUbFciCobHTz67XcdSudk09DE+a3YLLvUw6dA9IJK/H/v3
 DWq1hdk4nLGnDh5cZBHzi/oHKqmWHreQF/uVtbXXd1xkxz6HIJEBCC/2rJj84w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lz1maVCj
Subject: Re: [Buildroot] [PATCH v2,1/1] package/libkcapi: fix uclibc build
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
Cc: Tan En De <ende.tan@starfivetech.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Nov 2022 18:27:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following uclibc build failure raised since bump to version
> 1.4.0 in commit 06a9dc3528847ec6c12a9b6188d4106e086eabe5 and
> https://github.com/smuellerDD/libkcapi/commit/12f19b9a1dd308117f83e8cb33e28e3c040710a0:
> 
> lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
> lib/kcapi-kernel-if.c:196:26: error: conversion to 'int' from 'size_t' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
>   196 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
>       |                          ^~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/eccf4b84670b5ef0fdd68b46338edf5043c7cc0d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Tan En De):
>  - Use upstream patch

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
