Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6930AC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 08:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C6A80B31;
	Wed,  7 Aug 2024 08:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bupTeEIOIwj; Wed,  7 Aug 2024 08:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 293A580B52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293A580B52;
	Wed,  7 Aug 2024 08:50:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70F981BF329
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DFE8400A4
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9LU2UTtqYmX for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 08:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EB5F4015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EB5F4015A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EB5F4015A
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 08:50:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C33D01BF209;
 Wed,  7 Aug 2024 08:49:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbcMp-001agK-0U;
 Wed, 07 Aug 2024 10:49:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20230808200546.21420-1-ju.o@free.fr>
 <6fc86e43-ce9a-463f-85e8-1bc1aab2ee48@mind.be>
Date: Wed, 07 Aug 2024 10:49:59 +0200
In-Reply-To: <6fc86e43-ce9a-463f-85e8-1bc1aab2ee48@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Fri, 12 Jul 2024 21:42:20
 +0200")
Message-ID: <8734ngpvig.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/xvisor: fix RISC-V hang when
 BR2_SHARED_LIBS=y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 08/08/2023 22:05, Julien Olivain wrote:
 >> When BR2_SHARED_LIBS=y (shared libraries only) and BR2_PIC_PIE=y
 >> (Build code with PIC/PIE), the toolchain-wrapper will try to enable
 >> position-independent code/executables. See [1]. This configuration
 >> is a common default.
 >> Xvisor was likely tested only with RISC-V gcc from [2], which will
 >> not enable PIE by default. Since Xvisor is a Type 1 hypervisor, it
 >> needs the same kind of special treatment as U-Boot or Kernel.
 >> This commit adds a patch to explicitly force static linking and
 >> disable PIE for RISC-V architecture.
 >> [1]
 >> https://git.buildroot.org/buildroot/tree/toolchain/toolchain-wrapper.c?h=2023.05.1#n392
 >> [2] https://github.com/riscv-collab/riscv-gnu-toolchain
 >> Signed-off-by: Julien Olivain <ju.o@free.fr>

 >  Applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
