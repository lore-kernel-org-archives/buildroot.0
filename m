Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BB4C36005
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 02:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 797CD40838;
	Wed, 26 Mar 2025 02:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eo5fxZXZrU4N; Wed, 26 Mar 2025 02:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A7934085D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A7934085D;
	Wed, 26 Mar 2025 02:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C33D5E4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 02:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C049A40813
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 02:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5RB4S4Xp1CF for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 02:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5596540838
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5596540838
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5596540838
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 02:57:19 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22580c9ee0aso130074955ad.2
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 19:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742957838; x=1743562638;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4s5N6mF944aYh5kWWjM25b57zlYMpeQV4JKecCj80VA=;
 b=oTkqkui7YS+W7EL8rFLzF4rEDdcgHB74lom4y2/zE63d7R3VXaxqFkRYe635V5eWrL
 /E7xcVdIcz149e02U8XsXCIF6BIZ7VqdoRi2YuAOVrgFm1w5KK9sa+xPUtbf8ljT/PRQ
 0bCx5HFRGbNeI7oTuyeEgex2y51t+TYnKKJXtJJzHxV5hedswM089Eg8to3IL0lAJiS9
 m7l8LsXPeYtWc6uFg1xkPpEIDkAcRG9D9axEPUouLaFKlFuiFOxfhGJ7u4vz8cGDzikA
 UKQXI1lhXa3MlMJPOnhx4dCeVvBCLrXvWZOk09pf5GdJCRuosKvsWe3HNsTeK1xmaY3E
 Y9mw==
X-Gm-Message-State: AOJu0Yx/kbOzyJaB8qsP8cUDXSAAFYgokybvPGxzAfVqu2CRBvJaTOkW
 wgL8kdzwqqqpemRMqey/rTLuJiXr6JhwxRsnTh0Xqs4JddAugMIyw42UhwmrdNOdCDemmOUNTUl
 U
X-Gm-Gg: ASbGncvKlE+1ZRvupHUszCyHwQlIxvtMXHcYoYQMwglarpCmJTnZgEETs9eThqBKegF
 obbJoTEzP7aO+2et1J/0kGBC6qopC2STqrEOsYLHtmpy25+KBj0M1p9v4CDdu8USGkataIbmIau
 PfdIEhB283nY7OvkJI5WHieu6hNkn1Wq14/eIqQ+72Sh0VczwfP2FWp/LllFwf3x5p9s48ATw/6
 alMikIKb3eDyId/AyaIHGCdFf4rkI8qNlBUIus6YbaVtCBIJ7+xDOOnDz+QbUr0GNA9MEvZCXv7
 dDaSyRzGnBJcvNDdvDX5h2h1qcviaY4hD8kfUg==
X-Google-Smtp-Source: AGHT+IEGljqQ5LaiUXqlTiDmqHZvjOCNbKQiKo45km2prMwE0sAK/o/mEwk+LKWAmHY3HO4/Jw0Xcw==
X-Received: by 2002:a05:6a21:9185:b0:1f5:8f34:bf82 with SMTP id
 adf61e73a8af0-1fe4347daebmr36267021637.36.1742957838509; 
 Tue, 25 Mar 2025 19:57:18 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:8da:9963:dfd5:71e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73905fa92dfsm10936509b3a.5.2025.03.25.19.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 19:57:17 -0700 (PDT)
Date: Tue, 25 Mar 2025 19:57:15 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Z-NtC3refUELEx5t@ghost>
References: <20250310-fix_external_toolchains-v1-1-446f48af7cf7@rivosinc.com>
 <43c0f8e3-4e9f-4bf8-a0dd-0f39824c03a1@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43c0f8e3-4e9f-4bf8-a0dd-0f39824c03a1@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742957838; x=1743562638;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4s5N6mF944aYh5kWWjM25b57zlYMpeQV4JKecCj80VA=;
 b=dMKvxPpnmLh2WOMIEHeJ+Z0t1qD6c/tOFhTegD/GaozLgQXdwNhgFva3m6TRs/rUmL
 RjiWzHa60RGY6VK1alBmn6MwrZk/VNH8kRFuTIsXoHTdyaCKH48yaK7Pky0ObSsLQmSA
 htDwYz9ZEl6Mh2VWN8wjMcXgMQoazvbdSsUtXso9+4uhfvZ9FApj7W6ZwYK1VZXPG8o9
 I2NhZofFWI+PxrqqmdtUczE8QYiV/ELKmf63b+J0mRL7X/z6S71HW01kMYc2iqCCcrLs
 VWFF8rjorYIBLP5LVgLdAoBUVJKtQ3ieLQplDRvfAuLVS9WN3lGYhZnbJu4xR1GJwSU+
 Jg/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=dMKvxPpn
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

On Tue, Mar 25, 2025 at 10:47:12PM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 11/03/2025 03:48, Charlie Jenkins wrote:
> > External toolchains like crosstool-ng place libraries at /lib.
> > When BR2_ROOTFS_MERGED_USR is enabled, these libraries were not being
> > copied into the target. This caused these toolchains to be unusable with
> > this option.
> > 
> > WHen BR2_ROOTFS_MERGED_USR is selected, copy the /lib and /lib64
> > directories into /usr/lib and /usr/lib64 respectively.
> 
>  This should already happen, because the lib -> usr/lib symlink should be
> created in staging dir before the toolchain sysroot is copied.
> 
>  But you reported in the other thread that the problem is actually with the
> symlink:
> 
> > $ ls -l ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so
> > lrwxrwxrwx 1 charlie rvs 6 Mar  9 22:58 ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so -> ../../
> 
>  So this looks liek the symlink creation is going wrong. That is done by the
> following code:
> 
> 	for link in $$(find $(STAGING_DIR) -type l); do \
> 		target=$$(readlink $${link}) ; \
> 		if [ "$${target}" == "$${target$(SHARP_SIGN)/}" ] ; then \
> 			continue ; \
> 		fi ; \
> 		relpath="$(call relpath_prefix,$${target$(SHARP_SIGN)/})" ; \
> 		echo "Fixing symlink $${link} from $${target} to
> $${relpath}$${target$(SHARP_SIGN)/}" ; \
> 		ln -sf $${relpath}$${target$(SHARP_SIGN)/} $${link} ; \
> 	done ; \
> 	relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
> 	if [ "$${relpath}" != "" ]; then \
> 		for i in $$(find -H $(STAGING_DIR)/$${ARCH_LIB_DIR}
> $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} -type l -xtype l); do \
> 			LINKTARGET=`readlink $$i` ; \
> 			NEWLINKTARGET=$${LINKTARGET\#$$relpath} ; \
> 			ln -sf $${NEWLINKTARGET} $$i ; \
> 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
> 		done ; \
> 	fi ; \
> 
>  So I guess there is a symlink from usr/lib/libm.so to ../../lib/libm.so in
> the ct-ng toolchain, and that this doesn't get handled correctly by the code
> above. But honestly that code is not xxactly readable...

Are you suggesting that this is a problem with crosstool-ng and not with
Buildroot?

> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > I originally reported this issue here [1].
> > 
> > [1] https://lore.kernel.org/buildroot/Z86AGdrKHaUqgLVt@ghost/T/#t
> > ---
> >   toolchain/helpers.mk | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> > index f3fdaaec07c5a01688da685c4d0fd4e2cb357b95..b565da8a3a8f12567920f14dd3b6a18e548da6c7 100644
> > --- a/toolchain/helpers.mk
> > +++ b/toolchain/helpers.mk
> > @@ -55,6 +55,9 @@ copy_toolchain_lib_root = \
> >   # corresponding architecture variants), and we don't want to import
> >   # them.
> >   #
> > +# Furthermore, when BR2_ROOTFS_MERGED_USR is enabled, the 'lib*' directories
> > +# need to be copied over to usr/'lib*'.
> > +#
> >   # If ARCH_LIB_DIR is not a singular directory component, e.g.
> >   # 'lib32/octeon2', then symbolic links in ARCH_LIB_DIR and
> >   # usr/ARCH_LIB_DIR may be broken because Buildroot will flatten the
> > @@ -109,6 +112,10 @@ copy_toolchain_sysroot = \
> >   	ARCH_SUBDIR="$(strip $3)"; \
> >   	ARCH_LIB_DIR="$(strip $4)" ; \
> >   	SUPPORT_LIB_DIR="$(strip $5)" ; \
> > +	if [ "$(BR2_ROOTFS_MERGED_USR)" == "y" ]; then \
> > +		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/lib $(STAGING_DIR)/usr/lib 1>&2 ; \
> > +		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} 1>&2 ; \
> 
>  It looks suspicious to me that you copy both lib and ARCH_LIB_DIR - only
> one of them should be valid (or, usually, one is a symlink to the other).
> Also, ARCH_LIB_DIR is already handled in the loop below (in a slightly
> different way, because thanks to the trailing /, the lib -> usr/lib symlink
> is preserved).

Without both, the symlinks are not preserved. Getting rid of the
ARCH_LIB_DIR statement here results in the symlink being garbage:

./host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so -> ../../

- Charlie

> 
>  Regards,
>  Arnout
> 
> > +	fi ; \
> >   	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
> >   		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
> >   			continue ; \
> > 
> > ---
> > base-commit: 4809690d42f9b395ccb76ee7583c199fdd8d42c5
> > change-id: 20250310-fix_external_toolchains-d1b8c4da0be8
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
