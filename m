Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9D3109446F
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 18:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4093284A8E;
	Sat, 21 Mar 2026 18:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZiWbfIZkVv0; Sat, 21 Mar 2026 18:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8548684A8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774117139;
	bh=4hV/RBuPLM3HgcQ6BXQAWu2UFgfK7jU+p+4pk6mpIP4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DFeKVFdYUsDjiepiylZ8wkq9McghFXB3vknzvPgqcDHKhc565zndvcZp7hjXa7TyF
	 44FDXckIHPr5rmtT+uOTfMrt/JYmFgnXngMPmD4Cr9fliKACIQZymtLQA7ScRaGTuV
	 eVr4AMGM8nP8Zjg5T/CVdbVMpfyJRQWCIEHRzGUFcHaDJhSefdj0FQYwkumxYdASDI
	 9F5f7YQF6VXjow4sTbUrx6IZRiQcHHzFrm4U4josFdmKzn/LCeC9TvdAh0PBZrB0c8
	 S2vjHUpCbACOsX1kcOw+IWWHSmHPTfCHgwro4cBhIh9d6se46LPkozu9kUwRTwJ+a0
	 D6gFDI4c5OqSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8548684A8A;
	Sat, 21 Mar 2026 18:18:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4614265
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5ED5408AB
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ImS5QjUEID9 for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 18:18:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 842C140892
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 842C140892
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 842C140892
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:18:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9A90178032A;
 Sat, 21 Mar 2026 19:18:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 21 Mar 2026 19:18:51 +0100
MIME-Version: 1.0
Date: Sat, 21 Mar 2026 19:18:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260320183255.28463-1-bernd@kuhls.net>
References: <20260320183255.28463-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5a028cc27c2658c924f74ceec8a2a788@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774117133;
 bh=oJpUdYHd+OSsLHO5c1dUH6EkNJh7iHNqn4jsl6iVN9g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mhMYSzkxtsZMdbtVOK3bFSBJiHV6vxuX5H/lxCTV84lG+msWRE762rfoyRW4t+EwK
 jrx3K9YJSkKrLqG/v47DLdkr07BNqGC5vXcUL6c0Cy8UvZDniMGVfDJIAxUZDyEk3Z
 E9e8hUrtpeZdFblepi1+REHNvigBTMU7hc3Gj4/1DA7LZ5fcESDToK6EfGpmP86SFU
 GN5cHUFRbT5DSmn1COIOEuWMtjU99xAMmFGdi4E0aWVsigyKGpnjBTN3+J70H7NDF6
 nk3nCfduKkd3ZS6A6uFUY/nEW677FPXcLEv96MMWwstZVZDsvdoNjI2NpLOTKZg+zJ
 ua/dfNHtnK/1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mhMYSzkx
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.3.0
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

On 20/03/2026 19:32, Bernd Kuhls wrote:
> https://cmake.org/cmake/help/v4.3/release/4.3.html
> 
> Added Upstream: tag and rebased patch 0001.
> 
> Updated license hash due to copyright year bump:
> https://gitlab.kitware.com/cmake/cmake/-/commit/97ad58a86cf73d85f755939114eb6b32f085d0dd
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
