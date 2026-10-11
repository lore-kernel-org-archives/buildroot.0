Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886F3CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A7E4605ED;
	Sun, 11 Oct 2026 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShR_IAbRNsQ7; Sun, 11 Oct 2026 21:04:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BC4A605F7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791752657;
	b=ptxuWUetJ5uKwTMQddUhPwtc6kpHHFLAgR9QK9sZ2fuYnNkW+ddHzxKzzmiqhq+g8xB7
	 TjOPgfzpDQCUzJh7Ye4U5oL0jvZZFhv0xguWfgiKldPZW655Ff+pYMuZ4zBenhXkP3S2E
	 soOYk1vXpAygbg4y/V7u6WyCskeOsljJfXkh3u8Iq4vXvoMApChFvpillBfG6JlzX+/r5
	 Bl1IKtzToFAEn3QI9BN4MTn3RzqUseYTg7+3emvK242wHR4b6wR6jt7tq76FO0kyOc668
	 Fb473aolbFrLQANdHxGqwBXzWIGKxLu2wb5sOaN3o/gQYNpDxRKhn6tsF+O36VvUYuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791752657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=qKiYA81YK7xFKerxDvJ2m1QsMm3MW3Uu92tz4sG5lWU=;
	b=KtIqPK2obedyDzoMYaGUJitf0I0P5jJ2DN+P09QuRhzaS1AO4G9FpMVjoyyrnK6SiQCC
	 +BEiVxGSS5o/++EuZ9EnACnGoFE3MTYrtPowYGJ2ZToHNMSIDxJCnQk1bFFpDWxwknxOJ
	 Dl0zvCWEUTJTZHRm1PzGXu+M/QiMojuMSeUauPbC7L2fsGFtnqjPToLDk4cmeBr8zgTBm
	 UltHWPao5/rX2MFrMbWgKDMdztNyrcpaYX7EJXgNtucdSZMteYVrcKH6GaEr2jFIDMcf3
	 7eq3kpIj7mXYNBN3x7mHkuCC8S+++0cFbmCF9eHPLOr9LdfJ/EsJxhW4RmzywIJVH0A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791752657;
	bh=qKiYA81YK7xFKerxDvJ2m1QsMm3MW3Uu92tz4sG5lWU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BkR1fdyraKPUMHevXAjHtSqSBy5gOwDJWRTQSIdjMOXvjYKWdlAwK3OW+/dFoYs9F
	 j+HpK2b4+2QRJKmUgs8n25jLVGrxDyPsFI9YLHGQG1Ha6DBnisdyNGNkNybz3VYutO
	 +gJCVQ3zjaZpQ+C2aULjrWCblILawsfOPiH96kjM8BDpLpiONt2/SP4gATxuNS+1v0
	 JqE62aWt7dqenqxk6YIng1rlFO6MSdYEhlERKfO2ekjbZeBAd+d6MRxjs/NSAb+ggW
	 pVhMaQhg181VJnTZ8r2x/Bj9z0cxmc/77wm0Y2MT1t0uLB0rbx2dGn7Y5cJDcUPKsO
	 qO8vlKELgIRpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC4A605F7;
	Sun, 11 Oct 2026 21:04:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A6171A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24760605F7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSbaNBdVykgW for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 21:04:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8FA51605ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791752654;
 b=neX1toAlRLjnf2xEwkfZNzMCYUSYxq/KjZhrpGM8fRsoLE2epW91sbGaw2PTL7qodYRh
 q1xO/bBgbxtwIo7EFQ3YCKUEu+fhGTuDTxxT8kOQzp4YSg/Dze6EQS29atUpg00ekNKOp
 CMjWX/y3bF1ghWgfcWJhDTcmntoQ78e7y9+aMyE7uAHD1H9WbSEWdGZ+xcmQT7g9elHua
 wvuy0IkHIRgeIViGJTXG80I4ZLnukc+gJ7mPuILSpPgc0Mqo6ffin9VN6WHWnwVz3GJwe
 e+YP1AmIdcFSdZRo6tDOpQuPSag5TjB37AVqq16xSHWJwsdl6i1JGMxbLQLU8qQt6gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791752654;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=OWjKXwFz67Em08P2xvGGcrJpzKPRTyfocE7+N9NCUuk=;
 b=HsEhWn5OlpCXUp0FbfEQ8fZaJfchqXzr2Z7LXuEZOcahFODZf8j5nCtdigWj3haB/koC
 BBLvMxw8zdEAJ8BVz1IhfLR8p3vk7HWbKPY6TZOeJpGoSjrVEJlObVna/CsYLCHIc0asT
 bvsM1ylxPVxV3PR1TQFJwJI7d+S+aGOKVkTsQrTuR/MDCLYZfSfnkrsVYVr1UXEqq6vQD
 QMhh4TgANvCB8xS1uRtxrT50+58JX4pXgZXCynplG1UC+H30RN8YqWhYZ/c3z2XBD1mPE
 vK6ThoL2dS+PjgAkC3v9bjPdGY3TrP3Khfvcj44vZdtS4j4KyufFsp+BpBKIkPlMPcw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MFNkeC5n; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FA51605ED
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:04:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9692B97A0DA; Sun, 11 Oct 2026 23:04:10 +0200 (CEST)
To: buildroot@buildroot.org,
	Thomas Devoogdt <thomas@devoogdt.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Sun, 11 Oct 2026 23:04:00 +0200
Message-ID: <179175254200.259303.6040947056379810764.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001075427.539773-1-thomas.devoogdt@barco.com>
References: <20261001075427.539773-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/webkitgtk: also disable
 internal ccache in the build step
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

On Thu, 01 Oct 2026 09:54:26 +0200, Thomas Devoogdt wrote:
> WK_USE_CCACHE=NO is only passed to the configure step
> (WEBKITGTK_CONF_ENV). During the build step, ninja can run cmake again
> (e.g. when a cmake input such as toolchainfile.cmake changed), and that
> run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
> sets ccache as compiler launcher again.
>
> That outer ccache runs without the CCACHE_BASEDIR that the toolchain
> wrapper sets for its own ccache call, so the cache keys and manifests
> contain absolute paths, and the entries only match in the same checkout
> directory.
>
> Pass WK_USE_CCACHE=NO to the build step too.
>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

 Applied both to master, thanks!

 Small nitpick for the future: your Signed-off-by doesn't match the From address.
I understand why... but we want them to be the same. The easiest solution is
to simply add your private address in a second signed-off-by line.

 Regards,
 Arnout

> ---
>  package/webkitgtk/webkitgtk.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index a2ceb516ae5..14be8c0cbaa 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -22,6 +22,7 @@ WEBKITGTK_CMAKE_BACKEND = ninja
>  # Buildroot adds support for ccache through its
>  # toolchain-wrapper, so tell webkitgtk not to mess with it.
>  WEBKITGTK_CONF_ENV = WK_USE_CCACHE=NO
> +WEBKITGTK_BUILD_ENV = WK_USE_CCACHE=NO
>  
>  WEBKITGTK_CONF_OPTS = \
>  	-DENABLE_API_TESTS=OFF \
> -- 
> 2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
