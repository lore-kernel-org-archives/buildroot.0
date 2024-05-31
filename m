Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24D4C25B7C
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 11:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A248B406CA;
	Fri, 31 May 2024 11:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URlxUh4ESXtq; Fri, 31 May 2024 11:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28A0E40786
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28A0E40786;
	Fri, 31 May 2024 11:33:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1311D5152
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 11:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02E8640281
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 11:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPSZcYQUIBtw for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 11:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77FC440144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77FC440144
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77FC440144
 for <buildroot@buildroot.org>; Fri, 31 May 2024 11:33:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C63E313F89C;
 Fri, 31 May 2024 13:33:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 13:33:22 +0200
Date: Fri, 31 May 2024 13:33:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Zlm1gvwHFVeVJTDR@landeda>
References: <20240531095441.2506287-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531095441.2506287-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717155206;
 bh=0SptfhzXAu8W/K9yVjVJOZH3vcA2iuBDPheIqD2E+jU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mj/6d4gndidy/uKj5KxIKqbRJxMPbNjRogyAg6uOq6dp4CoVjpY7aJX+KCMQfl035
 STyXb7yRYBmYR8jrfUOGj0JlHDvUgPv1m3Ifg3U6jGCkt4a841Nknd7kG3jVIHBjk7
 cNBD6SXtnRRem2HtxIcq+hUXmchuwMvsDM30kfxDlHPyxC8PbxZPbrPoM2a0SqJyV2
 F+hKo1py0q1c/yeL0zXz59z26NZHCNBtDvQh6d1cWjhvkzjGqjKwR9sVEzmgkdbeZI
 GLAVFN8IR8c1isGYPvHQDwPFYm1MqGrQPy9j7rFIWf0IKq0S3d3d+O3dRlW85Q30AG
 cPbTEK1pL6WFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mj/6d4gn
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: Fix init script
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

Fiona, All,

On 2024-05-31 11:54 +0200, Fiona Klute via buildroot spake thusly:
> I have had constant issues restarting dnsmasq. Stop works, start fails
> because the new instance can't bind the socket. Another restart
> immediately after works just fine:
> 
> # /etc/init.d/S80dnsmasq restart
> Stopping dnsmasq: OK
> Starting dnsmasq:
> dnsmasq: failed to create listening socket for 192.168.128.1: Address in use
> FAIL
> # /etc/init.d/S80dnsmasq restart
> Stopping dnsmasq: FAIL
> Starting dnsmasq: OK
> 
> Solve this by waiting for process to actually stop before returning
> from the stop command. Clean up the PID file after to avoid potential
> issues with the PID being reused after stop. The wait could also be
> placed inside the restart block, but putting it into the stop block
> has the advantage that it also avoids similar issues for any other
> callers.
> 
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
> ---
>  package/dnsmasq/S80dnsmasq | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
> index 175daf9d26..f957af3594 100644
> --- a/package/dnsmasq/S80dnsmasq
> +++ b/package/dnsmasq/S80dnsmasq
> @@ -16,6 +16,11 @@ case "$1" in
>  		printf "Stopping dnsmasq: "
>  		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
>  		[ $? = 0 ] && echo "OK" || echo "FAIL"
> +		# wait for dnsmasq process to be gone
> +		while [ -f "$PIDFILE" ] && [ -d "/proc/$(cat "$PIDFILE")" ]; do

So what happens if PIDFILE disapears between the two checks? /proc will
still exist, so cat will spew an error on stderr, but the -d /proc will
succeed, we'll sleep a little while, and restart the loop. Not too bad,
but still not very clean.

I would have suggested to use the --retry option of start-stop-daemon,
but the busybox implementation does not support it... :-/

What about:

    while true; do
        pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
        ( [ "${pid}" ] && [ -d "/proc/${pid}" ] ) || break
        sleep 0.1
    done

> +			sleep .1

In my times, busybox' sleep did not always support sub-second durations,
but that has changed since 1.30.0, released in 2018, so that's OK. TIL.

Regards,
Yann E. MORIN.

> +		done
> +		rm -f "$PIDFILE"
>  		;;
>  	restart|reload)
>  		$0 stop
> --
> 2.45.1
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
