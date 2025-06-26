Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CA1C7EE32
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 22:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C4BB417D4;
	Thu, 26 Jun 2025 22:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoS_Tr6W3AsL; Thu, 26 Jun 2025 22:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7370641860
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7370641860;
	Thu, 26 Jun 2025 22:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B22511A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 22:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 082724195D
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 22:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRNrVA8AM4Cd for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 22:49:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12691417E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12691417E7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12691417E7
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 22:49:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E427819F57B;
 Fri, 27 Jun 2025 00:49:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Jun 2025 00:49:40 +0200
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 00:49:40 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250626174625.170714-1-buildroot@bubu1.eu>
References: <20250626174625.170714-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <6d68233726b978a5f41f2e8bf783eb5d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750978183;
 bh=cZPNFD3Ac9jSsVUEoZhBkjJnJ58xNZy5ycA2ZQYp4M0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=em87nj6p9/e8Qo64IYuGoeDq9t3yAbYNHqzuu4CAYnVE8AgeXndxSFGIKxwy9UksN
 PdXLUwpw4ENvWmVnjnJBA4eo3lglzmxHc9OAXMJ/WeLw3IQdGN3J+4Ta2OY3BmR0yc
 ZXWxBSze4ZqBSR5ELkoe+fvfGD4ZeSDGoHcqZhCRXio1ieSngcljE782UCE740T40A
 5rT/S/vs/3GiChPbrx//L+vxfS5RH215lfCex1KjllCBqtIQg4Iu6dnLxcS92M/hVE
 T4BfiyuATscKo3Se3Yg0abJMDvIYFTew/FPtbFHm6qnfjIbcl9rKsA9JzIMkySKCjC
 bEp+Js59nrujA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=em87nj6p
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to 0.115.14
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

On 26/06/2025 19:46, Marcus Hoffmann via buildroot wrote:
> Release notes:
> https://github.com/fastapi/fastapi/releases/tag/0.115.14
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
