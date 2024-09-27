Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA96CDD1CD
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 18:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCE5680EDA;
	Fri, 27 Sep 2024 18:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIlNZHPVQ-gi; Fri, 27 Sep 2024 18:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E569484728
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E569484728;
	Fri, 27 Sep 2024 18:07:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE87A1BF376
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9AEE40515
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_VsZyMeQZKL for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 18:07:46 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.16;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F3E440042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F3E440042
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F3E440042
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 18:07:46 +0000 (UTC)
X-CSE-ConnectionGUID: J34SNo+pTQCwn9/15v9CbA==
X-CSE-MsgGUID: Nc2ANHJ2RzeeYEtlnQsSqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="14236134"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="14236134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 11:07:45 -0700
X-CSE-ConnectionGUID: 6b6MXpPHQ5WrECpbUCSPng==
X-CSE-MsgGUID: 6M6rtFYvRyOJb+VikP977A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="103415506"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 11:07:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1suFNV-0000000DhQ2-10tK; Fri, 27 Sep 2024 21:07:41 +0300
Date: Fri, 27 Sep 2024 21:07:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baruch Siach <baruch@tkos.co.il>, Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Zvb0bYsF8XiySjqD@smile.fi.intel.com>
References: <20240925205558.1176626-1-andriy.shevchenko@linux.intel.com>
 <87h6a310mg.fsf@tarshish> <ZvaxwYeNZWCQUGic@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvaxwYeNZWCQUGic@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727460467; x=1758996467;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dCVZhYAuqxnQrtCO3brRpxyMHj92qLFI1X0XYv2u4E4=;
 b=Yq/EquthiajIWIAmGDeKQfnssnBEhwUZ7WIUGLE4/JHA/zLNDGPF6NNJ
 2EPsksM3hqd5vTdV1bL0deX8q2uFfiV0qba39pfuROSQVJ01CXhRI5SMx
 Pf9i7YlXeiUk1D+Ae7BkelXq1Ft821XrbUjaQdX6jCl3o8DQwI4IyXQYH
 lw2B7c4aV39i7ufaX0zBDbjs8/49eXiK1UvKZc9kbq7ZlAZ5gZnRRQCAI
 mASbwnwig1Rty9/4nunAuqGKFSdEfqz5nNvG1eat95SOZieg37cX63ReY
 mGyGWflo3u4H4Ck9iKLjR3JpyLgNekieXLiEYF0XJ9289sejui/BK07+k
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Yq/Equth
Subject: Re: [Buildroot] [PATCH v1 1/1] package: Add iotools package
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
Cc: Andy Yan <andyshrk@163.com>, Andy Yan <andyshrk@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Sep 27, 2024 at 04:23:13PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 26, 2024 at 07:48:23AM +0300, Baruch Siach via buildroot wrote:
> > On Wed, Sep 25 2024, Andy Shevchenko wrote:

...

> > > +	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/iotools
> > 
> > Buildroot target-finalize strips all target binaries (lookup $(STRIPCMD)
> > in top Makefile). Doesn't that work for you?
> 
> Lemme check this.

Okay, seems working for me. I will update this in v2.
Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
