Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6352D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D4B184293;
	Tue, 13 Jan 2026 19:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZvm9w9FgYkA; Tue, 13 Jan 2026 19:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFDD484270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333605;
	bh=pA5F3CvwSgWHkmo+eOPcD8EQgGCTeS/tvD5XWEC0VDA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dZ8y+Ihj8QXUXLTBC/fA3vbQ/i60rXRi5RaHmyDyLOFBDZejykYqsq0lsmBYSxA8y
	 YeouCR+IoAMn7Wz0DI5nmlfp38lRaNa8KmFhVlF/zun8e6tiOg+ND86yGZwkxGFtaL
	 MgUcFNjCU7vZVisKGWMrb6vKpcPkfoxFG5D3Ra5iX4nEybyF2WF+RyVYbiBy2hN9q0
	 b3SqhUd9WJO4xwBXXS1/1ex/15K2URzIxiCAziys1Ocg95qqSa+KpKOrKkMsdyrpJy
	 uCHlGKeMlDIRuoWVUbFn/8xBZ0c3rKQ2rz8K5XsJVMCqfU8Hgtuy7uAdEKK70QsBKB
	 Tcky+oaog4TRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFDD484270;
	Tue, 13 Jan 2026 19:46:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98644231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F7B240376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iSbs2-hwWFB for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 723EB40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 723EB40373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 723EB40373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8B8DBB97A863; Tue, 13 Jan 2026 20:46:41 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:40 +0100
Message-ID: <20260113194640.98908-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230222031.3626500-2-giulio.benetti@benettiengineering.com>
References: <20251230222031.3626500-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333601; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=g0iCL4INj+XaoTx1+A+mroek58kCqYWeIE1lLpnbM8s=;
 b=FbVwCMnMojNnZpyXg3U27I6IklcHCeZ8vRPTod1iF9mDLAUca4Zahb1GQhEttV6NufJexe
 tRiplTgazMDg8Xl712A+mRFMAN6KSaaud1C7pnMEGImX+cdNb1+XzuXvBZ4jRZKlg4ZAZw
 ki74eRdih+DHdNQdbP0HPMm77KZUs17fF7faKVR/DeKrjvzZ0Q40xPo1JoehtWdPq4924d
 5qP5Y0rt+QHmS1jrfnGa8nZnjSglPInSVi1TjE9seZjt78ujFOze7ua7wRAwCqcJvW/bQz
 iLvhUR5fdSb4kZ9BGvYScCK15natmxE/G+QyaTqDLWovEJotCpVHIP1b5PlvEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FbVwCMnM
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to Putty
 package
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
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 97a2701df8..73ece0231c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1318,6 +1318,7 @@ F:	package/minicom/
>  F:	package/mongoose/
>  F:	package/mmc-utils/
>  F:	package/nfs-utils/
> +F:	package/putty/
>  F:	package/python-libconf/
>  F:	package/python-uvloop/
>  F:	package/qt5/
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
