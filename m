Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7533C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AE4141811;
	Sun, 22 May 2022 10:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dp1Zxgs3fQQb; Sun, 22 May 2022 10:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276B5417DA;
	Sun, 22 May 2022 10:11:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7E81BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7998D81498
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99KdMc6QMRXz for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:11:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A17D381497
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:11:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 251F6100007;
 Sun, 22 May 2022 10:11:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nsiYd-00BgHU-WD; Sun, 22 May 2022 12:11:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <87sfqd8eo9.fsf@dell.be.48ers.dk>
 <20220416113138.72159-1-Jason@zx2c4.com>
Date: Sun, 22 May 2022 12:11:31 +0200
In-Reply-To: <20220416113138.72159-1-Jason@zx2c4.com> (Jason A. Donenfeld's
 message of "Sat, 16 Apr 2022 13:31:38 +0200")
Message-ID: <874k1h27xo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: Eugen Hristev <Eugen.Hristev@microchip.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

 > By returning a failure in the event that the initial seed doesn't exist,
 > we'd then skip creating a new seed, which means we'd never in fact have
 > an initial seed, and this script is therefore useless. Fix this by
 > checking for the existence of the seed file first, and just returning 0
 > if it's not there.

 > Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
 > Reported-by: Eugen Hristev <Eugen.Hristev@microchip.com>
 > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Committed to 2022.02.x, thanks.

> ---
 >  package/urandom-scripts/S20urandom | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
 > index c6b2ebd48f..6c6aea9eee 100644
 > --- a/package/urandom-scripts/S20urandom
 > +++ b/package/urandom-scripts/S20urandom
 > @@ -18,6 +18,7 @@ else
 >  fi
 
 >  init_rng() {
 > +	[ -f "$URANDOM_SEED" ] || return 0
 >  	printf 'Initializing random number generator: '
 >  	dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
 >  	status=$?
 > -- 

 > 2.35.1


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
