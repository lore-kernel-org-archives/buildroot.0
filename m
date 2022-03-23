Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202FCC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 05:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 960EA60DB2;
	Wed, 23 Mar 2022 05:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeLKAUs6FCgF; Wed, 23 Mar 2022 05:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B51660BD5;
	Wed, 23 Mar 2022 05:10:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 690441BF95F
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 05:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53F738492B
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 05:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Epyi0hcpV2ia for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 05:10:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 045AA84929
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 05:10:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7995DB81DFA
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 05:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8A8C340F2
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 05:10:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Ue+3Jx3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648012226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CEUAtKrK5QuEU7fvifDcSH9ffZ2X8lVCY7t1xDBxz1s=;
 b=Ue+3Jx3ZxwBr8bdSAJfqSW5mepsJZCQkIyywX7GjAmtrgWOXql4TItTiAy+0xF9YmDG49V
 05Eu0aGW2gEWL1vYi4mmLdU7ugvXmBZlf+xECtQg2M9KQLNZAfiBAU8ZPrPCKrnFD2WJOE
 NGb6xvMZP6kd10PZQrT03XfIvVtwVlY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4cb00269
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 05:10:26 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2e5e31c34bfso4668157b3.10
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 22:10:26 -0700 (PDT)
X-Gm-Message-State: AOAM530ToqhJK12E5cZrJJClPTwBhLcM+GBQT0fIlEOcFgy0uFtbnWUG
 BLNQ7Rqa6Y7labwCUnEUvCJbTFmQqZrGvibXzc4=
X-Google-Smtp-Source: ABdhPJxPXcQoWQ0YGpxSuTiSSrOtNYWB4eDjmByhAoEd7hm8n42Y38CsmF6ZFsD5NYnFQAVgWk/Os0JPYAkttWGWwU0=
X-Received: by 2002:a0d:c681:0:b0:2db:9ffe:1f00 with SMTP id
 i123-20020a0dc681000000b002db9ffe1f00mr34509947ywd.100.1648012225310; Tue, 22
 Mar 2022 22:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220323035233.140997-1-Jason@zx2c4.com>
In-Reply-To: <20220323035233.140997-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 22 Mar 2022 23:10:14 -0600
X-Gmail-Original-Message-ID: <CAHmME9o=eyyGPxpW4s55FvsHJvjz7NYhM3txyWT0vKHMTViK0w@mail.gmail.com>
Message-ID: <CAHmME9o=eyyGPxpW4s55FvsHJvjz7NYhM3txyWT0vKHMTViK0w@mail.gmail.com>
To: buildroot@buildroot.org, christoph.muellner@theobroma-systems.com, 
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: hash old seed with
 new seed when saving
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christoph, Yann,

I realized I should have CC'd you on the below. Sorry about that.

Jason

On Tue, Mar 22, 2022 at 9:52 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Writing into /dev/urandom doesn't actually credit any entropy bits. And
> while it adds that data to the entropy pool, it won't actually be
> immediately used when reading from /dev/urandom subsequently. This is
> how the kernel's /dev/urandom has always worked, unfortunately.
>
> As a result of this behavior, which may be understandably surprising to
> you, writing a good seed file into /dev/urandom and then saving a new
> seed file immediately after is dangerous, because the new seed file may
> wind up being entirely deterministic, even if the old seed file was
> quite good.
>
> I fixed this in systemd with
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
> ---
>  package/urandom-scripts/S20urandom | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
>
> diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
> index e4fd125721..f971ea905a 100644
> --- a/package/urandom-scripts/S20urandom
> +++ b/package/urandom-scripts/S20urandom
> @@ -17,26 +17,16 @@ else
>         pool_size=512
>  fi
>
> -check_file_size() {
> -       [ -f "$URANDOM_SEED" ] || return 1
> -       # Try to read two blocks but exactly one will be read if the file has
> -       # the correct size.
> -       size=$(dd if="$URANDOM_SEED" bs="$pool_size" count=2 2> /dev/null | wc -c)
> -       test "$size" -eq "$pool_size"
> -}
> -
>  init_rng() {
> -       if check_file_size; then
> -               printf 'Initializing random number generator: '
> -               dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
> -               status=$?
> -               if [ "$status" -eq 0 ]; then
> -                       echo "OK"
> -               else
> -                       echo "FAIL"
> -               fi
> -               return "$status"
> +       printf 'Initializing random number generator: '
> +       dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
> +       status=$?
> +       if [ "$status" -eq 0 ]; then
> +               echo "OK"
> +       else
> +               echo "FAIL"
>         fi
> +       return "$status"
>  }
>
>  save_random_seed() {
> @@ -44,7 +34,9 @@ save_random_seed() {
>         if touch "$URANDOM_SEED" 2> /dev/null; then
>                 old_umask=$(umask)
>                 umask 077
> -               dd if=/dev/urandom of="$URANDOM_SEED" bs="$pool_size" count=1 2> /dev/null
> +               dd if=/dev/urandom of="$URANDOM_SEED.new" bs="$pool_size" count=1 2> /dev/null
> +               cat "$URANDOM_SEED" "$URANDOM_SEED.new" 2>/dev/null | sha256sum | cut -d ' ' -f 1 > "$URANDOM_SEED"
> +               rm "$URANDOM_SEED.new"
>                 status=$?
>                 umask "$old_umask"
>                 if [ "$status" -eq 0 ]; then
> --
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
