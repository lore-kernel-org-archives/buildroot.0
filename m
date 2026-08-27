Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4272EC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D1D60828;
	Thu, 27 Aug 2026 21:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ka1BsJ1JuBJX; Thu, 27 Aug 2026 21:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787865043;
	bh=o8/E4tF9+dthvoIvIiIBqIKvWaUI/wyzCw2ajsxQ45s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R3Z9VbOjhMScbTonA9I0JRJqmyJ0y1L0+cn+Ok0cGR2UcAKrVQJU1/9rPWgzR7cBd
	 tfEMlGFOa854sbe48scQG8Cp0Gj2t6yT/gVaQizKwsKGx86/Ed2dEfRt2qRqy8V2j5
	 MgatkUzu8OaE4MKwKy5newnHeez8ILXPZKXM+DJlM7em6QW+ZTsKAW3GE8hmI4whfQ
	 gsheNYwI+fLZcNQtv7OpaeeVhJjbobQFAXY8Ok9TPXuAYgxzMtsSpovB015TKOsc7T
	 Yaehn/kPmdLRvH8QtO7ttiBoIlW+DOGxu7DE6tS4xWS+E6l6BL9Chw0psDUYqn5DTc
	 T7Ucpa+AOY7fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C24A9607E6;
	Thu, 27 Aug 2026 21:10:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C3FD386
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ECA14080C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vS5LGswK8Fih for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:10:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BA614080B
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:10:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A777D13F861;
 Thu, 27 Aug 2026 23:10:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 23:10:36 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 23:10:36 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260827165534.3741128-1-peter@korsgaard.com>
References: <20260827165534.3741128-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <32dc1259e6c04b0e59042e187abeace1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/haproxy: needs signed overflow
 handling
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 27/08/2026 18:55, Peter Korsgaard wrote:
> haproxy has a runtime test to verify that it is built with -fwrapv:
> 
> haproxy
> FATAL ERROR: invalid code detected -- cannot go further, please 
> recompile!
> The source code was miscompiled by the compiler, which usually 
> indicates that
> some of the CFLAGS needed to work around overzealous compiler 
> optimizations
> were overwritten at build time. Please do not force CFLAGS, and read 
> Makefile
> and INSTALL files to decide on the best way to pass your local build 
> options.
> 
> Build options :
>   TARGET  = custom
>   CPU     = generic
>   CC      = 
> /home/peko/source/buildroot/output-haproxy/host/bin/arm-linux-gcc
>   CFLAGS  = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 
> -D_FORTIFY_SOURCE=1
>   OPTIONS = USE_THREAD=1 USE_DL=1
>   DEBUG   = -DDEBUG_STRICT -DDEBUG_MEMORY_POOLS
> 
> Which comes from:
> https://github.com/haproxy/haproxy/blob/v2.6.0/src/haproxy.c#L3008-L3037
> 
> So build it with -fwrapv to fix that.
> 
> Notice that this message also embeds the build path (through CC), 
> breaking
> reproducible builds.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
