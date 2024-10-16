Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D36D1AD5D
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 13:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88EC880D46;
	Wed, 16 Oct 2024 13:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fjt6asR2ukMI; Wed, 16 Oct 2024 13:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71FA80D95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A71FA80D95;
	Wed, 16 Oct 2024 13:54:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C96D1BF306
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C18080DCF
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXesA0dR4826 for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 13:54:44 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.9;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC2FF80D95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC2FF80D95
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC2FF80D95
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 13:54:43 +0000 (UTC)
X-CSE-ConnectionGUID: mlx2mNBBRhaCuaJTMCKlVA==
X-CSE-MsgGUID: 3dgnrs5ITqSIE+NOp8JdJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39164052"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="39164052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 06:54:43 -0700
X-CSE-ConnectionGUID: 1JwXeKuMQrmgqy7LfqMgLA==
X-CSE-MsgGUID: F343sfI4SVyFbFWlatuGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="79060056"
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 06:54:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1t14U3-00000003mWV-2a3y; Wed, 16 Oct 2024 16:54:39 +0300
Date: Wed, 16 Oct 2024 16:54:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aaron Sierra <aaron@bubbl-tek.com>
Message-ID: <Zw_FnzaYeMObnxNM@smile.fi.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
 <Zw067nX__jWPkt2d@smile.fi.intel.com>
 <1928bf9ac30.11026c2a5160620.6141190462172193061@bubbl-tek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1928bf9ac30.11026c2a5160620.6141190462172193061@bubbl-tek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729086884; x=1760622884;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fyMQ9bmz2MMx0sI/GLPnLHcsljDQzud4ZPza34A06VU=;
 b=hf5GGhP5YPAtvVz24RqtU+tYxHkECDmzRkGpQEzltPExSMGXRBQ4SCZx
 8U8ZUxFUf1z36GDgumexiabYlfConQEb2NTccDYtbLJRDnlKSJB4U3ZMQ
 GjSoAnNyStfSF1punqp3ToNOylZ/clAera4oExNHdURK5CnwIZzn5H/Ir
 9EmJAf8zSSeqMPF4qs1+1IzpoQ1yb+vLmY2DYwutT/0qV5ZUQywktb8iH
 Jlf1lX6xmHR+9NkR835TiP1QrnaDbEB1d1USA8/kPrRkl2vKEYbAKz1Pj
 qnaZbdv1iGv/l3rb50xrfjaEATVI1Mq0jK8Io92paGf6BSROV3TujQR9E
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hf5GGhP5
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
Cc: buildroot <buildroot@buildroot.org>, Andy Yan <andyshrk@gmail.com>,
 Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 14, 2024 at 12:00:48PM -0500, Aaron Sierra wrote:
> ---- On Mon, 14 Oct 2024 10:38:22 -0500 Andy Shevchenko  wrote ---
>  >  
>  > Can this be pulled eventually? Or is there any comment I have to address?
> 
> I contributed the {mem,mmio}_{load,dump} commands to your repo back in 2021
> and had been considering submitting a package to Buildroot, since I find the
> utility so useful. It's the first package that I add to br2_external trees
> that I work with. Thanks for taking the lead.
> 
> There are a couple of things that I noticed in the patch that could easily be
> fixed.
> 
> 1. Despite being tagged as v1.7, the Makefile VER_MINOR is still 6, so the
> resulting binary reports "version 1.6".

Thanks for catching this! I'll look at this at some point, have a lot of stuff
to do...

> 2. It would be nice if the package populated command symlinks in the target
> filesystem. That could be done in a number of way, like using an explicit
> list of commands maintained in the package Makefile (iotools.mk) or adding a
> host-build dependency and leveraging the --list-cmds output to get the list
> of embedded commands for linking.

No, I don't do this. I explained why in the reply to Vincent.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
