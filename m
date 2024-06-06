Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5A1C27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 11:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 396DB80EC0;
	Thu,  6 Jun 2024 11:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2YYCjk1Hdv3; Thu,  6 Jun 2024 11:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 305D980ED5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 305D980ED5;
	Thu,  6 Jun 2024 11:49:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 826A71BF5DE
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F8E841474
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pU9RN2J-vJOr for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 11:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7219041461
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7219041461
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7219041461
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 11:49:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5BAC06173B;
 Thu,  6 Jun 2024 11:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7481DC2BD10;
 Thu,  6 Jun 2024 11:49:07 +0000 (UTC)
Mime-Version: 1.0
Date: Thu, 06 Jun 2024 14:49:05 +0300
Message-Id: <D1SWT4PQ5SRG.3CIZII0XWVO0O@kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240605233503.23516-1-jarkko@kernel.org>
 <20240605233503.23516-4-jarkko@kernel.org> <ZmGBnfkfL4h2SDac@landeda>
In-Reply-To: <ZmGBnfkfL4h2SDac@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717674548;
 bh=nSF12mc+YktEGbug99b+Z3/ITQXX662fc0af62EnJ2M=;
 h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
 b=bFJlX0pb302qa5/Q5ERqInNc/33QPif1emRo7mMA+/SMKanBdun6gNOibt/tO08Uj
 XxsaYq4tUUhabXdmXhuISWcx5WqCLtgeRQapaJw0XRkyhw4DNxvo1G/gHSrnsiwYqh
 UUFYUhL/wVrNlrOg7BBd+0pGf8aXGWimcSKRD6pKx7CGz2fYKmVl8oFG+keFLJPQKb
 dExoWcGYFevO6hwfaI+ci8VwPsT0L62PugmCl2jXHEPX70ay1ZarZOtbwB5DDgpy+u
 Dly6144PvQAuDpfCjEcQ8HEvie8fKYW5IEUY1Zlm068Uacx8OJ5IuTJAKCkmAbgTJ8
 KvVGHedG19FKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bFJlX0pb
Subject: Re: [Buildroot] [PATCH v7 3/3] package/swtpm: add host package
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
Cc: buildroot@buildroot.org, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu Jun 6, 2024 at 12:30 PM EEST, Yann E. MORIN wrote:
> Jarkko, All,
>
> On 2024-06-06 02:35 +0300, Jarkko Sakkinen spake thusly:
> > The SWTPM package provides TPM emulators with different front-end
> > interfaces to libtpms. TPM emulators provide socket interfaces (TCP/IP and
> > Unix) and the Linux CUSE interface for the creation of multiple native
> > /dev/vtpm* devices.
> > 
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > ---
> [--SNIP--]
> > diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> > new file mode 100644
> > index 0000000000..b05a248c03
> > --- /dev/null
> > +++ b/package/swtpm/swtpm.mk
> > @@ -0,0 +1,23 @@
> > +################################################################################
> > +#
> > +# swtpm
> > +#
> > +################################################################################
> > +
> > +SWTPM_VERSION = 0.8.2
> > +SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
> > +SWTPM_LICENSE = BSD-4-Clause
> > +SWTPM_LICENSE_FILES = LICENSE
> > +
> > +# Required because a plain Git clone is used:
> > +HOST_SWTPM_AUTORECONF = YES
> > +HOST_SWTPM_DEPENDENCIES = \
> > +	host-json-glib \
> > +	host-libopenssl \
> > +	host-libtasn1 \
> > +	host-libtool \
> > +	host-libtpms \
> > +	host-pkgconf
> > +HOST_SWTPM_CONF_OPTS = --with-openssl --without-seccomp
> > +
> > +$(eval $(host-autotools-package))
>
>     $ make defconfig
>     $ make host-swtpm
>     [...]
>     configure: error: expect is required: expect package
>
> It is only needed for tests, so I disabled those.
>
> I took that opportunity to also reorganise the variables in a more
> logical manner: first, depenencies, then autoreconf, finally configure
> opts.
>
> Applied to next, thanks.

Thanks a lot for addressing those issues!

With systemd I'll test if just those fixes without version upgrade
would take of it because that would be a better order. And also
split into two patches.

I.e. thes transcripts:

Filesystem found in kernel header but not in filesystems-gperf.gperf: BCACHEFS_SUPER_MAGIC                                                    
Filesystem found in kernel header but not in filesystems-gperf.gperf: PID_FS_MAGIC                                                            

Is this anywhere near how the upstream references could be tagged?

Upstream: ed01b92e1c92 ("basic: add PIDFS magic (#31709)")
Upstream: 201148b08de6 ("basic: Add BCACHEFS magic")

I did not look into any bug database just plain scavenged the superblock
keywors for systemd's commit log :-)

Probably for a project like BuildRoot there must be really something
actually enforocing the upgrade :-)

>
> Regards,
> Yann E. MORIN.

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
