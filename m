Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFC1D11180
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 16:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DECEF6077B;
	Sun,  3 Nov 2024 16:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEGKfbA9SeWC; Sun,  3 Nov 2024 16:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF53A607CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF53A607CE;
	Sun,  3 Nov 2024 16:30:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC42BB8
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DA0741228
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfH-vbyj2Uvn for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 16:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46A3341208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46A3341208
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46A3341208
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:30:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 35F9B780333;
 Sun,  3 Nov 2024 17:30:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54196])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Nov 2024 17:30:31 +0100
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 17:30:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241101225148.3432542-1-romain.naour@smile.fr>
References: <20241101225148.3432542-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <d8b2e65d03903b457637cc7fcdaa3485@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730651432;
 bh=IjYqS0IQnIrhrkoPJRpc/TGVL8DxvGQPsH1/BW8VGgk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fABzgYlWwTRBXoPkKzInBk7bpf3X0wLfaf4mjRP9fAIRJAgVDfcX5G0AfvWC92f1F
 1JpK9gVyHUTDAt3fTu83oJY7GPaEqUdJS51iWHl/mOtbC8k+68HNPF+SNZg5wdYgR+
 Ejuvvp52xLn37oTBA7Smbd9zA48fUcnijoI4PSi3YZf7Hul4M4ICUJHocjdPNJGmNx
 CXHxHW+Qu3I00yoxUyIQV2EZSEHBbn06yKF4vHJb1QA9bTN36wEciFRE/iXaw3G/1Z
 9PpvgrLNOaQudmBID6J7LNsqupIs+jqmZ1yqF1Z2QmBYfyzGmDYdUpZA53q2rObmue
 LybJDxkR6Yo1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fABzgYlW
Subject: Re: [Buildroot] [PATCH] package/util-linux: allowing building even
 on non-Y2038 compliant systems
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/11/2024 23:51, Romain Naour via buildroot wrote:
> Since the bump of util-linux to version 2.40.2 in Buildroot commit
> f14929c657a7b1794dcd39ac469d2ad826465d98 ("package/util-linux: update
> to 2.40.2"), the build will fail on systems that are not Y2038,
> such as uClibc configurations.
> 
> In order to preserve the previous behavior, pass --disable-year2038.
> See the gnulib documentation for details [0]. Contrary to what the
> option name might suggest, it doesn't really disable Y2038 support,
> but only the check that the system is Y2038 compliant. So even with
> --disable-year2038, if the system is Y2038 compliant (uses a 64-bit
> arch, uses the musl C library, or uses the glibc C library with
> BR2_TIME_BITS_64=y), util-linux tools will be Y2038 compliant.
> 
> "--disable-year2038" is already used to build tar package since [1].
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992338 
> (TestIso9660SyslinuxInternal)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992337 
> (TestIso9660SyslinuxExternalCompress)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992335 
> (TestIso9660SyslinuxExternal)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992259 
> (TestSysLinuxX86LegacyBios)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992257 
> (TestSysLinuxX86EFI)
> 
> [0] 
> https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html
> [1] 7f1088f9cae9f191740423a0084bb31f94af2e75
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master. Thanks!

> ---
>  package/util-linux/util-linux.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/util-linux.mk 
> b/package/util-linux/util-linux.mk
> index c3737a8d12..7a143290eb 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -42,9 +42,13 @@ UTIL_LINUX_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
>  	$(TARGET_NLS_DEPENDENCIES)
> +# --disable-year2038: tells the configure script to not abort if the
> +# system is not Y2038 compliant. util-linux will support year2038 if
> +# the system is compliant even with this option passed
>  UTIL_LINUX_CONF_OPTS += \
>  	--disable-rpath \
> -	--disable-makeinstall-chown
> +	--disable-makeinstall-chown \
> +	--disable-year2038
> 
>  UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
> 
> --
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
