Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99543C3ABC3
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 13:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5636083C7C;
	Fri,  9 May 2025 13:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6mlszTLZ3xM; Fri,  9 May 2025 13:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1339F83C46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1339F83C46;
	Fri,  9 May 2025 13:41:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E14C15A
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F2F240E3C
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNklc1mpo1nC for <buildroot@buildroot.org>;
 Fri,  9 May 2025 13:41:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E50BC40DEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50BC40DEE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E50BC40DEE
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:41:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DFA75B00585;
 Fri,  9 May 2025 15:41:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 May 2025 15:41:06 +0200
MIME-Version: 1.0
Date: Fri, 09 May 2025 15:41:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250504222712.213695-1-giulio.benetti@benettiengineering.com>
References: <20250504222712.213695-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <5678d5fea7727d479ebd13ae88a4a523@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746798068;
 bh=6pY+/HviRn6SA51yJslu0SDCluSrfT9piA3XzhPb9NA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hTEHUfQyrxCgle8iXbZV/F1O4x/CtzdotDqxODXCr9Z4bgGPZlLbU8ziKlM7/SK1L
 L2fTFvymzHK3VEJJYUB0SfPHUweAI9x1u2e9UBm2dNY7V+IfLt9C/snWKztAP0Z4Km
 lLG5aX32Eo3SOeOdN6QMtP9IkFvmBFtQYADOzr4MNAYXumXXaw7ejHWKDoqCwqRkpD
 beQYgraAMWdlTZ5P89UAdfNFl4AUq0l/uZhHdILiFCSCo4Zt0zaQzfDMrjRyxfZEPX
 TN8yluo+JqDz9jkHiokM1F/nlgJ4RPMyawXVArtOYywdxC4y6yMMsmNK7HK1ZgAkPr
 PW65HObd63DeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hTEHUfQy
Subject: Re: [Buildroot] [PATCH v2] package/rtl8812au-aircrack-ng: bump to
 version 2025-03-30 on branch v5.6.4.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/05/2025 00:27, Giulio Benetti wrote:
> This version adds support up to Linux version 6.14.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
