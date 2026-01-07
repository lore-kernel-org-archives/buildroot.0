Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A28D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE66B40F89;
	Wed,  7 Jan 2026 17:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCA5nSbPyA3J; Wed,  7 Jan 2026 17:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E568740F96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808327;
	bh=YhWJdOxLWtamhIJ4HUvsieCNTjjsIK9jAfmtI2RPEew=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KtaUCx7f9vgC7lSXEi6mby9XRibZfGtsNiwGGpEABSTc/bjR9Y7Uv4Fvlc/xXeEXv
	 XLWyA2JwWG7tb7dF5UVOwiDqUkMHYU/W+3XCtDiiEwG8E+baSavWmieqBXKMvmZPYS
	 AQkpyGI9OKdRKc5H7Vw6A6Jzx/Zs2NECltmjJcs/w5L/AMghBcRgjIJuL/0/e7kwV2
	 Qea7lIFCxEJw63RM5zrAwIpyt979DtUclqUzi3MS/VsrvIjb2gKkD0l5ZIgUhXQRTx
	 4MgBiA6jD47+u9iO0NRgFYaCKIBnFHBqSqC1viKpKXuYlfQU2sCLHvQubYxgzhlB/3
	 cm4o9vzqA7Ovg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E568740F96;
	Wed,  7 Jan 2026 17:52:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9737B25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 891E760661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6xHXRl8TKAN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8670060667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8670060667
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8670060667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E234B97A704; Wed,  7 Jan 2026 18:52:02 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:52:00 +0100
Message-ID: <20260107175200.228616-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-12-thomas.perale@mind.be>
References: <20251229090719.13291-12-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808322; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=4HbCfEGs0VoAkDDdN+u3YyqIxPQfG6hi4DJ4DvRmPH0=;
 b=lZ82EgAGV/HSs9riDgvdNrVxUqWXJ9oexDMh1R8L+sleXy+RQiONMOb1q7OsRhEVZu02I+
 psdMlBXFnIdmuTPL9+TZGcWCl0EhM2v6w2AR3V2gYx5wjqZv/GJmzHerMUPvDorQgYNkY1
 NOQemTr0lWRZGgF+i/hsZ18LAztxC22EGg+OXKWMrUMzQcOPm393s7gHSh4Y1FJVSo9pgn
 tU6nEe9e/1/JA+dhwcoWh2xDDIemCbfFoCL4hxlVBsdYUgkO/5bHg7bbvywSiIt7p+kaS7
 2Q4IKi6514Ev28gKWrLwQ0VmFXqcZ+0BnJSLXCZCemWb0jJ+MbOvhfzNiiZCSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lZ82EgAG
Subject: Re: [Buildroot] [PATCH 12/14] package/sdl: fix patch reference in
 IGNORE_CVES
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
> Since Buildroot commit [1] the
> `0003-SDL_x11yuv.c-fix-possible-use-after-free.patch` patch reference
> was renamed.
> 
> This update the reference in IGNORE_CVES accordingly.
> 
> [1] 9fab7bb79d package/sdl: drop directfb support
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/sdl/sdl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
> index 439c30b2a5..29697fe3c9 100644
> --- a/package/sdl/sdl.mk
> +++ b/package/sdl/sdl.mk
> @@ -13,7 +13,7 @@ SDL_CPE_ID_VENDOR = libsdl
>  SDL_CPE_ID_PRODUCT = simple_directmedia_layer
>  SDL_INSTALL_STAGING = YES
>  
> -# 0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
> +# 0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
>  SDL_IGNORE_CVES += CVE-2022-34568
>  
>  # we're patching configure.in, but package cannot autoreconf with our version of
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
