Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6682D41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB92383C92;
	Thu, 11 Dec 2025 19:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlK6snC6n_zq; Thu, 11 Dec 2025 19:32:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00FD82977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481559;
	bh=OZ2llq42Y/KvYX30m9FNR/Ra4ndEuo6So+e70Ku+5BE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=snMGdvST0ZvhBsvT51MZgxzajL7ZlG9FopSVpl9FkHjHPAZcIwTnk9G8e2KYHLjI+
	 xNyY7Hub03UsB43EaTqpHRjayqPRihE3Hr0e6AL/bHxZ5KhhuJrHiSNPHMy6ktOTB/
	 OoRtjcCBrwpXsMHNDOYTdw2kChb5KXdSXcboVsUoH+IbHACbEntLLrCPu+yO/lkcTz
	 SNAhE6gNkWI5SbDs1q00aRH0Z1TH8jJKf1zz24d/PWrxnLkza14GjYbOLRmeqRIQEs
	 TNjdZr7y7ARb5YGBJGBV5ks16Epapk7Eq0TSU8nIV8sTZiIu8jWbsipBIDxEzYWrhZ
	 S9pacT6cYh/JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00FD82977;
	Thu, 11 Dec 2025 19:32:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC73AE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE228605D2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0TdxbuyluZG for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B431760592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B431760592
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B431760592
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A641EB979EEF; Thu, 11 Dec 2025 20:32:35 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:32:34 +0100
Message-ID: <20251211193234.1100956-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207124910.3563028-1-bernd@kuhls.net>
References: <20251207124910.3563028-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481555; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=VcUEJ7hSX9tVKPWlLmLWkr23LQcWX+Gu63pBPAcCaZw=;
 b=PXk2egVASiUifrCYhbU85hLRMXqlhX1FHqMQEKz4CxGCj/XoDKr1GBBfz7dwhmChpkXv1y
 w7sxGAYjuzNsgTFKkvOGLR49kJdXoSQehN3OJgIkJ8Npiccm/aj1llBdSTFq5YOJY9eu+p
 micTbgr/yVNDctr9eAEXU6B0WiccsAVE0NYz0tR2DZXVW6COtnKmP1rW/NNWetgIwtUWw7
 Xmad9GVEEBT4wxlAQnsJN8t89cWPDIzWoasGp6hRcrGlVvv/DtdAMKcWAiyoi84EU+IpmX
 MzFO+kbz9L6N8bkXf9zSaLe2v+fS4Ab6YGbLERvysVbv1rOrtMgKBGOr8sFv8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PXk2egVA
Subject: Re: [Buildroot] [PATCH 1/1] package/xl2tp: fix build with gcc-15.x
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
> Fixes:
> https://autobuild.buildroot.net/results/bac/bac6a0cb3f38b0de5b0376e7eba5e0ede5fce589/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  .../xl2tp/0001-Fix-compiling-with-C23.patch   | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/xl2tp/0001-Fix-compiling-with-C23.patch
> 
> diff --git a/package/xl2tp/0001-Fix-compiling-with-C23.patch b/package/xl2tp/0001-Fix-compiling-with-C23.patch
> new file mode 100644
> index 0000000000..6f32e7df35
> --- /dev/null
> +++ b/package/xl2tp/0001-Fix-compiling-with-C23.patch
> @@ -0,0 +1,38 @@
> +From cabd67927d8ed565c36cdd0cbf9b9dbd71606009 Mon Sep 17 00:00:00 2001
> +From: Jaco Kroon <jaco@uls.co.za>
> +Date: Thu, 21 Nov 2024 00:12:29 +0200
> +Subject: [PATCH] Fix compiling with C23.
> +
> +https://bugs.gentoo.org/944070
> +Signed-off-by: Jaco Kroon <jaco@uls.co.za>
> +
> +Upstream: https://github.com/xelerance/xl2tpd/commit/cabd67927d8ed565c36cdd0cbf9b9dbd71606009
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + xl2tpd.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/xl2tpd.c b/xl2tpd.c
> +index 791d5a4..4bf15fd 100644
> +--- a/xl2tpd.c
> ++++ b/xl2tpd.c
> +@@ -74,7 +74,7 @@ static int control_handle_lac_hangup(FILE* resf, char* bufp);
> + static int control_handle_lac_disconnect(FILE* resf, char* bufp);
> + static int control_handle_lac_add_modify(FILE* resf, char* bufp);
> + static int control_handle_lac_remove(FILE* resf, char* bufp);
> +-static int control_handle_lac_status();
> ++static int control_handle_lac_status(FILE* resf, char* bufp);
> + static int control_handle_lns_remove(FILE* resf, char* bufp);
> + 
> + static struct control_requests_handler control_handlers[] = {
> +@@ -1549,7 +1549,8 @@ static int control_handle_lac_remove(FILE* resf, char* bufp){
> +     return 1;
> + }
> + 
> +-static int control_handle_lac_status(){
> ++static int control_handle_lac_status(FILE*, char*)
> ++{
> +     show_status ();
> +     return 1;
> + }
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
