Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0714FD29C33
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4667414FB;
	Mon, 19 Jan 2026 15:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbMcnlRcyWCA; Mon, 19 Jan 2026 15:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF045414FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768837667;
	bh=s3NijcRktHPfnW/PwQTgmRvEt9sg8VayItZ6bGf46Qw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LH9TRo6jGr+JnhRZw6MPhc1N0XI9T1NtjeLdzRipkw7oGR0sTG2fsVaIYtVIBli9j
	 VTi5qTEsdE0b6ZGmc07BhQ6N2b7/VZnT8hWDZUvsAUklSKFB0zO3WU+EXsyryI1/5v
	 3YKK8O5Ul8Yutnak93D94m9yAxV+b+bEHURk2sXW4XaBfH4teOolsVtffRVO8T3PU0
	 2vQ7MveRR6Ba3Cbvlo105jZi91FWiq5tfJbVbgOoCsu0jZuL83gVFWDFPNS+LP742U
	 /uXhzp+bPxZH+lxcbuY6sRz/ryQ0KNk+7qWBC/zo8H5TY5Gd7IjPWVCmHS91auDeIc
	 2QJGwBOxTDZ1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF045414FC;
	Mon, 19 Jan 2026 15:47:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FFA4160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EA6683C33
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qyp2fuKgkp8 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 730EC83C31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 730EC83C31
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 730EC83C31
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C20FB97A967; Mon, 19 Jan 2026 16:47:42 +0100 (CET)
To: Peter Seiderer <ps.report@gmx.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 16:47:41 +0100
Message-ID: <20260119154741.74239-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250805171603.1296472-1-ps.report@gmx.net>
References: <20250805171603.1296472-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768837662; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=MIwYfCprVKnWnL5zxAbawWbsfMOUBa2YYLYTDgVMXAs=;
 b=G5lveKWWIdfR6O9mlgC302RgJfdf54tR7jHB7ir8brc3CPhmPsgqoOF2f86jjAGOfJNM8g
 dK90dFdy9NJb0KRHraQj2MSzuV78U6bG7MBRWMSaNgpKAn5mJJBAnXHIZwFHBun3w+mj3l
 0J087bhG5FNrxq4EIzsrChpxSckYmLA80I4liY2mAFlErEuMDFA12/LxsOnB9TPZIps0gV
 wcCT2RmOj1x3u07v2SZAJiDMi3OJl1jLhByY000UVYHvBi5BEAp/vJf+U03KypxeT+Jcgs
 ndVf8X8v1QhU3+BTWioZd4to2ZObn8so+zrwI3tpFkqDq8ietsXurot8xnArxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=G5lveKWW
Subject: Re: [Buildroot] [PATCH v3 1/3] package/iwd: update S40iwd (use long
 options)
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
> - use long options (as suggested in [1] example)
> - drop '-q'/quiet option from startup
> 
> [1] https://nightly.buildroot.org/#adding-packages-start-script
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.11.x. Thanks

> ---
> Changes v1 -> v2:
>   - no changes
> 
> Changes v2 -> v3:
>   - no changes
> ---
>  package/iwd/S40iwd | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
> index 7858ff3e42..de5a1efb6f 100644
> --- a/package/iwd/S40iwd
> +++ b/package/iwd/S40iwd
> @@ -10,7 +10,8 @@ IWD_ARGS=""
>  start() {
>  	printf 'Starting %s: ' "$DAEMON"
>  	mkdir -p /tmp/iwd/hotspot
> -	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/libexec/$DAEMON" \
> +	start-stop-daemon --start --background --make-pidfile \
> +		--pidfile "$PIDFILE" --exec "/usr/libexec/$DAEMON" \
>  		-- $IWD_ARGS
>  	status=$?
>  	if [ "$status" -eq 0 ]; then
> @@ -23,7 +24,7 @@ start() {
>  
>  stop() {
>  	printf 'Stopping %s: ' "$DAEMON"
> -	start-stop-daemon -K -q -p "$PIDFILE"
> +	start-stop-daemon --stop --quiet --pidfile "$PIDFILE"
>  	status=$?
>  	if [ "$status" -eq 0 ]; then
>  		echo "OK"
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
