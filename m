Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D1DD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4067841BB;
	Tue, 13 Jan 2026 19:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMv6oumvjz3Y; Tue, 13 Jan 2026 19:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B9E1841BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333570;
	bh=Cfv0yb4qgTEONJI+RM1xcX406PB68ih1Og6YDGQBf9s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gaqGZX7rYPpyFKO0T1KMPFV4Ho/N2W8E2KjeVhZk2b6TSJPutYLjxZOjgTjgoaYNs
	 VttFwOKRS9Lmxcs0payDbDHjqPLHYCANpkkwC8WP634gQxuwiq5cVgjiHj0Q3ONJZN
	 pURMDeHz9M0E6zQCPcRtan116lrA9m2rTzCVdEjGpf/P2TpownO8EvJWJvqS6D7YIV
	 XwOvjcFDbQnnTR2nVcOQuFOG5eyTIYOabuo9Xp7DaO1u2rCoJElC2tW0w6XVMcZAQm
	 aWLFcnrGDaU1Y01pUFjA3Fhq4motleVJbrpx50o0pw/9hik3FBsPpM6HRCdX0cX4hL
	 e0Xn1MECZEpkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B9E1841BC;
	Tue, 13 Jan 2026 19:46:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE1A51C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFEE860B48
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b09eu2QzO87a for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD35860A94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD35860A94
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD35860A94
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7EE8CB97A885; Tue, 13 Jan 2026 20:46:03 +0100 (CET)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:01 +0100
Message-ID: <20260113194601.98226-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207214849.757334-2-fiona.klute@gmx.de>
References: <20251207214849.757334-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333563; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=GK/uJW1Qzx5b4wEubWFigMcdF/PiEvVCe6uNz99l3xs=;
 b=kzrXuM0S1QXmKxjH0al7Irz7vHgKg8+ESYLLTYs2CYrjyXCvc12oqX6Rr41WxAJXv0Q0qU
 mg43wYUzpcDI2M0Iu1bTII5QyVfvCUTBXSAc3LtiLpgdRifs4d1Gj4D20Cp0gdbgmPtA8C
 JeMfGeACh5hkaolIVB4e4+LLBxMAkoBCtXfzhzpgGlbE9pAw/NuupmMuu2cma3jbWhESxT
 gcO39TFb0NTq6BVdxGBSZWcyuJUKvABJiucQGZlyJwmMVsLnINg87f5syg6BcCCAa2Gy/x
 dtiBDRsMpFj8UoqBU5ZFbvRGqPyEXpA57uHJI4oxHhvhdHhfugw6hc8ystqr/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kzrXuM0S
Subject: Re: [Buildroot] [PATCH 2/2] package/apache: fix checkpackage
 warnings in init script
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
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  .checkpackageignore      |  1 -
>  package/apache/S50apache | 22 +++++++++++-----------
>  2 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 9ef65e8724..09d29f8194 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -201,7 +201,6 @@ package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
>  package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch lib_patch.Upstream
>  package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch lib_patch.Upstream
>  package/apache/0001-cross-compile.patch lib_patch.Upstream
> -package/apache/S50apache Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/apr-util/0001-remove-checkapr.patch lib_patch.Upstream
>  package/apr/0001-sys-param-h.patch lib_patch.Upstream
>  package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch lib_patch.Upstream
> diff --git a/package/apache/S50apache b/package/apache/S50apache
> index b687419055..71e8837bae 100644
> --- a/package/apache/S50apache
> +++ b/package/apache/S50apache
> @@ -1,15 +1,15 @@
>  #!/bin/sh
> +# shellcheck disable=SC2034 # checkpackage-required variable
> +DAEMON="apache"
>  
>  case "$1" in
> -  start|restart|graceful|graceful-stop|stop)
> -	apachectl -k $1
> -	;;
> -  reload)
> -	apachectl -k restart
> -	;;
> -  *)
> -	echo "Usage: $0 {start|restart|reload|graceful|graceful-stop|stop}"
> -	exit 1
> +	start|restart|graceful|graceful-stop|stop)
> +		apachectl -k "$1"
> +		;;
> +	reload)
> +		apachectl -k restart
> +		;;
> +	*)
> +		echo "Usage: $0 {start|restart|reload|graceful|graceful-stop|stop}"
> +		exit 1
>  esac
> -
> -exit $?
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
