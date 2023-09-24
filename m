Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDEECE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72FEB40939;
	Sun, 24 Sep 2023 18:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72FEB40939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUDJxRuOpWcG; Sun, 24 Sep 2023 18:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 866A140920;
	Sun, 24 Sep 2023 18:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 866A140920
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5EF1BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36C3A81E00
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C3A81E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CirvS_IxjlVJ for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:38:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2363B81DFD
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 18:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2363B81DFD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 263B51BF203;
 Sun, 24 Sep 2023 18:38:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkTzo-000Dut-8q; Sun, 24 Sep 2023 20:38:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20230915192308.1432032-1-ju.o@free.fr>
Date: Sun, 24 Sep 2023 20:38:20 +0200
In-Reply-To: <20230915192308.1432032-1-ju.o@free.fr> (Julien Olivain's message
 of "Fri, 15 Sep 2023 21:23:07 +0200")
Message-ID: <877cofju1v.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: fix riscv build
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > libjxl was failing to build for riscv targets, since commit ff7c37e57
 > "package/libjxl: security bump to version 0.8.1". Build was failing with
 > output:

 >     /build/libjxl-0.8.1/lib/jxl/enc_xyb.cc: In function 'jxl::Image3F jxl::N_SCALAR::TransformToLinearRGB(const jxl::Image3F&, const jxl::ColorEncoding&, float, const JxlCmsInterface&, jxl::ThreadPool*)':
 >     /build/libjxl-0.8.1/lib/jxl/enc_xyb.cc:223:21: error: variable 'std::atomic<bool> ok' has initializer but incomplete type
 >       223 |   std::atomic<bool> ok{true};
 >           |                     ^~

 > This build failure was due to a missing <atomic> header inclusion. For
 > some reason, the build failure was observed only with RISC-V toolchains.

 > This commit fixes the issue by adding an upstream commit, not yet in a
 > package release. See [1].

 > Fixes:
 > http://autobuild.buildroot.org/results/121/12107bc7aea7afae1d2fb935d31b44eee6ea1501

 > [1] https://github.com/libjxl/libjxl/commit/22d12d74e7bc56b09cfb1973aa89ec8d714fa3fc

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
