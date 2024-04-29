Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31793C4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 13:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB5544054B;
	Mon, 29 Apr 2024 13:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCUwafCIDVnp; Mon, 29 Apr 2024 13:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CD624055E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CD624055E;
	Mon, 29 Apr 2024 13:52:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D472F1BF2EF
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 13:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE9074051C
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 13:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yf4STyroOwm9 for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 13:52:50 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 29 Apr 2024 13:52:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D3D3404CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D3D3404CF
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.16;
 helo=mgamail.intel.com; envelope-from=aapo.vienamo@linux.intel.com;
 receiver=<UNKNOWN> 
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D3D3404CF
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 13:52:50 +0000 (UTC)
X-CSE-ConnectionGUID: ebwuWvkASKCEgh7qapAqnA==
X-CSE-MsgGUID: A+VeIlZwROK7nJX0lUphxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10593595"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="10593595"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 06:45:41 -0700
X-CSE-ConnectionGUID: 4fZfuYHEQTejAubsY0BzXQ==
X-CSE-MsgGUID: 81iSXaJdSRKjpO/kNjGhiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30764250"
Received: from jianyan1-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.33.104])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 06:45:40 -0700
Date: Mon, 29 Apr 2024 16:45:35 +0300
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <dkrivpzjr2bixpvo6fbblualnjvg3cjewvo2q35s2eszdeeht2@gmx3qlsin5b7>
References: <20240426113756.3962234-1-mika.westerberg@linux.intel.com>
 <yikqqkczs6qq3uonbqxhmv73gnp3nfvlwucki3ih62rk76zak6@nokzbi4ijbnn>
 <20240429113637.GF3969176@black.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429113637.GF3969176@black.fi.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714398770; x=1745934770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P4WuLQOYzV5P8OuHzNXNTdNrXXVHCx1m+4L7kjxPWr8=;
 b=HsHKjCCCEhhEXU+7+Vl74WOA8lLxRBy6XNyIvi7a09N+mu4cSK4AkCyb
 +FZ72Zlrjx2tia2f4Bkgu3adw5eI/eCCXIDpyR7WE/mjUe1JV2THy4Q3V
 w3ISXYy2YTmS9XDC+gzTLgOw7VXLpUvr6lCLvMbNpYFL84zJOfnGGBEU6
 /jDUomvAJFswed1wYQd9sjUz9GmCEdAO+4c7Fo+zXjA5ywaGvXpmnkSi9
 oRMHui3YvS7WtwbXe4vfMa/ikRcikwjagT6iHGRv89V7lI6GaosZp9jz6
 R/ql9Bz3ttNgX9oT+IlzBy1OUdqngHi21fTP1iJ1Te1ZcuTUzph07O65E
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HsHKjCCC
Subject: Re: [Buildroot] [PATCH] package/tbtools: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Apr 29, 2024 at 02:36:37PM GMT, Mika Westerberg wrote:
> Hi Aapo,
> 
> On Mon, Apr 29, 2024 at 02:23:56PM +0300, Aapo Vienamo wrote:
> > Hi Mika,
> > 
> > On Mon, Apr 29, 2024 at 02:04:02PM GMT, Mika Westerberg wrote:
> > > This is a collection of tools for Linux Thunderbolt/USB4 development,
> > > debugging and validation.
> > > 
> > > Signed-off-by: Mika Westerberg <mika.westerberg at linux.intel.com>
> > > ---
> > >  package/Config.in          |  1 +
> > >  package/tbtools/Config.in  |  9 +++++++++
> > >  package/tbtools/tbtools.mk | 12 ++++++++++++
> > >  3 files changed, 22 insertions(+)
> > >  create mode 100644 package/tbtools/Config.in
> > >  create mode 100644 package/tbtools/tbtools.mk
> > > 
> > > diff --git a/package/Config.in b/package/Config.in
> > > index cdbf3577f8e1..e346917649a8 100644
> > > --- a/package/Config.in
> > > +++ b/package/Config.in
> > > @@ -157,6 +157,7 @@ menu "Debugging, profiling and benchmark"
> > >  	source "package/stress-ng/Config.in"
> > >  	source "package/sysdig/Config.in"
> > >  	source "package/sysprof/Config.in"
> > > +	source "package/tbtools/Config.in"
> > >  	source "package/tcf-agent/Config.in"
> > >  	source "package/trace-cmd/Config.in"
> > >  	source "package/trinity/Config.in"
> > > diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
> > > new file mode 100644
> > > index 000000000000..d2a1405eb5e8
> > > --- /dev/null
> > > +++ b/package/tbtools/Config.in
> > > @@ -0,0 +1,9 @@
> > > +config BR2_PACKAGE_TBTOOLS
> > > +	bool "tbtools"
> > > +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> > 
> > Tested this and theres a dependency on libudev which should be declared
> > here. Also, currently the 32-bit build fails (for x86 at least), so I'd
> > suggest BR2_ARCH_IS_64 for now to prevent breakage.
> 
> Thanks for testing! I for some reason did not see issue with libudev but
> okay :)

That could be if you had already enabled udev in the buildroot config.
The udev crate depends on libudev-sys, which is where the build fails
as it's just FFI bindings for the system libudev.

> If I add following in v2, would it work for you?

Yes, with these changes:
Reviewed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>

> diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
> index d2a1405eb5..2627ea8bfc 100644
> --- a/package/tbtools/Config.in
> +++ b/package/tbtools/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_TBTOOLS
>  	bool "tbtools"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_ARCH_IS_64
>  	select BR2_PACKAGE_HOST_RUSTC
>  	help
>  	  tbtools is a collection of tools for Linux Thunderbolt/USB4
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
