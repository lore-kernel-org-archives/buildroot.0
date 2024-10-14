Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D302DD18129
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 15:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A8ED80DB4;
	Mon, 14 Oct 2024 15:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtZVSpfLOc7C; Mon, 14 Oct 2024 15:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DBEC80DDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DBEC80DDB;
	Mon, 14 Oct 2024 15:38:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 044C81BF363
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 15:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E726040438
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 15:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUVrgyj6P1K2 for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 15:38:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.20;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 393B4403F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393B4403F4
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 393B4403F4
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 15:38:26 +0000 (UTC)
X-CSE-ConnectionGUID: uaiBZVu1Q/2CucnfA6sHIw==
X-CSE-MsgGUID: Gc9FEjaiTN+nwUIa7Iwftw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28071407"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28071407"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 08:38:26 -0700
X-CSE-ConnectionGUID: v6AY2DzKRiu/yHRZ/rP+AQ==
X-CSE-MsgGUID: Kgn4Y1JZQ4OKhDBRWwbgGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="82230639"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 08:38:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1t0N9K-00000002xGK-1d54; Mon, 14 Oct 2024 18:38:22 +0300
Date: Mon, 14 Oct 2024 18:38:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: buildroot@buildroot.org
Message-ID: <Zw067nX__jWPkt2d@smile.fi.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728920307; x=1760456307;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gmeBw/81h7VPFbQdudupH9Z8EByhKGuIjLh+MJRzs4s=;
 b=LzqGO24MZN9FZJeBRoutt8hPPQ77WozCKq5gaEHtIwGCmCT+9AGLtRMk
 QAtUi2kh1oMvGXVFOS497cM4V/513sEPW7Y9o4S0kOE++HtHoh6nE4Dek
 kCTF+aM7peJjegkAVrFNaMAI4yeUdIZaH2EOR5I37ZAmkA+w/Y7kdwe+D
 DJwhCjoB6cGKgUNRCFdMA5bA3dBF5I4kIHXKW7MA3qcx+g3nEwWJsWMlN
 4bK/vcgH3goy2zWifS5amyd1mBvC5UMdVospAahL498kKlc0DHlfnR0g2
 ihOQ3OGMCgKVZ6InSsbpU62I/bAvbHWshmzubPlev2XW7CCCzMvZUIodt
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LzqGO24M
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
Cc: Andy Yan <andyshrk@163.com>, Andy Yan <andyshrk@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Sep 27, 2024 at 09:34:59PM +0300, Andy Shevchenko wrote:
> The iotools package provides a set of simple command line tools which
> allow access to hardware device registers. Supported register interfaces
> include PCI, IO, memory mapped IO, SMBus, CPUID, and MSR. Also included
> are some utilities which allow for simple arithmetic, logical, and other
> operations.
> 
> If you ever have to debug hardware, you could probably use these tools.

Can this be pulled eventually? Or is there any comment I have to address?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
