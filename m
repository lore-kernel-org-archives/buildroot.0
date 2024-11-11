Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04AAD12D7C
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 07:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF4180ED0;
	Mon, 11 Nov 2024 07:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNfGo2vWKVb0; Mon, 11 Nov 2024 07:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F8C280ECA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F8C280ECA;
	Mon, 11 Nov 2024 07:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B65DDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 07:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96786401F8
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 07:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCfezt9814HG for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 07:17:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.18;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61618401F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61618401F7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61618401F7
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 07:17:06 +0000 (UTC)
X-CSE-ConnectionGUID: zFtnaSHAS4uHiBulw8jGLw==
X-CSE-MsgGUID: /d4MU+B0Ru2wIExNq9q1dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30519406"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="30519406"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 23:17:05 -0800
X-CSE-ConnectionGUID: md8gzHahTUGYKJsI8OcJzQ==
X-CSE-MsgGUID: CbtzeCq/TDKw+AYO6NPUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="86722918"
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 23:17:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tAOfV-0000000DVel-0bCP; Mon, 11 Nov 2024 09:17:01 +0200
Date: Mon, 11 Nov 2024 09:17:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Andy Yan <andyshrk@gmail.com>,
 Andy Yan <andyshrk@163.com>, Aaron Sierra <aaron@bubbl-tek.com>
Message-ID: <ZzGvbJyygHw-rQAb@smile.fi.intel.com>
References: <20241106184841.1053511-1-andriy.shevchenko@linux.intel.com>
 <e097e9606bcd844e440d8cd95e2d494a@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e097e9606bcd844e440d8cd95e2d494a@free.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731309426; x=1762845426;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yyMourgVkxaEogtX3Vq5gTtKPNqO+KsFD+dp9+pdTHA=;
 b=BaYQx/W/lQbcYgA7xhqSfakOmcPdspmpDAPiXk3fFZxvwwZZT6q9OYUb
 a5i+rUYg+AP0H16W54qrNvc3VxsX02VsjIk6I5jtOZDdi04xvw1LVoa5s
 yvFEtpSLzDuxBnyPaP4QJmCqvRQxBJFIEaDXc+1SJDunGZWQnEkilz/57
 o5NuIZk8sbskwceXNLd3JKPCgsIpv0ypPc48iL9smlq9nLU+RSIN9iZXu
 QMTDXEf2KWCWXUWIExR8BDwF296rzBBOv2oc15QPLV35StTdghhc1HCWs
 G3hK6ESlHXgQiMg7dZ+lAXngpAB+LVNdhy6g+xYaeBlsEYWaBEYxO8NgV
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BaYQx/W/
Subject: Re: [Buildroot] [PATCH v1 1/1] package/iotools: Update to v1.8
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

On Fri, Nov 08, 2024 at 10:58:24PM +0100, Julien Olivain wrote:
> Hi Andy, all,
> 
> On 06/11/2024 19:48, Andy Shevchenko wrote:
> > This is minor update to iotools to fix some issues Aaron noticed and
> > addressed. The bigger change will come later with better integration
> > with the regular build systems (CMake).
> > 
> > Cc: Aaron Sierra <aaron@bubbl-tek.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Applied to master, thanks!
> 
> The patch was not applying as is, as the version number in the Buildroot
> tree does not have the "v". This is for the release monitoring, for new
> release notifications:
> https://release-monitoring.org/project/375158
> 
> Since the modification was trivial, I fixed it while applying.

I see, thanks!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
