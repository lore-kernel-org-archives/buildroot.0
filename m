Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8405910F3DD0
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 05:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4E841301;
	Sat, 28 Mar 2026 05:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnVPFvI0BnQb; Sat, 28 Mar 2026 05:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E508411A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774675868;
	bh=ekFZksoircuhaeui6BFcwmmaL025eIM0beBDUiff7oM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JEC90P/NwWLR6qG9yH6hCg0KXd8cfuq70Pz5P0E7ksXAy8D8GW9KavQI7JGwMvrOR
	 fnpLpowGJlhOxig+cQkfT/6IjkCNE0uNdJGYsEyLtw5rMkLzHFFkbLcvG7q1y1oAHZ
	 TOilMqDAR9bjnddSSt2YA7lOcTNDWIHY5VCvhe/XxQ5SbbiKWNS5BQQ6Y2oGitVF0M
	 tm3vx9jlTYWucbs8SK7LtNIEgPYKBVHaVKTBhX+zI5lmntFRhy0RdvM/GmZlbTJkM4
	 b/Iff9DW4c+R5H2SJN2UVPGmZ34vAv0zdlx2iwrh/mK0Xz3gnmcqWfcVqLcpu8TvXC
	 fq0umJQP8ZxJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E508411A4;
	Sat, 28 Mar 2026 05:31:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75BAC1D3
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 05:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E3F940140
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 05:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FgxMQdeCUoh for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 05:31:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C403340118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C403340118
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C403340118
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 05:31:00 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 00FB5BDE2F1F;
 Sat, 28 Mar 2026 06:30:55 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 05:30:55 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 romain.naour@gmail.com
In-Reply-To: <20260327094348.193822-1-chakrabortyshubham66@gmail.com>
References: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
 <20260327094348.193822-1-chakrabortyshubham66@gmail.com>
Message-ID: <cfbf28f28bc1485cfd2245db5120f739@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1774675856; bh=qcbGQo1Bp+THdKSUI1ZbkV1C/lq9/4vH8CNKjrsAdT0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SQQqmxrtMpHGshcR2h5gqyPWa4b6LYEC1rYTuPD+FW8zrfZ1jFumMZuoCRzeZVSzW
 Kh7Ma8hR2Y58Jni4wk4cXJ4aYos77PAOx45TAJdEGE8wb48EHd+pIXrCQPpsBsjrV1
 xgX6XpOvzNUzFr2MnOE/h7uKLunogX9KgvXfWT74=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=SQQqmxrt
Subject: Re: [Buildroot] [PATCH v4] Extend the existing patch to also add
 -lstdc++ to the Libs field, fixing static linking issues with libicuuc.a.
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

Applying this patch now works, build fails, please see below ...

On 2026-03-27 09:43, Shubham Chakraborty wrote:
> This combines the previous 0003 and 0004 changes into a
> single patch, following review feedback from Andreas.

Your previous commit messages were more descriptive. Also 0004 never 
existed in the Buildroot sources ...

> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>---
> ---
> Changes v3 -> v4:
>   - Clean up patch to remove deleted 0004 patch file
>   - Ensure only 0003 patch is modified; no extra files or deletions
>   - Remove any rebase or history artifacts that caused previous patch 
> failures
> ---
>  .../0003-fix-static-linking-with-icu-uc.patch | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch 
> b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> index 36a3d1f696..c58f2700ee 100644
> --- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
> +++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> @@ -13,14 +13,26 @@ 
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
>  diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
>  --- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
>  +++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
> -@@ -279,7 +279,7 @@
> - 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' >> $@
> +@@ -276,10 +276,10 @@ config/icu-uc.pc: config/icu.pc Makefile 
> icudefs.mk
> +       @echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data 
> libraries" >> $@
> +       @echo "Name: $(PACKAGE)-uc" >> $@

There are eight space characters in the resulting patch, the icu 
Makefile uses one tab. The build fails with:

Applying 0003-fix-static-linking-with-icu-uc.patch using patch:
patching file source/Makefile.in
Hunk #1 FAILED at 276.
1 out of 1 hunk FAILED -- saving rejects to file source/Makefile.in.rej

> + ifeq ($(ENABLE_SHARED),)
> +-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' >> $@
> ++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' -lstdc++ >> $@
>   else
>   	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
>  -	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
> --
> 2.53.0

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
