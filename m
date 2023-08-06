Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10512C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D9080BD0;
	Sun,  6 Aug 2023 11:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0D9080BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uiHC5MXmPdzH; Sun,  6 Aug 2023 11:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5ECD813B6;
	Sun,  6 Aug 2023 11:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5ECD813B6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 929E11BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 135DD4030F
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135DD4030F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gT000AN4ALsv for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:55:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 956BA4031B
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 956BA4031B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D528240004;
 Sun,  6 Aug 2023 11:54:59 +0000 (UTC)
Date: Sun, 6 Aug 2023 13:54:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806135459.7fc67211@windsurf>
In-Reply-To: <20230804161121.1033315-1-bernd@kuhls.net>
References: <20230804161121.1033315-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691322900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Henk782D5+pH8ipXZfu1gCXuUkZ36GNI+44H4eyKtX8=;
 b=DlFaMqdVDOa1zY9qePZQMaWdOFZyLxikdUOXwPfXI9ZLyatEcSL5rbh7rFo2ds2QST4KYR
 PF9IZzt0xYxPN2Opfit+tq1z6K3SKCAuoejSiw2PIPfTSMWd2nnHigKsR5AawOAzs6ojyn
 IjKeKMNXn4rWtL4EtcHfXBwKMN825e4Tct+7zWgoedhIawpPrypbgGXvv+qivOZEZFpnVF
 +9V8/ycVIS2WYICMVBUZHqLzzO50ueu2RqmXvuueCl/1dKCQlOJu7aA2o12rWlahGLvQFC
 U9yeoE2oKNAEAVU1/2d1Vk7pIZ/zBXq9DqWK1N2PY35zAakXkRIR+NXIPo2TOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DlFaMqdV
Subject: Re: [Buildroot] [PATCH v2 1/1] package/tvheadend: needs __sync_*_8
 intrisics
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Aug 2023 18:11:21 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/992/99235aa2aca1afe031a088baebbd46057fe75fcd/
> 
> /home/autobuild/autobuild/instance-15/output-1/build/tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a/src/atomic.h:253:
>  undefined reference to `__sync_lock_test_and_set_8'
> /home/autobuild/autobuild/instance-15/output-1/build/tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a/src/atomic.h:81:
>  undefined reference to `__sync_fetch_and_add_8'
> 
> The build error was introduced by the latest bump of tvheadend with
> commit 67cbbbfe6e9632deacd0784bdbf51496ad76701d.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: added comment about commit which introduced the build error (Thomas)

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
