Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC345C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 14:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8031C6067E;
	Fri, 17 May 2024 14:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uit_ijfpQX6P; Fri, 17 May 2024 14:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE3A60744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE3A60744;
	Fri, 17 May 2024 14:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F9AE1BF2B6
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BA7540514
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBRIZjkxM7lw for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 14:40:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C64D40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C64D40025
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C64D40025
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:40:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B455F13F8A7;
 Fri, 17 May 2024 16:40:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 16:40:18 +0200
Date: Fri, 17 May 2024 16:40:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZkdsUlPt6FN6LizI@landeda>
References: <20240517141413.1716448-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517141413.1716448-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715956820;
 bh=KBHjhLYFXvTAYChgWCeuxW1otal5wg1iODLkrX81YeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRJrsgCC8jM9QBT+poqV2rmWCPNyCHfW+c4o6KdbKpH0nMONxWkgbiuVFVgqLwNjN
 iCA8hj5+p7coTTCtdekAjUxJzNEANacce1IYE47dUDP+njT2C2W6aEBLMgP1M+D1W7
 Pnnfk0wMFkR1Eb8RbrHyq3/9wAEM19UAcOu2nAhVrdmM6pMRSdcKDrSwlICLNqLqDh
 1FSZujMyd1hyPK055HmeOpJ29YHatp6Evn6bjng8RmenPinXjGkLhP7V9duDjHTMJb
 KGSrjRiGgTIJ4FrYycxz/bm/VboZYK/JhKlHjw9xmJi8/V1td+JV/Tw43xKyX6quFJ
 2U/ijvlJ/FBJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bRJrsgCC
Subject: Re: [Buildroot] [PATCH] package/procps-ng/S02sysctl: pass
 SYSCTL_ARGS before -p argument for busybox
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

Peter, All,

On 2024-05-17 16:14 +0200, Peter Korsgaard spake thusly:
> The busybox sysctl applet expects all arguments after -p to be filenames to
> read:
> 
> sysctl -p file -h
> sysctl: -h: No such file or directory
> 
> VS:
> 
> sysctl -h -p file
> sysctl: invalid option -- 'h'
> BusyBox v1.36.1 (2024-05-17 15:27:21 CEST) multi-call binary.
> 
> Usage: sysctl [-enq] { -a | -p [FILE]... | [-w] [KEY[=VALUE]]... }
> 
> Show/set kernel parameters
> 
>         -e      Don't warn about unknown keys
>         -n      Don't show key names
>         -q      Quiet
>         -a      Show all values
>         -p      Set values from FILEs (default /etc/sysctl.conf)
>         -w      Set values
> 
> This seems to be the intented behaviour:
> https://git.busybox.net/busybox/tree/procps/sysctl.c#n317
> 
> Notice: The procps-ng variant is happy with both:
> 
> sysctl -p file -h
> 
> Usage:
>  sysctl [options] [variable[=value] ...]
> 
> VS:
> 
> sysctl -h -p file
> 
> Usage:
>  sysctl [options] [variable[=value] ...]
> 
> So pass SYSCTL_ARGS before the -p args so custom sysctl arguments can be
> passed.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/procps-ng/S02sysctl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/procps-ng/S02sysctl b/package/procps-ng/S02sysctl
> index 85d9ed50d0..c202833ab8 100644
> --- a/package/procps-ng/S02sysctl
> +++ b/package/procps-ng/S02sysctl
> @@ -43,7 +43,7 @@ run_logger() {
>  				break
>  			}
>  			echo "* Applying $file ..."
> -			/sbin/sysctl -p "$file" $SYSCTL_ARGS || prog_status="FAIL"
> +			/sbin/sysctl $SYSCTL_ARGS -p "$file" || prog_status="FAIL"
>  		done 2>&1 >&3 | /usr/bin/logger -t sysctl -p kern.err
>  	} 3>&1 | /usr/bin/logger -t sysctl -p kern.info
>  }
> @@ -60,7 +60,7 @@ run_std() {
>  				break
>  			}
>  			echo "* Applying $file ..."
> -			/sbin/sysctl -p "$file" $SYSCTL_ARGS || prog_status="FAIL"
> +			/sbin/sysctl $SYSCTL_ARGS -p "$file" || prog_status="FAIL"
>  		done
>  	}
>  }
> -- 
> 2.39.2
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
