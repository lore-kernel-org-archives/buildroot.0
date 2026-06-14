Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13499CD98D2
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 10:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA4F180892;
	Sun, 14 Jun 2026 10:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKGwA5No0UAu; Sun, 14 Jun 2026 10:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE05E808C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781431779;
	bh=GrdEYESfcryZr3/MPXsPAHOxl6W/hMNcR99EXf1tcaM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KlcKPNE3UVwgFX8Dsq9tapSRKvms3uQOo7cqhtbmrddtMkbOfSfIMhAXal9E+THe8
	 O6xJNGlxNEID56F0PzC6VDujgPAVY6U7GxKmmMExH6Vtog97W59M1JehL/AeVGzmk9
	 GpfA0hXYhVNZ9bcEoD+u9A2llp2E2P9U5kyeTNcY+v0GPboC27B8dIQ0h7WeJkvYor
	 lxQjJnhTyOzOzAKL42UvxPdHc4i6oxXl3wM6EfwA4FJ33n57vS+0+w78bg1M/dm2jm
	 J/luUiuIiNgcDDlG7KJpcL+71RGqpZFxYnJVfEEuY9EyMGmGfqbitx7J5roOwHUtwg
	 6k2LoKc8XcE8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE05E808C6;
	Sun, 14 Jun 2026 10:09:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4198E169
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 327DD40280
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1ywE8cQUPeN for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 10:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 284D14026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 284D14026F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 284D14026F
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -592453444; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Jun 2026 10:09:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wYhmX-0000000FSs9-3AWr;
 Sun, 14 Jun 2026 12:09:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260613194451.220317-3-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Sat, 13 Jun 2026 21:44:49 +0200")
References: <20260613194451.220317-1-romain.naour@smile.fr>
 <20260613194451.220317-3-romain.naour@smile.fr>
Date: Sun, 14 Jun 2026 12:09:33 +0200
Message-ID: <871pe9mo0y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=cHKfPe7ps/XYMn/UODTqIMf6pL654M/t6NeFSHAtgGnE7cEtLg+oR+5K+/LU+iZva3FDKRd5GxGTvfI/gyq+yGC8ebkCg3eoSINe6uAhMnUzfQXC4m5Z2hlKKppL7DX2H9W0ImZ/Gumlr/p6gNqnN6dHRnUtGqucchekILfnupRTtjqObJisS5pjEANM+LaOcxDKJcZI7rZ9+ubc+BdK530KejP9CXRJ/rcX6F+BbDGvUz6S66/HcHn7SSs+TszdmM+lW+uEvcoHMCbHZSfM4OodzW6t+Z+dk7g0TOHVGaEkBN0YMFQ2Uc78KE36ck1ueePSesyC/J6fUrwEqsP80A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=S+TvBvToNl7KunnSKJmHi6uBb3uKwS+Xz8sKwF1YunA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=cHKfPe7p
Subject: Re: [Buildroot] [PATCH 3/4] configs/qemu_aarch64_{ebbr,
 sbsa}_defconfig: switch to Bootlin stable toolchain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > Update the qemu aarch64 ebbr/sbsa configurations to use the Bootlin
 > glibc stable prebuilt external toolchain, as recommended in the
 > Buildroot meeting report from ELCE 2024:
 > https://elinux.org/Buildroot:DeveloperDaysELCE2024

 > This will reduce the number of Gilab-CI minutes by ~20 minutes.

 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913979 (qemu_aarch64_ebbr_defconfig)
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913980 (qemu_aarch64_sbsa_defconfig)

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
