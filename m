Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F98C433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 18:13:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACAC6138F
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 18:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DACAC6138F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E19F80C4C;
	Thu, 18 Nov 2021 18:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGmYJ0DFDA2B; Thu, 18 Nov 2021 18:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F19B81016;
	Thu, 18 Nov 2021 18:13:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E7871BF30B
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 18:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79AB3404CF
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 18:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7PyaZbixCgTX for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 18:13:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10BD8404BD
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 18:13:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3d2a:c72d:f7cc:1319])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A47B95FFB9;
 Thu, 18 Nov 2021 19:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637259218;
 bh=mYYVE/UIavrw2RDv2wRce1rDnG5SBD/F2Gz7ymMqK3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aPm6irAVkSug+PWR/W6PWOmo2GuZxdTm0duyO7Ce9usZsDMVw64DRnxIdhlFI0CsH
 eoT5wc2jINYgoUg4teHc6Wzmdvf+XH30Vbh8RGngvvHsJP/K1tZHnEx2YMR8D2GuSV
 AIVKOh/fKh1GgODq25djWL/epMvgxei5CUv5yXGYdUPMBCABhCnZMbPzI3BDujLMuY
 3qUyu+XS4Ru85xmg7qlDvNQ+fUALWpzvQnUNx1LcfNOL5/VyHilt2yy+uoNUNoEXDt
 X8BVIqhpdKDOpTEkDbmHGNj1ohyCeYREv3pTpLga8fkY86sXgyxjMgH0+xKxPr8vWA
 Y4SNjKiNhjyrQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 18 Nov 2021 19:13:30 +0100
Date: Thu, 18 Nov 2021 19:13:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211118181330.GM247986@scaer>
References: <20211117173152.994041-1-fontaine.fabrice@gmail.com>
 <a8caa7e3-f449-ebd0-e94b-cff8163759f2@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8caa7e3-f449-ebd0-e94b-cff8163759f2@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/apparmor: fix per-package build
 with apache
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2021-11-17 21:47 +0100, Arnout Vandecappelle spake thusly:
> On 17/11/2021 18:31, Fabrice Fontaine wrote:
> >Fix the following per-package build failure with apache:
> >
> >/home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/../../usr/build-1/libtool --silent --mode=link /home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/aarch64-linux-gcc    -o mod_apparmor.la  -rpath /usr/modules -module -avoid-version    mod_apparmor.lo -L/home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -lapparmor
> >/home/buildroot/autobuild/instance-3/output-1/per-package/apache/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: cannot find /lib64/libc.so.6
> >
> >This build failure is raised because the fix added by commit
> >3c836e54203b16015c9c52cbe007adc92d293a0d was incomplete as the apr
> >special libtool script was not patched (see commit
> >b747c29c4e8eb89b7b99658dfd34f4a6b6b0744d for a detailled explanation)
> >
> >Fixes:
> >  - http://autobuild.buildroot.org/results/6747b1cb11b129ea4bcb1ecc9645e94fb8e095e8
> >
> >Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >---
> >  package/apparmor/apparmor.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> >index 400ea349ae..6f0e59224d 100644
> >--- a/package/apparmor/apparmor.mk
> >+++ b/package/apparmor/apparmor.mk
> >@@ -59,7 +59,8 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> >  define APPARMOR_FIXUP_APXS
> >  	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apparmor/@g" \
> >  		$(STAGING_DIR)/usr/bin/apxs \
> >-		$(STAGING_DIR)/usr/build/config_vars.mk
> >+		$(STAGING_DIR)/usr/build/config_vars.mk \
> >+		$(STAGING_DIR)/usr/build-1/libtool
> 
>  I was surprised by the build-1, but it seems to be correct. Apache is weird...
> 
>  Now I said that: shouldn't all of this move to apache.mk, by adding them to
> APACHE_CONFIG_SCRIPTS?

In fact, no, becasue FOO_CONFIG_SCRIPTS are fixed at the end of
staging-install (even after the hooks).

However, for per-package, STAGING_DIR will change, and we really need to
fix the paths for each packages before they are configured... That's why
we use PER_PACKAGE_DIR in the fixups...

But ideally, I'd like that a package be able to provide "prepare-hooks"
(or some better name) that are executed not in that package context, but
in the context all packages that depend on it; that would allow fixing
those paths in a single location...

Regards,
Yann E. MORIN.

> Of course, those are assumed to be in
> $(STAGING_DIR)/usr/bin, so you'd have to put ../build/config_vars.mk and I'm
> not sure if that won't break the realpath stuff...
> 
>  So anyway, applied to master, but it would be nice to do this in a cleaner way.
> 
>  Regards,
>  Arnout
> 
> >  endef
> >  APPARMOR_POST_CONFIGURE_HOOKS += APPARMOR_FIXUP_APXS
> >  endif
> >
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
