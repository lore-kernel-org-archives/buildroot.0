Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D842FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 20:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F30616B0;
	Wed, 29 Apr 2026 20:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JseIzd9hzfIQ; Wed, 29 Apr 2026 20:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A614A616B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777492864;
	bh=igqpS6deUT/goJwZ/vp3J84cBe2QjMAYBeH2ngSvp7g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B/PkY9tGDO0iGnydKHP3SsS3twbWi3Uo+cNAd+WdKCVIGa5W8LUzmB+MBEzn1lK+R
	 +ub1/VuechhmaHNyGAPJ5c/dAsALJUAm++3rI92GRK/fJszVDqx+6gS6KMIK1ag4pQ
	 I4hgCh2lZ+AE3nwe8sWkrNTPBbP+G0CvS8hYK9gQiGkqgtSXJ8jmuYdY2ocVdXlwBG
	 oWn+HCG4/zgAIkDVNjUJvGXf5BuXQvu8rQagbaoyoNN+Ms7gEoZxUez1vRyrvkIWck
	 B4vahbo0MRr/NbcA1ZQqm8T9/AACK06ZAY20ti13t2BpLl160yNeTv5rVevhf1hUQi
	 58bTbVuUaOtNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A614A616B3;
	Wed, 29 Apr 2026 20:01:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E106192
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ED3F616B3
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jc-QHXWsKDRV for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 20:00:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F5A4616B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F5A4616B0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F5A4616B0
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:00:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5FF73B0051E;
 Wed, 29 Apr 2026 22:00:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Apr 2026 22:00:53 +0200
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 22:00:53 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260429184937.2405733-1-chakrabortyshubham66@gmail.com>
References: <20260429184937.2405733-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <daf7c82d8c392faebd0b5d008a637839@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777492854;
 bh=tXzOfDRPoBWQ8p5HHBMbQVaxPJH0dSFurbF/fqQPP+I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XV31TI8T2wQq5BaWNdSPu6Qyznz4nwa6Oj+JVGxDbjjNnBaS8xIkXAdQjmZ+HfQmX
 eS2k1GV/9lxmj/vQdmALsbSFzLSTbw8pOm5FQmMmlKKp3yDCY1hNLVdpcZJKele+I/
 X7Upvk2AKdy6Rcc+bZybWjnKDI+Yz/Q0Po3dkAABpuhT2M+TWwnXN2NKwwfUiSQW+a
 E/FsCcg7DweHtpqcurK1o0nJY9UERDh4ow7xs0x70s3DA9GKmM675DOS7nAH+jXwcU
 +BSbgj2z3RoV7zgx/5DcVnOHVfneTWqw5A5ZF8iO5tA0Kvlr4kdSUGOgK7i5hWAHvL
 jCEmbRWAX1YLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XV31TI8T
Subject: Re: [Buildroot] [PATCH] package/ed: bump to version 1.22.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/04/2026 20:49, Shubham Chakraborty wrote:
> Changes in 1.22.5 (released 2026-02-06):
> - Fix sizeof usage in set_active_node: Use 'sizeof active_list[0]'
>   instead of 'sizeof (line_node **)'
> - Improve error message: Change "Is a directory" to "Invalid filename"
>   in may_access_filename function
> 
> Changes in 1.22.4 (released 2026-01-03):
> - Skip check of ISO-8859-1 names on UTF-8-only systems in test suite
> 
> https://lists.gnu.org/archive/html/bug-ed/2026-02/msg00000.html
> 
> Tested Using:
> - utils/test-pkg -a -p ed
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
