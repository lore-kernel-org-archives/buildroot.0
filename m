Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F5310BA422
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 04:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 941288239A;
	Fri, 27 Mar 2026 04:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvCk0hVJSSzA; Fri, 27 Mar 2026 04:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C0E28238B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774585633;
	bh=FchfqH/V0OZgdFCteM01QEW+7zrGwv72CjgMTMvDi8Q=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jign0BbF76WP3QJSEkpMR61NjkpZdpUHt1nuh/K2DyKNfwoE7og6rrAw2qQIKgAj2
	 +isflnNJKLJ/1IovBhne23LGJs7SNdQCdEVdbcV52D+Kj2+GKdlI7dkrP0MDvZBntG
	 jY+gviRhPxA19ZvUeRBS7yILs0fFRwfKUqmOjkcdr4HnKdkvZLvL9IoF/E7Jml2M3Z
	 qy+77u+PnhqcqAMEtGUsDfT2kEPi2Tx99YpvwDkt5By358U922LNuK6FyFvQmWLRM8
	 OdE1YJMcj6JoVtDKiIunSrBmJEvxoFAhvXFWJjnd9NaWKoljzABRUzlL+ulAlWRzxF
	 KurBAGdd9iQKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C0E28238B;
	Fri, 27 Mar 2026 04:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77759249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 04:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 695AC40A62
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 04:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YzLFy2shA4U for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 04:27:09 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 69D7740126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69D7740126
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69D7740126
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 04:27:07 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id BA719BDE0769;
 Fri, 27 Mar 2026 05:27:03 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 04:27:03 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 romain.naour@gmail.com
In-Reply-To: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
References: <20260303182128.1242999-1-chakrabortyshubham66@gmail.com>
 <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
Message-ID: <8fff630f63cf5dbca36e7efe3a8f13ef@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1774585624; bh=7VAiILGkF/uCwnWBFOcu7gNHEUMDXtCdPZcrsSIdu3M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=mwxImDCw0J7dp0Mn+N2AhuUDxI57Vq/IJQVW5zwUdC3qOZEsKso993O8+O4p6HDWj
 uCnHlxiYe2LNAosj/s702esHioRhFAcSw62/pcTar98/rrue9ZDc0M4UNvY5sJiMYA
 Jvszh12QsmyRzJpNcVUt6sVM58LfExEQtIGWiNDw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=mwxImDCw
Subject: Re: [Buildroot] [PATCH v3] package/icu: fix static linking with
 icu-uc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Shubham,

On 2026-03-26 11:36, Shubham Chakraborty wrote:
> Extend the existing patch to also add -lstdc++ to the Libs
> field, fixing static linking issues with libicuuc.a.
> 
> This combines the previous 0003 and 0004 changes into a
> single patch, following review feedback from Andreas.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
> Changes v2 -> v3:
>   - Merge previous 0003 and 0004 into a single patch
>   - Extend existing fix to also add -lstdc++ to Libs (static linking 
> case)
>   - Keep original authorship and add my Signed-off-by below Romain's
>   - Update commit message and description based on review feedback
> ---
>  .../0003-fix-static-linking-with-icu-uc.patch | 29 ++++++++++++-------
>  ...atic-linking-with-icu-uc-static-musl.patch | 26 -----------------
>  2 files changed, 19 insertions(+), 36 deletions(-)
>  delete mode 100644 
> package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> 
> diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch 
> b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> index 36a3d1f696..ec393254e8 100644
> --- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
> +++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> @@ -3,9 +3,6 @@ From: Romain Naour <romain.naour@openwide.fr>
>  Date: Wed, 22 Jul 2015 22:43:25 +0200
>  Subject: [PATCH] fix static linking with icu-uc
> 
> -During static linking with a C application and libicuuc.a,
> --lstdc++ is required.
> -
>  Add -lstdc++ in Libs.private of icu-uc.pc.
> 
>  Fixes:
> @@ -13,14 +10,26 @@ 
> http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef52
> 
>  Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>  ---
> - source/Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> +This patch currently addresses linking against stdc++ for 
> shared-library
> +builds. Add -lstdc++ to the static build flags also, to fix 'undefined
> +reference' errors when linking programs like xmlcatalog (libxml2)
> +with musl static toolchains.
> +
> +Upstream: Inactive-Upstream [Buildroot specific]
> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +---
> + source/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> -diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
> ---- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
> -+++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
> -@@ -279,7 +279,7 @@
> - 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' >> $@
> +diff --git icu.orig/source/Makefile.in icu/source/Makefile.in
> +--- icu.orig/source/Makefile.in
> ++++ icu/source/Makefile.in
> +@@ -279,10 +279,10 @@ config/icu-uc.pc: config/icu.pc Makefile 
> icudefs.mk
> + 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data 
> libraries" >> $@
> + 	@echo "Name: $(PACKAGE)-uc" >> $@
> + ifeq ($(ENABLE_SHARED),)
> +-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' >> $@
> ++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' -lstdc++ >> $@
>   else
>   	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
>  -	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
> diff --git 
> a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch 
> b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> deleted file mode 100644
> index e17f6ac775..0000000000
> --- a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> +++ /dev/null

Your patch seems not to be based on the current Buildroot master branch. 
It cannot be applied, unfortunately.

> @@ -1,26 +0,0 @@
> -From 2107f9dfb39eeb6559fb4271c7af8b39aef521ca Mon Sep 17 00:00:00 2001
> -From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> -Date: Tue, 3 Mar 2026 10:00:00 +0000
> -Subject: [PATCH] fix static linking with icu-uc (static case)
> -
> -During static linking with a C application and libicuuc.a,
> --lstdc++ is required. The previous patch (0003) only addressed the
> -shared library case (Libs.private). This patch adds -lstdc++ to the
> -main Libs line for the static case to fix undefined reference
> -errors when linking programs like xmlcatalog (libxml2) with
> -musl toolchains.
> -
> -Upstream: Inactive-Upstream [Buildroot specific]
> -Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ----
> - source/Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
> ---- icu.orig/source/Makefile.in
> -+++ icu/source/Makefile.in
> -@@ -281,3 +281,3 @@
> - ifeq ($(ENABLE_SHARED),)
> --	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' >> $@
> -+	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' -lstdc++ >> $@
> - else
> --
> 2.53.0

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
