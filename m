Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D5DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:54:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B82FB61139
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B82FB61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BD9980EF6;
	Wed,  3 Nov 2021 21:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6l6jVD-uT6C; Wed,  3 Nov 2021 21:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09AC580F14;
	Wed,  3 Nov 2021 21:54:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74A041BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6513080F1E
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shTfXUG-_d1E for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:54:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B96C980EF6
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:54:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6CC0C1C0002;
 Wed,  3 Nov 2021 21:53:59 +0000 (UTC)
Date: Wed, 3 Nov 2021 22:53:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211103225358.00d638d8@windsurf>
In-Reply-To: <87k0hpkkjl.fsf@dell.be.48ers.dk>
References: <20211102222035.719508-1-thomas.petazzoni@bootlin.com>
 <87k0hpkkjl.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] utils/getdeveloperlib.py: fix
 check_output() return value decoding
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 03 Nov 2021 22:15:42 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:  
> 
>  > In Python 3.x, check_output() returns a "bytes" array, and not a
>  > string. Its result needs to be decoded to be turned into a
>  > string. Without this fix, "get-developers -c" bails out with:  
> 
>  > Traceback (most recent call last):
>  >   File "/home/thomas/projets/buildroot/./utils/get-developers", line 105, in <module>
>  >     __main__()
>  >   File "/home/thomas/projets/buildroot/./utils/get-developers", line 53, in __main__
>  >     files = getdeveloperlib.check_developers(devs)
>  >   File "/home/thomas/projets/buildroot/utils/getdeveloperlib.py", line 280, in check_developers
>  >     files = subprocess.check_output(cmd).strip().split("\n")
>  > TypeError: a bytes-like object is required, not 'str'  
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> Alternatively we could use universal_newlines=True, but Ok - Committed
> to 2021.02.x and 2021.08.x, thanks.

But was this committed to master already? It seems not. Isn't it
dangerous to start committing stuff to stable branches that are not in
master? I thought you were only cherry-picking stuff from master.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
