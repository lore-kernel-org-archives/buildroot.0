Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B51C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 20:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0153941022;
	Mon, 18 Apr 2022 20:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id naGmUwDqSH1k; Mon, 18 Apr 2022 20:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12EE94101A;
	Mon, 18 Apr 2022 20:36:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 933D61BF28C
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 20:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74F23401FC
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5XGcav090vP for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 20:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 178604015E
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 20:36:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F702B810FA;
 Mon, 18 Apr 2022 20:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B6AC385AE;
 Mon, 18 Apr 2022 20:36:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="V9ZZI44I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650314182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I8simI9RmnsmU8T2+rmJICkrL+oQsdg6J9zGC1cuQoU=;
 b=V9ZZI44IIijmS7/sgeXWE12QWSB0BP5J92T89H/zzFV5FqLGMvDfP/6ll66/gqvTM8goCb
 7G6Hmq3Q+DMIRL0LJVZCN+aSThg3oljfPTEHzDfwx/rtMOp7ugGPsmKfRZytZ8CKI3m6zB
 stRM4n6kiocEScySNIfifaopDVKKqs8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c1e339ba
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 18 Apr 2022 20:36:22 +0000 (UTC)
Date: Mon, 18 Apr 2022 22:36:20 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eugen.Hristev@microchip.com
Message-ID: <Yl3LxMttmg5n91CG@zx2c4.com>
References: <87sfqd8eo9.fsf@dell.be.48ers.dk>
 <20220416113138.72159-1-Jason@zx2c4.com>
 <87bkx187ig.fsf@dell.be.48ers.dk>
 <0f4e63a3-6b82-aaf0-47af-54102e91ccfb@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f4e63a3-6b82-aaf0-47af-54102e91ccfb@microchip.com>
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: do not seed if
 initial seed doesn't exist
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

Hi Eugen,

On Mon, Apr 18, 2022 at 08:19:13PM +0000, Eugen.Hristev--- via buildroot wrote:
> On 4/16/22 4:47 PM, Peter Korsgaard wrote:
> 
> >>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:
> > 
> >   > By returning a failure in the event that the initial seed doesn't exist,
> >   > we'd then skip creating a new seed, which means we'd never in fact have
> >   > an initial seed, and this script is therefore useless. Fix this by
> >   > checking for the existence of the seed file first, and just returning 0
> >   > if it's not there.
> > 
> >   > Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
> >   > Reported-by: Eugen Hristev <Eugen.Hristev@microchip.com>
> >   > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > 
> > Committed, thanks.
> > 
> > --
> > Bye, Peter Korsgaard
> > 
> 
> 
> Hi Jason,
> 
> I cherry-picked this patch to my 2022.02.1 tree, and rebuilt my images.
> I still see this message at boot time :
> 
> "Initializing random number generator: FAIL"
> 
> Any ideas about what I could try ?

Huh, no, not sure. Are you sure your new images are running the new
file? I've manually run that function and I don't see it erroring...

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
