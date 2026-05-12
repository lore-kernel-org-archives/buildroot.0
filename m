Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C98CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A02E8268B;
	Tue, 12 May 2026 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4zYegw2fXlV; Tue, 12 May 2026 20:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A15C082660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778616202;
	bh=eJDmVEEBZr6eRCTKKNkvgF1o2foAWnQnt72dws4NARY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X1+HzFsZTCm5B8eunrmr4gWnDkbHhl2bFds/Kp4lYzHZVdyVl4fQA9riUMRQzznku
	 nmM9GcebV6yWlWUijeS8uMtobGILD2KtcBUPDvEAdK9x1YUJ07kqDg6g8dNrEDBW49
	 Nj3ruEVn6RmLWmH6DyInca1nngXLklpYptGKfMTV7ORJqdNUwd+q5rj5H2+3QV3k6U
	 U6L6JGn0HgKIV5yTbC5B9w/veQfghdY4Y8LAuQAX40uhIPr4B4Mp+FTBlHr0NRATkm
	 SGo9/kYe96J5yiy4mk1t3mdYdo2cNLinFy8uY53pn0pBiCda3oChps7xuPoZUgIosu
	 6LOb6rxU5HwlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A15C082660;
	Tue, 12 May 2026 20:03:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C4B15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED05441048
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEQBKlnbb08d for <buildroot@buildroot.org>;
 Tue, 12 May 2026 20:03:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2CFFB41041
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CFFB41041
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CFFB41041
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:03:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D528978034E;
 Tue, 12 May 2026 22:03:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 May 2026 22:03:17 +0200
MIME-Version: 1.0
Date: Tue, 12 May 2026 22:03:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260512172138.2595183-1-bernd@kuhls.net>
References: <20260512172138.2595183-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <ebb0f8f21c9debc11471013bfaf47b29@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778616199;
 bh=hv2J6aVipDHnB9OLqtAASEc/IL5kpcxZJzIRoNjv60c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LDIQiDmTn2IQEQfStnxllnoHF50MglTZ98VNk583eRVXk/8ne8jjYMVHc7OHDfuRx
 mcXlQewWSemhoPptS7mPLFozpFBvKlDrciPjMg4FCdSi5t1cNeeXyuXMnfP2YVUozh
 340lslBcjs4Hy+w9Jv1FmNTu7gcsPKt8g5sI0kXCamA4GkKlMo5U81unLjoPAbfuo7
 3mPdwt2TycTEY9oLuuYVX0/EPAbTmnWduoxEpFCOcietX/Kl5vQ7JxORtNMsvNFoFS
 ynEDD6gOlAX6GMsRD1DZPJ0zcO8/AQqdR7q8TgF1gFH82d8Gd+G/4cVHGyjMP+TQCJ
 PMjvLJxcisfRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LDIQiDmT
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.24.2
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

On 12/05/2026 19:21, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.24.2.html
> 
> Fixes CVE-2026-40170.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
