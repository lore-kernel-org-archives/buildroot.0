Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18772C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 20:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE0D14123F;
	Sat, 15 Feb 2025 20:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuyQZVdD_SiM; Sat, 15 Feb 2025 20:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D5A441234
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D5A441234;
	Sat, 15 Feb 2025 20:41:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45020DF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DD1983EC9
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4z2A22uMFJGU for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 20:41:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 645D983C45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 645D983C45
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 645D983C45
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:41:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8CA92780383;
 Sat, 15 Feb 2025 21:41:13 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Feb 2025 21:41:13 +0100
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 21:41:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250215202512.559928-1-peter@korsgaard.com>
References: <20250215202512.559928-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <263ac7ac499145d30ac1dd8260077d9c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739652074;
 bh=dtK8L1F2uaRZsK0ip7QKaJ0lybv8UaaAVVvMn+DiV9A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PjttOmoeTVCnY7gqmmPBVY6uvIyZs6Pp1lWGE5SFcHbD58+8SoiddY3vC/o4ROC8n
 EHm12emrs5AdmR5y/SRZ+oBk9owSnXu400B5rYsPUq/1QQ8woL41bp8k0+CrNCBmTe
 7AfQNVIKuxA0MTtoqfs7lAPin7P42z65mVzijZE3gspZ+OVqCZjCbdPE2VTHirdmtO
 8d2Ix/fJscLOAHAJu6fcWcbYj0lKOOeDETpqtvH6OZMk99f04V2W+dhmWrTecolW18
 UR8YU0ePbSusF54EalGqx0V/aZhjibVfJ7o2r560u9lRh93JUy/qrZMdSRxdSvJZsI
 ReicsFR2OBwXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PjttOmoe
Subject: Re: [Buildroot] [PATCH] package/assimp: security bump to version
 5.4.3
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

On 15/02/2025 21:25, Peter Korsgaard wrote:
> Fixes the following security vulnerability:
> 
> CVE-2024-40724: Heap-based buffer overflow vulnerability in Assimp 
> versions
> prior to 5.4.2 allows a local attacker to execute arbitrary code by
> inputting a specially crafted file into the product.
> 
> https://github.com/assimp/assimp/pull/5651
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
