Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A2FD13570
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 07:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D9BF6071B;
	Mon, 28 Oct 2024 07:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PY41E-itvgP7; Mon, 28 Oct 2024 07:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3BED60735
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3BED60735;
	Mon, 28 Oct 2024 07:58:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4DB3AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 07:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE73340124
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 07:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpRt6Kjun03I for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 07:58:04 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.21;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63DEE400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63DEE400AF
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63DEE400AF
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 07:58:02 +0000 (UTC)
X-CSE-ConnectionGUID: sD6lC99zR3uXcny2Db8naw==
X-CSE-MsgGUID: l4pOw/QVRU+zpkHHbnmSLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29650272"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29650272"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 00:58:02 -0700
X-CSE-ConnectionGUID: 9d+1t5GPSduvPjMvHdUUbQ==
X-CSE-MsgGUID: 4gs0iEWGTm6MQiBotgnUWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; d="scan'208";a="81862734"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 00:58:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1t5KdS-00000007re1-1raR; Mon, 28 Oct 2024 09:57:58 +0200
Date: Mon, 28 Oct 2024 09:57:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Andy Yan <andyshrk@163.com>,
 Andy Yan <andyshrk@gmail.com>
Message-ID: <Zx9EBoth4bf6QpQd@smile.fi.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
 <20241026144748.09d6b892@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241026144748.09d6b892@windsurf>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730102284; x=1761638284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xDmhhOvEHX1rFouzf1cWnHeBbjrr24SKtr6lGvqRcok=;
 b=Q/UmOmcVA/z7b6zZkHgPArB+rJOpaLRGvyeEc6aPQuPBPa/SzWFIpxBH
 gboAQDtKrhgFE6nJV/BL37QKEhEKMvgsrWfWo6SyCTcTy8py3rhpiQzBc
 TpjA7D9vzg+GUBhi9FIbFGvU7C23mPMszfteFXsYbg52awWt2jykfdMyv
 CwxWlhfE4sXINiW3dbZM+JqmwHXeJ0HTNWBLO0gbaCLzAWazfBkrrhZeP
 8KzyM8q/HCG9iGEr/V5aT5t3KNaXdT3/oTRJKPyY8M+nwqFTDm3o00xA6
 RF4spW257/j0wLj81beRCZwEkeA3i57ToRyMWME+ca3QW7gJTcPCyURyN
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q/UmOmcV
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

On Sat, Oct 26, 2024 at 02:47:48PM +0200, Thomas Petazzoni via buildroot wrote:
> On Fri, 27 Sep 2024 21:34:59 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The iotools package provides a set of simple command line tools which
> > allow access to hardware device registers. Supported register interfaces
> > include PCI, IO, memory mapped IO, SMBus, CPUID, and MSR. Also included
> > are some utilities which allow for simple arithmetic, logical, and other
> > operations.
> > 
> > If you ever have to debug hardware, you could probably use these tools.
> 
> Applied to master after doing some tweaks:

Thank you!

> - Used STATIC=1/STATIC=0 to achieve the proper behavior with regard to
>   BR2_STATIC_LIBS
> 
> - Use the canonical $(INSTALL) incantation for the installation step
> 
> One thing that isn't super nice is your handling of the DEBUG variable.
> Ideally in Buildroot we would want neither DEBUG=0 nor DEBUG=1, but
> "don't do anything and let Buildroot pass the CFLAGS it wants".

Any suggestion how it may be addressed?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
