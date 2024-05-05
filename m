Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D20EC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 15:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A662F405D5;
	Sun,  5 May 2024 15:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWboeVDJQRFU; Sun,  5 May 2024 15:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52378405DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52378405DE;
	Sun,  5 May 2024 15:17:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF1A41BF82D
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC1A8400B8
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taz4ifgdAEYz for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 15:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47BAC400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47BAC400A6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47BAC400A6
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:16:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CBED313F88E;
 Sun,  5 May 2024 17:16:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 17:16:48 +0200
Date: Sun, 5 May 2024 17:16:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Zjei4EXWx3XZnTuN@landeda>
References: <20240502090939.748610-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240502090939.748610-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714922213;
 bh=kDR4ABncihgyKkZ693UDdc/FJIr6h6jNui4sEeeZLss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CB+3SYmhz/KaFVV6xrbPLCs3w2v4dZl3tSCJX40OrRtFsrdVYQE+BPqwds0z1GosQ
 T9xdyBIhLg9YEnxO8cyINoCprjWm7mlqQ4EXPNTOf7t/TQdMEIjxKZ/jUj79WNpJYl
 K6cu84CGeP6nw1AESAzWwUQAOUdFvp1jPKqDL4+/2fXRHLpjtpyFbaI4Ch3Hsi+ZqK
 wNy/6hvrUf5ERw7kE80nwItx3RQFXN+Prlzlg1SFxs87JDduoYP5LVrmU8D8DuOc0x
 +CVASbZEyQjwnZd9JGL9E904T3FSYjrw8EtHzXJlAR43vIbo4smJ9TtHGMy8cSzm3d
 fHQ34fMdk0amA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CB+3SYmh
Subject: Re: [Buildroot] [RFC PATCH 1/1] support/scripts/apply-patches.sh:
 set the maximum fuzz factor to 1
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Dario, All,

On 2024-05-02 11:09 +0200, Dario Binacchi spake thusly:
[--SNIP--]
> By setting the maximum fuzz factor to 1, we reduce the possibility that
> patches which cannot be applied are incorrectly reported as valid.

I think it is a good idea overall.

Did you assess how many of our patches thus no longer apply with this
change?

Note that, except for the huge amount it would require, I would pretty
much be in favour of being even stricter, and refuse any fuzz at all,
thus effectively requiring that patches actually be properly refreshed
for a version bump.

Regards,
Yann E. MORIN.

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  support/scripts/apply-patches.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 6da83f6826e9..999384cbbd5b 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -114,7 +114,7 @@ function apply_patch {
>          exit 1
>      fi
>      echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
> -    ${uncomp} "${path}/$patch" | patch -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
> +    ${uncomp} "${path}/$patch" | patch -F1 -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
>      if [ $? != 0 ] ; then
>          echo "Patch failed!  Please fix ${patch}!"
>          exit 1
> -- 
> 2.43.0
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
