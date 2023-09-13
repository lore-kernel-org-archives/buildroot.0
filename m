Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA57EDEC7E
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 15:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D16580A5D;
	Wed, 13 Sep 2023 15:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D16580A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMTr0oEAKrNJ; Wed, 13 Sep 2023 15:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8CEA82D2F;
	Wed, 13 Sep 2023 15:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8CEA82D2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EAB91BF5EA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8577382D2F
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8577382D2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hucyi5Ctg-aG for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 15:53:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32D50822EA
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 15:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32D50822EA
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF89B1C0002;
 Wed, 13 Sep 2023 15:53:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgSBA-005zTJ-7B; Wed, 13 Sep 2023 17:53:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZORnh9dzTr/VmBfa@waldemar-brodkorb.de>
Date: Wed, 13 Sep 2023 17:53:24 +0200
In-Reply-To: <ZORnh9dzTr/VmBfa@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Tue, 22 Aug 2023 09:45:11 +0200")
Message-ID: <87pm2m2hor.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gmp: fix compile error for riscv
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > In commit 87b2a30319394c2cc79efae1af7833cad8c62b32 gmp got updated
 > to 6.2.1, since then the compile error exist.

 > Compile error looks like this:
 > tmp-mul_1.s: Assembler messages:
 > tmp-mul_1.s:55: Error: unrecognized opcode `mul a5,a7,a3'
 > tmp-mul_1.s:57: Error: unrecognized opcode `mulhu a7,a7,a3'

 > Patch should be backported to stable branches.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/2f2/2f2112bea73adbf49eabb62fe6cda6a9cd5d0567
 >  - http://autobuild.buildroot.net/results/566/566a4945555b781ed127997176f73b3c17ecab5d

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
