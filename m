Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3ACC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C08781B8A;
	Mon,  3 Jul 2023 20:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C08781B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhgRXDLRVuwd; Mon,  3 Jul 2023 20:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65F6F81EAE;
	Mon,  3 Jul 2023 20:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F6F81EAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DDBA1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E4C160E4B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E4C160E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcDb0vxZJ4q0 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:00:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79ECF60E97
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79ECF60E97
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:00:03 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39E38240006;
 Mon,  3 Jul 2023 20:00:01 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:59:17 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230703215917.16bfa729@windsurf>
In-Reply-To: <20230703191617.1338283-2-giulio.benetti@benettiengineering.com>
References: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
 <20230703191617.1338283-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+xXqgcR1cbKIMpILKoeGjaB66/z5Ru5RZ+l9qeyQbk=;
 b=f06iChq+5L7MH4qurqFAsQUObDcLhXbAzzflm4oWdDIJYcJVsSYHjj27LWz6azExSwsc06
 imjfVhshLBCmlK1vsexpemv9+ttFSz1bSiqolUGXobeJRhjTq/6BIjG8kk+IAQFDlsO+UI
 0FeX3eaPjY9jWNlLcADxxy+KmFCauBVJZUHtvm0yyREU/uylRL+tIVKnY3uI0LDWyv8FtC
 9RLrmixqaVeXQGGgIESdGfAJUN4MZYYPYlKP1CD+X/Pbx3tENyrjYmfm6LyoYFsio+D3IS
 E4XmKsA8/fTJ1foGZTq/BIfD+GMOmh0ud19wIeuUqV+LUr6vsmc47qouJVNnaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f06iChq+
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to
 version 2023-07-03
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  3 Jul 2023 21:16:16 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version fix build failure on Linux version < 5.15.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This patch doesn't apply cleanly on the current master. Are you sure
it's based on master?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
