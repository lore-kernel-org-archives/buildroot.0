Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14A1D1AD5E
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 13:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A02980D54;
	Wed, 16 Oct 2024 13:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ru-cUJPQ-BjK; Wed, 16 Oct 2024 13:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8045D80D58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8045D80D58;
	Wed, 16 Oct 2024 13:52:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66C7B1BF306
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62F7E605DC
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWu9_bT9wgld for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 13:52:20 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.10;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 889BA605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 889BA605B7
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 889BA605B7
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 13:52:20 +0000 (UTC)
X-CSE-ConnectionGUID: X6uCeQSXSEa78ZI0CTuotw==
X-CSE-MsgGUID: /L1VhjU1Rrm1YJRMOXpDtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46008550"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46008550"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 06:52:20 -0700
X-CSE-ConnectionGUID: +kojaVaMQZWu4HgGz4n7Wg==
X-CSE-MsgGUID: DKPhemTKQZWqXxUKuQJS9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78123940"
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 06:52:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1t14Rj-00000003mUS-2aTJ; Wed, 16 Oct 2024 16:52:15 +0300
Date: Wed, 16 Oct 2024 16:52:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <Zw_FDy5XWpeQ78sG@smile.fi.intel.com>
References: <PH1P110MB1603BAEB621A821D82C0A2C19F44A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH1P110MB1603BAEB621A821D82C0A2C19F44A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729086741; x=1760622741;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T7bd/smQ7pyecseLhQSUFhaK4WUJqt1nmHUtjzmi2ls=;
 b=EbOuKygLP85uFczMWYux7WuZu1eUnytjTLm8Ox6IEKuU6alxXE2dxeDq
 eq5NYFxsistwjEeOSDWeMcx3RTxsLIvL5EJq+NEq8q3eFGHLDONi6bk+W
 Au+Hdv9HAGwuIKhwGDCDMIG6NOx0iYwNmSi6Wl7oBM1b+zdjZSl4QWwQJ
 dJLs51sV2fHdS5P3RUkNVezLBu7/kxAacLwRH77fePym/h++c428sKzWC
 Plq/33/Q1WiuFUg2sAReYgSSNDchKvnk47KMBrAgQkTfPdWz9QK8IO5L5
 kEICU6KZGw6XKjgUyMz57gTRAs2adUPyHzGqmt9cfxggwd5tEVgoWBIJM
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EbOuKygL
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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
Cc: Andy Yan <andyshrk@163.com>, buildroot <buildroot@buildroot.org>,
 Andy Yan <andyshrk@gmail.com>, Aaron Sierra <aaron@bubbl-tek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 14, 2024 at 05:55:46PM +0000, Vincent Fazio wrote:
> Aaron, Andy,
> > From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Aaron
> > Sierra
> > Sent: Monday, October 14, 2024 12:01 PM
> > ---- On Mon, 14 Oct 2024 10:38:22 -0500 Andy Shevchenko  wrote ---
> > Can this be pulled eventually? Or is there any comment I have to address?

> > 2. It would be nice if the package populated command symlinks in the target
> > filesystem. That could be done in a number of way, like using an explicit list of
> > commands maintained in the package Makefile (iotools.mk) or adding a host-
> > build dependency and leveraging the --list-cmds output to get the list of
> > embedded commands for linking.
> 
> Caveat lector, I have not reviewed your patch or the sources in a while.
> 
> WRT to this comment, I have this note from when we ported it:
> 
> # we can't run make install because the symlink installation executes the binary
> # which isn't guaranteed to work in cross-compile scenarios
> define IOTOOLS_INSTALL_TARGET_CMDS
>     $(INSTALL) -D -m 0755 $(@D)/iotools $(TARGET_DIR)/usr/sbin/
> 
>     for link in $( IOTOOLS_LINKS); do \
>         ln -sf iotools $(TARGET_DIR)/usr/sbin/$$link; \
>     done
> endef
> 
> We then earlier in the mk file define the tools per platform, akin to:

I deliberately won't populate those links. The naming is so generic
that it's a real chance to get a collision with all pain of splitting it
in the configuration what links we create and what not and what to do
with those that may collide.

TL;DR: no, I don't think it's a good idea.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
