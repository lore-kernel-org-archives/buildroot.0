Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09D0C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D03360825;
	Fri, 31 Jul 2026 12:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0dEHbV_wWaK; Fri, 31 Jul 2026 12:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B286160ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499510;
	bh=hy3USHlyXD6+YMobk287hxH7K+e4qGLx4SmbZtdeONA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PVyR1bT3ik2mAkaLilA1zSIGh6ZoKTGllrxeL2Gfin1KWriKsQoZ3WPNsOSZIMCBd
	 bwUTgis5iI423wwe+T/zDtMToGepHqoDxJgNxzk7ZshINoIxNBsAMEJuGNBymvb59I
	 DxIgM7W2ZFM0tKEcrfwRHGF57bIRAkDCA+kj9Y3fSVFHDzPVNgcS9zI7TQSMhCF1ZU
	 8P10Ew406uDH7pMgXwxCcf0aAhjSN6kTkiiCBLA3/an4wYKLHh8lFwkkWqY+SJKIGu
	 GZ2fA7eq2aD4axIhRTRPeFlrtFAcvdz9o20o8PbbTNJOxn7dDSCNepEL976s/ejDP8
	 XkYUm9AzYNugg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B286160ACD;
	Fri, 31 Jul 2026 12:05:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9C5927B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B7D460AE1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJvtz0fUnD_i for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FDD660ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FDD660ACD
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FDD660ACD
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:07 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so456390f8f.2
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499505; x=1786104305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yq3kSw8c9CRIcHQdsz0vhy+x5MIJo21CoC6MbTji6sA=;
 b=FIM74472lPirIhPyVdngeBB4NqxbusYkovmZIkzheYbWnVUNTZWZ6pJdBtC/pt+Ibv
 3EuIur2P8mzUbFZYWcKIgAb+Q98+Q7HKx38mRau3yLkbFoo0/Uz6+NxXnEa3gGN17Vtu
 Yh0sGDtempNn8FPB1dOopZwqSvA7uskKe63tdQTJqP/1XUrfBp69Os08HGePmIxaMma9
 nClXR67xCGmbg9VGqCRkhFPFOu2fLIGOG3i/9pwITDiXSE/yqFC6mGjUxweOPBHT9rAn
 VCXE2fjQyMTD3ImFxeJVNOpjsYz5D6i8+M0HFxZcEm0mb9DO30MKiPDVSlFyBnUhwyFv
 GcNQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RosPUqMq8RmZAwrrklvmcqrqsdjuvDNHVqjzqoF7HvC6NeW9NThKlTByu1RwG+6CRXulTrBm8BYVQo=@buildroot.org
X-Gm-Message-State: AOJu0Yyl1W1F9wn21m/8Tq3PR4V3ExoWWS28snV5iIm7ZsdxEW7Cxv62
 7A5rkn/P0YBnKGhbFzN2wVbx5OeXo1Svc89iqW/+dwsk88IGw5aN2WSeJ8gWRggAErASYNR1TA4
 1zBEH
X-Gm-Gg: AR+sD10xTsrx3nJoA2SGPywJJsUyn2lHRiyRZ9c13bXr9Hm2l87FisQieKwQ43E7se3
 oa1O70lw/E9pq0aHVhJ/p+5Bm3L5IWhrXtMxtditOb0fc/P22J+aPZ1dE4m5mmQ8SoYxRjNklhV
 ePFcXn2iAy3E3b1YndI5gqxPb6pmII/bwn7rxuCVlkaM9U81OsOm3M1NSDSbIImLOpYL/DjhTGl
 av20aXaKAJ0yRnq1UlzUpZicpPtuvSPSgoP2BvUveHFQaBsJHJY+gl5q5VEyWfaRpLdTlUHhqtI
 XdChIjOo/1RuiBcA0fAG1NjHL5MT7H2bM4QY1dXmB/ybUzp7ga1IoU2LrPvqZp6sCKYW2AZCP49
 WJAIUp59yDqVX5uwTlUkZghVRpRCbhCv/eXo25k3m2snZ3IJ6QxTZYDvxxCrGHc8oHNL7Ei/wVo
 FP2VMrbXs7bZA0EFQhyWC1kAVMjb1REEF4PNi4FnMDa2yosD0Eaw98IG3mHb04aGHf4QxqSdqeD
 uqMkuLkzupbW1qJOuzkoFhipOMBYt1R40CP
X-Received: by 2002:a05:6000:40c8:b0:47f:8110:3073 with SMTP id
 ffacd0b85a97d-47fd2ae2586mr4384044f8f.24.1785499505108; 
 Fri, 31 Jul 2026 05:05:05 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2484sm4252604f8f.11.2026.07.31.05.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:04 -0700 (PDT)
To: Pedro Aguilar <paguilar@paguilar.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:03 +0200
Message-ID: <20260731120503.3234-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260623155231.3827936-1-paguilar@paguilar.org>
References: <20260623155231.3827936-1-paguilar@paguilar.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499505; x=1786104305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yq3kSw8c9CRIcHQdsz0vhy+x5MIJo21CoC6MbTji6sA=;
 b=cDd+CrRxu5mnQLWH508qIGMZgmpPho2EYTk4L+pQRg/CGHf0eZYRQ3o37QpisafEik
 aZVeRKLMghRFo3I0QV/1JqakH0vBo0wgP5LPQ2L027YFvTIqLjNWVodR08AY4oEa/RIJ
 wxYxpP149AGJAYgw2XZ8s4JwJGKwKfV5oQb/8CtVJPTYzf7bFUAYwgBapFhFRVi7+wHG
 b3t+FeurCTadfs38KiR6lDO4FYtDJdxxPMjwTLQ8tTxi0gkg4wXWKaqgk0vDp/VpcU/H
 w4t6xK3kIFXHIwn4isNkmIriv8cuouObBMPkii5Butizbsa369/95ZUYuKfug6ZPg8aM
 XOow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cDd+CrRx
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: bump to version 3.0.11
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
> The patch 0002-Makefile.am-fix-build-without-makeinfo.patch is not longer
> needed since it builds even if 'makeinfo' is not installed, so it's removed.
> 
> Changelog:
> Changes are detailed in the git repo logs:
> $ git clone git://git.sv.gnu.org/guile.git
> $ git whatchanged
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  ...kefile.am-fix-build-without-makeinfo.patch | 51 -------------------
>  package/guile/guile.hash                      |  2 +-
>  package/guile/guile.mk                        |  2 +-
>  3 files changed, 2 insertions(+), 53 deletions(-)
>  delete mode 100644 package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
> 
> diff --git a/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch b/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
> deleted file mode 100644
> index 0d16f92387..0000000000
> --- a/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 9304ad88a5f4b083d348563c5de00da53b34cf46 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Fri, 6 Mar 2020 23:20:39 +0100
> -Subject: [PATCH] Makefile.am: fix build without makeinfo
> -
> -Don't build doc subdir if makeinfo is not available otherwise build
> -fails on:
> -
> -make[4]: Entering directory '/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/doc/ref'
> -  MAKEINFO guile.info
> -/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/build-aux/missing: line 81: makeinfo: command not found
> -WARNING: 'makeinfo' is missing on your system.
> -         You should only need it if you modified a '.texi' file, or
> -         any other file indirectly affecting the aspect of the manual.
> -         You might want to install the Texinfo package:
> -         <http://www.gnu.org/software/texinfo/>
> -         The spurious makeinfo call might also be the consequence of
> -         using a buggy 'make' (AIX, DU, IRIX), in which case you might
> -         want to install GNU make:
> -         <http://www.gnu.org/software/make/>
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/9605aac6f760bfff190d0ab95fa50f65486ffe90
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: sent to bug-guile@gnu.org]
> ----
> - Makefile.am | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index ebbf6d476..2270afb9f 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -38,8 +38,12 @@ SUBDIRS =					\
> - 	test-suite				\
> - 	benchmark-suite				\
> - 	gc-benchmarks				\
> --	am					\
> -+	am
> -+
> -+if HAVE_MAKEINFO
> -+SUBDIRS +=					\
> - 	doc
> -+endif
> - 
> - DIST_SUBDIRS = $(SUBDIRS) prebuilt
> - 
> --- 
> -2.25.0
> -
> diff --git a/package/guile/guile.hash b/package/guile/guile.hash
> index b671edad9d..4db8b1855b 100644
> --- a/package/guile/guile.hash
> +++ b/package/guile/guile.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  1a2625ac72b2366e95792f3fe758fd2df775b4044a90a4a9787326e66c0d750d  guile-3.0.9.tar.xz
> +sha256  818c79d236657a7fa96fb364137cc7b41b3bdee0d65c6174ca03769559579460  guile-3.0.11.tar.xz
>  # Locally computed
>  sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> index 82daaf5ad4..467a21f5a2 100644
> --- a/package/guile/guile.mk
> +++ b/package/guile/guile.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GUILE_VERSION = 3.0.9
> +GUILE_VERSION = 3.0.11
>  GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
>  GUILE_SITE = $(BR2_GNU_MIRROR)/guile
>  GUILE_INSTALL_STAGING = YES
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
