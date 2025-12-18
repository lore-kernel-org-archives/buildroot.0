Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE3CD6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDA3C410A8;
	Thu, 18 Dec 2025 16:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Usbibnf9HRyc; Thu, 18 Dec 2025 16:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FDC3410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075836;
	bh=WPbOJ/m77AYiczzm9GuD/YOb88CAZP2gsiTIM1u2cEw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pAcKXCsdA0RTQu7y6xp2W47BZyZGHdmvrRnds943sKu74g1c7mlvKW74VUGqgl9Zj
	 Sd2X0B61oz/RItZVJV88RwL1qs+aa66RS+gLk6VNaE0TA3ZdOUk+MP10e4W7YhQOnP
	 uKMIynTBHp/Y/AqCfxScxUbTwAsgV1rTA271dopCV85vLI+9wrdZg3TX+UsYjLLEST
	 lB281WNd6gEab4aeIxqcWgDZHVw/hYE8WLcVkDGbJMG7joT92L/mS6Uc2zuuW5EPre
	 bJ0A6vnY/iIMnznJG/qoL1z1nOr5sKoLzQ26qQHlKOpkXJJ33+jLQ1gCJNE/QlZq2L
	 3Q7fr0kg5hJWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FDC3410B5;
	Thu, 18 Dec 2025 16:37:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76330361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D4C140CA4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdvTyQqoShkZ for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49C0E40077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49C0E40077
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49C0E40077
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB96CB97A1BF; Thu, 18 Dec 2025 17:37:10 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:08 +0100
Message-ID: <20251218163708.379255-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211083052.432926-1-thomas.petazzoni@bootlin.com>
References: <20251211083052.432926-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075831; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=29KDaIQO+6xbFYvq/rP31ZDVpZRmhpyZHXIKt7IUFy0=;
 b=OSukXSI+Vk1eGXuE1q9WRf+r0oBBmhwvqVZzXRE9pr6sQxrrWa1/uL5lhDLCFGsxH/x2lO
 R6bCrAbEnOcarwFL4lr/YH7frO0W+kLnjKqDH+5RFJim02hF4d8r3u5WRqniIXK1Tht+QT
 /jn16cWbjzzjSArgsgXvU1Egu0Mo5Yz38BRMFswGw9ASXW10kZMe5dEnJ+8QSgNWqoe4uf
 8S1d+DNtLiGqc1Hoe+dWUmvYZORaDCeS4lWdxjurnAJCMik5aq94ttWbUPhQ+rgKoIGKX4
 Ax4gHiAKb4fiQnr25gIFp7T1kuVCu4tTq3s7DbwL7CfuodIp15Y9yMgQHlE6kQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=OSukXSI+
Subject: Re: [Buildroot] [PATCH] support/dependencies: improve error message
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
> "Fix you PATH" not only has a typo, but isn't very clear. Turn it into
> "Fix your PATH environment variable".
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/151
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  support/dependencies/dependencies.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 2843e3c5d5..9c2aeaf23f 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -41,7 +41,7 @@ case ":${PATH:-unset}:" in
>  (*" "*|*"${TAB}"*|*"${NL}"*)
>  	printf "\n"
>  	printf "Your PATH contains spaces, TABs, and/or newline (\\\n) characters.\n"
> -	printf "This doesn't work. Fix you PATH.\n"
> +	printf "This doesn't work. Fix your PATH environment variable.\n"
>  	exit 1
>  	;;
>  esac
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
