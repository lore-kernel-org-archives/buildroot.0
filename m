Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F42CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 383B842F72;
	Sat, 30 May 2026 20:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbbfKHtHKUxy; Sat, 30 May 2026 20:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DD8842F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780171504;
	bh=pq688n4l8aSWkMs6YH8kstYvb0h3eIm4XdD1SLlxqGs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LHuVspY1Es6Ol6dt5ilQgE8O/fd1eQ7P54oOxWWkaZYkbyf4rEwCHJ5z0vGPNrTCY
	 YBm6rg80d9IiB+dEqFjvF4pAigVl5PpkyFBxbqGcvJTv5mYZ7+PSJnqG0TcPR/RIyb
	 YICG+D9au8/SVfyFv2dc/ICWBAVI4rdRmxwhuVU+Q+t02srN4xsP3gmtcZ8b8fb2oD
	 o17ynITvGpoROOPJyywcyDMGkCX58o6EX/eaxW4PVgsxm8/WG9ltGPjZ927ZzmdovV
	 ZSN/CMumxloth0MUlQox4/OuOq4gWH22iG0IQ/tKqdDmxbHmoD1fU0rzk87jxY/dea
	 iu3vXOkV6lsMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DD8842F25;
	Sat, 30 May 2026 20:05:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89A58D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AC8E42F25
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6dCZmbFc1pb for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6262F4287F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6262F4287F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6262F4287F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:05:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 759C7B97C5F9; Sat, 30 May 2026 22:04:59 +0200 (CEST)
Message-ID: <96c082de-9e4e-4e95-b33c-af689e010fc9@rnout.be>
Date: Sat, 30 May 2026 22:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260314230517.4160-1-christian@aperture.us>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260314230517.4160-1-christian@aperture.us>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780171499; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=KeibR0Tntk3VPBS4X4zC83DXroa6WTmR2OBAgBcPHQs=;
 b=MwpfFwJCVYWT2lJOCCRlaAu8MYgkZCDkbsWu7OgqcD2xUKPqACUEYB94SjAbKeraLOisA7
 Pqy2DQ0Q1gusONtdMP+4/9Q8uGyez3zftc5bs6WwkwMjRcJqktHWuAv3KtViq0mnMk9YwJ
 jPszyDvUKqMlgutTOwpIxQlXVMqW6Y7aNBx31PWWLk/Cqb91WSaNONrniy/0XkeOGlF9yd
 xkDBahimbgIEjvXKmWYbeF3uyfal1G5zA069/ftPQ7wv77pqbcC1wj6jDOb/H9LUzrwqlH
 lDA859ECAoFrosEHdg6TN+OB9qk8KzlPTyyfM0NR3bPaoByrwggTnymOLQIEvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MwpfFwJC
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: fix
 build with Linux 6.19
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2026 00:05, Christian Stewart via buildroot wrote:
> Add local patch pending upstream to fix build failure with Linux 6.19.
> 
> Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1254
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

  Applied to master, thanks, after updating the Upstream URL with the actual 
commit since it got accepted.

  Regards,
  Arnout

> ---
>   .../0004-fix-build-for-kernel-6.19.patch      | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
> 
> diff --git a/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch b/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
> new file mode 100644
> index 0000000000..64101a5709
> --- /dev/null
> +++ b/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
> @@ -0,0 +1,37 @@
> +From f17facc866cb36bc889f873beb36e7991fa5e71c Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@aperture.us>
> +Date: Sat, 14 Mar 2026 14:53:48 -0700
> +Subject: [PATCH] Fix build for kernel 6.19
> +
> +With kernel 6.19 and CONFIG_X86_KERNEL_IBT or CONFIG_KLP_BUILD enabled,
> +objtool runs on the linked module object (delayed objtool via --link).
> +The module Makefile passes --strip-all to ld -r, which strips local
> +function symbols. Without these symbols, objtool cannot determine
> +function boundaries and reports errors like:
> +
> +  88XXau.o: warning: objtool: rtw_mp_cmd+0xf8: unannotated intra-function call
> +
> +Replace --strip-all with --strip-debug to preserve function symbols
> +while still stripping debug information, allowing objtool to properly
> +validate the linked module object.
> +
> +Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1254
> +Signed-off-by: Christian Stewart <christian@aperture.us>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -22,7 +22,7 @@
> +
> + ccflags-y += -I$(src)/include -I$(srctree)/$(src)/include
> + ccflags-y += -I$(src)/hal/phydm -I$(srctree)/$(src)/hal/phydm
> +-ldflags-y += --strip-all -O3
> ++ldflags-y += --strip-debug -O3
> +
> + ########################## WIFI IC ############################
> + CONFIG_RTL8812A = y
> +--
> +2.50.1 (Apple Git-155)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
