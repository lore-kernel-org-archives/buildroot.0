Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14DCF9D0F1
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 156926F506;
	Tue, 14 Apr 2026 19:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFNXLsXTWwJi; Tue, 14 Apr 2026 19:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE5F76F4FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776194298;
	bh=H9V848DennHeqa/bF+JD8VIQBbpDMn7VfyErRo0pjc0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lrt7iQwwltQUSMLGFMvXCQLJRe4aWZCPcGHvGVbuY+F+23HagKDbb/QdZgl+2uIdY
	 aDHIq27WBnEHSUxLO2FNKII+k4ZaI9fya+Gceawg15prELBJG2ncBCGVIULLyvv3Bt
	 pwEznmYzmgonCVmM2TXD2tDN60xxSCeU1+OA5qLxIBPR7DnLbW1C7HGzUp7co91ovi
	 e+QdI+YvSFeVEilNBguE+V8cD6VXxxSaSz5OYDhdpC9qO8MlMAaBiaoPs/3WNOB+ON
	 pWM/+TXBWTv3SQw5qwXLmFI8QR+etp1cwwWIa7/HY0V2/d2gqbTb9/mckFWuqpA42X
	 IxDYLKrryCfpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE5F76F4FF;
	Tue, 14 Apr 2026 19:18:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC8AA375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1F446F4F7
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXh8cL_xZx2o for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:18:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3004D6F4DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3004D6F4DA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3004D6F4DA
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:18:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 30CDF5FFB1;
 Tue, 14 Apr 2026 21:18:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 21:18:12 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 21:18:12 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20260408073140.3998441-2-buildroot@heine.tech>
References: <20260408073140.3998441-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.14
Message-ID: <92863555807dc4dab85882486576449f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776194293;
 bh=QFL+c5a9zBimBEnifFCZ8LsJ4Ac4QaFroCji6CcuqtU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IOv8s6sBnGsru1rrSHr+1kcCTP5D1n9FEJQXD+T2Oe4BKn5Z+C+DGZbS7wqe+/XIT
 730MJCNsUeXKnkQUtwylYziF5eMAh4sRDzswoa90J3D/ur+/BwQno/JJ7Uy2LYQfo2
 Hg1i3Um7u9bR2XftMFnHuPQfxEeryRhIk7ppS7R9dKFHl5yg8VMt/kl9pyU9AiOqVn
 EHgmeFaPCrkUe0JbTGItlmW1XVAFIdsstNIV0B3XzLVWvH4m3SL6LPCWb6FMBjwTSG
 wc76t/2AiWHnW3ymk8LP2ELTIiaJC/t8WnZKKQkHlfwfNPj4l/qp8hOux184gnsQcv
 yxVGjn04biWNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IOv8s6sB
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.14.0
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

On 08/04/2026 09:31, Michael Nosthoff via buildroot wrote:
> Changelog:
> https://github.com/catchorg/Catch2/releases/tag/v3.14.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
