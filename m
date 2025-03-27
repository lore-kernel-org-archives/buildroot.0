Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36863C3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 07:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 787DF8433C;
	Thu, 27 Mar 2025 07:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWysn7h4kQMI; Thu, 27 Mar 2025 07:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5473E84747
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5473E84747;
	Thu, 27 Mar 2025 07:33:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 444D412A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 07:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E39F42528
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 07:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C81zY7s33ByF for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 07:33:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95B9C42510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B9C42510
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95B9C42510
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 07:33:30 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2239c066347so15899665ad.2
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 00:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743060810; x=1743665610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNKlO6FhqHPSmJZO/2LrIH5zaeZRrEW1vkdapBanqHE=;
 b=EO0F4Q5o7hwDyAwELO657B1e89VOEh8q+k8gafsCOmHwUyRRMfyoioSwhnNqSTarll
 acA4CjqCZA0DqCgs423+Gsl0Y9enXOHHQIiHCFSy0DUoB9tN2n2rqaUCmauq0D6KFNuf
 CUPXsLfq0TqlZQ6fgeUosKZ/bNHV18CrMZSZMJ3B2q89QORxaOQFaUcoHV6EuH0hGWY+
 8PZZ2oQQ8HSecKx+3IJGNXnUXznzuU0rar4heavGYuAWAS9eA8I5QjCxm70NmwWPTeSq
 RQtFqpF635b9zYxWTozXAYj76ODp9iVKd0GQU6tDrmw6ZD4Ew/gQmx+dPMRU8JWz/HjC
 TUnA==
X-Gm-Message-State: AOJu0YxWBcZViXJtbICuXcOoO8O4GlJkURBamIoVqCPKd9li/6UmMWzh
 MdL1CjJsM6Dsgg+4fSJK/XwCyMjIXYsXa+I+LkAUj7IfLOOhgxnTNf2qsewolVI=
X-Gm-Gg: ASbGnctQjsGlpc4/D6BIdLuOg2DUU9F4vra6vWRCF3g6BEysxBVRlNr6fvuMwPxsyvu
 m3u32kNXmrs48rps559Dbfn65Nb2EjIVrptIjpZjbeohBU31WWCiTKHXa1E5PRt38xlmDARSW/2
 siBEw8MVRmNcJ9uOJft1Gy4PK1yB6vKfZ8WHHK8Bj2y+aQlXhCQG+v0XWbUauNbMGJCiyyNEAhL
 E9gXwVxP29XdWUg9YHRtxMXBbmjsnfIp71mBCupkHqOc+9ETZOH1w7UdUSDknPmZlay30huxj/o
 r7pvyTMJ9HhaqCCUDfabhnw51rMrfzYN82rpJJLBEw/AmJRojDo=
X-Google-Smtp-Source: AGHT+IGROSd8yEBZlewImfsKdScgBN+wcMH0O+evNGnA0Lu6eWl5PiocmdHBctgIlTJH2dtdyLT07g==
X-Received: by 2002:a17:902:d4c5:b0:21f:6546:9af0 with SMTP id
 d9443c01a7336-22804957c1emr44739655ad.44.1743060809622; 
 Thu, 27 Mar 2025 00:33:29 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:2a06:b365:a8c6:b138])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811daa6esm122177175ad.163.2025.03.27.00.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 00:33:28 -0700 (PDT)
Date: Thu, 27 Mar 2025 00:33:26 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Z-T_RjIweX1Vy2iA@ghost>
References: <20250310-fix_external_toolchains-v1-1-446f48af7cf7@rivosinc.com>
 <43c0f8e3-4e9f-4bf8-a0dd-0f39824c03a1@mind.be>
 <Z-NtC3refUELEx5t@ghost>
 <3dcd408a-1a5a-4a65-8cdf-8677a9d08cbd@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3dcd408a-1a5a-4a65-8cdf-8677a9d08cbd@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743060810; x=1743665610;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dNKlO6FhqHPSmJZO/2LrIH5zaeZRrEW1vkdapBanqHE=;
 b=3EdfqvutNmsBOo9HsLrr8HOTeEuxa5uxeLtTiwg2EE1oZWFJCNSihCTolUKbw7jwaQ
 Z6CWqHBvNmNhvuFkjldMa7S157/mDR67Umim2zvsRPRTjgOT099rpkobJnWSx/vUOgST
 mZcpbqWP6BmVEgNhQMAbTO8jXudjjF/mglDxad3sTDbrlzuAH9s+3qoFae88VLnGIub+
 139t3xfSUjOg38BsmF9nZGh0CKrAZmJMQQYfGVwrjux1t/QsxOvGkn73HgOSn9/a/Hl9
 DbrhXg+ktRtQfcy/BF86cri1aJaGQ5Mo86yDEQACfA2BCgcVjYTgXZKZRav9PFq7KSwD
 QB7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=3Edfqvut
Subject: Re: [Buildroot] [PATCH] toolchain-external: Fix external toolchains
 when BR2_ROOTFS_MERGED_USR
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

On Wed, Mar 26, 2025 at 09:01:01AM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 26/03/2025 03:57, Charlie Jenkins wrote:
> > On Tue, Mar 25, 2025 at 10:47:12PM +0100, Arnout Vandecappelle wrote:
> > > 
> > > 
> > > On 11/03/2025 03:48, Charlie Jenkins wrote:
> > > > External toolchains like crosstool-ng place libraries at /lib.
> > > > When BR2_ROOTFS_MERGED_USR is enabled, these libraries were not being
> > > > copied into the target. This caused these toolchains to be unusable with
> > > > this option.
> > > > 
> > > > WHen BR2_ROOTFS_MERGED_USR is selected, copy the /lib and /lib64
> > > > directories into /usr/lib and /usr/lib64 respectively.
> > > 
> > >   This should already happen, because the lib -> usr/lib symlink should be
> > > created in staging dir before the toolchain sysroot is copied.
> > > 
> > >   But you reported in the other thread that the problem is actually with the
> > > symlink:
> > > 
> > > > $ ls -l ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so
> > > > lrwxrwxrwx 1 charlie rvs 6 Mar  9 22:58 ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so -> ../../
> > > 
> > >   So this looks liek the symlink creation is going wrong. That is done by the
> > > following code:
> > > 
> > > 	for link in $$(find $(STAGING_DIR) -type l); do \
> > > 		target=$$(readlink $${link}) ; \
> > > 		if [ "$${target}" == "$${target$(SHARP_SIGN)/}" ] ; then \
> > > 			continue ; \
> > > 		fi ; \
> > > 		relpath="$(call relpath_prefix,$${target$(SHARP_SIGN)/})" ; \
> > > 		echo "Fixing symlink $${link} from $${target} to
> > > $${relpath}$${target$(SHARP_SIGN)/}" ; \
> > > 		ln -sf $${relpath}$${target$(SHARP_SIGN)/} $${link} ; \
> > > 	done ; \
> > > 	relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
> > > 	if [ "$${relpath}" != "" ]; then \
> > > 		for i in $$(find -H $(STAGING_DIR)/$${ARCH_LIB_DIR}
> > > $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} -type l -xtype l); do \
> > > 			LINKTARGET=`readlink $$i` ; \
> > > 			NEWLINKTARGET=$${LINKTARGET\#$$relpath} ; \
> > > 			ln -sf $${NEWLINKTARGET} $$i ; \
> > > 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
> > > 		done ; \
> > > 	fi ; \
> > > 
> > >   So I guess there is a symlink from usr/lib/libm.so to ../../lib/libm.so in
> > > the ct-ng toolchain, and that this doesn't get handled correctly by the code
> > > above. But honestly that code is not xxactly readable...
> > 
> > Are you suggesting that this is a problem with crosstool-ng and not with
> > Buildroot?
> 
>  No not really. It's annoying that ct-ng doesn't use merged usr in its
> sysroot, but not wrong as such.
> 
>  What I'm suggesting is that Buildroot should already copy all the
> libraries, but it is just not creating symlinks correctly. And just rsyncing
> stuff willy-nilly is probably going to break other external toolchains.
> 
> > 
> > > 
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > > I originally reported this issue here [1].
> > > > 
> > > > [1] https://lore.kernel.org/buildroot/Z86AGdrKHaUqgLVt@ghost/T/#t
> > > > ---
> > > >    toolchain/helpers.mk | 7 +++++++
> > > >    1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> > > > index f3fdaaec07c5a01688da685c4d0fd4e2cb357b95..b565da8a3a8f12567920f14dd3b6a18e548da6c7 100644
> > > > --- a/toolchain/helpers.mk
> > > > +++ b/toolchain/helpers.mk
> > > > @@ -55,6 +55,9 @@ copy_toolchain_lib_root = \
> > > >    # corresponding architecture variants), and we don't want to import
> > > >    # them.
> > > >    #
> > > > +# Furthermore, when BR2_ROOTFS_MERGED_USR is enabled, the 'lib*' directories
> > > > +# need to be copied over to usr/'lib*'.
> > > > +#
> > > >    # If ARCH_LIB_DIR is not a singular directory component, e.g.
> > > >    # 'lib32/octeon2', then symbolic links in ARCH_LIB_DIR and
> > > >    # usr/ARCH_LIB_DIR may be broken because Buildroot will flatten the
> > > > @@ -109,6 +112,10 @@ copy_toolchain_sysroot = \
> > > >    	ARCH_SUBDIR="$(strip $3)"; \
> > > >    	ARCH_LIB_DIR="$(strip $4)" ; \
> > > >    	SUPPORT_LIB_DIR="$(strip $5)" ; \
> > > > +	if [ "$(BR2_ROOTFS_MERGED_USR)" == "y" ]; then \
> > > > +		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/lib $(STAGING_DIR)/usr/lib 1>&2 ; \
> > > > +		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} 1>&2 ; \
> > > 
> > >   It looks suspicious to me that you copy both lib and ARCH_LIB_DIR - only
> > > one of them should be valid (or, usually, one is a symlink to the other).
> > > Also, ARCH_LIB_DIR is already handled in the loop below (in a slightly
> > > different way, because thanks to the trailing /, the lib -> usr/lib symlink
> > > is preserved).
> > 
> > Without both, the symlinks are not preserved.
> 
>  Well, obviously symlinks are not preserved correctly, because the Buildroot
> logic takes the libraries from several places and puts all of them in
> usr/lib. So cross-directory symlinks are not correctly preserved. That's why
> there is additional code after the rsync loop that repairs symlinks.
> 
>  I'm not entirely sure how it is possible that these additional rsyncs
> preserve it. I suspect that the second one destroys the lib64->lib symlink
> and this somehow makes the libm.so symlink valid again.
> 
> > Getting rid of the
> > ARCH_LIB_DIR statement here results in the symlink being garbage:
> > 
> > ./host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so -> ../../
> 
>  I suspect that this garbage is created by the symlink-repairing code that I
> pointed out above. So the correct fix is to fix that symlink code, not to do
> additional rsyncs that duplicate the rsyncs that already exist.
> 

Ooh I see, that makes sense.

> 
>  If you put the toolchain in some location where I can downoad it, I could
> give it a try (but don't count on it too much, my Buildroot contributions
> are unfortunately very unreliable).
> 


I didn't know where to put it so I put it in git with LFS [1]. I also made a
config "external_toolchain_testing_defconfig" that can be used. The
commit that has the workaround is included. Reverting that commit will
cause compilation to fail and the broken symlinks can be found.

Much appreciated if you have any time to look!

[1] https://github.com/charlie-rivos/buildroot

- Charlie

>  Regards,
>  Arnout
> 
> > 
> > - Charlie
> > 
> > > 
> > >   Regards,
> > >   Arnout
> > > 
> > > > +	fi ; \
> > > >    	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
> > > >    		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
> > > >    			continue ; \
> > > > 
> > > > ---
> > > > base-commit: 4809690d42f9b395ccb76ee7583c199fdd8d42c5
> > > > change-id: 20250310-fix_external_toolchains-d1b8c4da0be8
> > > 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
