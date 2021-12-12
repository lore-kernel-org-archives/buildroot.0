Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46701C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE94440283;
	Sun, 12 Dec 2021 12:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQGkSQ7_p1GV; Sun, 12 Dec 2021 12:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D451740530;
	Sun, 12 Dec 2021 12:16:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 556101BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43BFA60E8E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxxyED2jrSkb for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1254A606BA
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:16:02 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v1so44121963edx.2
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=913thMZ6puAg5JBU2pBwS4v9JrvdoPQeajb4XFH83BE=;
 b=Gf+9RBJfcLwgZEhh4UXPB7dkoHQAirf9evqepy2oOKrz1Ghy1972DiLZ42MZf5Ol4G
 4pHUxUFfVUD/2lT37aE3Jtsvm2WhjphfRRdrtz5xhJjfW8aVVyjZ0KfN34IWuYYIMoWq
 bpmjNTv8FAsHuJ+JX0lPvjx/o+KD+DSJqEnGjWIgYrseImF/bvNCA8Zf+x1Ny+KIv3tv
 HrOk/XseCOeS1m09hECI7P2cUzH6UPaADjljGKkSwHriSXcCYOD7ixffoU0rOEq2uDzV
 4tliJQrl2N/vM7Md505yS2pKy3z5mG11l0adkD3ki391Jqq5UFxEC0NI855e6aWYAf2d
 loTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=913thMZ6puAg5JBU2pBwS4v9JrvdoPQeajb4XFH83BE=;
 b=sFlyqLRdLg3hx7PHhZc0KlvKH8WMcmSDXuS/B2yQHlG/zT2PXwggmdkYQuQWOa8bfg
 QoRsNZtq3161rCYCIh4C73rvLthIYoynRMdzfdzjFdU3s8BaDhRHDO+VMhA4OZcD1LBO
 5Gsg4tUCs8mWdJq/vMNsDXVAgm8F9rP6BoAlxjkoVkWiRYvwm96vjhS8nlYiMUR1QbGw
 BaYbaQtprdiJiH9rreeNchxQy+Qy13vW7PzldT7yxq/e1N/Q0otDZ0Ua5t9ELo9bfh8m
 VurcMO4Rpiu55uQr1e89zBRqmCiWLQxzUZUKAcuvlExGHf6j6fOFoxptsXSko7iPg847
 GjQA==
X-Gm-Message-State: AOAM5337eNp2RENjX5L8BsDinywuQ6GTD5OHYT1o+L5azHXtCG1Yh/ea
 v3Tujq3Us8sNbuAp5hp3+hGqYg==
X-Google-Smtp-Source: ABdhPJxwJLsMshRzPikYFzM8BcWD5JOWWPStpXd7eB45HzHdCSH0fLw0HUL3PnXB1SSOOhunykL5gQ==
X-Received: by 2002:a50:fd16:: with SMTP id i22mr54482990eds.224.1639311361291; 
 Sun, 12 Dec 2021 04:16:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jx10sm4338485ejc.102.2021.12.12.04.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:16:00 -0800 (PST)
Message-ID: <b6eb9e64-5904-54e1-48b2-68733bbf6b8f@mind.be>
Date: Sun, 12 Dec 2021 13:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211206214452.510-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211206214452.510-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/iperf: bump version to 2.1.5
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/12/2021 22:44, Peter Seiderer wrote:
> Changelog ([1]):
> 
>    - fix some HAVE_IPV6 conditional changes
>    - fix SO_TIMEOUT regressiony
>    - ren sockets.c to socket_io.c
>    - fix compile breakage per abs() returning an int instead of float
>    - support for gettcpinfo on Mac OS X (tested on both M1 and x86 silicon)
>    - move setsock_blocking from sockets into PerfSocket.cpp
>    - don't require -V for v6, instead try v6 when v4 hostname lookup fails,
>      client only
>    - add assert in writen
>    - add tcp RTT variance to client output
>    - use setsockopt to get the nagle status
>    - show Nagle and TOS settings on client
>    - more on connect-only testing
>    - sample and output the initial rtt and cwnd in the connect report
>    - fix multiple fullduplex regressions
>    - fix for HAVE_TCP_STATS in configure, then linux compile
>    - writen can have more than one write, fix accounting when this occurs
>    - fix tos with --reverse and --full-duplex
>    - add support for --tos-override <value> on server
>    - add support for  --tcp-drain, add mmm stats, histograms - experimental
>      feature
>    - multiple man page updates
>    - fix partial histogram print to not show (f)
>    - some new scripts in python flows
>    - fixes to incr-srcport
>    - fixes for --incr-dstport
>    - fix regression on very first UDP packet having transit latency of zero
>    - fix --reverse and --isochronous when --trip-times not set
>    - fix client_init regression, pull out tcp_shutdown
>    - fix reporter startup race and one second delay by setting the threads
>      ready predicate and issuing the signal under a lock
>    - fix first send accounting for small -n
>    - fix configure.ac to use '=' instead of '=='
> 
> [1] https://sourceforge.net/projects/iperf2/files/readme.txt/download
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/iperf/iperf.hash | 2 +-
>   package/iperf/iperf.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
> index 35ed2a10c1..bd5643af95 100644
> --- a/package/iperf/iperf.hash
> +++ b/package/iperf/iperf.hash
> @@ -1,5 +1,5 @@
>   # From https://sourceforge.net/projects/iperf2/files/
> -sha1  f1b7835eb74094b1a1849faeafe35b7c362f4ab5  iperf-2.1.4.tar.gz
> +sha1  b9d0868a6cdd970c1835d3d1a264dd54907f2c5c  iperf-2.1.5.tar.gz
>   
>   # Locally computed:
>   sha256  062b392e87b8e227aca74fef0a99b04fe0382d4518957041b508a56885b4d4f9  iperf-2.1.4.tar.gz
> diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
> index 34cbe532fd..a3d95535b3 100644
> --- a/package/iperf/iperf.mk
> +++ b/package/iperf/iperf.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IPERF_VERSION = 2.1.4
> +IPERF_VERSION = 2.1.5
>   IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
>   IPERF_LICENSE = MIT-like
>   IPERF_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
