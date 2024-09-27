Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F322CDD1AE
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 13:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3AF424C2;
	Fri, 27 Sep 2024 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeHpsS03Wct0; Fri, 27 Sep 2024 13:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB74424C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDB74424C6;
	Fri, 27 Sep 2024 13:23:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 183441BF2C1
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 13:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 076A4614E9
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 13:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0zL2S6g5P9f for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 13:23:19 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.11;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98F88614F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98F88614F3
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98F88614F3
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 13:23:18 +0000 (UTC)
X-CSE-ConnectionGUID: JmPtU8hHSgiN7xxfIHOfNA==
X-CSE-MsgGUID: dnYAhhHVRjyZ/glTMBkpSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37151158"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37151158"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:23:18 -0700
X-CSE-ConnectionGUID: I7rWtjhgQgmw8bGEV7mZ7g==
X-CSE-MsgGUID: wUbWn9u8RPuH6oMEmVIvqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="77043928"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:23:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1suAwD-0000000DaiE-3peU; Fri, 27 Sep 2024 16:23:13 +0300
Date: Fri, 27 Sep 2024 16:23:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baruch Siach <baruch@tkos.co.il>, Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZvaxwYeNZWCQUGic@smile.fi.intel.com>
References: <20240925205558.1176626-1-andriy.shevchenko@linux.intel.com>
 <87h6a310mg.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6a310mg.fsf@tarshish>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727443399; x=1758979399;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iRimOvsPeivB1KZjNNWDitQUQwRWv9Sa7T+SRvXAeik=;
 b=Unvtv6ts+Hvj8i3Ci2qpCv0l3DyEh/d3vg2s25Iy59QBZJ7O4EFUWVHb
 NlkN8CDZqNtn7KUtDzm2RIhII/7R6XBnE5yTcbT7l+n4JKh2ETk16V6cE
 O9ZZ9/aH2qHRUKvjnRTOFvT4MOO18MNKpxrLr7uK5dphgPvNIa40JHu6K
 c7MCovC/J/0ZepwFRw/YWOw/rhNeCCFxyu5nY2fcOqXRRmtHaM3MZb+iu
 vwiPKEUn6tRfl6X5oh7uCU2IU4xOxArqs8S5CF/jMeFdQtwCP2T0RrDOR
 iobGxQ9RupoMNyQn9xKh/Jr4vU/vnhsIK8q4ujWTcT8zIaT7eaU51HtIB
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Unvtv6ts
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
Cc: buildroot@buildroot.org, Andy Yan <andyshrk@gmail.com>,
 Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

+Cc: Arnout (see below why)

On Thu, Sep 26, 2024 at 07:48:23AM +0300, Baruch Siach via buildroot wrote:
> On Wed, Sep 25 2024, Andy Shevchenko wrote:

...

> > +	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/iotools
> 
> Buildroot target-finalize strips all target binaries (lookup $(STRIPCMD)
> in top Makefile). Doesn't that work for you?

Lemme check this.

Arnout, I think that the package from  [1] intersects with this one, and
the latter has better feature list along with clear licensing. I think
that concentrating on it is better than spreading resources on two, one
of which is a small part of the other (feature wise).

[1]: https://lore.kernel.org/r/20240924110345.34659-1-andyshrk@163.com

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
