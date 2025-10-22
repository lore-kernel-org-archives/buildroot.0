Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4407DCCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E08612DD;
	Wed, 22 Oct 2025 16:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biZQUZhBBUaZ; Wed, 22 Oct 2025 16:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C2D61233
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C2D61233;
	Wed, 22 Oct 2025 16:42:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5149743F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 412B540BAC
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1laxYOKn9RSK for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:42:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4342F40B27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4342F40B27
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4342F40B27
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E488B97918C; Wed, 22 Oct 2025 18:42:48 +0200 (CEST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:42:47 +0200
Message-ID: <20251022164247.285632-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007130757.1004115-2-peter@korsgaard.com>
References: <20251007130757.1004115-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151368; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=GRH26z6eIH6zcuPfuFs8Ex8y8DHAPdJiKZwEKSCtcio=;
 b=fUYqX5f7WMZQY74EJXAlZ7+98tjYfWsUmtNe0ZzFMAfVdlldqGFL6J3qqgTVh49LuJf5dv
 1pebPQMxbIWBlARsoSPKIvHwQX8KM+iyjalFaTMciCf65+/hL9KGa1vSs2eXSxlrm02c/o
 OGATD+0pnA4ea7utG6tnMaYXkYALBZxzE4GqH0wDf6BIqfA9jm7ECjdznXqtl21WhN3r8u
 tnpjHBy14oCZ+fFuKVE61c/ZkXOt+nK+LCdLUciBqWkXp6G225o7B1tLTsw2YcL+0XHvkp
 YrFxLXXit+EiNY09+NBrkuWyoaAur0qfWGGcfuwe4B6lhfbr1DRGZr6CU6NEQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fUYqX5f7
Subject: Re: [Buildroot] [PATCH 2/2] board/beagleboneai/post-build.sh: fix
 shellcheck issues
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BOARD_DIR is not used, so drop it and quote $BINARIES_DIR to make shellcheck
> happy.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  .checkpackageignore                          | 1 -
>  board/beagleboard/beagleboneai/post-build.sh | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index a9d259a2f2..1c3bca481f 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -9,7 +9,6 @@ board/asus/tinker/post-build.sh Shellcheck
>  board/atmel/flasher.sh Shellcheck
>  board/beagleboard/beaglebone-qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
>  board/beagleboard/beaglebone/post-build.sh Shellcheck
> -board/beagleboard/beagleboneai/post-build.sh Shellcheck
>  board/boundarydevices/common/post-build.sh Shellcheck
>  board/boundarydevices/common/post-image.sh Shellcheck
>  board/broadcom/northstar/post-image.sh Shellcheck
> diff --git a/board/beagleboard/beagleboneai/post-build.sh b/board/beagleboard/beagleboneai/post-build.sh
> index 384b4d8745..8d94a8f1e4 100755
> --- a/board/beagleboard/beagleboneai/post-build.sh
> +++ b/board/beagleboard/beagleboneai/post-build.sh
> @@ -1,4 +1,3 @@
>  #!/bin/sh
> -BOARD_DIR="$(dirname $0)"
>  
> -cp board/beagleboard/beagleboneai/uEnv.txt $BINARIES_DIR/uEnv.txt
> +cp board/beagleboard/beagleboneai/uEnv.txt "$BINARIES_DIR/uEnv.txt"
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
