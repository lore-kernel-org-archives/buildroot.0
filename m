Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0A5C61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A2DE4052D;
	Tue, 25 Aug 2026 08:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xz-S6-hk1gUR; Tue, 25 Aug 2026 08:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787647857;
	bh=Zt8JKZcIV0oAe1ei8LtfOjXfAAMFyVU83mzphCyZ9KY=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HhICwVfDGjHj1+9xmPsJyLsruHNSUfc3CEu02f+jUQ1jLiJGv0jOzKQRXDUkleAqg
	 wNHvDqjQuGaCzGuRiuXkTTbnG8iHtZArXNjgDLcvDD31PCjpHR7lGu1X4zO0sJeaNi
	 ATZ3e4w+xv4WWycvSsUvflHI2oZeaz8vA6uyHdYfxxMulWd+giWVW62H4DmNxo0VJz
	 3/kJC486d8jXqRxr8DNLNkBZlEZJ1o7b1aJzKpL0sGADcwtQrFNCtVpJ2vsHtlL89J
	 Nf2SIahflaaNjNg7z/vcfu5jpCMu6DHlCvOBikaULOpltVoyca34j+T8Php0Rob03O
	 dtzl+5oegKyww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AAAF40550;
	Tue, 25 Aug 2026 08:50:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CDC1279
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ED2D40064
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_dPAc3fcbfx for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UHfL03dK
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60B8A40055
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:50:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=UHfL03dKvA8noWj/7yZsb+Uzz0XOpjC73LIFl080k8YD+lU7cRhegbgDJoCBPMJmhdeN/WjT6ojj9SQiM8rDULdfnM6+5j/03Ip7rg0ZiPezBf7eJKe2jMWl7ksyDgBJAlrw3jPa3rQkTlS/gX+4RgPELWp1TzGKO9m1bsN5EU5zysrYdL9oLqCpY9R2492miUA6iWznZ2zZXd8YaSoYFXNcgmB02GzTWtkNVRZkYJKjjJTP/3j+23HX1qTI8/7bf+Y7/RkfoiSJpMLnmzW0QZXsMH3SF3ZhP68DHvzuYLhIsrOZXmGw6bGkg1ZkHdGLoP98S6fhX35VotGv/4RcXA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=WjOD1/sEvesU2Nd3EcRoWcIIqL2pcZFmHrMsKj28oF4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -867382308; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 25 Aug 2026 08:50:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wymrq-0000000CWx8-3hyb;
 Tue, 25 Aug 2026 10:50:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20260825080308.3606178-1-neal.frager@amd.com> (Neal Frager's
 message of "Tue, 25 Aug 2026 09:03:08 +0100")
References: <20260825080308.3606178-1-neal.frager@amd.com>
Date: Tue, 25 Aug 2026 10:50:50 +0200
Message-ID: <87se42vb11.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal2_vek385_defconfig:
 config atf to load optee-os
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 buildroot@buildroot.org, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Add the option to configure the atf to load the optee-os binary:
 > BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y

 > Without this, everything was still booting, and even though the versal2_plm
 > was loading the optee-os to its runtime location, it was never actually
 > loaded by the atf.

 > With this option enabled, atf is now properly loading optee with the boot log
 > below.

 > NOTICE:  BL31: Executing from 0xbbf00000
 > NOTICE:  BL31: Secure code at 0x1800000
 > NOTICE:  BL31: Non secure code at 0x40000000
 > NOTICE:  BL31: v2.14.0(release):custom
 > NOTICE:  BL31: Built : 08:41:36, Aug 25 2026
 > KATs execution completed.
 > In task dispatch loop
 > I/TC:
 > I/TC: Non-secure external DT found
 > I/TC: pl011: device parameters ignored (115200n8)
 > I/TC: Switching console to device: /axi/serial@f1930000
 > I/TC: OP-TEE version: Unknown_4.9 (gcc version 14.3.0 (Buildroot 2021.11-18033-g83947c7bb6)) #1 Mon Aug 24 08:45:53 UTC 2026 aarch64
 > I/TC: WARNING: This OP-TEE configuration might be insecure!
 > I/TC: WARNING: Please check https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html
 > I/TC: Primary CPU initializing
 > I/TC: Cluster shift early-configured: 1 (cores per cluster: 2)
 > I/TC: ASU initialization complete
 > I/TC: OP-TEE OS Running on Platform AMD Versal Gen 2
 > I/TC: ASU ECC: NIST_P192=SW NIST_P224=SW NIST_P256=HW
 > I/TC: ASU ECC: NIST_P384=SW NIST_P521=SW
 > I/TC: ASU RSA driver successfully initialized
 > I/TC: Primary CPU switching to normal world boot

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
