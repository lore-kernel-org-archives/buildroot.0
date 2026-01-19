Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE66CCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D4B81B70;
	Mon, 19 Jan 2026 10:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDZwF0sZdI-5; Mon, 19 Jan 2026 10:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D30D781B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817341;
	bh=kZRCMHcEig0+SBQFalIRM6+EaUpeGDzK6oDfaFKA79g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SnMKjDiV1z52gPQeo2zAiFszLAr6Z+G2b8JBWe4nQIVMIwM66oExtwGz7MC5njkpA
	 +rvTRzf1yJKTazMD9sZTM+EvDvnU9n2dNvFMSzS+oTfXg9dm6FSjM4zJUiVQFJsUDB
	 LCamqnaPOFMskMmKrCzsgUDVrcrlhKeXZN0S6LY0pufWzHZZF3peHTQrIx9AzJC1Nt
	 wee2GwzAPcMrI/oUHzgYol2Gtd74wBRKFtbSwuwLYBb6zoPsM1J7gCn3B4AzSoAIwR
	 AgK922WKhd5O/+EvS57UBhA6bB+UXXHWFpgfQuSAmsPjlg7w888qYWwOPzURVwAqvi
	 lQw1WAwBwnQAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D30D781B7B;
	Mon, 19 Jan 2026 10:09:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D41EA160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9DE460D90
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cnkzio5rncWk for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE6DA60D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE6DA60D8C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE6DA60D8C
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:08:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56C21B97A1FF; Mon, 19 Jan 2026 11:08:57 +0100 (CET)
To: Peter Seiderer <ps.report@gmx.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:08:56 +0100
Message-ID: <20260119100856.12256-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250805171603.1296472-3-ps.report@gmx.net>
References: <20250805171603.1296472-3-ps.report@gmx.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817337; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ONjo7bUhoVAdi1u7yOKJoiaEbWHi+SAWgvWny9jWuvU=;
 b=OvE/InDkgfl0XDLZfwWihZ+it2jCF5OrQEy0Is9sh6e2zgOicr4ia34zQDoRC3wkUTwCQ+
 CWlLIFCXUDxq0hGFVlgMOMnX9S7MLDLUSk1ySFg7O2DW2CzvcGVarxyuLm21mGGLBy4CH5
 XrNP6iHT9ePDhSsL/5NclVRaZQXz90OUkTl8SZ0LbctANvktza+OznK8Exr983uahdmOGX
 G7Nv2Pw6rzJv5OvFP4d0WvVkIwAuM56qOu35lepWLtfkt2HACoPB8EjSSHeRIUB5wS/jLH
 TcBrKoRbDKZUfXuxFWbdfbGdkWT4wZyo8g6Yw4NQqpJ57RPM8aX3RCy969qAaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=OvE/InDk
Subject: Re: [Buildroot] [PATCH v3 3/3] package/ssdp-responder: update
 S50ssdpd (move shellcheck comment)
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
> - S50ssdpd: move shellcheck comment to the line where needed
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> Changes v2 -> v3:
>   - new patch
> ---
>  package/ssdp-responder/S50ssdpd | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ssdp-responder/S50ssdpd b/package/ssdp-responder/S50ssdpd
> index 8654de4f26..7b8106dcc8 100644
> --- a/package/ssdp-responder/S50ssdpd
> +++ b/package/ssdp-responder/S50ssdpd
> @@ -10,9 +10,9 @@ DAEMON_ARGS=""
>  # shellcheck source=/dev/null
>  [ -r "$CFGFILE" ] && . "$CFGFILE"
>  
> -# shellcheck disable=SC2086
>  start() {
>  	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
>  	if start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS; then
>  		echo "OK"
>  	else
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
