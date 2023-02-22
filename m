Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017ACC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84175415AD;
	Wed, 22 Feb 2023 14:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84175415AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82ACMY2ZfpX2; Wed, 22 Feb 2023 14:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05414158A;
	Wed, 22 Feb 2023 14:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C05414158A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD3751BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C483A4107F
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C483A4107F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAtpD3uyEqWe for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:55:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB9741083
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BB9741083
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:55:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9536D20004;
 Wed, 22 Feb 2023 14:55:44 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:55:43 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222155543.0b46db89@windsurf>
In-Reply-To: <20230222095434.444552-1-fontaine.fabrice@gmail.com>
References: <20230222095434.444552-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677077744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DwbNPz75MVwfCcB+T/ZExH2p9MLq0BtJolgRM1YQfWM=;
 b=ZKIDoxw/tSnBO9Dnb9Vx9CATN4ic4W/A7tGWGD+9bIZ9h/Y7b8rvHwwySNBygNmhEXb7DM
 ADCcaKs91tOXxM9Oknuw+ZMW323POg3kXunWAYwbwiRrK7wCrvs6RtupQqyvnEDIpSPMW4
 fRQhGHSMEZGc3JKxLeeU7y82KuHEn/yARv/iPaPqN6DCvvCb9a4KAB0LDqtxu48Xq+Rk1V
 dkYR3SbbijVYl0YUDX4og25Vf2Fx2dAZ6EzXKF0WBrcWEKexuTiXgdseLcmp5+HRK2WbTm
 /XwucXDsws6L/ilJA6rnom0R47VM4raS1hWbJbwR3NFBqPDVAcBnjttf6oRoHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZKIDoxw/
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: fix build with empty
 OPENSBI_PLAT
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
Cc: Alistair Francis <alistair@alistair23.me>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Feb 2023 10:54:34 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure when OPENSBI_PLAT is empty raised since
> commit 9b5b7165deb91bad3cdb1ea0dd8f940eff75f3a9:
> 
> /usr/bin/install -m 0644 -D /nvmedata/autobuild/instance-4/output-1/build/opensbi-0.9/build/platform//firmware/fw_jump.bin /nvmedata/autobuild/instance-4/output-1/images/fw_jump.bin
> /usr/bin/install: cannot stat '/nvmedata/autobuild/instance-4/output-1/build/opensbi-0.9/build/platform//firmware/fw_jump.bin': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8033327f090e4a3d84a7fce1f62b14fdf89dbd89
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  boot/opensbi/opensbi.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
