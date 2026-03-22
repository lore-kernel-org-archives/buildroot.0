Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1080EFC72C2
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 11:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79942840E3;
	Sun, 22 Mar 2026 11:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wysXMfqO9I91; Sun, 22 Mar 2026 11:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF3E8403B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774178467;
	bh=VjQdcS1gJjJk2iE/Qm3ZyVzLOd8vLWnTDp0zthjEOXc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oNuAtx4BhipXlpud6bFH3WXtOl4fGaNgCeutM8Wu+1c/0ue1Pzq77AETeTWhpq1CW
	 JqmEqHNrnKgsIzQnUkAuWrelbZlubklDuFFOlHa9HrPBu9ISIBlhKa0Cxw2io2PFdN
	 NBtJCtTNKeISQpG2oowah3hXxHJb0Quwz1CRt4qpdEs8DAOqU2wfqD4pMeXb/2zf7G
	 sJ2G5PmvDhzbUntUedU9FXRM6W114NR55yoEnOSnCLNF6vk7qjfjPiD8enCLP4TaSG
	 1wZzHsDF0EFTosLJm0519Wd9t3dp6RNslN+PJ2LCeJlMuxC33E5dgvSsFPi8FzSjyk
	 KY7cj1RH8pIJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BF3E8403B;
	Sun, 22 Mar 2026 11:21:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18B932CC
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F28524030F
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0JDGjAnCBnk for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 11:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58DE34018C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58DE34018C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58DE34018C
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:21:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DA621B0057C;
 Sun, 22 Mar 2026 12:20:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Mar 2026 12:20:59 +0100
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 12:20:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260312163737.3178306-1-bernd@kuhls.net>
References: <20260312163737.3178306-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <8f6fd493e0b6512548074419c0a78b25@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774178461;
 bh=hlJ1Bt8FTQurvPG13frhwLzRs4viz7T4E62MBa+Idec=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q0g7+Wd1P74kJc26fjuUvImGVc30gSu9H50BE2KaGStBBwZtPFvp7/y3apwtgCqnK
 VGndWr/OvIPoCMpfCsriu65X8gmShyo5v+ae9TQ9KcA+iZH4+IMoOmOTN60AiD4vC9
 G53vpkpuLKowrNA3PFGAchXB9VPqqJbip1fwX37fzEkU4szmAoFfKGMbIg8BeL5aTQ
 78jInDJhnyvLqrodHOCphWsX+VfxrpMaoZRcQ9QV7AjeafEWy75a/p9ouKhQk966MP
 cPYt/msGLPXEkIHb1f11aHg2KOGRRZE/bgbrHya9F3/0ZlWtLJATNMbauFVgX9TIH3
 4URnDvNDyDd0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q0g7+Wd1
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.1.4
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

On 12/03/2026 17:37, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.1.4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
