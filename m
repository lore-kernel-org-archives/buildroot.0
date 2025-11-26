Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED35AD10F21
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 10:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE6C80BCA;
	Wed, 26 Nov 2025 10:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RQ9jnZYvxCz; Wed, 26 Nov 2025 10:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 233D480BB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 233D480BB7;
	Wed, 26 Nov 2025 10:39:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49D10359
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C55D4037C
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrjsOgapljYO for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 10:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 985B540349
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985B540349
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 985B540349
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:39:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1481651653; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Nov 2025 10:39:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vOCvx-0000000BcX6-1Cuv;
 Wed, 26 Nov 2025 11:39:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251123172531.527134-4-neal.frager@amd.com> (Neal Frager's
 message of "Sun, 23 Nov 2025 17:25:30 +0000")
References: <20251123172531.527134-1-neal.frager@amd.com>
 <20251123172531.527134-4-neal.frager@amd.com>
Date: Wed, 26 Nov 2025 11:39:37 +0100
Message-ID: <87ikexgjrq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=OYC0qhYyNgrsdqT6P/esdESLOZ74RneQ+TGv/WtQEXMia8RM5OAUgQVURhJ1p7gmCmxnFBc6sOg9DQQOk1cs+ZMmyL6x4D0Oy+aTAZGIkOLQpdr9+y87ZAVQeq6i74Zc+C9Q6l98YYNcA0m1MFhGl1G2a1nwIJq+Og9hw7cllziuIQBZo1ipiKHVhDNaEw9e4ROlK1mWj7OiIWnmA9U22rS1dMxG2StJOerBMDMo4vnIiwcRJEtmng7wnLVBai73+aiHZru43xlYGN7STbGPF76l2ktnf2zsdtpBAcZKZ50l3p7Dpdzmybz/z7wztjrBPGXdTaLtP2M+IyIuvthT0g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=MmZahNuB0nAYdYmWMgHJ6piJv9Q6VUIOXJ5kuxOStS4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=OYC0qhYy
Subject: Re: [Buildroot] [PATCH v1 4/5] configs/zynqmp_zcu*: bump to
 xilinx_v2025.2
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Bump zynqmp defconfigs to xilinx_v2025.2.
 > xilinx_v2025.2 includes the following software versions:
 > arm-trusted-firmware v2.12
 > linux v6.12.40
 > pmufw xilinx_v2025.2
 > uboot v2025.01
 > with all Xilinx downstream commits included with xilinx_v2025.2.

 > xilinx_v2025.2 was run tested on a zcu102 evaluation board.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
