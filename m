Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05556C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 22:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7194611A2;
	Wed,  8 Feb 2023 22:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7194611A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0UsuvdJXube; Wed,  8 Feb 2023 22:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FFF5611A5;
	Wed,  8 Feb 2023 22:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FFF5611A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDBC61BF302
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 22:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B76E04185A
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 22:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76E04185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XyYbsx8j37H5 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 22:22:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E56941838
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E56941838
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 22:22:21 +0000 (UTC)
Received: from pwmachine.localnet (18.103-178-91.adsl-dyn.isp.belgacom.be
 [91.178.103.18])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3516420C8AD5;
 Wed,  8 Feb 2023 14:22:19 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3516420C8AD5
From: Francis Laniel <flaniel@linux.microsoft.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Lang Daniel <d.lang@abatec.at>, Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 08 Feb 2023 23:22:16 +0100
Message-ID: <2667723.mvXUDI8C0e@pwmachine>
In-Reply-To: <17501a13-8018-656f-5f4d-b1cf6c1ecd5c@mind.be>
References: <VI1P190MB04936E3BDB708B8974C8287B9F139@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <12146851.O9o76ZdvQC@pwmachine>
 <17501a13-8018-656f-5f4d-b1cf6c1ecd5c@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1675894940;
 bh=y4G9t9jOw9ZRWU4S2OV6/rVWW9ZGiueXqbrrcQHzbm8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X5svS/B4OC/rz1i0WiuMttnolV1M0MZw7Iz27yiLsHDZg1IqSrGxzcB5x/zxCRqcH
 NhwwjgjpJLapeonxMT45TgtrnwhOpw7hEMn0O0UfXpFC1Dpk/UrHDFfFEuLQ/ngrGw
 2l6nenf3rrgNs41sRdCOLHRMDMkf0FbSMEzFO/RE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=X5svS/B4
Subject: Re: [Buildroot] [PATCH] package/libbpf: Don't remove bpf.h on host
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


Le mercredi 8 f=E9vrier 2023, 16:47:58 CET Arnout Vandecappelle a =E9crit :
>   Hi Daniel, Francis,
> =

> On 07/02/2023 21:10, Francis Laniel wrote:
> > Hi.
> > =

> > Le lundi 28 novembre 2022, 16:06:20 CET Lang Daniel a =E9crit :
> >> libbpf >1.0.0 defines libbpf_bpf_link_type_str(enum bpf_link_type) in
> >> src/libbpf.h, which is included by host-pahole.
> >> bpf_link_type is defined in linux/bpf.h, therefore the comment stating
> >> that pahole doesn't need bpf.h is no longer valid.
> >> =

> >> Fixes:
> >> -
> >> http://autobuild.buildroot.net/results/d126a4b6eca786402dc362c86f8df3a=
dde
> >> c3
> >> d217/
> >> =

> >> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> >> ---
> >> I wasn't able to reproduce the mentioned compile error in the kernel.
> >> The mentioned file (tools/lib/bpf/strset.c) shouldn't be compiled when
> >> compiling the kernel as it would recompile libbpf.
> >> ---
> >> =

> >>   package/libbpf/libbpf.mk | 17 +----------------
> >>   1 file changed, 1 insertion(+), 16 deletions(-)
> >> =

> >> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> >> index 820f1dc4bf..0381fd833a 100644
> >> --- a/package/libbpf/libbpf.mk
> >> +++ b/package/libbpf/libbpf.mk
> >> @@ -39,26 +39,11 @@ define LIBBPF_INSTALL_TARGET_CMDS
> >> =

> >>   		-C $(@D)/src install DESTDIR=3D$(TARGET_DIR)
> >>   =

> >>   endef
> >> =

> >> -# We need to install_uapi_headers so we have btf.h to compile
> >> -# host-pahole.
> >> -# Nonetheless, this target adds bpf.h which generates a conflict when
> >> -# building the kernel:
> >> -# In file included from libbpf_internal.h:17:0, from strset.c:9:
> >> -# relo_core.h:10:6: error: nested redefinition of 'enum
> >> bpf_core_relo_kind' -# enum bpf_core_relo_kind {
> >> -# ^~~~~~~~~~~~~~~~~~
> >> -# relo_core.h:10:6: error: redeclaration of 'enum bpf_core_relo_kind'
> >> -# In file included from libbpf_legacy.h:13:0,
> >> -# 		from libbpf_internal.h:16,
> >> -# 		from strset.c:9:
> >> -# /home/francis/buildroot/output/host/include/linux/bpf.h:6497:6: not=
e:
> >> originally defined here -# enum bpf_core_relo_kind {
> >> -# So, better to remove remove it now since we do not need it to build
> >> +# We need to install_uapi_headers so we have bpf.h and btf.h to compi=
le
> >> =

> >>   # host-pahole, the only user of host-libbpf.
> >>   define HOST_LIBBPF_INSTALL_CMDS
> >>   =

> >>   	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> >>   	=

> >>   		-C $(@D)/src install install_uapi_headers DESTDIR=3D$(HOST_DIR)
> >> =

> >> -	rm $(HOST_DIR)/include/linux/bpf.h
> >> =

> >>   endef
> >>   =

> >>   $(eval $(generic-package))
> > =

> > Thank you for this patch and sorry for my very late reply.
> > Sadly, I do not think the patch addresses the underlying issue.
> > Indeed, this is not pahole which does not need this file, as pahole rel=
ies
> > on <linux/bpf.h> to be built.
> > So, the whole point of this comment and the rm is to avoid a problem wh=
en
> > building the kernel when pahole was built before.
> =

>   The current solution, however, also doesn't work, which is why Franci's
> patch [1] is needed to fix it again.
> =

>   However, we believe this is not the proper fix. The real issue is the
> following:
> =

> - libbpf installs headers which are possibly incompatible with the kernel=
's
> headers. Normally this is not a problem, because you have either the
> kernel's or libbpf's headers installed, not both.
> =

> - However, when we install libbpf headers in $(HOST_DIR)/include, the ker=
nel
> build itself picks up those headers instead of its own internal headers.
> That is why bpf.h is removed here to begin with. If bpf.h is not removed
> (and the kernel headers are indeed incompatible with the libbpf ones), th=
en
> the kernel build will fail.
> =

> - There is however no reason why the kernel should pick up
> $(HOST_DIR)/include instead of its own internal headers. Normally it
> doesn't do that, because it supplies -I options to its own headers, and
> these have precedence over the system included /usr/include etc. However,
> we force HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS)" and HOST_CFLAGS has
> -I$(HOST_DIR)/include. This one will come before all of the ones that the
> kernel adds and will have precedence.
> =

> Therefore, we believe that the solution is to use -isystem instead of -I =
in
> the HOSTCC setting of the kernel. This is indeed what is already done for
> uboot:
> =

> 	HOSTCC=3D"$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem
> /,$(HOST_CFLAGS)))" \

Thank you for all the details! Using -isystem sounds like a really good ide=
a!

> Note that there is a risk that this by itself goes wrong as well. We tried
> at some point to use -isystem instead of -I in HOST_CFLAGS:
> =

> commit 6f8162cf8c1abef7e0a4771fe0d6b26a28f5c2b6
> Author: David Raeman <draeman@bbn.com>
> Date:   Mon Jul 25 21:52:26 2016
> =

>      package/Makefile.in should grab HOST_DIR headers using -isystem inst=
ead
> of -I.
> =

> =

> but this was reverted a copule of days later:
> =

> commit 255b6f80d395ef048f46cfcf75dba690c56af657
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Sat Jul 30 18:10:18 2016
> =

>      Revert "package/Makefile.in should grab HOST_DIR headers using -isys=
tem
> instead of -I."
> =

> (Unfortunately, the commit has no further explanation of what went wrong).
> =

>   So, could you (Daniel and Francis) try to apply this patch and replace =
-I
> with -isystem like is done for U-Boot, and do a bunch of kernel builds to
> see if it breaks anything?

I will sure take a look and will come back here with my findings!

>   For now, I've marked this patch as Changes Requested (it can only be
> applied if the bpf.h problem is solved in some other way), and marked
> Francis's patch [1] as Superseded.
> =

>   Regards,
>   Arnout
> =

> =

> [1]
> https://patchwork.ozlabs.org/project/buildroot/patch/20220610165441.84812=
-2-> flaniel@linux.microsoft.com/
> > Sadly, I tested your patch and I hit the problem described in the comme=
nt
> > regarding redefinition of bpf_core_relo_kind.
> > =

> > Did you also hit it or you were able to build the kernel with
> > BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE?
> > =

> > =

> > Best regards and thank you in advance.
> > =

> > =

> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot


Best regards.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
