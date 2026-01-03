Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010C5FA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7CD407D4;
	Sat,  3 Jan 2026 11:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1PlVc846AKy; Sat,  3 Jan 2026 11:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EE714078F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440554;
	bh=UVs4HpY1ww0db2kpTT8crFLDKJdHMFJrRYV/wvUopxY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ns/YUU3ZYXGBjv29zuoUPEOU87XqVI2IPFXRw5ssqhrPEYCVJ/5YlAOaUN4ja/VJK
	 nUhcJW+bVxxRx05geze6BvUUHRxrNlA0vzPAG/gsKPnl4wtq4SMEQc4klSNNyBXYIx
	 ybht1MuwcDw7BRQ99ifFGIForOj2Y/lyY8RIvCqgm6CEGblmehcZs++KP6K9Tn3xIv
	 YQRirJnPx/Xy08CaG11ThYR6cFLNIifPVxrOKD8L2VCQTrFbA4Vx7My+o2EYiiiUgo
	 fXrEDfhjDeahduPqYygb52Y+Ec8vDQ1YtaYyizKtlQQm0XwzatClGRQGVcfuO8K7pr
	 uOSmisItq94vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EE714078F;
	Sat,  3 Jan 2026 11:42:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE5F440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA54D81250
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVVgoRhO6weM for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E151F81233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E151F81233
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E151F81233
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:42:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1CB37780507;
 Sat,  3 Jan 2026 12:42:29 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:42:29 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:42:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103012339.750123-1-james.hilliard1@gmail.com>
References: <20260103012339.750123-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <cf2847f33fbf204798594860cfc6e08b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767440550;
 bh=QcAh6SUKdcZ93EByUhNLbFQeCWnaTKeBGmrhZCk+nmY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AnphmXpGNjS1sPZnMIYlYb8yaWl5aAtsQObaTxeqXuQBNTwJt6O95m2Sy8aZFb/XS
 C3sb5WRZRqe9sxr9xXIIQAfiVy/csBt2/l0+gVe31mVbknuhnb7t7MnZgufJ5hbcIx
 CYV6VgvQdHn7ecJgabUQdZDt4L+ujSgsLDe8H94jVtR0CWQBO/etn7sMf+pT24jmQ5
 nfAhqDDrqIw1OOBouVRu/I0plTAd6mEZPitvOz3a6dTESiU/cm2189iW9n3UQDwAgK
 iR6GRfMD0nBBC9VdxSv4twuTUps/fXYNxOG9W5bbcd2GPjFCCVkTffk0Nj2wRE0zGj
 hVM9VG5rA0eGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AnphmXpG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bottle: bump to version
 0.13.4
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

On 03/01/2026 02:23, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
