Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4026D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB906842C5;
	Tue, 13 Jan 2026 19:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HD0uNvKxP3-f; Tue, 13 Jan 2026 19:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E57DA842C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333615;
	bh=L/X4YygE6liZNO/GscLvEyUXxFKYrgKc41qRhwjvzrI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jUo5I1DiSWXFVuQlza/fiqvfGsxAeqhcHqM8BV6HEkE0DhPEPwukcEfRyC4F25zXl
	 YKiEHaY12CXuDPq0+7ODkC4GK2XJJLZpc3LczYvfCdSs4YOP1BbpFOnz9RKDkGjFju
	 zR/CM86K93e+wQazwPIeF2YibnL4tQsvjYD7i15eDO5hLvDJYGxswVcJPzNvc0IAJZ
	 Zc6bRGXeEFmyS68AX0//8H+hYXLZzEVgS7/D1nHpnKMypaRQi/JXhmXx0RU8L2Kaox
	 VxCLMU1P8gheuBTeMW/mmajPANQcAkG2exFm/rT4t7vLG+0NC6CX/Ah7URmXudTFML
	 nthkQpx36Q0IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E57DA842C7;
	Tue, 13 Jan 2026 19:46:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 316BB231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17ADC842BC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdWc-bAvkVnq for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 071DB842BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 071DB842BF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 071DB842BF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 320F3B97A863; Tue, 13 Jan 2026 20:46:49 +0100 (CET)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:47 +0100
Message-ID: <20260113194647.99055-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230175738.267463-1-fiona.klute@gmx.de>
References: <20251230175738.267463-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333609; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Ib8aRoiQRxiRgL4/+aAARHpkAEGI5Xs7t0DSnmlNMr8=;
 b=nnGz3YVBDZJ4pQQGTVbvBVC4H2dTgcv81hOxLBekKj7YUX5H/aeKNTYbbLMHeYlgwsrgCU
 H+DrBnyLry1l6Ggou6vjgoy8P83jlk5WNoYNs+0Atj+y8tCNgajSJWHLhPhchtB7cMkB+G
 cvi35JwfpuObPCrsIULeWAda9H55lOWFoqKJ8Sm9KRukmyUWCAE5YZePFOuMSDPRBtsZhc
 XERzarCVpIza6nAr+r2ncJCo4gKOiCEhEM3I/yW5fLRr6SdBw3XJFEdNd4El3XaEREgPvF
 I3CWOUihwEPTDhE71wuF/x48gyrGYi+iPR86p4YE+H8HpkXcKtBTzJWS0e/gJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nnGz3YVB
Subject: Re: [Buildroot] [PATCH 1/3] package/dbus: remove broken
 "condrestart" action & comment from init script
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
> The "servicename" environment variable was never set, so the condition
> in the "condrestart" case would always evaluate to false. Nobody seems
> to have noticed since it was introduced with commit
> ceb285976563f6ba2c87a17ff92f1b1490df698a in 2007, so simply remove it.
> 
> Likewise, the comment in the stop function that mentions $servicename
> is incorrect, there is no safety check to the "killall" call.
> 
> With those, remove the /var/lock/subsys/dbus-daemon file that was
> created but never used.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> I've split this from the second patch for clarity, so the commit log
> will show why there's no reference to the removed parts in the
> rewritten script. If that's not needed the patches can be squashed.
> 
>  package/dbus/S30dbus | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
> index 26772755d7..da02609f2d 100644
> --- a/package/dbus/S30dbus
> +++ b/package/dbus/S30dbus
> @@ -12,7 +12,6 @@
>  
>  # Create needed directories.
>  [ -d /run/dbus ] || mkdir -p /run/dbus
> -[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
>  [ -d /tmp/dbus ] || mkdir -p /tmp/dbus
>  
>  RETVAL=0
> @@ -24,20 +23,14 @@ start() {
>      dbus-daemon --system
>      RETVAL=$?
>      echo "done"
> -    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/dbus-daemon
>  }
>  
>  stop() {
>      printf "Stopping system message bus: "
> -
> -    ## we don't want to kill all the per-user $processname, we want
> -    ## to use the pid file *only*; because we use the fake nonexistent 
> -    ## program name "$servicename" that should be safe-ish
>      killall dbus-daemon
>      RETVAL=$?
>      echo "done"
>      if [ $RETVAL -eq 0 ]; then
> -        rm -f /var/lock/subsys/dbus-daemon
>          rm -f /run/messagebus.pid
>      fi
>  }
> @@ -54,18 +47,12 @@ case "$1" in
>          stop
>          start
>          ;;
> -    condrestart)
> -        if [ -f /var/lock/subsys/$servicename ]; then
> -            stop
> -            start
> -        fi
> -        ;;
>      reload)
>          echo "Message bus can't reload its configuration, you have to restart it"
>          RETVAL=$?
>          ;;
>      *)
> -        echo "Usage: $0 {start|stop|restart|condrestart|reload}"
> +        echo "Usage: $0 {start|stop|restart|reload}"
>          ;;
>  esac
>  exit $RETVAL
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
