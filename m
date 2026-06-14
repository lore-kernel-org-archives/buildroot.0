Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED35CD98D2
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 10:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A232809C1;
	Sun, 14 Jun 2026 10:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kp7aNyLpFmTr; Sun, 14 Jun 2026 10:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B3A9808C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781431765;
	bh=tx2WtzIxh5fx9VAx1xYTnxpaVxurvagUtgsnXBPF92M=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bmgf+Cse8EMeY+I0+XlLSCXw+Rkr6QXt1vDPSALef94BkN7289UyTxkC/AisnGiwE
	 gVLsefASRyZgqNCM0te8QbBF99ZWxEg5VibdrISjDYuGHR1h47sgmC2/8yJR3yy1+Y
	 88/C7iOXGBHxzOqBk3We34jjxPCkDvyp/nUehSfv4NhqjhcdgDZRDhQOMME1lFyCB9
	 hD6CbmtGNx9wmHb10C+Bm3xjVjjAprEvaKRGbzO8b2dKJL+GeRhoSfT4QIRgkMTtBJ
	 NcTyZ7EOL5ZNYpxgV1oPaxAraY1i+WrICprEocoXeFRdONCBfa9XsCQeUBdXQmIrLv
	 Flq0ceHoA+Hbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B3A9808C6;
	Sun, 14 Jun 2026 10:09:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B293169
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98D1E808C6
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEZ0AYuj1_K6 for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 10:09:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1299680892
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1299680892
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1299680892
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -453236935; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Jun 2026 10:09:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wYhmI-0000000FSrJ-0dlp;
 Sun, 14 Jun 2026 12:09:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260613194451.220317-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Sat, 13 Jun 2026 21:44:47 +0200")
References: <20260613194451.220317-1-romain.naour@smile.fr>
Date: Sun, 14 Jun 2026 12:09:18 +0200
Message-ID: <87eci9mo1d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aP2mCFMkJaV667QHaP+d80WMktcQKStPrIkJCdQD2aEhSzH6zaEMekYuFEBmTSYmix/wIRYr1L+kOFDsJo8Jron9zgFOzAa139ewa/pdQYqKNuc+OABy2rx6V5e5q7Nf1EuMfoq5JWeaajUxVLbn4ynx4r4uw7WQivmjkIJx3LW1NWD5dcsIETk164NC0IIuKFVQFV2pamsSJs1O2KVd4xHoMyICNZTyrRD9QtUUpHD+qEfDqIhRhYQuxMdS2bhyCwip/lppzJFMg7IIMLEq/P51HLBKWCthvYgJNRENk9ObknVIG2In5/qmUY87iyfKrMfPJeY4/wWExsufcV7AOQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=9RvLDQ16B5k05xZBwBp0U7/AX4lAG73/f8vcKI1qsWs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=aP2mCFMk
Subject: Re: [Buildroot] [PATCH 1/4] configs/ti_am{62ax, 62px, 62x,
 64x}_sk: switch to Bootlin stable toolchain
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

 > Update the ti_am6x configurations to use the Bootlin glibc stable
 > prebuilt external toolchain, as recommended in the Buildroot meeting
 > report from ELCE 2024: https://elinux.org/Buildroot:DeveloperDaysELCE2024

 > This will reduce the number of Gilab-CI minute used to tests each
 > defconfig (1h10 -> 52 minutes).

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 > Build tested only but the ti_tda4vm_sk_defconfig already use a
 > prebuilt external toolchain. The tda4vm and am6x are based on the same
 > TI K3 familly.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
