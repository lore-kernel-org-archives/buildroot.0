Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F01CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 14:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07CA58439F;
	Sat,  9 Apr 2022 14:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjUiOrHPbngb; Sat,  9 Apr 2022 14:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F5984307;
	Sat,  9 Apr 2022 14:10:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 723581BF425
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6124060AA0
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJTFgqkT5RB0 for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 14:10:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C42E606F9
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 14:10:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 25AD71BF206;
 Sat,  9 Apr 2022 14:10:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndBms-003I9Q-AI; Sat, 09 Apr 2022 16:10:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220403103146.2873012-1-fontaine.fabrice@gmail.com>
Date: Sat, 09 Apr 2022 16:10:02 +0200
In-Reply-To: <20220403103146.2873012-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Apr 2022 12:31:46 +0200")
Message-ID: <87y20eqret.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/flac: fix build on ppc64
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable vsx to avoid the following build failure on ppc64 raised since
 > bump to version 1.3.3 in commit 89337e4f39343b3cba0e9f77b3a198fa8ea340af
 > and
 > https://github.com/xiph/flac/commit/cdb030cd3749b4547399a049ce3cae5e974ccd48:

 > In file included from lpc_intrin_vsx.c:46:
 > /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/powerpc64-buildroot-linux-gnu/9.4.0/include/altivec.h:34:2:
 > error: #error Use the "-maltivec" flag to enable PowerPC AltiVec
 > support
 >    34 | #error Use the "-maltivec" flag to enable PowerPC AltiVec support
 >       |  ^~~~~
 > lpc_intrin_vsx.c: In function 'FLAC__lpc_compute_autocorrelation_intrin_power8_vsx_lag_16':
 > lpc_intrin_vsx.c:94:7: warning: implicit declaration of function
 > 'vec_vsx_ld'; did you mean 'vec_vslh'?
 > [-Wimplicit-function-declaration]
 >    94 |  d0 = vec_vsx_ld(0, base);
 >       |       ^~~~~~~~~~
 >       |       vec_vslh

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a97a0522c58964fa51815236bc39b378e10b5008

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
