Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2789AD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F16CB40E00;
	Tue, 13 Jan 2026 19:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9YF14QsZC3U; Tue, 13 Jan 2026 19:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D5C940E01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333644;
	bh=WZlZXdQyrsNuNqDfGDKfV7c4LLt/FOb61SiUa+i9+4k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ICjP9WvkoaeZTXLLPFx+7x8LXiIHFEP3SaPBzBdcexFUSgNEHfIxDKb+p2oWSZtzg
	 OAo16gtZ+ivucZ751e/i3/RalJD9lYWnuh6/YPdnCgrUzrFD+pMkk9bqUWfDeeDwv+
	 OVqaZnUXwHcC9P4gBINq4GX7Bho/b/pX6+vyamCdOT607Pd0j4OvGqMO0XfgjaroLl
	 jz6VEAYVBf2woJb6LQmeACaAONqj8fg/GPTxXi33E3IZ2qylacfdF1NTK7xiQahxsy
	 rXBRl3VouXw3vNZZXzLhNOWKx9e0p3ugr42NOGqJx0fd4goYWejLjTGyc4FPf1yHGK
	 Ow9XzteqRfKLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D5C940E01;
	Tue, 13 Jan 2026 19:47:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A4811C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FD1860BD2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRPjQjyIXy89 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76EBA60BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76EBA60BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76EBA60BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AAA4CB97A863; Tue, 13 Jan 2026 20:47:19 +0100 (CET)
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:18 +0100
Message-ID: <20260113194718.99710-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230-libxshmfence-shared-memory-dir-v1-1-03a64fed2269@gmail.com>
References: <20251230-libxshmfence-shared-memory-dir-v1-1-03a64fed2269@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333639; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=x8PJ9kAdeaK4Wz0cQGVn7p5h1iJeluwTSt+/jntksyA=;
 b=BWaNQKoIqK+Ww6IXhN44zbA4iwPhbbxBVoXQUTEFtEMcv0SS6D4hdw6r1BAduZPI08eEvV
 CS03OxHHjF2DYXsWisIymUSVYk3B9GMqT/bPa76AZQJADAD4FWtICDpdrKJN5VnanUtolY
 oFKYBzhJVWnbXHVwTVpM3HyFlvV45gCVmD0+56+LPICaQ7WdWppmrwh3darTJkpFIYUDJz
 yH1gBSMc29vLEOmO9qp8bkt6wpdOeHmqWA1J7CO3OkCpCSrerG35JSetaO2rawcCpy6mz4
 P3I/6k1HVFjcWnNWep/PA+VIb9ze7njLUz4vlR8RZOEiTMi9YDaUVDAK1l2oeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BWaNQKoI
Subject: Re: [Buildroot] [PATCH] package/x11r7/xlib_libxshmfence: set
 shared-memory-dir
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
> libxshmfence has multiple paths available for the shared memory
> directory, as some distros [0] opt to mount their tmpfs in a
> non-standard location such as /run/shm rather than /dev/shm.
> 
> The default value of 'auto' will set this path to whatever the host is
> using, leaking host configuration into the target.
> 
> With X configurations that depend on shared memory files for futexes,
> (muvm [1] is a notable example), this results in applications silently
> breaking during presentation with a blank window, as the configured
> path doesn't have the required tmpfs mount.
> 
> Set this path explicitly to avoid situations where the host context
> leaks into the package build, causing feature breakage.
> 
> [0] https://wiki.ubuntu.com/OneiricOcelot/ReleaseNotes?action=show&redirect=OneiricOcelot%2FTechnicalOverview#Upgrades
> [1] https://github.com/AsahiLinux/muvm
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
> index b8c9ebfe97..6461348891 100644
> --- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
> +++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
> @@ -12,4 +12,7 @@ XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
>  XLIB_LIBXSHMFENCE_INSTALL_STAGING = YES
>  XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xorgproto
>  
> +# default 'auto' leaks context from host
> +XLIB_LIBXSHMFENCE_CONF_OPTS += --with-shared-memory-dir=/dev/shm
> +
>  $(eval $(autotools-package))
> 
> ---
> base-commit: f1e3a29a5b11ea373aef3260afcd0d1203fa2c99
> change-id: 20251230-libxshmfence-shared-memory-dir-b4370ef20303
> 
> Best regards,
> -- 
> Joseph Kogut <joseph.kogut@gmail.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
