Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB04D374BD
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 06:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13A2B40684;
	Sat,  6 Dec 2025 06:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HgnRsMxvQjj; Sat,  6 Dec 2025 06:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393A84068B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765003019;
	bh=JW10oEp3AiVoef0K/SCgRlq3I187dbherVdrc7ZRWXw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=csR/oU1xW4GK2UieeCfEZQU03Xf5RAfRax8toSR2nyWpOaeM3CTofszeavbtcSSFy
	 k01exya/aKCE6QIP2pxaN4QFEE1RngS0FNJXAR4xuYH9p0GxuOYQixcH6JK+lQ+NMC
	 RbZ/muJ9MR/rO0lJIcQTDufsklWXS1GOOpW1jcr4liX/1ogKA8T6rqXO4AHo1+iPPh
	 rkkpDUQ+ViqFuMn13ZdcffFRoAUAKqaunm8N0X1vM9a/LPU06GThD1+gh9l6Mam5dI
	 2w/vrcD5r/KYKVa/tykn4nGnfVCwU4D3cXCk5q6JkhPHD2NqS1RYtW94DGeHxM9hHz
	 7bNMT1dnnXTmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393A84068B;
	Sat,  6 Dec 2025 06:36:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A9411A9
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C4924068B
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THt-rifePM4h for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 06:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33DBB40684
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33DBB40684
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33DBB40684
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:36:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1856912020; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 06 Dec 2025 06:36:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vRluW-00000002gTb-2bNd;
 Sat, 06 Dec 2025 07:36:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20251205212959.2082018-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 5 Dec 2025 22:29:54 +0100")
References: <20251205212959.2082018-1-thomas.petazzoni@bootlin.com>
Date: Sat, 06 Dec 2025 07:36:52 +0100
Message-ID: <87sedoazgb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iLxNgHwQzE9Ly6mTfXjxEhY6GH4hDtA/WbQQO7BrAr875NU2EHE0JbWlftTybgh7qK5ggYvV30SEfWMRHX3c5CAFFIKYuCRcbBsSPI7gKft+oeV8Y7EZlx/ZvkvvGyrZUChGCWLnhSFh2oEk01qgVYZ/RVBchVghCSp6pw2sxIgv61guaAYCfDiNI15XQX9XNFU7OovWND/z+kF9inR1J+ZzcbFUOJvcbT/kD3xwKLMk2NYKCpvZoyCdmgKl2TUgb+adOSd5U1qXf1/TN2eOOlypvrNXT6TPrX9hZgQauyg2I55K/FIA1HFOQOOUnjeFKQxEcc7Osgbo9DLrmYG5YQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=km6LnwjVAGnCUMkrhQPD/4X69O5pE3Blm+QSn7SsJ4Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=iLxNgHwQ
Subject: Re: [Buildroot] [PATCH] package/glibc: only supports ARC
 little-endian since glibc 2.41
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Since upstream commit
 > https://sourceware.org/git/?p=glibc.git;a=commit;h=4ff55d08df0e6f11cbd217f4dca4532bd7d9330d,
 > glibc no longer supports ARC big-endian, and the configure step fails
 > with:

 > checking for egrep -e... (cached) /bin/grep -E
 > checking for big endian... yes
 > configure: error: big-endian not supported
 > make: *** [package/pkg-generic.mk:263: /home/buildroot/instance-0/output-1/build/glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830/.stamp_configured] Error 1

 > This commit was first merged in glibc 2.41, so this issue is
 > applicable to both master (glibc 2.42) and 2025.02.x (glibc 2.41).

 > Fixes:

 >   https://autobuild.buildroot.net/results/87e4b84f3aee64d041c3b845cb003e6b90649ffb/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

Does this mean we should completely drop support for big engian ARC?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
