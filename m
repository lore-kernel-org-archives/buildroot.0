Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736A0C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 06:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BBFE80E4D;
	Thu, 17 Sep 2026 06:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoKfAWAoWcgR; Thu, 17 Sep 2026 06:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3317280CBA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789627052;
	b=ewj7+RdYgSfTlAZ/1/EmwcIXhGO2eOuLUL0QKF+81uCQP7kwzwVesUtyc+NI50RSBKiQ
	 evbM7699o+OPrMhX2zK67Ib+GjGzPb51cW4cGRhNhDxW4ZRFHTML6COy99iAV61vjREdI
	 f3+emawct7bxIOdQcPUJkwTNqfMcjTaLl2yI7txeuu9LvnUZGLi1lBtw/xbw4rQO5wsHE
	 dOTUsi0JOGk8ploUskpApBFH/mLV4I8hYvfqebsdza4yVtraiTx2byI6TVVYT2KzW4AZo
	 iGKgzxlu+BueES7hfUT6IlfCfnDU7lP/J292edycbgP8NNfY8gZDHByI4WtoKB/Xd5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789627052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=//QbBGI0oQa0OAhW935SO1otDOQ74+KFd/bnHpRSEiU=;
	b=jWOoSUc4JhX/HPOCQpnRJDPfxARfq16ej2eoxoRrr85Ql4Jz/601XAUKm2HRF3gNt9QZ
	 YIYnmCgKvk0XaenHeGEaTcfpVDLm3Tp8X9AyLdVs4ojoX7yvlle0hXnVAuIj8IHnGsVPS
	 QaYtV9Gbk9+dQMX8hUmyYQSWrbp9I28TLuBbXEApHLj8mvMBEf0XP2CCNQDGfWviSUcpx
	 LXBlGJDiDo66l/4OCW8TxLOhk5Ol8LdRL7AjaXLGi52IhCWes8NIgtVF5OmOMwmW74NSS
	 Hw9XNiQb1gr4+m3oFcfvllZA1pbrFlTQP7Z5k2RcRx3MjkymJGcYhWPkMpLWPSueBng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789627052;
	bh=//QbBGI0oQa0OAhW935SO1otDOQ74+KFd/bnHpRSEiU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cNd9L6pTYPuzuZ6HEovGXjByoMBPKByofMozKaFUy6296WCsxn7zG8VwNwwPXalwi
	 En/rrlW1zLp1+usQ89wZVkvAtqoDkhOsZVTVgrUL57BT7ZeSYqqdkXtX94qMpM/xHp
	 adFqxSK7mxsStsOhZmHxgq0Ao1XILjsA3G/AnPAk3v1Wc1qK7hm0ogC10Q3G19BP8w
	 Qld+2HSf2pJwkrpQDz2eWkF4zL+sfoyCi6DHqWmvsZxTu8gT1kpMsgP4t2FRIFmNgq
	 p8lIeSqjxjH+uihklpZiUD7GDEZjxLH3dssAaLoA6fIxEGgRaCKmvWDknQ0TzpgJbe
	 lyvutoEZI5X1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3317280CBA;
	Thu, 17 Sep 2026 06:37:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB8243A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2226F40077
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Og7OabmCack5 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 06:37:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8AB404005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789627049;
 b=Ky6JcKW58qoZW26TH0FWPhT5v354mptXkWGUA5L8PeakQJtP7YCpsIwQEnGUXbMekpBA
 7OQ87MMRB/NBWmGNPA2Ep35K9KzIfXvbmDMsZleFPwRlGSCUuQVNLwSHpEaRkEMNP79xA
 9wgfSuWWPa8oS2GKLk4hfUpY0GQcD9gdq5QXRAo3rRLNLE7U6DrTtxUcpRZa2Vma84tQ+
 +GvLGsCnIXfjah7KXWiRpiDUPG3s5K9nIUf4votSSD2Pbv2cpPMt4OfeeGBBneFuqrbGR
 Mt8WAAE0mz9Pyp0FNClAZZkhxD/sJXHGjZdagnmXRpETc+hyyUgGkMgKRM3diKLZ/8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789627049;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=bsCEZo1vbG+8M43yyydO3r4UcdVYsJpdvuOj74HSC1c=;
 b=lLXa3i3cYbaZlakh8OgwUHdVyuIlizTywqrrLuY0rqHZELpjDBoo3VwgGeNCwXW87krG
 TIxS1HpiXvUAg1ZXDJu+v7K32CBCDL5NxTncreTXewrAg0UhWBqZ4XuyuWczEBucDu5WX
 C37mEY6IwxS4W2WurYUycO6sNjzzMaq/mFM8aqqS4h8w/k+Zvyau4BTQQrFV8YB8ZgcEH
 hW4ZRMECV+EbsCG0sebfz4MKaJuZ+5B0yNOJTVxHOH7Cc3Y+qFyluA9Z2xHKSgf4kndr+
 8NKesUHNMWaoeTLU0y2VpylLiA3a6qw5ZI+QTw7+NSjjJbtdwXlWr+DL6u5q5fVkQYA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VWAMdbsK; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AB404005F
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:37:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1902CC63A11;
 Thu, 17 Sep 2026 06:38:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB6995FAA3;
 Thu, 17 Sep 2026 06:37:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DF94211C7A1AE; 
 Thu, 17 Sep 2026 08:37:25 +0200 (CEST)
Date: Thu, 17 Sep 2026 08:37:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Reynes <philippe.reynes@softathome.com>
Message-ID: <aquKoe0G-byCZP-y@windsurf>
References: <20260916231235.2635069-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916231235.2635069-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: fix build with
 gcc-15.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 17, 2026 at 01:12:35AM +0200, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/d43/d4364f6e3636c696471bf8cba6d308439130e53a/
> 
> In function 'MakeIv',
>     inlined from 'TestSymmetricAlgorithm' at AlgorithmTests.c:197:25:
> AlgorithmTests.c:181:23: error: writing 32 bytes into a region of size
>  16 [-Werror=stringop-overflow=]
> 
> The build error occurs with gcc 15.x on some platforms, gcc 14.x is not
> affected.
> 
> These defconfigs build without this patch:
> 
> BR2_x86_64=y
> BR2_GCC_VERSION_14_X=y
> BR2_PACKAGE_IBM_SW_TPM2=y
> 
> BR2_x86_64=y
> BR2_x86_x86_64_v4=y
> BR2_GCC_VERSION_14_X=y
> BR2_PACKAGE_IBM_SW_TPM2=y
> 
> BR2_x86_64=y
> BR2_PACKAGE_IBM_SW_TPM2=y
> 
> This gcc-15 based defconfig is broken:
> 
> BR2_x86_64=y
> BR2_x86_x86_64_v4=y
> BR2_PACKAGE_IBM_SW_TPM2=y
> 
> The build error is not related to the recent bump of the package from
> rev183-2024-03-27 to rev183-2026-08-26 because no changes were committed
> upstream to AlgorithmTests.c since rev183-2024-03-27:
> https://github.com/kgoldman/ibmswtpm2/commits/master/src/AlgorithmTests.c
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
