Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17480C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94B22417D6;
	Thu, 29 Feb 2024 15:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ow96tBvwOMQD; Thu, 29 Feb 2024 15:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71CB4417D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71CB4417D8;
	Thu, 29 Feb 2024 15:16:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 318551BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EFDC82015
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Go1qkJEtiRF5 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:15:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 057E581FB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 057E581FB3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 057E581FB3
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:15:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3530140005;
 Thu, 29 Feb 2024 15:15:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfi8O-004mDP-21;
 Thu, 29 Feb 2024 16:15:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240122212121.7805-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Feb 2024 16:15:44 +0100
In-Reply-To: <20240122212121.7805-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Jan 2024 22:21:21 +0100")
Message-ID: <875xy7i9nj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: fix mips4 build
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The 'sync' instruction for MIPS was defined in MIPS-II as taking no
 > operands. MIPS32 extended the define of 'sync' as taking an optional
 > unsigned 5 bit immediate.

 > As a result, replace "sync 0" by "sync" to fix the following build
 > failure on mips4 raised since the addition of the package in commit
 > ea47e177f093d7378e8e8e1f50d6f4e3fce0a088 and
 > https://github.com/linux-rdma/rdma-core/commit/b7c428344ea96d446f6ffe31c620a238a7f25c9e:

 > /tmp/ccrBy9fV.s: Assembler messages:
 > /tmp/ccrBy9fV.s:994: Error: invalid operands `sync 0'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2ab22a3ec4287fc15ff6a90d8715b4897b32a933
 >  - http://autobuild.buildroot.org/results/2df58f9b98aacf00960932f53510b29199393461

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
