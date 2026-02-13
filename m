Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197A3EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0CC661422;
	Fri, 13 Feb 2026 19:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CArFTIDIUCDZ; Fri, 13 Feb 2026 19:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D568061559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011528;
	bh=HSvJVFTeU12g/4XbMsB+oRiWyRkjnCCUuOyid7jC6wI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pi4uu7OOmJ9Jx4mDKrWpOyTeQ/RH3E4JrpwTTUBxvrc709/k1dcNliJQPykodwj87
	 VbF9qLa7PW9TAk9ganBuHHl4wDuaLknCoiWV49fPdoq79kRFV4RPAIG+2/x9inX+OM
	 e8TI4hJiBdpQtfjtgohxY5q9TQVpSdU9laBIOheDvbV6MNJE2btLHFY228gSH6Su1V
	 UgLRWAFlrPMlYYEWJEvDnTPTCDbiemKKK3SpcUh+kCkDtPGfyN19CcI7Z4YKJeTXYJ
	 iTzNcnGBr4UDEAf5JjGh3WtzndYMbOZR98eT6VUqw+57x9njF5lpzcZGD852QspDkg
	 HxAcaehXX8vGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D568061559;
	Fri, 13 Feb 2026 19:38:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59A59EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EED841E60
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcowzJSdOc7F for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28B8141F8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28B8141F8F
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28B8141F8F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:45 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4377174e1ebso904952f8f.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011463; x=1771616263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zsKoudBlhJNI0t9Zr/tRzYH9YpoAo9rWAfAa0uJotEU=;
 b=aAOaaOjgJzcs5F6SYYWCQ3CPy7TIFrxBm2quAPSMULhEnfBiGVN4E4Qi4BQlMegJXG
 jOY8tUgyQ76X6ZPRIR49+pZd73DBQ4qWbBPRqaA2omavzu0euQhcOD7FNp3PKurszghF
 4QI18OlQ/BLuavUjMMlHjM28ek79Q2w0tKs3OPFkZkGTM5kC7vg01N7oPNflbpaLk2kp
 bUnt5AlYdqBuujE007sH2+e9bm8irkBGNNHhuHWrcopZerZbZNcQTMiYVzueaSWkL85S
 yvji0NymelMoRcnhFhQrsvQ09k0NE66Lq+IyoSdYn7S5yiPmGo2mrX2CuzWGvy0MzjTt
 hdiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+y+I1SavKnFxjKfHO19yjEq7iF5E5GeRhJrW7Bfb+nP2o+MOk9VY4muRfH9Gd8zINVvseFZ5x6A0=@buildroot.org
X-Gm-Message-State: AOJu0Yz8mdhy5yxGHTKR62FL4EcQsZBeMFZfWCdPk7KF6hEcz122AqwV
 gfaCEoH+DhUoZ6qk5BuaHDg2scdNeLfOxkgzvmnPn+ypo/o0RHi2jeeyhVIpkv6UvM0=
X-Gm-Gg: AZuq6aLG3V9ay8FZKXMRYydyTY/9N5sCH8YBgzkwYc4oUUW8YhqWYM/znH5l7s4kuJK
 gD8ue4zFPZwLq/u0t8PQx3pKY+2pVU2rPz9gDHTRCWX6rp/e8Q1i6bJTDaz8pf39tbo/MEHL1n8
 g+Yz7qpgYOI1fdGzdHK9Rr7Y8ik4RaekPXESJEANwkI1+dd+aS4NNVCs9BYJjum0vMGg/KOwXlB
 sFGCUXICz6BwRG334YtgUYrFIKAe/x+XsnX/Cca6PuLQpifiaih2SKqxz4eORRy9/4uSdkoqVZe
 wzNb5UpklRU7Bj2ki0K6v8SHfpJtmk3matZ1O0ykpfkILNnIYWQBgLnXvYoyRmIIGDh9IhPnPAq
 N5hZb8B9dHpbvWe2NHmf14+fkFn5cUqGz62imZs5tARnhaDOD1UzsyBIKf/6WxOY8MfD/3AkiDZ
 EsLYcsRxB8lJH6Wfo=
X-Received: by 2002:a05:600c:8b32:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-483739fc64fmr53993655e9.7.1771011463129; 
 Fri, 13 Feb 2026 11:37:43 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a41fd5sm22647535e9.27.2026.02.13.11.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:42 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:42 +0100
Message-ID: <20260213193742.40412-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115194549.1208078-1-bernd@kuhls.net>
References: <20260115194549.1208078-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011463; x=1771616263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zsKoudBlhJNI0t9Zr/tRzYH9YpoAo9rWAfAa0uJotEU=;
 b=H/aCQZBEprPzK+lqfp7DAXPaosOgx6FVKlCvY1jyIzmXN4sMqaXHv+pnV6DpwvXIcX
 kcezzrEZKsrR6OFwtbC7Gv2X6dGzjrT7kJfP2Fk9No8TCx9qC1aJtkiOBYOu8k0JfnhO
 GP5xkYTP2m5WUUvcY3wR39MhyValk2plsvZY1dQXDvS01FUZ2N1958Z7T4K9pAGnMTgY
 +i9n+/s0CpmD603gjtrp1z9LPLs8jfdPGnPkQpqsrxP0ixfrDz6iYvZZQkJlnaga4Nme
 3NlhjHEBZR1iFjuZOC9jTTl1WacG6b02IBbysg/9rl1DUIcYKkzJKIeOo/bYhiTEPyID
 m8FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H/aCQZBE
Subject: Re: [Buildroot] [PATCH 1/1] package/berkeleydb/: fix non-threaded
 build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Building berkeleydb is broken with a non-threaded toolchain with gcc >=
> 14.x:
> 
> ../src/rep/rep_method.c:1740:25: error: implicit declaration of function
>  '__repmgr_get_nsites'; did you mean '__rep_get_nsites'?
>  [-Wimplicit-function-declaration]
>  1740 |                 return (__repmgr_get_nsites(env, n));
> 
> According to src/repmgr/repmgr_util.c, line 503+, the function
> '__repmgr_get_nsites' mentioned in the gcc error message "may only be
> called after threads have been started".
> This source file repmgr_util.c belongs to REPMGR_OBJS according to
> dist/Makefile.in, line 249+, which is, according to dist/configure.ac,
> line 956, only build if thread support is present.
> 
> In a non-threaded build '__repmgr_get_nsites' does not exist causing the
> build error.
> 
> To fix the build error we disable replication for non-threaded
> toolchains.
> 
> Using gcc 13.x the build error does not occur, tested with this
> defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_GCC_VERSION_13_X=y
> BR2_PACKAGE_BERKELEYDB=y
> 
> Using this minimal gcc 14.x-based defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_BERKELEYDB=y
> 
> the build error can be reproduced.
> 
> The oldest build error of this kind, afaics, dates back to 2024-06-13:
> https://autobuild.buildroot.net/results/e0d/e0d6bdbef01bee277b0da83605b2906af876058a/
> 
> Fixes:
> https://autobuild.buildroot.net/results/792/792ed942d17bb8d00cd321536a102f6dd63b6a8a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/berkeleydb/berkeleydb.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
> index 6c487400ae..46838ca85c 100644
> --- a/package/berkeleydb/berkeleydb.mk
> +++ b/package/berkeleydb/berkeleydb.mk
> @@ -45,6 +45,7 @@ define BERKELEYDB_CONFIGURE_CMDS
>  		--with-pic \
>  		--enable-o_direct \
>  		$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-mutexsupport,--disable-mutexsupport) \
> +		$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-replication,--disable-replication) \
>  	)
>  endef
>  
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
