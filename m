Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED78C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 08:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB1441798;
	Thu, 24 Mar 2022 08:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7D9EO-IWsAYc; Thu, 24 Mar 2022 08:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5E2041773;
	Thu, 24 Mar 2022 08:24:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9D751BF3B5
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 08:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4667404B4
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 08:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOvoOf1eFzCj for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 08:24:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5181A400CB
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 08:24:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9911:ddfc:be7c:3131])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8316819F5A3;
 Thu, 24 Mar 2022 09:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648110276;
 bh=0Tw6yKeQQ4dSrxyQs2dxjHzDhO7mxaHwDdCKIF2KrNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E6TvsePpEJ4n846IO5/BiE7QG9wltB3YOBd+ToidX+OvR46NgsjWM1cLPC+Qqphiq
 8tDW6+//IivcGeB5sHMO6lptjW1LP4Oa8dpigs1Gi9CN7IZq/4NLD2KqNwneq4TZhx
 K7RoaUcKNNvAladknAkBI2SemPaSXcwxKhpMvnYzkiiDIWshhturxs2UR7XTLb4Adt
 KBL/OZKwhuSv/BUcIEmwsjfSmogdZFkz8KYZvDnYb/AKA0ocrCD63d2hnE1iIZrcbV
 WfAs6SIvMlsvbmyw+VHx13FWQG0qfX3LTZTLzzjIkQm+/ViyncOBkCXjywJzArtxNU
 2E4TTSrbRbiEA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 24 Mar 2022 09:24:33 +0100
Date: Thu, 24 Mar 2022 09:24:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20220324082433.GA3649946@scaer>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220323200731.170409-1-Jason@zx2c4.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
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

Jason, All,

+Peter: candidate for backporting as a security fix

On 2022-03-23 14:07 -0600, Jason A. Donenfeld spake thusly:
> Writing into /dev/urandom doesn't actually credit any entropy bits. And
> while it adds that data to the entropy pool, it won't actually be
> immediately used when reading from /dev/urandom subsequently. This is
> how the kernel's /dev/urandom has always worked, unfortunately.
> 
> As a result of this behavior, which may be understandably surprising,
> writing a good seed file into /dev/urandom and then saving a new seed
> file immediately after is dangerous, because the new seed file may wind
> up being entirely deterministic, even if the old seed file was quite
> good.
> 
> This has been fixed in systemd with
> <https://github.com/systemd/systemd/commit/da2862ef06f22fc8d31dafced6d2d6dc14f2ee0b>,
> and fortunately it's possible to do the same thing in shell script here.
> Specifically, instead of just saving new /dev/urandom output straight
> up, we hash the new /dev/urandom together with the old seed, in order to
> produce the new seed. This way the amount of entropy in the new seed
> will stay the same or get better, but not appreciably regress.
> 
> At the same time, the pool size check in this script is useless. Writing
> to /dev/urandom never credits bits anyway, so no matter what, writing
> into /dev/urandom is useful and not harmful. There's also not much of a
> point in seeding with more than 256 bits, which is what the hashing
> operation above produces. So this commit removes the file size check.
> 
> As a final note, while this commit improves upon the status quo by
> removing a vulnerability, this shell script still does not actually
> initialize the RNG like it says it does. For initialization via a seed
> file, the RNDADDENTROPY ioctl must be used.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/urandom-scripts/S20urandom | 39 +++++++++++++-----------------
>  1 file changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
> index e4fd125721..c6b2ebd48f 100644
> --- a/package/urandom-scripts/S20urandom
> +++ b/package/urandom-scripts/S20urandom
> @@ -17,43 +17,38 @@ else
>  	pool_size=512
>  fi
>  
> -check_file_size() {
> -	[ -f "$URANDOM_SEED" ] || return 1
> -	# Try to read two blocks but exactly one will be read if the file has
> -	# the correct size.
> -	size=$(dd if="$URANDOM_SEED" bs="$pool_size" count=2 2> /dev/null | wc -c)
> -	test "$size" -eq "$pool_size"
> -}
> -
>  init_rng() {
> -	if check_file_size; then
> -		printf 'Initializing random number generator: '
> -		dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
> -		status=$?
> -		if [ "$status" -eq 0 ]; then
> -			echo "OK"
> -		else
> -			echo "FAIL"
> -		fi
> -		return "$status"
> +	printf 'Initializing random number generator: '
> +	dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
>  	fi
> +	return "$status"
>  }
>  
>  save_random_seed() {
>  	printf 'Saving random seed: '
> -	if touch "$URANDOM_SEED" 2> /dev/null; then
> +	status=1
> +	if touch "$URANDOM_SEED.new" 2> /dev/null; then
>  		old_umask=$(umask)
>  		umask 077
> -		dd if=/dev/urandom of="$URANDOM_SEED" bs="$pool_size" count=1 2> /dev/null
> -		status=$?
> +		dd if=/dev/urandom of="$URANDOM_SEED.tmp" bs="$pool_size" count=1 2> /dev/null
> +		cat "$URANDOM_SEED" "$URANDOM_SEED.tmp" 2>/dev/null \
> +			| sha256sum \
> +			| cut -d ' ' -f 1 > "$URANDOM_SEED.new" && \
> +		mv "$URANDOM_SEED.new" "$URANDOM_SEED" && status=0
> +		rm -f "$URANDOM_SEED.tmp"
>  		umask "$old_umask"
>  		if [ "$status" -eq 0 ]; then
>  			echo "OK"
>  		else
>  			echo "FAIL"
>  		fi
> +
>  	else
> -		status=$?
>  		echo "SKIP (read-only file system detected)"
>  	fi
>  	return "$status"
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
