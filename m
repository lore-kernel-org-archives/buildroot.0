Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22634C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 20:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0197820C3;
	Sat,  1 Jun 2024 20:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yw089GKg6rIA; Sat,  1 Jun 2024 20:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 949D7820D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 949D7820D8;
	Sat,  1 Jun 2024 20:19:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E4711BF4E5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A91C60750
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSC7i1-ev1ZX for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 20:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39DCF606EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DCF606EB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39DCF606EB
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 20:19:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 06A9113F8BA;
 Sat,  1 Jun 2024 22:19:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 22:19:31 +0200
Date: Sat, 1 Jun 2024 22:19:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZluCU3w40FzxVl1h@landeda>
References: <20240531185328.2586537-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531185328.2586537-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717273175;
 bh=HFU0ul4icHFoVLk9a9XT2l5R/WNXHS0O2ffYKKFpBmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofsG25w8PemNclLIxdsUFUIxLgR177GxM3yXXxg12qmQ4OTULBsgCzsBd9jOcpL2+
 SWvaAJRdNx3svcz5K6nOq1CbnCkp15MHnGz7ogjeNhDg8k6xL+oIA7ZjsID8S4fIjU
 qf57z0GlgIbYTU0wGeky/QK7BcnDWwnITW9FXWKtezW5RtioGq3uRhtTI6vHBPsUqw
 uZnpMlfoDpyyTyGFCKJmL2z0szzY87XmiBC9+kLjSG96FEN9W0yeybDVgaCDPGzOZ4
 Tk15Y1T+zYFK8qw3LbtbG5mgn1XN064MCfADbuQFuREDbeaOEmiBC/LFpC1Ed13CKY
 CI0Sh/Y3oyYrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ofsG25w8
Subject: Re: [Buildroot] [PATCH v2 1/1] package/dnsmasq: Fix init script
 restart command
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fiona, All,

On 2024-05-31 20:53 +0200, Fiona Klute via buildroot spake thusly:
> I have had constant issues restarting dnsmasq. Stop works, start fails

We try to have commit logs with a neutral tone, i.e. not in the first
person, so I slightly rephrased that sentence. I also reflowed the
part with the example failure.

Also, see below...

[--SNIP--]
> diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
> index 175daf9d26..27163f5205 100644
> --- a/package/dnsmasq/S80dnsmasq
> +++ b/package/dnsmasq/S80dnsmasq
> @@ -16,6 +16,13 @@ case "$1" in
>  		printf "Stopping dnsmasq: "
>  		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
>  		[ $? = 0 ] && echo "OK" || echo "FAIL"
> +		# wait for dnsmasq process to be gone
> +		while true; do
> +			pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
> +			( [ -n "${pid}" ] && [ -d "/proc/${pid}" ] ) || break

I have a hook that runs check-paakcage without the exclusion list, and
that also runs shellcheck:

    $ ./utils/docker-run shellcheck package/dnsmasq/S80dnsmasq
    In package/dnsmasq/S80dnsmasq line 22:
                            ( [ -n "${pid}" ] && [ -d "/proc/${pid}" ] ) || break
                            ^-- SC2235: Use { ..; } instead of (..) to avoid subshell overhead.

So I fixed that (as well as the two other warnings that are unrelated to
your change), and applied to master, thanks.

Regards,
Yann E. MORIN.

> +			sleep 0.1
> +		done
> +		rm -f "$PIDFILE"
>  		;;
>  	restart|reload)
>  		$0 stop
> --
> 2.45.1
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
