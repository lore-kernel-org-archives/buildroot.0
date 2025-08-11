Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBE4C87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 09:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24C6461292;
	Mon, 11 Aug 2025 09:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyL1NySF1n7I; Mon, 11 Aug 2025 09:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B41161283
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B41161283;
	Mon, 11 Aug 2025 09:22:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DB94138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BA2D83BD3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGqDrVGi11B0 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 09:22:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B09C583B90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B09C583B90
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B09C583B90
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:22:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1558772497; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Aug 2025 09:22:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulOjq-0082W2-1i;
 Mon, 11 Aug 2025 11:22:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
References: <20250810203621.945900-1-romain.naour@smile.fr>
Date: Mon, 11 Aug 2025 11:22:42 +0200
In-Reply-To: <20250810203621.945900-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Sun, 10 Aug 2025 22:36:21 +0200")
Message-ID: <87o6smnrfh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Vj0V1SpUoA0ty/Jp9ppreFsjWNU1l78gsVurnZXhim8q/oMTvP2CzTZwFM5QjPR35vnhUdiZFN3awo3WVDyPJbatWi5bKKtAR73pTdmm22hha3YR5rBiT8SordRrznubyVKHD3bjfuGrdKBFGUaKb6T3N7drwiWO4fBHejKEy+y/PYMSNbpQga3fhonQ5/EptrCvx/5sGfT7SR6tc8mns9YWzdkHCt91/Hm/OABUxH/+DZUF/7zFekbf4R6/yaKlGS8jU+04/7pWltbgiFlQmxSmQmktA9SNLezM/LvO2pW/Mwk7vLEyoKsOlpL2zJgkoBtIcqIhGNMIjpr8aNiw4g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=GclFDqhHN7QLg54wNhsxVcPpiXvNLGTgS+b7vCMAorM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Vj0V1SpU
Subject: Re: [Buildroot] [PATCH] package/gcc: add microblaze fix for GCC bug
 121432
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

 > This is a temporary fix under discussion [1], but it resolves the
 > problem, by implementing the same behavior as GCC 14.x for register
 > allocation on Microblaze.

 > Tested with qemu_microblazeel_mmu_defconfig and used to generate
 > Microblaze toolchains for the Bootlin toolchains 2025.08-1 [2].

 > [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432#c10
 > [2] https://github.com/bootlin/buildroot-toolchains/commit/83947c7bb6158072bc2f52b58e90891cd3dc04a2

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---

 > This requires this patch [1] applied first.

 > [1] https://patchwork.ozlabs.org/project/buildroot/patch/20250728045145.132333-1-neal.frager@amd.com/

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
