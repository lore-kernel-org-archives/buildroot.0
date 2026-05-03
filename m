Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F44CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 19:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 240BC41458;
	Sun,  3 May 2026 19:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEiFLAGdJITN; Sun,  3 May 2026 19:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455BA41219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777837085;
	bh=YFmqylucy4CKF2RX+zF6m6p1gqM/UcxScMA9rSWaUeg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fF2ikElHd9+Ciea+PZ4KxMg+MVK0X6ktnO+R5NaZ4zEIlAf1Haa3YcrsOXy1AVRM1
	 +b7N2Kw2qcuLcYRul7bduEIqgFIHLNqBM6xqomQzAXX9zyPk+hVB/3+L2jILqc61SF
	 LsxIxw8KWD8A0ykeCN4BJlr18smwweJzemUusgmMXQG0KNjQSE6H4+aM3fPp9CFm8e
	 01B/qCEpuC5qGcJ2aSswMLQd27YM9YrHMf/u/LlJk3AEnMCBUKMXy7O88s3Cb4oRjy
	 Wz9cBnLtJ6qTdxrdXv5E6TQIQjAmniNdPOyxYr2tvJHZcBvc6EP19dlRA78BPy/tzR
	 1TkA8VSHo78kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 455BA41219;
	Sun,  3 May 2026 19:38:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5BB7190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 19:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C25E41218
 for <buildroot@buildroot.org>; Sun,  3 May 2026 19:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oo0v081gRAR for <buildroot@buildroot.org>;
 Sun,  3 May 2026 19:38:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6245C41211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6245C41211
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6245C41211
 for <buildroot@buildroot.org>; Sun,  3 May 2026 19:38:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 68E4119F59C;
 Sun,  3 May 2026 21:37:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 21:37:59 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 21:37:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430044050.7637-1-bernd@kuhls.net>
References: <20260430044050.7637-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <c9b1758dad3014506d0cb6d758fcf21b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777837080;
 bh=p42/OLtRCvCU4E2wNEWr7d3KQVSIBDtX6GsRQA3wovU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bMBDHQRHLOcgdz1GDaWjOzG6WSZmB1sHU8cHlwEcouhD0fCjh6eXVs/vNmTLLkERO
 vZW2KDE9/FdL1oHm4LqIgAbPTuZM43Or7ZXUcjoW+j3TbIObrZ6w/w3/T8Qfb7bJzA
 USgkWzjKzGldxPiFNl6Xqygv+6ENbfjRIgq/fkOD52CJdkwcsWeHGJGfS3agxc3NiF
 c+427v6IjuHrAV6LNx3Se4xC86WI2fXBHmGW1pHVnEcaRBT71MLuonAr/v8dovuJ77
 BRX66BgOC9beHwoQW5XZ4xW9jAP2xezvD+Gep1/NNS0WK4XGysrB7KFaN4U8/9b0Sb
 7InzvrDYI6Rew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bMBDHQRH
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.2.0
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

On 30/04/2026 06:40, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.2.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
