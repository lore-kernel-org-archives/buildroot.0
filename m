Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7078CC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 17:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D50FB40197;
	Sun, 25 Feb 2024 17:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRMyNSiRi1EO; Sun, 25 Feb 2024 17:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14ADD400E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14ADD400E4;
	Sun, 25 Feb 2024 17:53:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 180D11BF37C
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 17:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0344A813EC
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 17:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZV86rM92u4o for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 17:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E89CD81375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E89CD81375
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E89CD81375
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 17:53:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4609613F8D7;
 Sun, 25 Feb 2024 18:53:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Feb 2024 18:53:00 +0100
Date: Sun, 25 Feb 2024 18:53:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sen Hastings <sen@hastings.org>
Message-ID: <Zdt-fKdNrG52yRTJ@landeda>
References: <20240213120714.393026-1-sen@hastings.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213120714.393026-1-sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708883582;
 bh=f9rR4DazmjHsyHWLLE+2PM6v2Cm7Qt2M8Xl6iiY2pXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rnku1eAOQM5vm8vUAKPKDOum3mcxFtMkAsJy3kJgVMDdQx/3Xh9haCSSM8+ElrSs7
 xCA1OgA/+ILZaMQRgfvfC1ZLfhBMZQJKPbz7msppAJVmEyO5iQUcxTOmcQIjC5vB6c
 w2+zfSWg8JlFgt7bDDrsBjeaE8SA36/uY6IqCkMOi7veTQlx1OcsjuoF6JNqoGSO6d
 TD55tVGBtHA9BtmwmxBOMQI/wzdESi9p/HcR9SY81O1feuGeRPHjedaxfOlX9b81mn
 nA83TiJRiVfwnjSC/mEwjTJU6mp5I0zRqmDxnNAscuUR6P4FXzVI5ZLsAN1t0ONCe9
 RTyskx1lb+4kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rnku1eAO
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: make current
 version cell scrollable
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

Sen, All,

On 2024-02-13 12:07 +0000, Sen Hastings spake thusly:
> *Resubmitted to mailing list because I messed up the subject line.*
> 
> I realized that instead of truncating the version number,
> we could simply make the cell horizontally scrollable.
> This of course allows us to have a fixed cell width,
> while preserving the full version number.
> 
> A demo is available here:
> https://sen-h.codeberg.page/pkg-stats-demos/@pages/make-current-version-cell-scrollable.html

I've entirely reworded the commit log with more explanations, and a
neutral tone.

> Signed-off-by: Sen Hastings <sen@hastings.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/pkg-stats | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 7835cb3d62..9307992d29 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -845,6 +845,13 @@ function expandField(fieldId){
>  .centered {
>    text-align: center;
>  }
> +
> + .current_version {
> +   overflow: scroll;
> +   width: 21ch;
> +   padding: 10px 2px 10px 2px;
> + }
> +
>   .correct, .nopatches, .good_url, .version-good, .cpe-ok, .cve-ok {
>     background: #d2ffc4;
>   }
> @@ -964,10 +971,7 @@ def dump_html_pkg(f, pkg):
>  
>      # Current version
>      data_field_id = f'current_version__{pkg_css_class}'
> -    if len(pkg.current_version) > 20:
> -        current_version = pkg.current_version[:20] + "..."
> -    else:
> -        current_version = pkg.current_version
> +    current_version = pkg.current_version
>      f.write(f'  <div id="{data_field_id}" \
>          class="centered current_version data _{pkg_css_class}">{current_version}</div>\n')
>  
> -- 
> 2.25.1
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
