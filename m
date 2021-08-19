Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE291C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:39:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71CEF60720
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71CEF60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DAC2402C8;
	Thu, 19 Aug 2021 20:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FD9FsJYdSMi1; Thu, 19 Aug 2021 20:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5642D4040B;
	Thu, 19 Aug 2021 20:39:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75D871BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72D4F4040B
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sy6Oh473g_6J for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:39:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69EC040246
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:39:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 87A1FC0004;
 Thu, 19 Aug 2021 20:39:28 +0000 (UTC)
Date: Thu, 19 Aug 2021 22:39:27 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Matthew Weber via buildroot <buildroot@busybox.net>
Message-ID: <20210819223927.6b575293@windsurf>
In-Reply-To: <20210819142558.10417-1-matthew.weber@collins.com>
References: <20210819142558.10417-1-matthew.weber@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/eigen: override Fortran path
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

On Thu, 19 Aug 2021 09:25:58 -0500
Matthew Weber via buildroot <buildroot@busybox.net> wrote:

> The language detection is falling back to the host system
> Fortran compiler. An example of this is in RHEL7.9
> (gcc4.8.5 20150623 (Red Hat 4.8.5-44)).
> 
> This patch bypasses detection and points to the location
> where the compiler would be installed (if present). In the
> cases where it doesn't exist, the detection falls through
> and leaves Fortran disabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8354da225d1e5e337aa7ea62a7e6524fb5f1135f/
> 
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>

Thanks for looking into this!

>  # Default Eigen CMake installs .pc file in /usr/share/pkgconfig
>  # change it to /usr/lib/pkgconfig, to be consistent with other packages.
> -EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig
> +EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig \
> +	-DCMAKE_Fortran_COMPILER=${TARGET_FC}

We use $(...) to reference make variables, not ${...}. This is reported
by "make check-package". I fixed that and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
