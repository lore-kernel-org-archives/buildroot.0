Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F77C0032E
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 16:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A59B0705AA;
	Fri, 20 Oct 2023 16:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A59B0705AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kijIDHo6W81l; Fri, 20 Oct 2023 16:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E590B705A6;
	Fri, 20 Oct 2023 16:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E590B705A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 124111BF336
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 16:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF533705A4
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 16:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF533705A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LI_v4yZM0t1T for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 16:00:14 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F66B705A6
 for <buildroot@uclibc.org>; Fri, 20 Oct 2023 16:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F66B705A6
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qtrv1-000AV0-8y
 for buildroot@uclibc.org; Fri, 20 Oct 2023 18:00:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 20 Oct 2023 17:59:17 +0200
Message-ID: <pan$96fb8$6febde99$79fd5445$8f31fda7@ID-313208.user.individual.net>
References: <20231020120158.2684019-1-andyshrk@163.com>
 <20231020120240.2684127-1-andyshrk__36105.3176618711$1697804308$gmane$org@163.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH v3 1/1] igt-gpu-tools: add igt-gpu-tools
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

thanks for v3! Some more nits/hints ;)

Please add an entry in the DEVELOPERS file for your package:
http://buildroot.uclibc.org/downloads/manual/manual.html#DEVELOPERS

Am Fri, 20 Oct 2023 20:02:40 +0800 schrieb Andy Yan:

Due to the addition of elfutils as dependency this line is still needed in Config.in

	depends on BR2_USE_WCHAR # elfutils

along with an updated comment.

elfutils has another dependency which would need backporting:

	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC

But when my patch series
https://patchwork.ozlabs.org/project/buildroot/patch/20231019214953.4002609-1-bernd@kuhls.net/
lands there is no need to add this dependency to igt-gpu-tools ;)

> +if BR2_PACKAGE_IGT_GPU_TOOLS
> +
> +config BR2_PACKAGE_IGT_GPU_TOOLS_LIBUNWIND
> +	bool "libunwind"
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
> +	select BR2_PACKAGE_LIBUNWIND
> +	help
> +	  Use libunwind
> +endif

This whole block is not needed, see below.

> +ifeq ($(BR2_PACKAGE_IGT_GPU_TOOLS_LIBUNWIND),y)

Replace this line with 

	ifeq ($(BR2_PACKAGE_LIBUNWIND),y)

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
