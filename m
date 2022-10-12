Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E82C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 20:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2225340605;
	Wed, 12 Oct 2022 20:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2225340605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NARVdDCIeg9v; Wed, 12 Oct 2022 20:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51512405D0;
	Wed, 12 Oct 2022 20:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51512405D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2BF51BF2AA
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9995881826
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9995881826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weQLl5837IQT for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 20:40:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 563BD81432
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 563BD81432
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 20:40:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 67621FF803;
 Wed, 12 Oct 2022 20:40:09 +0000 (UTC)
Date: Wed, 12 Oct 2022 22:40:08 +0200
To: Li Chen<me@linux.beauty>
Message-ID: <20221012224008.5dc7c7b6@windsurf>
In-Reply-To: <87edvdeseo.wl-me@linux.beauty>
References: <87edvdeseo.wl-me@linux.beauty>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665607209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bd7O4lzUWEAEmJXa6aRhLOTH/6/J9fPPHDM1eCE/YXU=;
 b=NdjrErLgjqqFBPQEGG6/OFqCrr4nx3oNZGk62/SC52N/1mGlU+F0QFppUaobz5z4nYuhqA
 256KJz4FfN+7DOL93AxNgoOFjEuRCHhi+314amkljcEAqgh7cLakFGDeP/Nx3yqZEKpAlN
 CND21AKoBCmxJdxYMUnlaxlmkvjNfSQmF+d8bopbUVX9EJZAvt2Cyyw4SNzVDlU38yBmb4
 j4sr/YgQTYABt8gSUVKTYjoou7yGVhX0g3KzDSgrz5zcl3cqC/9u1UK9NCykYwp7cMc45i
 ZTBmzZyquEmwG118LTXJgqgLzLzacfJrGoS9DpH5vwjpAYzPDHhis5DuQxgZyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NdjrErLg
Subject: Re: [Buildroot] [PATCH] package/kmod: use the correct path for kmod
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

Hello,

On Wed, 12 Oct 2022 09:34:39 +0800
Li Chen<me@linux.beauty> wrote:

> Content-Transfer-Encoding: 8bit
> 
> kmod install path is always /usr/bin/kmod instead
> of /bin/kmod.
> 
> So if we link modprobe/lsmod/... to /bin/kmod
> 
> We will get error like:
> > # modprobe
> > -sh: modprobe: not found  
> 
> because it points to:
> > # ls -liah /sbin/modprobe
> >   2551 lrwxrwxrwx    1 root     root          11 Sep 25 10:05 /sbin/modprobe -> ../bin/kmod  
> 
> and kmod is under /usr/bin/kmod instead of /bin/kmod.
> 
> Signed-off-by: Li Chen <me@linux.beauty>

Are you testing a BR2_ROOTFS_MERGED_USR enabled or a
BR2_ROOTFS_MERGED_USR disabled configuration?

If you're testing a BR2_ROOTFS_MERGED_USR enabled configuration, then
the "modprobe" symlink, even if created in /sbin is in fact in
/usr/sbin, because /sbin is a symlink to /usr/sbin. So actually the
symlink is /usr/sbin/modprobe -> ../bin/kmod, which is correct as kmod
is indeed in /usr/bin/kmod.

If you're testing a BR2_ROOTFS_MERGED_USR disabled configuration, then
the "modprobe" symlink is really in /sbin, and /sbin/modprobe is a
symlink to ../usr/bin/kmod, which is correct.

(Of course, I didn't do a test, so maybe my reasoning is wrong, but the
current logic appears correct at first sight).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
