Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8353EC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:42:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD9C6108F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DD9C6108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9E9D401BB;
	Thu, 19 Aug 2021 21:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFsBDaUup9b6; Thu, 19 Aug 2021 21:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AA4D401D8;
	Thu, 19 Aug 2021 21:42:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B030E1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E66F401D8
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wx2WcowRgWpv for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:42:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D993E401BB
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:42:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A64BD2003AE;
 Thu, 19 Aug 2021 23:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629409327;
 bh=iZm6Hx8nVQoyAzWNYfKwcQq93az+eLJwdRLxWFRbFAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UKyTdNNPWdRDW6/jQ4VJjEdPSJTX96IQM63lFe6WO/wm83XdDe3RJ2pVrkAsjYMBa
 DS1i6W/cSes8BIHSudiP4Cmuv6/D4i+Bni+zjIfqehF45s+p3x9Iq9mJ6aquBIzOky
 3cezHpVHsVPUPmySpMl4BQcXSkSiWv9ev/S7BMEgxpaVS6gLXoJ1dwIPrRgYAdochQ
 WGGEfv2CYF6dhGBY0AuWyA6sU+IaFiUltSt+QciQsVwD0ctTUeYi6LPpuLfOsohYBn
 s3opGhtDo8t7xP9xhINZakUrFnbaEC+aw3N7SQ9jOV5NKBhl00SQcY2vVSoepGYtWR
 Ud9zwNsMvbOmA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 23:42:00 +0200
Date: Thu, 19 Aug 2021 23:42:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210819214200.GJ27036@scaer>
References: <20210807162742.490256-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210807162742.490256-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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

Fabrice, All,

On 2021-08-07 18:27 +0200, Fabrice Fontaine spake thusly:
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

The isue was a bit broader than that: libvirt needs headers >= 3.12 for
all architectures, but AArch64, for which it requires 4.11.

The 3.12 requirement was overlooked when the package was added with
ccfc90e1010e, though, but was present in the comment.

So I've added that too.

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

I've moved that part to the main symbol, since it is more logical to
have there, especially since there is a more global dependency on
headers 3.12 now.

Applied to master, thanks.

And damn, I forgot to update the comment! Grr... :-(

Regards,
Yann E. MORIN.

>  	default y if BR2_i386
>  	default y if BR2_x86_64
>  	depends on BR2_USE_MMU # fork()
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
