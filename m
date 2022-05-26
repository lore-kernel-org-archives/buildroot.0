Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6397EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 047CC4117E;
	Thu, 26 May 2022 08:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzL1LGg0W0M3; Thu, 26 May 2022 08:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A40941186;
	Thu, 26 May 2022 08:34:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0E81BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44307845C6
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2puiWgRn1bn for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:34:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40625845BF
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:34:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2FD2F1BF203;
 Thu, 26 May 2022 08:34:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nu8wy-00HJPd-C5; Thu, 26 May 2022 10:34:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220420172816.1160081-1-fontaine.fabrice@gmail.com>
Date: Thu, 26 May 2022 10:34:32 +0200
In-Reply-To: <20220420172816.1160081-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 20 Apr 2022 19:28:16 +0200")
Message-ID: <871qwgsndz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: fix uclibc build
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add BR2_PACKAGE_OPENCV4_LIB_DNN to fix the following uclibc build
 > failure raised since bump to version 4.5.5 in commit
 > b6922313937712a89841b58d3b355edd53754bca and
 > https://github.com/opencv/opencv/commit/1feb3838b51c0b27b0f3e64f02358ff5ef3111b8:

 > /home/giuliobenetti/autobuild/run/instance-3/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:
 > In member function 'float cv::dnn::RoundFunctor::calculate(float)
 > const':
 > /home/giuliobenetti/autobuild/run/instance-3/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1260:43:
 > error: 'fegetround' is not a member of 'std'
 >  1260 |         int old_rounding_direction = std::fegetround();
 >       |                                           ^~~~~~~~~~
 > /home/peko/autobuild/instance-0/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1261:14:
 > error: 'fesetround' is not a member of 'std'
 >  1261 |         std::fesetround(FE_TONEAREST);
 >       |              ^~~~~~~~~~
 > /home/peko/autobuild/instance-0/output-1/build/opencv4-4.5.5/modules/dnn/src/layers/elementwise_layers.cpp:1261:25:
 > error: 'FE_TONEAREST' was not declared in this scope
 >  1261 |         std::fesetround(FE_TONEAREST);
 >       |                         ^~~~~~~~~~~~

 > Indeed, uclibc pretends to implement fenv but it raises build failures
 > on numerous architectures (or1k, sh4, xtensa, mipsel, arm, arc, riscv64,
 > etc.)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a6dd3c10acfbf6bc1af867d770cf0ce926c6ce84

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
