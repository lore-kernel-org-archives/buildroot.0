Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1605CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59FFC60703;
	Mon,  2 Sep 2024 16:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXHF4N3LOBtc; Mon,  2 Sep 2024 16:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53F796063D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F796063D;
	Mon,  2 Sep 2024 16:39:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 305811BF3FD
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26CAE40291
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id da_JQoqd8HxV for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:39:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9980640253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9980640253
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9980640253
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:39:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9C96813F89A;
 Mon,  2 Sep 2024 18:39:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 18:39:36 +0200
Date: Mon, 2 Sep 2024 18:39:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <ZtXqSMVTSbe12Td3@landeda>
References: <20240902074109.50173-1-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902074109.50173-1-michael@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725295178;
 bh=WuW8eQj1/oWXkWJ4Gt8Z/PY9i6GDuyJJx7puJ+uYGs4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ad9sMhCTimMNT+O5Jp7vJFYBcVBQkWwuF8uSMZ7dkBZtsxVglbRp+TUT9tC/9TlO/
 aV96azMN0kx5pt2Vm87MnrxqJeeHD+pVdpwx0lx5QaNYHwlUVSSQCsHwWQxnVbiA8c
 ZS9Y6EYDUkZkhaL8ff7UP5Lr3WMiPvCx+16opUWIeZjH3DwmjgJDAcTrNW1HJwtWzY
 5/7IVq5rUkN8DS/xCohOaa2sA9R+lVYNtDcyUW+l4wUrPnCNaGH0DGlzJljzI+oJvE
 ZF+Yw0Cjim3agsF2KqMbpAbcaU+X+KyyQ2w6MoXXFF7fdBjIvX1kuM9ySexc5fv8vA
 k2I2eeODCgrXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ad9sMhCT
Subject: Re: [Buildroot] [PATCH 1/2] scripts/cve: Avoid to do a complete
 clone of cve git repository
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

Michael, All,

On 2024-09-02 09:41 +0200, Michael Trimarchi spake thusly:
> Just a simple clone --depth 1 should be enough to parse the
> cve and generate the pkg-stats report. The space now does
> not take in account of the full history and only use 2.2Gb

I just did both a full clone and a depth-1 clone, and the size delta is
not that much: 2.9GiB vs. 2.2GiB, so we're still in the same league.

Still, the download size does change: from 983.55MiB down to 270.78MiB;
the remote has to compress objects specifically for the depth-1 clone,
which takes a bit of time, but there less deltas to resolve locally, so
it's a net time win too: 2m17s vs 1min7s (on a 100Mbps link).

Is it eventually worth it? I like things to be simple rather than have
complex heuristics, and storage nowadays is cheap, and bandwidth is only
really paid on the first clone, since the following calls would only
pull what's missing, which will eventually cause the local clone to grow
to a size that would not differ by much if the first clone had been a
full one.

So, I 'm a bit comnficted about that one, but would tend to say no...
Leaving pending for other maintainers to chime in.

Regards,
Yann E. MORIN.

> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  support/scripts/cve.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> index e25825581e..7d115a28b5 100755
> --- a/support/scripts/cve.py
> +++ b/support/scripts/cve.py
> @@ -82,7 +82,7 @@ class CVE:
>              # happily clones into an empty directory.
>              os.makedirs(nvd_git_dir)
>              subprocess.check_call(
> -                ["git", "clone", NVD_BASE_URL, nvd_git_dir],
> +                ["git", "clone", "--depth", "1", NVD_BASE_URL, nvd_git_dir],
>                  stdout=subprocess.DEVNULL,
>                  stderr=subprocess.DEVNULL,
>              )
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
