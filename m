Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDD3C433FE
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:11:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A222061250
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A222061250
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6852581AAD;
	Thu,  4 Nov 2021 21:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvL0PgZzqCDr; Thu,  4 Nov 2021 21:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C557D81A99;
	Thu,  4 Nov 2021 21:11:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69D031BF8A8
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55AF581A99
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8F6LGBmcapO for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 21:11:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B20F81A39
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 21:11:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1C140E0003;
 Thu,  4 Nov 2021 21:11:19 +0000 (UTC)
Date: Thu, 4 Nov 2021 22:11:18 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211104221118.0f67acc3@windsurf>
In-Reply-To: <20211007164112.3490293-1-fontaine.fabrice@gmail.com>
References: <20211007164112.3490293-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/boinc: fix build with autoconf
 >= 2.70
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

Hello Fabrice,

On Thu,  7 Oct 2021 18:41:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da and
> http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=ec90049dfcf4538750e61d675d885157fa5ca7f8:
> 
> checking for /home/buildroot/autobuild/instance-0/output-1/host/bin/mips-linux-gnu-gcc options needed to detect all undeclared functions... cannot detect
> configure: error: in `/home/buildroot/autobuild/instance-0/output-1/build/boinc-7.16.18':
> configure: error: cannot make /home/buildroot/autobuild/instance-0/output-1/host/bin/mips-linux-gnu-gcc report undeclared builtins
> 
> This error raised because AC_CHECK_DECLS returns an error due to -mavx
> flag:
> 
> mips-linux-gnu-gcc: error: unrecognized command line option '-mavx'
> 
> To fix this build failure, hard code ac_cv_c_undeclared_builtin_options
> to 'none needed' as removing '-mavx' from CPPFLAGS will hinder the
> detection of xgetbv, xgetbv, __xgetbv, cpuid, _cpuid and __cpuid
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4b468a5d3bfbff9638316ca930ef791867774aef
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Wow, this was messy, and took me a while to understand. I've even added
a comment in the .mk file itself to explain what's going on.

There is a bug open in upstream Boinc on Github to track this issue,
and they acknowledge that they shouldn't unconditionally pass -mavx,
which really is the root of the problem.

Anyway, in the mean time, I have applied your patch, with an additional
comment, as said above.

Thanks for the good investigation on this one!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
