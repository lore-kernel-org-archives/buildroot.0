Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B00DCCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1425E61464;
	Wed, 22 Oct 2025 16:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOD94L3HYxQ0; Wed, 22 Oct 2025 16:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4288E6146C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4288E6146C;
	Wed, 22 Oct 2025 16:43:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD0F43F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0E6140FA9
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoQRdwnR-5e5 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAA6F40C4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAA6F40C4D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAA6F40C4D
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C366DB979192; Wed, 22 Oct 2025 18:43:01 +0200 (CEST)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:00 +0200
Message-ID: <20251022164300.285987-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008101535.51154-1-fiona.klute@gmx.de>
References: <20251008101535.51154-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151381; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=0o/jLwN17T9ijuovKWoLxuEgHOuUkq6cT+tipssXtMU=;
 b=T8D9BpGuGUcsDPIoknfdhW2Z5MyGAae7h04porRHYnPwaU3TczCeuFESR+ouX1DcQxfOAi
 0WEHSVjmiE0WrfxNPyGKLDWHmAmxb51ZwxxJXyhfKJA4GI0SnzO4zmj/Tpac7aWLBkDj5X
 ba0I7LfQOvd93N15Qt4i587u3QNW7GK7INHrZGLNvnTDW/NlGC0JWyPBY0n/KxGSiYIoqC
 Hb4w36R8zb1Zzxl+eu7SfVyYDNuWRndEGUqdHv+3ZD5HCocSt4bR1k8GjDgcB1hjMM1MuI
 RqTyZAVf8MSRslNM3y6JVL73dyAlsBcj1cD8fDwMK+jgGdxqqshBtU53mGudWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=T8D9BpGu
Subject: Re: [Buildroot] [PATCH 1/3] package/audit/S02auditd: fix SELinux
 label issues
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
> "mkdir -Z" tries to create the directory with the default type context
> and does not accept any parameter, leading to mkdir creating a
> directory by the name of "system_u:object_r:auditd_log_t" (or failing
> to, with a read-only rootfs). Use "--context=" instead to specify the
> context.
> 
> Letting start-stop-daemon create the auditd PID file leads to an
> incorrect label, with type "initrc_runtime_t" instead of
> "auditd_runtime_t", which would prevent auditd from writing or
> deleting it. Auditd manages its own PID file and daemonizes by
> default, so simply drop the --background and --make-pidfile options
> from start-stop-daemon.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/audit/S02auditd | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/audit/S02auditd b/package/audit/S02auditd
> index f32f01714e..97c43bc66f 100644
> --- a/package/audit/S02auditd
> +++ b/package/audit/S02auditd
> @@ -18,13 +18,13 @@ start(){
>  	# the directory with SELinux permissions if possible
>  	if command -v selabel_lookup >/dev/null 2>&1; then
>  		audit_log_selable="$(selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3)"
> -		mkdir -p /var/log/audit -Z "${audit_log_selable}"
> +		mkdir -p --context="${audit_log_selable}" /var/log/audit
>  	else
>  		mkdir -p /var/log/audit
>  	fi
>  
> -	start-stop-daemon --start --background --make-pidfile \
> -		--pidfile "${PIDFILE}" --exec "/usr/sbin/${DAEMON}"
> +	start-stop-daemon --start --pidfile "${PIDFILE}" \
> +		--exec "/usr/sbin/${DAEMON}"
>  	status=$?
>  	if [ "${status}" -eq 0 ]; then
>  		# Load the default rules
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
