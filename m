Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED503C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 23:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60CE461B7D
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 23:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60CE461B7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F406A4051A;
	Wed, 17 Nov 2021 23:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIvic3D7gQSa; Wed, 17 Nov 2021 23:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB9740511;
	Wed, 17 Nov 2021 23:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B39C11BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 23:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F6440511
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 23:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scapnnMCJYGI for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 23:01:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AF1040508
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 23:01:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 88353200005;
 Wed, 17 Nov 2021 23:01:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mnTvl-0005Hh-VC; Thu, 18 Nov 2021 00:01:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211117173152.994041-1-fontaine.fabrice@gmail.com>
Date: Thu, 18 Nov 2021 00:01:29 +0100
In-Reply-To: <20211117173152.994041-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 17 Nov 2021 18:31:52 +0100")
Message-ID: <87ilwqqtdi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/apparmor: fix per-package build
 with apache
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following per-package build failure with apache:
 > /home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/../../usr/build-1/libtool --silent --mode=link /home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/aarch64-linux-gcc    -o mod_apparmor.la  -rpath /usr/modules -module -avoid-version    mod_apparmor.lo -L/home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -lapparmor
 > /home/buildroot/autobuild/instance-3/output-1/per-package/apache/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: cannot find /lib64/libc.so.6

 > This build failure is raised because the fix added by commit
 > 3c836e54203b16015c9c52cbe007adc92d293a0d was incomplete as the apr
 > special libtool script was not patched (see commit
 > b747c29c4e8eb89b7b99658dfd34f4a6b6b0744d for a detailled explanation)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6747b1cb11b129ea4bcb1ecc9645e94fb8e095e8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
