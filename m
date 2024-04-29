Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F15AC4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 11:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B155E6077B;
	Mon, 29 Apr 2024 11:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yebtmMPnwEiR; Mon, 29 Apr 2024 11:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF24B60780
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF24B60780;
	Mon, 29 Apr 2024 11:36:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F95A1BF23C
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 11:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7891D40561
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 11:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbfuG5HFQvPK for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 11:36:40 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.12;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBD9A40556
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBD9A40556
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBD9A40556
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 11:36:39 +0000 (UTC)
X-CSE-ConnectionGUID: 4spOUxajQNaOSIod+dXZyw==
X-CSE-MsgGUID: ru/+GzxlRaeGQNGWs0wSSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13833033"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="13833033"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 04:36:39 -0700
X-CSE-ConnectionGUID: koXNOsO4TQCPJG8yFtnpEA==
X-CSE-MsgGUID: ZHjaqeXjQiWErbsoGVXS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30736193"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP; 29 Apr 2024 04:36:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 593E815B; Mon, 29 Apr 2024 14:36:37 +0300 (EEST)
Date: Mon, 29 Apr 2024 14:36:37 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Message-ID: <20240429113637.GF3969176@black.fi.intel.com>
References: <20240426113756.3962234-1-mika.westerberg@linux.intel.com>
 <yikqqkczs6qq3uonbqxhmv73gnp3nfvlwucki3ih62rk76zak6@nokzbi4ijbnn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yikqqkczs6qq3uonbqxhmv73gnp3nfvlwucki3ih62rk76zak6@nokzbi4ijbnn>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714390600; x=1745926600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VxQ0QWdN4ypqFgBkR7nEw63eDRXAinXBE+DxzWeXwl4=;
 b=Pj9vFe6O4nT8i///ld+vTo9DMHBczSu0aukBLFiSKCGPmihUQJVtBFfh
 t/hb5tEV4scCXoxyLggPYAvMPLAIN2rMZzxm7R8M/dVmBdFa83AQlWRdh
 bXCTjWpsu8+lMO3ZCrTqRTK63LHLDZL+rj7I3xOuIy5Tgx8DTlgoAIYLE
 GxhtzrRNdX7c+G53bM9Sj5C912UuIFbiTkXoCPwGGiNgYYJQVV2FJ0Y6r
 VyxH1Z2TOu0xw/i3aPjsV/9qmdE3rofiVmqHV1DrVXcCgRuY6SYLmaLex
 MoMbCGvR2FvJthvJggwpiaKgXb5UiByuZc6/2n5HyxoLYvzKyxRBvF6Ia
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Pj9vFe6O
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

Hi Aapo,

On Mon, Apr 29, 2024 at 02:23:56PM +0300, Aapo Vienamo wrote:
> Hi Mika,
> 
> On Mon, Apr 29, 2024 at 02:04:02PM GMT, Mika Westerberg wrote:
> > This is a collection of tools for Linux Thunderbolt/USB4 development,
> > debugging and validation.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg at linux.intel.com>
> > ---
> >  package/Config.in          |  1 +
> >  package/tbtools/Config.in  |  9 +++++++++
> >  package/tbtools/tbtools.mk | 12 ++++++++++++
> >  3 files changed, 22 insertions(+)
> >  create mode 100644 package/tbtools/Config.in
> >  create mode 100644 package/tbtools/tbtools.mk
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index cdbf3577f8e1..e346917649a8 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -157,6 +157,7 @@ menu "Debugging, profiling and benchmark"
> >  	source "package/stress-ng/Config.in"
> >  	source "package/sysdig/Config.in"
> >  	source "package/sysprof/Config.in"
> > +	source "package/tbtools/Config.in"
> >  	source "package/tcf-agent/Config.in"
> >  	source "package/trace-cmd/Config.in"
> >  	source "package/trinity/Config.in"
> > diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
> > new file mode 100644
> > index 000000000000..d2a1405eb5e8
> > --- /dev/null
> > +++ b/package/tbtools/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_TBTOOLS
> > +	bool "tbtools"
> > +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> 
> Tested this and theres a dependency on libudev which should be declared
> here. Also, currently the 32-bit build fails (for x86 at least), so I'd
> suggest BR2_ARCH_IS_64 for now to prevent breakage.

Thanks for testing! I for some reason did not see issue with libudev but
okay :)

If I add following in v2, would it work for you?

diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
index d2a1405eb5..2627ea8bfc 100644
--- a/package/tbtools/Config.in
+++ b/package/tbtools/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_TBTOOLS
 	bool "tbtools"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_ARCH_IS_64
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  tbtools is a collection of tools for Linux Thunderbolt/USB4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
