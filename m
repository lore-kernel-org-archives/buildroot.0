Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB207CCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C78840CE1;
	Mon, 19 Jan 2026 10:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeJVB9HnWoNj; Mon, 19 Jan 2026 10:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D0040626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817347;
	bh=bfDQeHFzJo42OWAHgDB5fOjSqOk16m6VAGA6prtiTpI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s62TDmoebMwLhlRqNKew9FVmWnpSLZ1fIt5ZFJTvapSawfgS6dD3qUczeYb4rVNEN
	 cyL2y753gnXPqbf0fHRyjhUZyEjcZHSqbpwaa+x4Ct79ehuaciKmdH+fTsRtbpjUZu
	 Z9aLQ3LkPEm6+kpeCu4zHdnlHTDsBZOW1I91goLb1PuBdR3K9ziS8Its5p3qYzl0MY
	 /NIOHZnZpcv5xwRXuEg1wPoB9+2PJqafUjsGBQv6TNLXN5DhEomBKITT+pvWqeicKj
	 EXhAHk0QiCS3G22vmoa7Vz8i+yR1BQShKgtjG7XfFc4JOzVu1RfqlWvH+lcdkNSN64
	 fBhCBbLtVE9sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D0040626;
	Mon, 19 Jan 2026 10:09:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D1572CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AE9F40258
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k82xrEFTS13o for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D3B040141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D3B040141
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D3B040141
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 85FD5B97A1FF; Mon, 19 Jan 2026 11:09:01 +0100 (CET)
To: James Knight <git@jdknight.me>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:00 +0100
Message-ID: <20260119100900.12359-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250809033757.1197-2-git@jdknight.me>
References: <20250809033757.1197-2-git@jdknight.me>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817341; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5dbBkJDzU3ZcYdJGn4DEerOInG6rTCQyN/mQ/kAMj+w=;
 b=bjd9mmD8OqGY4vgWa3kAZKv6yyB5VMwaTXd9Ck//erZUlOljWmmsVmSfoqeKDprWpNAXes
 22jpTBTCVw+CoNzNmttgQW/ibCKjhRLXYhB0Jb4JJK9atPGFIrZRa3+zkvk6xGaK8i5DXe
 zXkUFuwEkOnI9ivub5SkPdfMyFY6as+ZkHUsqwhGcS0osWjj2+yKn12MmY2xxX55VbXF+J
 Mc6OJUpShOQL7JROkTrz1OMqLaiXMQyI9u96N/BD/cH5RIXi7RfBVNwBPSXm0a4n0G3X+c
 wBTOFgIlDrv0w4O9bmySCkIDczE/TdS8WYimUY1n7K/PYo97z3MtABUFjldaCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bjd9mmD8
Subject: Re: [Buildroot] [PATCH 2/3] package/libgtk4: remove schema compile
 hook
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
> Signed-off-by: James Knight <git@jdknight.me>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libgtk4/libgtk4.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
> index b00a2facad..f63e320629 100644
> --- a/package/libgtk4/libgtk4.mk
> +++ b/package/libgtk4/libgtk4.mk
> @@ -79,12 +79,6 @@ else
>  LIBGTK4_CONF_OPTS += -Dbuild-demos=false -Dbuild-examples=false
>  endif
>  
> -define LIBGTK4_COMPILE_GLIB_SCHEMAS
> -	$(HOST_DIR)/bin/glib-compile-schemas \
> -		$(TARGET_DIR)/usr/share/glib-2.0/schemas
> -endef
> -LIBGTK4_POST_INSTALL_TARGET_HOOKS += LIBGTK4_COMPILE_GLIB_SCHEMAS
> -
>  # here, we build a native gtk4-update-icon-cache as host-libgtk4
>  
>  HOST_LIBGTK4_DEPENDENCIES = \
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
