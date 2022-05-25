Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8279AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 08:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08B5A410E4;
	Wed, 25 May 2022 08:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBZz9sHlo4rX; Wed, 25 May 2022 08:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCAE7410D5;
	Wed, 25 May 2022 08:57:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C47171BF2A5
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 08:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1B2B60769
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 08:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zM3RJVGl-pmv for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 08:57:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8926060671
 for <buildroot@buildroot.org>; Wed, 25 May 2022 08:57:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6823:fe26:3f6d:8e17])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6D54F5FFC1;
 Wed, 25 May 2022 10:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653469043;
 bh=8i6DPr+VJbNtLcu+P+A11RcmKboNh0VN5KMu0mT1DVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tl0SIjOSG82kQHhgrr4OlCczXZQh98+LMAOV6Ji4MOXqO2Wq1CTuKYDcjK+ZfNnXG
 FAQif37Sw8wXrBk5m1KPVLsJ3stjkA7TltQndwTrGZYbw5uaK2ys07LBCJdwytxC/R
 Ll+jFYceLJfz+K+BJQx/U1Nz9FGmyiGqKCFt1Obue7mZ7/Cc1JVTHD/2CsjCGqh5+6
 FHbnciKu+dnQt4DWsWN8GDzSITgX7KkmraADuIWaegg1h5WW5Zt2VJifKA6JY1m2IG
 dh6k8ojrb2CtQYw8VV6OpVKi0uB6FWJZGJy7bFSRShxW/MfoaBUYjafyjYEQUd/Nkv
 IfZypR5IOvs7Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 May 2022 10:57:17 +0200
Date: Wed, 25 May 2022 10:57:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20220525085717.GC301044@scaer>
References: <20220522131535.1498502-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220522131535.1498502-1-neal.frager@amd.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 wesley@sonifex.co.uk, michal.simek@amd.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2022-05-22 07:15 -0600, Neal Frager via buildroot spake thusly:
> This patch uses the BR2_ROOTFS_POST_SCRIPT_ARGS to auto-generate the
> extlinux.conf file, so developers will only need to modify the
> board_defconfig file to change the console and boot file system locations.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/post-build.sh | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
> index 9fd8bbf2c8..749784c3f3 100755
> --- a/board/zynqmp/post-build.sh
> +++ b/board/zynqmp/post-build.sh
> @@ -4,5 +4,19 @@
>  # in the binaries directory
>  
>  BOARD_DIR="$(dirname $0)"
> +CONSOLE=$2
> +ROOT=$3
> +
> +FILE=$BOARD_DIR/extlinux.conf
> +if test -f "$FILE"; then
> +    echo "$FILE aready exists."
> +else
> +  cat << __HEADER_EOF >> $BOARD_DIR/extlinux.conf

Why would you need append-redirection >> ? Afterall, you just tested
that the file did not already exist... Anyway, see below...

> +label linux
> +  kernel /Image
> +  devicetree /system.dtb
> +  append console=$CONSOLE root=/dev/$ROOT rw rootwait
> +__HEADER_EOF
> +fi
> 
>  install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf

We try to avoid generating files in the source tree.

Instead, why not just:

    FILE="${BOARD_DIR}/extlinux.conf"
    if test -f "$FILE"; then
        install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"
    else
        mkdir -p "${BINARIES_DIR}"
        cat <<-__HEADER_EOF >"${BINARIES_DIR}/extlinux.conf"
    TAB>label linux
    TAB>  kernel /Image
    TAB>  devicetree /system.dtb
    TAB>  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
    TAB>__HEADER_EOF
    fi

Note: the <<- rediretion removes leading TABs, so it is allows a nicer
indentation (so, replace TAB> above with an actual TAB, of course).

Also, please always evaluate variables using curly braces and quote the
expansion, like so:   "${foo}"   (in the here-document, quotes are not
needed, of course).

Eventualy, at the end of this series, the script will always be used for
boards that do not already have an extlinux.conf, the condition can be
dropped in a final patch, to just only keep the else part of the
condition, don't you think?

Regards,
Yann E. MORIN.

> -- 
> 2.17.1
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
