Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353A1D1118E
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 19:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8F4760598;
	Sun,  3 Nov 2024 19:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xuztk5KjhHuW; Sun,  3 Nov 2024 19:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C015C6059B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C015C6059B;
	Sun,  3 Nov 2024 19:01:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF7041128
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 19:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9069D81403
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 19:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4AWIvWnekfq for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 19:01:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69D4A80DF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D4A80DF0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69D4A80DF0
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 19:01:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CEAFA13F89C;
 Sun,  3 Nov 2024 20:01:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37834])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Nov 2024 20:01:50 +0100
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 20:01:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241103143751.756123-1-romain.naour@smile.fr>
References: <20241103143751.756123-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <894c353f8b1392cc90c8552cabc0eefa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730660512;
 bh=99wLK8v93YofX6yEZ1V3PJcIJbyFBF3g34PwsYQwcBo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fzNSMe+FNzUE4ECyb5xisMYW3h3jhqDf0SjoVX0Tl6XQPPO1p0fzYkgNTiu99Utcy
 lCheZGV4paK5EeAcFxINoBx1cldeC4wmzTvmZXTG+09gvRh9tM3p69O8YouUDwejiu
 ux0xtjKP0Zx7Tp4uWhJA7qwaUmfpr4vroVw/7wO+g/gnE/mQd7GxXDF3lKO+O0slFO
 oZUZFoHKG7x9Y1xnGNI5mSmkO4ipb6UAejj4rwp3L93e0A/frbVyEwqNiRLLIvWXm3
 LHr7CEcuwoHIZOSb0ngTa0ok/N/2q4Ix9keaoaSHoFkCWvL+ydKWDxL8aJpb1QNy4O
 K58gCkZYWZn8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fzNSMe+F
Subject: Re: [Buildroot] [PATCH] board/mender/x86_64/post-image-efi.sh: use
 bash for genimage.sh
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/11/2024 15:37, Romain Naour via buildroot wrote:
> mender_x86_64_efi_defconfig started failing to build since 2024.08 in
> our Gitlab-ci since the board/mender/x86_64/post-image-efi.sh is
> calling support/scripts/genimage.sh with the host default shell.
> 
> There is no problem if the default shell is bash but our docker
> image uses dash as default shell. Since support/scripts/genimage.sh
> is actually a bash script it's not going to work if bashisms are used:
> 
>   support/scripts/genimage.sh: 57: Syntax error: redirection unexpected
> 
> Indeed bashisms have been added recently in
> support/scripts/genimage.sh by the commit introducing bmap image
> support [1].
> 
> Remove "sh" before support/scripts/genimage.sh and rely on
> "/usr/bin/env bash" to find the bash interpreter.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226891
> 
> [1] 6889056f1eb4293de67c28b1ff6ee34be05d2ee4
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master. Thanks!

> ---
> I checked if "sh support/scripts/genimage.sh" is used somewhere else.
> ---
>  board/mender/x86_64/post-image-efi.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/mender/x86_64/post-image-efi.sh 
> b/board/mender/x86_64/post-image-efi.sh
> index 073b18c972..ab12386076 100755
> --- a/board/mender/x86_64/post-image-efi.sh
> +++ b/board/mender/x86_64/post-image-efi.sh
> @@ -54,7 +54,7 @@ generate_mender_image() {
>  }
> 
>  generate_image() {
> -    sh support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
> +    support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
>  }
> 
>  # Main function.
> --
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
