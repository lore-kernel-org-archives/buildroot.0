Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E78DCCF2D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD9481C58;
	Mon, 19 Jan 2026 10:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBtrmIDQPYmX; Mon, 19 Jan 2026 10:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B7681C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817345;
	bh=AOC82qsqiRoEDAj6QXdKhEirDkg98MJ9i/tQojAS3EI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=odTphjUqG76L/ui/wuYgxfUhHJXULez0MrahbA5qsf2X/FQr/d9+mUiYimVjP3vMJ
	 +OtzDsAaTjMoWHDUaSdsfLw8uBaNZe/vTrQAfB6qAYjJ5xnKGeFUSZBKZ5KLoVR5H5
	 mSV8LmIJFmB1MKyjHWtp77Yylk8ABi90ESINsmlNo0fLSJd0NwL/YVdGXKAUmVNNob
	 0CaulJZHiHpKg8m0bClLwmZDQfOIrRMgHLJrs6Lecaenl/Y4rovsLqMNBtLtKYeOR7
	 NQlKS7HLoJw2TyyBcfArL/k1X5P11QP1wAuoggJn7DwXk7af2fkpDKhQU8lJmOUwVc
	 TYRvXn19N1Cyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B7681C40;
	Mon, 19 Jan 2026 10:09:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70E5F160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F42340258
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yP5irSBjAhQ8 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23B9240141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B9240141
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23B9240141
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C566AB97A961; Mon, 19 Jan 2026 11:08:59 +0100 (CET)
To: James Knight <git@jdknight.me>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:08:58 +0100
Message-ID: <20260119100858.12305-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250809033757.1197-3-git@jdknight.me>
References: <20250809033757.1197-3-git@jdknight.me>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817340; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=YEcfUuh5QiiLVmIRDgmtWt7Jb0dc95BkgIEVgoj3dic=;
 b=Qq+1NXGQCVEyToZ2zOttiZ+bU+z+WuGUx8CABrhEgeWyuIDrmwmDgyodGQUqopqtyds2NY
 vw5FMLMyd82rhp1d4uZ1gowzwXKfAPozfuUc6xiuR3s0pLu8YU/cv2LC8pdEC7KyAJIR2H
 o0z4Jm4BdSly3IUkAb5RHjp+UZM29SVmWP8/CqiuaEgCQgqF7FUJu8Q+YFFVOy4k4o5K2b
 C1UFPbLeaDeXnKY8u5mcf0rV9E0LXGNGIcZlvjFvaLvi7FM3Ozydq6uX+ktb7BpAIL1ugo
 zyiARAR+j3O9LykFsCcyqQPGOnReLHXSseiEZpGkw5mqDyJOmPWIT8p8Tyn+7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Qq+1NXGQ
Subject: Re: [Buildroot] [PATCH 3/3] package/gvfs: remove schema compile and
 cleanup hook
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
> Dropping the need for this package to compile any schemas as the
> libglib2 package (a dependency) already handles this during target
> finalization.
> 
> In addition, libglib2 already removes schemas from the target during
> target finalization so the gvfs-specific cleanup can be dropped.
> 
> Signed-off-by: James Knight <git@jdknight.me>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/gvfs/gvfs.mk | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
> index b46b438dc6..6eff3bd859 100644
> --- a/package/gvfs/gvfs.mk
> +++ b/package/gvfs/gvfs.mk
> @@ -157,16 +157,4 @@ GVFS_CONF_OPTS += \
>  	-Dtmpfilesdir=no
>  endif
>  
> -define GVFS_REMOVE_TARGET_SCHEMAS
> -	rm $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml
> -endef
> -
> -define GVFS_COMPILE_SCHEMAS
> -	$(HOST_DIR)/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
> -endef
> -
> -GVFS_POST_INSTALL_TARGET_HOOKS += \
> -	GVFS_REMOVE_TARGET_SCHEMAS \
> -	GVFS_COMPILE_SCHEMAS
> -
>  $(eval $(meson-package))
> -- 
> 2.49.0.windows.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
