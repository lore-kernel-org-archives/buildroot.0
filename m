Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD32CD98D2
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 10:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D82454115B;
	Sun, 14 Jun 2026 10:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vpvab522i6I6; Sun, 14 Jun 2026 10:09:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DA141162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781431775;
	bh=oTmYMjGLUZ7XT+iQfk8iRVE8c1cm1g1eQK7CLSjWdhw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gkBkS3lytcbSZLY7EtWmiogoXBZRG0lVGH8ACyAf1gt5u6lt9ODTzv+BKU6uMhHcI
	 /12eELAfTTkG+UEllYe3rJxZhGFVegd4l0OEtBiELu66e+eJt1vo8CnsE3RHn7B/Wr
	 ZSYfyqQ7ILzA9blmJwduDneGyLjWxs6PMCmv+GNrCrz9KX3VemwEz85ge2TnLvNiD1
	 pcdnip7AOUq1t5stPdkL7GuKEnqQ3qQGH+VpEPZP18fZfNa4C9nxz/+8+SN4ewXKvA
	 GJP7T74GxBWDsDVeedUofDog4rpPxgqlB4UPDBQm3Y2VVjdozsnUhsCzafGmeDBq+O
	 zs14G7T6SKVRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DA141162;
	Sun, 14 Jun 2026 10:09:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0A40169
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2A6E41162
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avl19pbKPcnt for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 10:09:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0A874115B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A874115B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0A874115B
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1162101672; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Jun 2026 10:09:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wYhmS-0000000FSra-1uA9;
 Sun, 14 Jun 2026 12:09:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260613194451.220317-2-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Sat, 13 Jun 2026 21:44:48 +0200")
References: <20260613194451.220317-1-romain.naour@smile.fr>
 <20260613194451.220317-2-romain.naour@smile.fr>
Date: Sun, 14 Jun 2026 12:09:28 +0200
Message-ID: <875x3lmo13.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AdiMVJItgmsp3YKIJU/osR2c4PZhrzPPKh2zTlUc/ym6IJ/G3li7YMmh6OwdcfdC3RNYRt5LgFKgtp0oMJEoGrmTeis3cwZ3riMMPJcUas22WzaQR7PYVIq9qCU3ThRG9Drx8fe7eBYRglo55Ewkeds/Iyj59VdJ1fzJT1zldiwPHza5fOJq3qVGZS0dPcqmE9o0hwMdqnSLInIakcYrYfjXByKP3C3ya/3zy2wFIOrICsn6vPvIpnuTYjMXUYYdqGU7Q17NNqXxHSO2yn1j3Ig6RmPx1nkxqGLLPPbfNOn3WcBn81rwXIrBVtM4N026DBxAXOySyYNuKv2rlSUhAg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=H61fbqrvyYdrOLCeQoH2TmMw5OsaBt2uwR0cDTDWq6g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AdiMVJIt
Subject: Re: [Buildroot] [PATCH 2/4] configs/qemu_arm_{ebbr,
 vexpress_tz}_defconfig: switch to Bootlin stable toolchain
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

 > Update the qemu arm ebbr/tz configurations to use the Bootlin
 > glibc stable prebuilt external toolchain, as recommended in the
 > Buildroot meeting report from ELCE 2024:
 > https://elinux.org/Buildroot:DeveloperDaysELCE2024

 > This will reduce the number of Gilab-CI minutes by ~20 minutes.

 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913982 (qemu_arm_ebbr_defconfig)
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913985 (qemu_arm_vexpress_tz_defconfig)

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
