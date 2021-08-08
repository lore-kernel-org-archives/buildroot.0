Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BABC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:12:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF04A60F02
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF04A60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE2C82B81;
	Sun,  8 Aug 2021 21:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7eMvM2yzZAP; Sun,  8 Aug 2021 21:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC02182B49;
	Sun,  8 Aug 2021 21:12:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2FF1BF42E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BE946060C
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLZJ_IdJDBma for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:12:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 229716058B
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 21:12:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id EBFC3E0002;
 Sun,  8 Aug 2021 21:12:34 +0000 (UTC)
Date: Sun, 8 Aug 2021 23:12:33 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210808231233.615ba5a1@windsurf>
In-Reply-To: <20210807162742.490256-1-fontaine.fabrice@gmail.com>
References: <20210807162742.490256-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libvirt: aarch64 needs headers
 >= 4.11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat,  7 Aug 2021 18:27:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libvirt unconditionally uses HWCAP_CPUID on arm which is only available
> since kernel 4.11 and
> https://github.com/torvalds/linux/commit/77c97b4ee21290f5f083173d957843b615abbff2
> resulting in the following build failure since the addition of the
> packahe in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:
> 
> ../src/cpu/cpu_arm.c: In function 'virCPUarmCpuDataFromRegs':
> ../src/cpu/cpu_arm.c:562:20: error: 'HWCAP_CPUID' undeclared (first use in this function); did you mean 'HWCAP_PMULL'?
>      if (!(hwcaps & HWCAP_CPUID)) {
>                     ^~~~~~~~~~~
>                     HWCAP_PMULL
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/85bf7b4dad73a748bf439e63874eb64d9a53088f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvirt/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index 2f191882cc..e231511906 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_aarch64
> +	default y if BR2_aarch64 && BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11

What bothers me is that for kernel headers dependencies, we normally
have a comment. Is it worth it in this case? Perhaps not.

Yann, Arnout, Peter?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
