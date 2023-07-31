Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51EBC001DC
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 12:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 673C781320;
	Mon, 31 Jul 2023 12:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 673C781320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnrXdYodD-IL; Mon, 31 Jul 2023 12:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB3A812D0;
	Mon, 31 Jul 2023 12:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AB3A812D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D97D71BF3CA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6DE4408D1
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6DE4408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lddvUT6UC8c3 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 12:18:36 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49E7940865
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 12:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E7940865
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 42012CBAEC
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 12:11:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C8E71BF20B;
 Mon, 31 Jul 2023 12:11:26 +0000 (UTC)
Date: Mon, 31 Jul 2023 14:11:25 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230731141125.56c04a05@booty>
In-Reply-To: <20230731061937.245062-1-neal.frager@amd.com>
References: <20230731061937.245062-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690805487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+SX+xSS7EMbhCUBjChnOJRjg2NDs+HD2mMuO1NYknFE=;
 b=LjfYopuJnZkY1XvI+S/0kOMe1II8pjkRqK80KN41/2+ksURE1S7S/8bu1iPffMVoRJehKz
 f/226dU1uXbGYwd0vIYyWgGxOFllOpYyRh5MFMnjlKvdbo8udomRc3Bv4SICHevgGLboRf
 FcrIZ4K/7oVaeeAgD4Aqne+2nPoskUQw1ACeNOXoVYvW/t9MsW/oKU5OFa+c7595Zn7gmW
 u48OHAX7uaolw42alu/gHXU+Sd6jKPGbsZzQ3wjBOiW73Pj2cqoXYzdKv5Rk9bi6FJju2f
 MdnrKAZj4QxCj6EMGWD7r3IyhDOrbuP1djTEBfBYB/+1hDVOQd0BEFEJNdar7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LjfYopuJ
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal: fix atf build failure
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 07:19:37 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Binutils 2.39 now warns when a segment has RXW permissions[1]:
> 
> aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
> permissions.
> 
> There is a ticket filed upstream[2], so until that is resolved just
> disable the warning.
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> [2] https://developer.trustedfirmware.org/T996
> 
> Fixes: https://developer.trustedfirmware.org/T996
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Build-tested on zynqmp_kria_kv260_defconfig]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
