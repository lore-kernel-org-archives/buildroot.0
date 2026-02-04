Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB482E83EF5
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF22816D9;
	Wed,  4 Feb 2026 09:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDRR5R_DY5u7; Wed,  4 Feb 2026 09:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BDB4816DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770196398;
	bh=MT5k5uhMg9IBHa82KHk2zrDGugLJsB07gqOJVpwRMy8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=inXCFjQRI7hzHHouIb3dKlB/5sNSpC6jUm8HpVk3Y4nnt0qkMBH1v3eUwxPZuyILP
	 uvbANvcaIKBzCT5xGOH9IYDdfwRGQQIikiAfH6H6ErKksbp1Hc5lPThZKxb93bVz5n
	 GjBbD3NBVuqaQYT3eA1SzG81oVBMi7n7qpK7zUA3ENatKFHXs/AW8qD98AFaUS/Ma6
	 Uzx/yGy9AiOiy3sXISGOD6HKXlQw+swYBVL/6YPej9iuvSecbJYWn4vbzeVY9il/DJ
	 SC2wyDLabS0tthao9fmGeuMyptZI7nKRerNT2aCVr4FZTyOWmY6OiLvifkKVcAKXj+
	 JQ14by4Jfwozw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BDB4816DF;
	Wed,  4 Feb 2026 09:13:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4B8F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED25B606AA
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAU5xwJFmm1h for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15C0C60650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C0C60650
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15C0C60650
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:13:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1ED821A2BE7
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:13:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E7BE760745;
 Wed,  4 Feb 2026 09:13:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB1EE119A8891; Wed,  4 Feb 2026 10:13:12 +0100 (CET)
Date: Wed, 4 Feb 2026 10:13:12 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>
Message-ID: <aYMNm2HxiDuR1POR@windsurf>
References: <20260117103109.12198-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260117103109.12198-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770196393; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=zpAVUigOhSlS4vy/42e1vM42J1OqvGDyJJN7jxDDYNI=;
 b=RxdWZjJmEYaNFIJ9DtgHooEq4lujNzhQZarhV9QU4ruAgzQ/MSCz2tPv60Pi1SOHVrZcNk
 T8xARLEjx49aHVbvG1+vuv1xHIxx3pbpuce/11w4jwkm8oJVv+bl81wBrSbJbeKBvt8kqf
 NFAstN0RR4qWc2nGK+TwUa/yRNbUL87RMi5f3xh7q7TWJVUHV5w8z3xzjDYV7KeSWcZQav
 gsJKYQ6tAnNuV2jDVp5lYGgyEEE70topGkG4kOynoZ3gYTVpBs/1QVwr+JbKqMgAMuApYs
 2iRWfcndAQ+BTKi7/Xd38wl5Z3HypiG3k4ccvDyRBxouK9eTsC8RikaNFRn/4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=RxdWZjJm
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: add
 Platform/Buildroot-Initialize.cmake
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jan 17, 2026 at 11:31:09AM +0100, Julien Olivain via buildroot wrote:
> Since commit [1] (core/pkg-cmake: provide our own platform
> description), Buildroot is setting its own CMake platform
> description. This description applies minor changes on top of
> the CMake Linux platform, see [2] and [3]. The CMake system specific
> script tries to include an initialization script, if present.
> See [4].
> 
> Since in commit [1] we set the CMAKE_SYSTEM_NAME to "Buildroot"
> (rather than "Linux"), CMake will search for a
> "Platform/Buildroot-Initialize.cmake" which does not exist, and
> continue normally, since the include is optional.
> 
> The "Platform/Linux-Initialize.cmake" file is the one setting the
> LINUX [6] and UNIX [7] variables, which are expected to be true on
> a linux compatible system. In Buildroot, it is currently not
> included, so those variables are unset.
> 
> If a CMake package in Buildroot has a construct such as:
> 
>     if(LINUX)
>         # ...do things...
>     else()
>         message(FATAL_ERROR "System not supported")
>     endif()
> 
> It will fail at configuration time.
> 
> This situation happened when trying to add the btop++ package
> in Buildroot. See [8].
> 
> Since the initial intent of commit [1] was to make the Buildroot
> CMake system inherit from Linux plus some fixups, this commit simply
> adds a Buildroot-Initialize.cmake file that includes the
> Linux-Initialize.cmake one from CMake. This will have the effect
> to properly define the LINUX and UNIX variables.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/c69b14fe2f72d8134057b115884c04a2bf27d410
> [2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/misc/Buildroot.cmake#L1-4
> [3] https://cmake.org/cmake/help/v4.2/variable/CMAKE_SYSTEM_NAME.html
> [4] https://gitlab.kitware.com/cmake/cmake/-/blob/v4.2.1/Modules/CMakeSystemSpecificInitialize.cmake#L35
> [5] https://gitlab.kitware.com/cmake/cmake/-/blob/v4.2.1/Modules/Platform/Linux-Initialize.cmake
> [6] https://cmake.org/cmake/help/v4.2/variable/LINUX.html
> [7] https://cmake.org/cmake/help/v4.2/variable/UNIX.html
> [8] https://github.com/aristocratos/btop/blob/v1.4.6/CMakeLists.txt#L76
> 
> Reported-by: Gilles Talis <gilles.talis@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
