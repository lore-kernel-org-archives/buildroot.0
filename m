Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FA4D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E966C8234E;
	Wed,  7 Jan 2026 17:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmJiFF7HMr0W; Wed,  7 Jan 2026 17:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D238E81911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808209;
	bh=PkdpCHnyveRUT6ZtswkGsb/ywMCPSy7AzBHRGvRiax4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EYVqdLdpRuN1j/WIq37T+6dQtjZybwLhD2o+Kr1G2RcQ2XoNbR/ErobaC1Y+eZ36W
	 2D66jxCi/an9t32WoaljgqGszbqZycXp7+2L4UOUSwgbKNsi0BqpS6Hxc4qfTMKdGi
	 iKxn53dV74i3/peJguN4vYUIRUfHA7Uvi9tq+SfD8iIIF8EuzGOE9bbr/c3z9onqUB
	 XnpuyjMmG0gujVN6QG0QrAUcJUQJw14wPSFRCNKEkZnE1LfrW9fAxP4Zrh/w5Dk1cC
	 A3zeGQ0iQqjfzV0gTUyV0XckJsp2ia0vCsIGgHZ/Zak1JcTmU5l60UIgLY++OkkOiQ
	 9K+Tmw/tGG7hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D238E81911;
	Wed,  7 Jan 2026 17:50:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDD525B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4707940391
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcewoUMSsKvo for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A5D640263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A5D640263
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A5D640263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 467F4B97A192; Wed,  7 Jan 2026 18:50:05 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:03 +0100
Message-ID: <20260107175003.225918-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-8-bernd@kuhls.net>
References: <20251221223441.185169-8-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808205; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=caRyVMQ9dbm9XWoC/t2inJiYTyfUiPwHacy7l953+X4=;
 b=nDG6I27ocCs9bfpU3oiMBH0bptg5qBDK3DpK04vPBsMapxhlSkkllLKbYuceF+SInUdz+6
 jeVAMTacKS6dUiRvxBuze6cThm1PD9rT1VTLYuOc6WVEpeHAPQGS9HmJUTxVwot9yYlQyP
 zPoihXCdGo8QsCgRWCdytzaeVR1Idb95YbiwjY5SdsQGteB6HopQFlBMOxgWg551W93+yx
 4hY8Ce+yYx+eM/1679FXvOGK3ckKBHxtSGs3HJAM+mX5Y4yLD38MwC4YI+nEH0uqkWevFr
 R+yzLygYBiGYrPgxL20A5i4Gp2+bIdeoxLar4zRNeEaCnm4iTZtXNk5Ewjt+WA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nDG6I27o
Subject: Re: [Buildroot] [PATCH v2 08/23] package/python-httplib2: fix sort
 order of dependencies in Config.in
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
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-httplib2/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-httplib2/Config.in b/package/python-httplib2/Config.in
> index a029814f03..9647bd495a 100644
> --- a/package/python-httplib2/Config.in
> +++ b/package/python-httplib2/Config.in
> @@ -1,8 +1,8 @@
>  config BR2_PACKAGE_PYTHON_HTTPLIB2
>  	bool "python-httplib2"
> +	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
>  	select BR2_PACKAGE_PYTHON3_ZLIB
>  	select BR2_PACKAGE_PYTHON3_SSL
> -	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
>  	help
>  	  httplib2 is a comprehensive HTTP client library, httplib2.py
>  	  supports many features left out of other HTTP libraries.
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
