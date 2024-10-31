Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E9CD767F2
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 17:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6969D408B2;
	Thu, 31 Oct 2024 17:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yUREC4BCxp5; Thu, 31 Oct 2024 17:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EC45408AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC45408AA;
	Thu, 31 Oct 2024 17:25:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 679BB5E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4423F408AA
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9VkNkU5H0rV for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 17:25:11 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.17;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 068574089A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 068574089A
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 068574089A
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:25:10 +0000 (UTC)
X-CSE-ConnectionGUID: 0nkcN+rsSYyYlJVLIAQjrg==
X-CSE-MsgGUID: 2GFfVnVsR6ulpnVL0WF85w==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30041538"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="30041538"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 10:25:05 -0700
X-CSE-ConnectionGUID: KQ0wMy65T1uWIsl7V1JtNQ==
X-CSE-MsgGUID: rG4ZEQZlSuq0i5+uvddlPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87833404"
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 10:25:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1t6Yuq-00000009jxb-3huc; Thu, 31 Oct 2024 19:25:00 +0200
Date: Thu, 31 Oct 2024 19:25:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Andy Yan <andyshrk@163.com>,
 Andy Yan <andyshrk@gmail.com>
Message-ID: <ZyO9bOAks5c_vMrV@smile.fi.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
 <20241026144748.09d6b892@windsurf>
 <Zx9EBoth4bf6QpQd@smile.fi.intel.com>
 <20241028092600.61ee97f7@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028092600.61ee97f7@windsurf>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730395511; x=1761931511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wFwZl1Og1/XgWMnyEew8sI/7emQAfIHxbZdVn7owGyA=;
 b=cIaK5QrfhljE2hCHPfjUc3XdXiWhPXlq5sb8zaCkZsyAPrF+PgVGxc1Q
 T0LBaNIMVq+mKGBJXUX/Y9Igg0N5s3trnOQQPB7pJd1tgA2Gkj3qA+Kut
 paZtDxtPx3ji7TWLzbvBhLDLCyxNJbq64ykr9KWbZJPyAqrs0XudFgyyo
 szT4aIEmpBLMf3qiIxAyDruAwjQCJLgVIPJpjwHfLTn1FLpBlt0K1Z3hI
 AV7INw10mKJpim/oMzExdH4S+ev08Je8xCC+XKkqgMwwcMiGhIRibbB6G
 NFX5njKAMvMICgHuDUrYlKo0stoK5MnHs6o/lr3BYc/K1xKuq+DVSjLk9
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cIaK5Qrf
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 28, 2024 at 09:26:00AM +0100, Thomas Petazzoni via buildroot wrote:
> On Mon, 28 Oct 2024 09:57:58 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> > > One thing that isn't super nice is your handling of the DEBUG variable.
> > > Ideally in Buildroot we would want neither DEBUG=0 nor DEBUG=1, but
> > > "don't do anything and let Buildroot pass the CFLAGS it wants".  
> > 
> > Any suggestion how it may be addressed?
> 
> 1. Don't override the CFLAGS passed by the user
> 
> 2. Allow a value of DEBUG= that tells your Makefile to not do anything
>    (i.e neither DEBUG=0 nor DEBUG=1)

Thanks!

Seems Aaron already does a lot to improve this by moving to CMake. I asked him
for a few changes in his PR and most likely we soon have the updated version in
Buildroot that satisfies the requirements.


-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
