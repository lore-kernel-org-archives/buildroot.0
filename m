Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA91D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5948438F;
	Tue, 13 Jan 2026 19:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-IkjHkm7ENv; Tue, 13 Jan 2026 19:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BF548437C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333649;
	bh=XVun0qJGQ0DINTh8HAL/VApW6J/pW5JzjShBYOBSuRc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TTLoowDIlUZyMH57SbkFu3oioNfmSgfaoNl/c8iIugais2EzJc//TYqfew9FRp5Pj
	 BFoRUw6fFdGL1expe7LgyEKf/Nm5e7kwRojqXxbZsobo2XCoSyfNw4/3d7l8vTBk7D
	 57anQQYWrT75guB8Shfd9T2krjlncXye1JSqPgvZpWNTer/+4ZOwwF2tqO7/XG+z+G
	 qJ+cWJQhDJZm+0wVFvyecKnpCZJ4dnYMluORJ98V5mzuBeSjPKybE2zgtbxIlN/Pzd
	 XMmg7cX6f1kMFEibpcDyPmaGgis2WcJHRJSsvAgEN+f80sD5jKcf7bI3vs03Fm25MM
	 U8VwZzVW3JngA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BF548437C;
	Tue, 13 Jan 2026 19:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D49EC1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5BCD8437E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qALZ1TM05YrR for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9B8A84375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B8A84375
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9B8A84375
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EAB15B97A863; Tue, 13 Jan 2026 20:47:23 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:22 +0100
Message-ID: <20260113194722.99812-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260101180045.247057-2-bernd@kuhls.net>
References: <20260101180045.247057-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333644; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ykQd/hDO0/olfqGIytWLzFWiROfnLBPUg0hN7Rualkg=;
 b=kEvJzA4/AabfYAacIKZt7QAAJgt3HWNRDhANX6kkAP/2uPSsD/pcFnCAfWhuEmG8YNOfB3
 cD8mcT3+w6ySAxl1LrO+lCAyxiEnhx4xM8XgrEBGNDXlZfwDzd6fDW9y4rZslRr2rraphW
 NMe60+ZhN71L1aFMHv1TlIW/+3c5skvNF9/iaM6YfDhPqKzeRLvBCSKRoDpSaBE3fPixLw
 SM90B7IzBuz5Z3yhJi1h8MRu0BwEwRuWhsEf5mrkoDFW5NPb/yhi4A8bShe/uJxv9Z99DE
 OKbMmd/I13BP6471EOFi4abO+0yOpsK1mb+hBsrRk3mFy6yqjD6dBQVHp9v37w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kEvJzA4/
Subject: Re: [Buildroot] [PATCH 2/3] package/libdill: update project URL
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
> https://github.com/sustrik/libdill/pull/228
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libdill/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libdill/Config.in b/package/libdill/Config.in
> index 2376fc9698..ec649c6600 100644
> --- a/package/libdill/Config.in
> +++ b/package/libdill/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBDILL
>  	  Libdill is a C library that makes writing structured
>  	  concurrent programs easy.
>  
> -	  http://libdill.org
> +	  https://sustrik.github.io/libdill/
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
