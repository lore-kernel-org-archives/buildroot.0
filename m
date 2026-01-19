Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0703AD29C39
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5CC461272;
	Mon, 19 Jan 2026 15:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2-aJno1h02i; Mon, 19 Jan 2026 15:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D71B461281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768837653;
	bh=dOLECBZ1pyXNI2TXzH5Gwh8ELgBLHFwDexti/e9Llx8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iADHk3TXPFymck5SHgU4OFdqGUvkfyvNN74cbxuYrjmJDOGQ8NG3U28FK9XUEexVZ
	 8D0Z1ZppjEGUOn+2kjp2MwYaK0/imD7Affr7deGcu0hapwMSwvdTrP3otR31kHxkf1
	 bEszXOL6AQVbBUOOXim4lslSBE6B8P74BiAthntt0HEWlsc6JV/Q3hdlieT88seoIz
	 OCXVSYmNKEHNy7wvFsZVFywRWFdlq/W/QDVUnAi3WfYdAjBT2A0Fmfsjd8pDTmtBbD
	 2DWFUakNnwjYeftg6LWoAMTVgds+Me0dN/Pb6b8y5L9YslyQk9urP9oy3cRLrENyr4
	 cpGGBgXDBs0MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D71B461281;
	Mon, 19 Jan 2026 15:47:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FB12160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FBD84017B
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qI3e1Fiy2oaY for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:47:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6211E4007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6211E4007D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6211E4007D
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F296B97A1FF; Mon, 19 Jan 2026 16:47:28 +0100 (CET)
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 16:47:27 +0100
Message-ID: <20260119154727.74068-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105-uboot-2025-10-fix-build-on-lts-v1-1-51997f7758a4@bootlin.com>
References: <20260105-uboot-2025-10-fix-build-on-lts-v1-1-51997f7758a4@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768837648; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=JkyCRW6cZ08nKo+TL6ZClvSASjqIzoCX0ayWsOmaBL0=;
 b=e14gKqegdx2tVWwrhrUnA3Ay9EIisFg9Vbr/qZ81GXkr5MIqnfSq8JlfwANeOR+g0i+wff
 VYcxY42r6vU3NR0kae2RfpjshDsod/67y+WkOYtern0YKS/JOxQIqReXwazzUV03ZFExQ/
 t2+nu4RuFW9PQ2w7cfborfr7/2niw13+TtR4UzC9pHj0+gXObKqo8pKTMq1j9WthtVTy3q
 YQmYLz24cNCb2Dcsqq8CUeKVEZ1DcwWizl7m6pSgVGehSg4T+3RkF38sgvATmMUxYQcvzy
 Qle7TN6q59q/mHl4IAqKNgAeT971qwSXGoGmcj+ljt3LcddmtFbz/++lJYSI8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=e14gKqeg
Subject: Re: [Buildroot] [PATCH 2025.02.x] uboot: allow building versions >=
 2025.10
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
> With upstream commit a239b0b0b6db ("Add symlink from gpl-2.0.txt to
> a COPYING file"), COPYING is now a symlink to Licenses/gpl-2.0.txt,
> causing the install command in UBOOT_COPY_OLD_LICENSE_FILE to fail
> because the source and destination refer to the same file. To avoid
> this, copy the license file only if Licenses/gpl-2.0.txt does not
> already exist.
> 
> Link: https://gitlab.com/buildroot.org/buildroot/-/commit/128c26f2875dd60ed5fafe25f63b3da11bb79f60
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to 2025.02.x. Thanks

> ---
> This change was applied on master as part of commit 128c26f2875d
> ("boot/uboot: bump to version 2025.10"). This commit is only taking the
> line to allow to building a recent U-Boot on stable branches.
> 
> To maintainers: I'm not sure whether I should set the original patch author
> as the author of this patch, or add a Co-developed-by, or something
> else. I'm fine with resending with such changes if they apply.
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2796b0a31010..0d77340f85a4 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -307,7 +307,7 @@ endif
>  # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
>  # legal-info finds it
>  define UBOOT_COPY_OLD_LICENSE_FILE
> -	if [ -f $(@D)/COPYING ]; then \
> +	if [ -f $(@D)/COPYING ] && [ ! -f $(@D)/Licenses/gpl-2.0.txt ]; then \
>  		$(INSTALL) -m 0644 -D $(@D)/COPYING $(@D)/Licenses/gpl-2.0.txt; \
>  	fi
>  endef
> 
> ---
> base-commit: e81d65de87f710d711fb204e2af4ac07d26feb20
> change-id: 20260105-uboot-2025-10-fix-build-on-lts-5c186b4338f4
> 
> Best regards,
> -- 
> Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
