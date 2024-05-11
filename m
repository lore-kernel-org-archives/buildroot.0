Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEFEC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3F0607D9;
	Sat, 11 May 2024 07:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GYdtvMW25vV; Sat, 11 May 2024 07:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CEF6082A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CEF6082A;
	Sat, 11 May 2024 07:52:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1572D1BF47E
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01CD56082A
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6NP4sMHHzTp for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:52:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.15;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1431607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1431607D9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1431607D9
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:52:01 +0000 (UTC)
X-CSE-ConnectionGUID: Y612y/KQRxi0TDLzRgq/nw==
X-CSE-MsgGUID: QnVDu4msRj6H2cOISCJEoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="15207539"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; d="scan'208";a="15207539"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2024 00:52:01 -0700
X-CSE-ConnectionGUID: pcO4FCudRHS2VWqH+2Tk3A==
X-CSE-MsgGUID: 1d8cnHWkQxK2DzvqLgA8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; d="scan'208";a="61025499"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP; 11 May 2024 00:51:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 85AC7142; Sat, 11 May 2024 10:51:58 +0300 (EEST)
Date: Sat, 11 May 2024 10:51:58 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240511075158.GF4162345@black.fi.intel.com>
References: <20240430045945.2164313-1-mika.westerberg@linux.intel.com>
 <20240510134411.27f5639b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510134411.27f5639b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715413922; x=1746949922;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=apFiiVPthxCz/h6Ifj053+ltuGui/4cpN3R+ucAdJGQ=;
 b=eN6Y6Qiv2ITUdyCVEgB+sjrIoqV3Y9FgFCY3Su1c8thAV5LIqwAzg5+T
 6dFd1S7hF7a77o3wtt2vOdd+dig6lIDZCzZ4236CMWiDn0Aj3wvkQspai
 nUe95f0sE1CSiZjgU7bL9J1mcJYNJamSJs6EwVyY6iWrX4ES7rZ4fgMET
 8yIupGgET51CdpdPBhZQ9riICpilDTQRVmrtGxZJHi32TbgkzDJMlOCrj
 KgUkn+5puBEiYyvMcx+CZ2W8Pcx9SxiPuA7axW3QnpJgJG09c7j3+IT2+
 uhz8IoBz0zrckMS27CjsN+RNK6oNmMXYmXDnmLzlP7tr+AtHSQPDXrq+L
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eN6Y6Qiv
Subject: Re: [Buildroot] [PATCH v2] package/tbtools: new package
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
Cc: Aapo Vienamo <aapo.vienamo@linux.intel.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Fri, May 10, 2024 at 01:44:11PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for your patch. I fixed up a few things, wanted to apply... but
> it fails to build for me. See below a number of comments, and details
> about the build failure.

Thanks for looking into it!

> On Tue, 30 Apr 2024 07:59:44 +0300
> Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> 
> > This is a collection of tools for Linux Thunderbolt/USB4 development,
> > debugging and validation.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Reviewed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> > ---
> > Changes from v1:
> > 
> > - Added dependency to udev (libudev) and 64-bit builds.
> > - Added tag from Aapo.
> > 
> >  package/Config.in          |  1 +
> >  package/tbtools/Config.in  | 11 +++++++++++
> >  package/tbtools/tbtools.mk | 12 ++++++++++++
> >  3 files changed, 24 insertions(+)
> 
> You need to add an entry to the DEVELOPERS file, like this:
> 
> +N:     Mika Westerberg <mika.westerberg@linux.intel.com>
> +F:     package/tbtools/
> 
> (make sure to respect alphabetic ordering of developers)
> 
> > diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
> > new file mode 100644
> > index 000000000000..2627ea8bfcca
> > --- /dev/null
> > +++ b/package/tbtools/Config.in
> > @@ -0,0 +1,11 @@
> > +config BR2_PACKAGE_TBTOOLS
> > +	bool "tbtools"
> > +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> > +	depends on BR2_PACKAGE_HAS_UDEV
> > +	depends on BR2_ARCH_IS_64
> 
> I think it was worth adding a comment about this:
> 
> +       # Fails to build on 32-bit systems
> 
> > +	select BR2_PACKAGE_HOST_RUSTC
> > +	help
> > +	  tbtools is a collection of tools for Linux Thunderbolt/USB4
> > +	  development, debugging and validation.
> > +
> > +	  https://github.com/intel/tbtools
> 
> You need a Config.in comment:
> 
> +comment "tbtools needs udev /dev management"
> +       depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +       depends on BR2_ARCH_IS_64
> +       depends on !BR2_PACKAGE_HAS_UDEV
> 
> 
> > diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
> > new file mode 100644
> > index 000000000000..61986ca8d311
> > --- /dev/null
> > +++ b/package/tbtools/tbtools.mk
> > @@ -0,0 +1,12 @@
> > +################################################################################
> > +#
> > +# tbtools
> > +#
> > +################################################################################
> > +
> > +TBTOOLS_VERSION = v0.3.2
> > +TBTOOLS_SITE = $(call github,intel,tbtools,$(TBTOOLS_VERSION))
> > +TBTOOLS_LICENSE = MIT
> > +TBTOOLS_LICENSE_FILES = LICENSE
> 
> You're missing:
> 
> +TBTOOLS_DEPENDENCIES = udev
> 
> without which udev is not built before tbtools. Without this, it fails
> with a pkg-config detection issue.
> 
> But even with udev built before, I get a build failure:
> 
>   = note: /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-musl/12.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: cannot find -ludev: No such file or directory
>           collect2: error: ld returned 1 exit status
> 
> You can reproduce the following defconfig:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE=y
> BR2_INIT_NONE=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_TBTOOLS=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> Could you have a look and submit a v2 ?

I think Rust udev wants to have glibc as the C library. I will add
dependency to that as well.

I'll fix these up in the next version.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
