Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF8BD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A985782F0F;
	Tue, 13 Jan 2026 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnDDn4gmW60R; Tue, 13 Jan 2026 19:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F57807F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333533;
	bh=qXhcoitxfe+vzmLHqoF9dD/Tr/h1a9PjFBGmad/2dPo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WJ8yWdAAI2e92AhkRiCQVLu9tZVJrIZMG+P774gAu493NzlJWWLp0kIhMRrNduc52
	 9YGfQs421INHQYlKo8SCYVBBBaBcJBNS9NOyGASS6Mw3wAI5kL7m/rH7l8ASk1xaur
	 GHnlv1KG5Zi2073DTYv6sCYMAQIoBgOZXHHJt1HI7RUtnjCAhwUknBZIBwELtKAbYy
	 yXX0mbdGr8yLV/kLkdIPOR4C108ZqXfKeWV8NAZhLdwaiKhyu2dhE00B6C7NiZMMf+
	 vPrrnSqCpuY3/gcCyV52YibmYcT0kqMkfKnUp6Hf+JFXRy9XfT2z8r5CJc/rTAPoql
	 WGjK1GJ700KEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12F57807F8;
	Tue, 13 Jan 2026 19:45:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFEA4231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D23B9840F9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORzrD7OG1X5k for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDE1B84111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE1B84111
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDE1B84111
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 14362B97A886; Tue, 13 Jan 2026 20:45:27 +0100 (CET)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:25 +0100
Message-ID: <20260113194525.97660-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250904195812.3259342-2-buildroot@heine.tech>
References: <20250904195812.3259342-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333527; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=XwOWT7qiDoacyw4VhXPJ0qaWpNOM1agoU1iGsHipuKY=;
 b=UrzD2bTeLrNYugk7TiUW9EALEaia+2nYMMDCyWYSsvzgHvmKzAIT3IQWPFrm7kD3iDqJsl
 rNs7zGrB2630/od+9NnC0NppGe4nIcdrouAJVf1ySmYJizOEnE6ofRiQdXxwsDNL9U+RVb
 TQs4eInU9aHNGSKGj+Ew9PTeZQIPAeOVUFY85SLPXGK4oW8oe0up1QMaZDzcEwNQJldUXm
 h6MAdNmUqT1DO4Sv7qXefObmErMO3vdR3IwZgI9n501/qwWEc5elugw3D7yIYlH7vShmNx
 c3+8mKdA1Agw/7grI62STEZ7sfJBKFXshJivGtF6xo/1sIyqh54jk/XIkFW3dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UrzD2bTe
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libcpprestsdk: add
 dependency on Boost.System
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
> libcpprestsdk searches for the Boost.System module in its
> CMakeLists. Hence it should be selected as a dependency.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libcpprestsdk/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
> index e533b30393..7688021ed0 100644
> --- a/package/libcpprestsdk/Config.in
> +++ b/package/libcpprestsdk/Config.in
> @@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
>  	select BR2_PACKAGE_BOOST_RANDOM
>  	select BR2_PACKAGE_BOOST_REGEX
> +	select BR2_PACKAGE_BOOST_SYSTEM
>  	select BR2_PACKAGE_BOOST_THREAD
>  	select BR2_PACKAGE_OPENSSL
>  	help
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
