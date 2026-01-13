Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A31D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BFA4842AF;
	Tue, 13 Jan 2026 19:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgFG0mh5Vm8z; Tue, 13 Jan 2026 19:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DED27842A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333609;
	bh=+53akdNY1BsovAecIUgXWxo7U9qLqIz2C2wz/Wiq9Lg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ma68LMMJJRCC06AMElx96Lw3VRBJFTBvuw2fkmpDeCApOta0j9FNu3YkWxjrtPQXV
	 zukOH3qecVixwYtkAQbOeVuKOzuVyHz/QhGip7WuN1L3C5wks3GFeMEneSOQ88+y+W
	 NhhWWZZ8XQMhJhGZB9Q+HUx5xW9UdTTM4BYq6mlXGGAcH5FpRWUghU9hJydRuAFFZQ
	 m0boMFt/boLHpD0CGYish9fqupG58vupg1YZXGHn2pEFjVtccVzg2yAUyQWELbuCP+
	 aqk3d/X8qVuPOYsJGXAsjeBMYrQ/76Tv+AzZt0qXGVGefuL8KPo1/L+plfMCPEUw90
	 1xKvqim9GvqxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DED27842A6;
	Tue, 13 Jan 2026 19:46:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD3061C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C294F60BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwINAYmypAiz for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0684A60BD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0684A60BD1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0684A60BD1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2C181B97A863; Tue, 13 Jan 2026 20:46:44 +0100 (CET)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:42 +0100
Message-ID: <20260113194642.98958-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230145117.3375118-1-fiona.klute@gmx.de>
References: <20251230145117.3375118-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333604; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=gmEDuJlqlzdtG0R3FgsKKX1Z5ZVAHabmqXDj2B+IzbY=;
 b=imMuSd7PWZ3sFCPmaHRzGU3MZuV6ckEeH31eV+EkJJC9rsxy6upYa/Ura43mPlHZJSPIX3
 wg3PlDPvTtiAewHrktChGxhMcrmNuEFdGmiSaB59V67Dv9vDmPSQgeLpst6SANcmsFgF5Y
 TFRpEufN+y+0QmAc9sYOG0P+XX+deO411nfCXWiS55wf/j5j46q07AtjvUOUPbE+ApFcj2
 boH1YNfhxVr9lFfsTJPQZ746yNFFYPM2xFcnacrpBPoFtZ0cw3QtDmVgKvpi8Hw4GU+iQn
 IKbn+l1eDtsQzaei1DWwEglvq3cg8GbiS0BAgaVfgqTGksAAOh1o07LMBudLgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=imMuSd7P
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: tidy up klogd init
 script
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
> * Wait for process to stop before deleting PID file, instead of fixed
>   wait during restart
> 
> * Use long form options
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> Restarting klogd is probably not common, but it's nicer this way. :-)
> 
>  package/busybox/S02klogd | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/package/busybox/S02klogd b/package/busybox/S02klogd
> index 0677e1e5ca..f76d4e72d4 100644
> --- a/package/busybox/S02klogd
> +++ b/package/busybox/S02klogd
> @@ -13,7 +13,8 @@ KLOGD_ARGS=""
>  start() {
>  	printf 'Starting %s: ' "$DAEMON"
>  	# shellcheck disable=SC2086 # we need the word splitting
> -	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
> +	start-stop-daemon --start --background --make-pidfile \
> +		--pidfile "$PIDFILE" --exec "/sbin/$DAEMON" \
>  		-- -n $KLOGD_ARGS
>  	status=$?
>  	if [ "$status" -eq 0 ]; then
> @@ -26,20 +27,24 @@ start() {
>  
>  stop() {
>  	printf 'Stopping %s: ' "$DAEMON"
> -	start-stop-daemon -K -q -p "$PIDFILE"
> +	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/sbin/$DAEMON"
>  	status=$?
>  	if [ "$status" -eq 0 ]; then
> -		rm -f "$PIDFILE"
>  		echo "OK"
>  	else
>  		echo "FAIL"
> +		return "$status"
>  	fi
> +	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
> +		--exec "/sbin/$DAEMON"; do
> +		sleep 0.1
> +	done
> +	rm -f "$PIDFILE"
>  	return "$status"
>  }
>  
>  restart() {
>  	stop
> -	sleep 1
>  	start
>  }
>  
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
