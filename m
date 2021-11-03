Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7732BC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:10:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD6416113B
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD6416113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B16340165;
	Wed,  3 Nov 2021 22:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47ZnV2c_3L3x; Wed,  3 Nov 2021 22:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B802403AC;
	Wed,  3 Nov 2021 22:10:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD94D1BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC96540523
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDNZuqAOUaqd for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:10:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A1DF40507
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:10:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3A523240004;
 Wed,  3 Nov 2021 22:10:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1miOSj-0007a0-KK; Wed, 03 Nov 2021 23:10:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211102222035.719508-1-thomas.petazzoni@bootlin.com>
 <87k0hpkkjl.fsf@dell.be.48ers.dk> <20211103225358.00d638d8@windsurf>
Date: Wed, 03 Nov 2021 23:10:29 +0100
In-Reply-To: <20211103225358.00d638d8@windsurf> (Thomas Petazzoni's message of
 "Wed, 3 Nov 2021 22:53:58 +0100")
Message-ID: <8735oclwkq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 03 Nov 2021 22:15:42 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:  
 >> 
 >> > In Python 3.x, check_output() returns a "bytes" array, and not a
 >> > string. Its result needs to be decoded to be turned into a
 >> > string. Without this fix, "get-developers -c" bails out with:  
 >> 
 >> > Traceback (most recent call last):
 >> >   File "/home/thomas/projets/buildroot/./utils/get-developers", line 105, in <module>
 >> >     __main__()
 >> >   File "/home/thomas/projets/buildroot/./utils/get-developers", line 53, in __main__
 >> >     files = getdeveloperlib.check_developers(devs)
 >> >   File "/home/thomas/projets/buildroot/utils/getdeveloperlib.py", line 280, in check_developers
 >> >     files = subprocess.check_output(cmd).strip().split("\n")
 >> > TypeError: a bytes-like object is required, not 'str'  
 >> 
 >> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
 >> 
 >> Alternatively we could use universal_newlines=True, but Ok - Committed
 >> to 2021.02.x and 2021.08.x, thanks.

 > But was this committed to master already? It seems not. Isn't it
 > dangerous to start committing stuff to stable branches that are not in
 > master? I thought you were only cherry-picking stuff from master.

I am, you applied it to master yesterday?

https://git.buildroot.net/buildroot/commit/?id=53da6a7c05f75af925d235f22db2142b5067806e

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
