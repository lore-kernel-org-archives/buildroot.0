Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5325DC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:26:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A5E6108B
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15A5E6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C01FA40723;
	Fri, 20 Aug 2021 21:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4x26gkhInV8b; Fri, 20 Aug 2021 21:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E55940729;
	Fri, 20 Aug 2021 21:26:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C878D1BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B75FB81B70
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PloDBz8BVIm for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:26:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFCF681B72
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:26:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 86908C0003;
 Fri, 20 Aug 2021 21:26:29 +0000 (UTC)
Date: Fri, 20 Aug 2021 23:26:27 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Matthew Weber via buildroot <buildroot@busybox.net>
Message-ID: <20210820232627.02c88420@windsurf>
In-Reply-To: <20210820124018.23297-1-matthew.weber@collins.com>
References: <20210820124018.23297-1-matthew.weber@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: fix powerpc64 PHDR
 seg err
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, 20 Aug 2021 07:40:18 -0500
Matthew Weber via buildroot <buildroot@busybox.net> wrote:

> Upstream comment: "Let's introduce some fake PHDRs
> to the linker script to get this working again."
> 
> Fixes:
> (next) http://autobuild.buildroot.net/results/ae091dbcb155e63c208ce5adb289807cee83e28d/
> (master) http://autobuild.buildroot.net/results/ef0/ef0b044802c54a697d8bffb28eba08cf9ce44f4c/
> (2021.02.x) http://autobuild.buildroot.net/results/044/04495aa23ce51c48b9b850890453abded85dc477/
> (2021.05.x) http://autobuild.buildroot.net/results/0fa/0fa94f1f930aa16cec3bc96e64bc57b460238a0a/
> 
> [Cherry-picked upstream]
> 5126732d73aa75a0bc84f898042bfe35640624b8
> 
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> ---
>  ...issue-with-the-linker-from-Fedora-32.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
