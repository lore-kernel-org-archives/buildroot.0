Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28136D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F33D8822DB;
	Wed,  7 Jan 2026 17:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ht18ldbVcgQz; Wed,  7 Jan 2026 17:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D14D822E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808157;
	bh=31X7vo/KoETWkqO5u9J1e9OnZSQgamXkChChI/kIUCQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AgNJca5G96MK4Ypnmzl28sjN7RGcKO/A+g52lJLke+GUKwl4z0ALs7O5I/YpO5Raf
	 AwVpucaXKG+E1nh6Bt3vMwuO+V/Y1I+pM/VuJKXezXAh/aa3B6B7tZMK8CAPYPs63h
	 jwi8qHXeZ5C4i9jIRBdrEMVBsUYw5Pxp6biwhf2Bb0NY+5XszwoFe8T01QdCCECbam
	 zxV5fW0UFPP0ihssvp+mSeRUXFEBcJt6pe28/REIgX3wJD5V8wFuM1on3i+d2sPpfL
	 B+KgNPyowmrpqf/h04wXyMYLqawhKWY5lhzD6bmQQ/EO90xLHqTKZowIM7E+FmI7ev
	 4gLSDi9gWxYug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D14D822E9;
	Wed,  7 Jan 2026 17:49:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B6399ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6A3D40128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDIh12wyiO9Z for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD6CB40160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD6CB40160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD6CB40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 02C17B97A192; Wed,  7 Jan 2026 18:49:11 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:10 +0100
Message-ID: <20260107174910.225003-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217222539.1989993-3-thomas.petazzoni@bootlin.com>
References: <20251217222539.1989993-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808152; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=K+Tz9DFrJmfY4JErLyZHgYI+yC5W5VtcnEcZRvQbgME=;
 b=HSfxegmiOV4FP2NjbfEUc53ie8z+YhaOZHghmvxXhj9YwNJTLjDqdEi1ioNxyedL+wBGOx
 NeYMsEFNWZJv6n1TPfgR9ltBWG8Fl527JET7D4CllasYmopz+VD5ExXiHCz6OHiYxW0mCa
 s8sK6G4ex/TCgHoNKjhj3TWlyQOVTqCZf2pNBxD0H01QzXep4P/ViIuv+tdHmO9FffrsQM
 +oYo5M0v1yg+uYbGlvJa2Wh8hAZXA00+dOjYyVdbDjvjYcZqK6ELUyzcg7EKKvGY3X7Iyh
 eiQohkYyLWF/RXT5O+S5Wuw/eWaFhvIGUUecJ60qI5GCYJH40npO53xlhrjxjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HSfxegmi
Subject: Re: [Buildroot] [PATCH 3/3] package/cppcms: change upstream to
 Github, bump to 2.0.1
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
> cppcms.com now points to a Github page at
> https://github.com/artyom-beilis/cppcms which has a 2.0.1 version, so
> let's use that. The number of differences to 2.0.0.beta2 is very
> small:
> 
> $ git log --online v2.0.0.beta2..v2.0.1
> b872972 (tag: v2.0.1, origin/master, origin/HEAD, master) Version to 2.0.1
> a1914f7 (tag: v2.0.0) Replaced system category with one from predating C++11 (v1.2) because std::system_category does not translate WSAGetLastError results
> c4febcc Merge pull request #104 from dreaming-augustin/upstream
> 922cd49 Python 3.12 compatibility: wrap regex in r''.
> a11e9d4 Merge branch 'cpp11'
> 3000bc6 (origin/1.2_updates) Merge pull request #99 from dreaming-augustin/master
> 44e24c7 [#89] cppcms_error fix typo + consistent  messages
> a6d5575 (origin/cpp11) Added backtrace to system error
> b3aef3b Fixed missing include for stripped down build
> 463a9a6 Removed IPV6 due to travis limitations
> f8163c6 Merges from cpp11
> 31d4fe7 Added verbose log on failure
> 90bc996 Added Linux to build matrix - so I have fallback if normal build environment fails
> f78ee39 Added Readme for github
> a737d5d Merged python3 compatibility from master
> 0c67544 Support of python 2.7 and python 3
> 0d121a7 Python3 compatibility
> 2fc7e38 Python3 compatibility
> d745869 python3 fix for tmp_cc
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/cppcms/cppcms.hash | 5 +----
>  package/cppcms/cppcms.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
> index a8d04ff36f..8e59f66489 100644
> --- a/package/cppcms/cppcms.hash
> +++ b/package/cppcms/cppcms.hash
> @@ -1,8 +1,5 @@
> -# From http://sourceforge.net/projects/cppcms/files/cppcms/2.0.0-beta2/
> -sha1  746cc5e3f58565d91d9ded6e2616399d60e9d01d  cppcms-2.0.0.beta2.tar.bz2
> -md5  ef561d13ee92d2053151cab073feba10  cppcms-2.0.0.beta2.tar.bz2
>  # Locally computed:
> -sha256  697031c7d141fdd215c6be5090b66e2106a63bb3e52f09ee8120e8efc6c08a21  cppcms-2.0.0.beta2.tar.bz2
> +sha256  4a7a2217b3fa59384650912a7000e016c308b4fa986a3d2562002691e5a9d6e7  cppcms-2.0.1.tar.gz
>  sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db  COPYING.TXT
>  sha256  3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f  MIT.TXT
>  sha256  d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b  THIRD_PARTY_SOFTWARE.TXT
> diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
> index 8a59990a8d..b39122d12f 100644
> --- a/package/cppcms/cppcms.mk
> +++ b/package/cppcms/cppcms.mk
> @@ -4,11 +4,10 @@
>  #
>  ################################################################################
>  
> -CPPCMS_VERSION = 2.0.0-beta2
> -CPPCMS_SOURCE = cppcms-$(subst -,.,$(CPPCMS_VERSION)).tar.bz2
> +CPPCMS_VERSION = 2.0.1
> +CPPCMS_SITE = $(call github,artyom-beilis,cppcms,v$(CPPCMS_VERSION))
>  CPPCMS_LICENSE = MIT, BSL-1.0 (boost), Public Domain (json2.js), Zlib (md5)
>  CPPCMS_LICENSE_FILES = COPYING.TXT MIT.TXT THIRD_PARTY_SOFTWARE.TXT
> -CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
>  CPPCMS_INSTALL_STAGING = YES
>  CPPCMS_CXXFLAGS = $(TARGET_CXXFLAGS)
>  
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
