Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D1CD29C3C
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AADD06128D;
	Mon, 19 Jan 2026 15:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCnaH8ptn9vy; Mon, 19 Jan 2026 15:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4C3861276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768837666;
	bh=x1s1no6nYqqk35LbOPSzasJDBG9p1Oz6uUdLs790xAM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gLV4tFbo7z0BQO6fdyEoeFE4qksFIcBaRr38ZZa0oPxBCdx7OxkBSyjHBFAJoNwh3
	 WT7dHau9+RLUgE2UtLGnsEkvwOq0pBS67LdH4e9JNBMhYsfko8Owt2IQ6bytK0W5at
	 qbzkQykJ3UqrfoCQJQPVi1wHfMFepcZ71AoQ2zx7wmLzWv9NfvgLD/Bk48VY2mfLHJ
	 RdzpCnP+njNZEZEX91D0STxplVCXDIZdt9w5rObxCcYYCFq+7/ziZBQCuGBVwZoS0L
	 JhlXRSVNnYmulf6c2ESOogXCXUpvd7YKQNVbzQMogoflPR4RAs2hKrBVV78uznLaxq
	 K53tAFBWtLGCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4C3861276;
	Mon, 19 Jan 2026 15:47:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D755D2CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5DDC414FE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lchsTq8376dB for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:47:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B57D6414FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B57D6414FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B57D6414FC
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BBFCDB97A1FF; Mon, 19 Jan 2026 16:47:40 +0100 (CET)
To: Peter Seiderer <ps.report@gmx.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 16:47:39 +0100
Message-ID: <20260119154739.74189-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250805171603.1296472-2-ps.report@gmx.net>
References: <20250805171603.1296472-2-ps.report@gmx.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768837660; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=LChsT+ns8yWCzSrpzSXTByKtoMhpgK9qrxyuzf30NN8=;
 b=IT/cz0h818nxFgIpkq68kmCg+/rczl1fYgXGtf55gyDe1km313T4VapYOWKxieUNRLt9oj
 mL2XzZK7GqyyeDwhvrOh2G468m9G0F1uS3+/E05U7a7j518fK/0kAE0ua6hXMR9agSTg8G
 iOYDRWtS4mWtg15q4DxtmcjV5XVQwpOCZeeV/XgxcX8gtMdKIedtNVhNXz6khg9wRhrXHl
 5KARAHj3CVjUldIFb01VDA4z285cE3ZYWtTmCoL1W+qHxhL+q00gWYNWm1yS81PrzzKiK0
 yxMiG6symRTU1dOO8jzGx04bKqd6umglrpBeaMxo9ir633fdrZcFY/y8DwXANA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=IT/cz0h8
Subject: Re: [Buildroot] [PATCH v3 2/3] package/iwd: suppress S40iwd
 shellcheck warnings
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
> - suppress S40iwd shellcheck warnings:
> 
>   In package/iwd/S40iwd line 8:
>   [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
>                                      ^--------------------^ SC1090 (warning): ShellCheck can't follow non-constant source. Use a directive to specify location.
> 
>   In package/iwd/S40iwd line 15:
>   		-- $IWD_ARGS
>                      ^-------^ SC2086 (info): Double quote to prevent globbing and word splitting.
> 
> - remove package/iwd/S40iwd from .checkpackageignore
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.11.x. Thanks

> ---
> Changes v1 -> v2:
>   - remove 'git squash' leftover line from commit message
> 
> Changes v2 -> v3:
>   - move 'shellcheck disable=SC2086' line to where needed
>     (suggested by Fiona Klute)
> ---
>  .checkpackageignore | 1 -
>  package/iwd/S40iwd  | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 7697fd2ea1..7a5260b1b1 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -584,7 +584,6 @@ package/irqbalance/S13irqbalance Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch lib_patch.Upstream
>  package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch lib_patch.Upstream
>  package/iucode-tool/S00iucode-tool lib_sysv.Variables
> -package/iwd/S40iwd Shellcheck
>  package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
>  package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
>  package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
> diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
> index de5a1efb6f..1a2d0e9780 100644
> --- a/package/iwd/S40iwd
> +++ b/package/iwd/S40iwd
> @@ -5,11 +5,13 @@ PIDFILE="/var/run/$DAEMON.pid"
>  
>  IWD_ARGS=""
>  
> +# shellcheck source=/dev/null
>  [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
>  
>  start() {
>  	printf 'Starting %s: ' "$DAEMON"
>  	mkdir -p /tmp/iwd/hotspot
> +	# shellcheck disable=SC2086 # we need the word splitting
>  	start-stop-daemon --start --background --make-pidfile \
>  		--pidfile "$PIDFILE" --exec "/usr/libexec/$DAEMON" \
>  		-- $IWD_ARGS
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
