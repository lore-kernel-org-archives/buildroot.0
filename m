Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2EEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:32:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B45260F23
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B45260F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9ED44039E;
	Mon, 20 Sep 2021 18:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knigwe-Rfh9O; Mon, 20 Sep 2021 18:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F064045C;
	Mon, 20 Sep 2021 18:32:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89CDE1BF23C
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86B208242D
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mf8EyyNd0Hea for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 18:31:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B691882425
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 18:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632162710;
 bh=eNPMvCPpGNbhk4Q6dvKi0INsChtsOLuyBo81iTgyHqs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Lcsw2W2qts4BvdYLs7y9xY4cTYAyABSsPGkw+ZgDvHbDd7wPKPnIva/0x+2rrPRPV
 yzrjqy6KvsepAHF6Ko6pT8BUljml/Qykdt4nlbK5AncW/m7EvZXFNFKSTOeilaAwyr
 jR31XN/v4way4/yTNq1QLPsNhxinPrcTrNkrGesw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpOT-1n3ucZ08Qj-00gKxx; Mon, 20
 Sep 2021 20:31:50 +0200
Date: Mon, 20 Sep 2021 20:31:48 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210920203148.3eb59c22@gmx.net>
In-Reply-To: <20210920163031.197937-1-fontaine.fabrice@gmail.com>
References: <20210920163031.197937-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:KN7qRuNh8LGggg19LZtJ0prL3NwIEPdD62f8mldp66CP8snLOzB
 KQzY6XShkVy4uScLtKravrYOCNLIZCdobaNQdA/0q8EdwKMUTr13rDqG8PKSgERUWBfEL5k
 boC9zYvtzwmkITgei23TRP5pJUmb0PhFkOPaNxYYRe701Z8+fnGKLN+xibVNhvn+Yrf+ADr
 MZMYp1Z4hqAoAsT92G8oQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5dTmlW4RPDY=:ZXlcaEG/5VLQ9s0cXoktJa
 Nln86gHv9LdsDUOE/NNlbTUsg7JL9hX1UWlNiXI4H4rfBa2LUibOP3FqmXpOlaL6x5IaNAgLh
 pLhM0QdW2x9AgCNMC8s3UMqlqJ03a9HBHVwewR/t4kFN+B2KixK+KFuosjHdDAjo12ELrBm7S
 DD46zFbWcxc9yfG/3IpwWvwUmRWhW407LTt5KRSXxzxBStI5s4U3Rs36n+XdBCr0AYgj0xQF8
 EURr+T9IpbHiG37fXHDda9nFUPLTMxy81xRtBB/OrGkXKpPXnoZCkGbm5nFTRwJSVHnAYymtZ
 dj1Oq5RTcI43IeSAWiGrHa7gwVydvS1ri3WMIV0LPU2TWwYUXzS/i7zq1CspXPAj1KHzQ6Z2Z
 ID6Ixx98ecXGnOHO3cgrZEix9SvqScmOm0L2vn2Qi4TiPQkl42SGI9sSaBTMMeMGjXvhnWu7P
 heYMiNrUHpNcRwwG/xNGaOtuIEDc/aXkErezVk/CRLWWkyAfuNCe8jbfYOIyOdSy0r9PIQA2l
 BDW0i3Wi46AEh/AWKDy4es151OSu9bwGuklozrxuYtJAi66n5wdvtS/ipaRVTUcJqxcj6YbVO
 HkgbFaADDjpOK6zkYQTiOKjOR5xZBezWORe4oACYofto50VKzso1FvPzew1e5iMRF7EIY/Oe3
 GW8VhPjATwp2CMIYjsdHRE6yXhT8o5ClKKcn5De16HgqrCRpFEOdRysH1w2JTax+xluhBM7GQ
 pkJX6H4lRJltXy2L04nq9g7t0BnQEbCQcrTlRoxSHtUjmiipvv7IUsR7phV87wNW8mRNEs9u5
 EPLG+CBXm1zGd58fbnh1ZFVQFgJ956GQdS/nUg1TFrQSVyqk0r3ulX7rvSdZATim0YWVpcd0j
 i10tJjm1gWK+eU3swKZo5/+kvH5m2eIe+z1iUEneBAMH7ok4IdcSraG5cO9dJYGSbQ2Fvmy0k
 v5XNaGkx0s2uD7GGSWqut9r7WxyRuWtsRn03Xw/T+W5EQfRp710wJ7ZLhvxFeHpDL4IPYNzRu
 QB5IeRcM/gsgfkZHYll9ylbB1PMDTKmwLMjJuK1Iwy49hO2fsaqBcJahRE/jnGOR1mHhn2n+B
 gbAvH2BD4WtiWk=
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: fix build with uclibc-ng
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello Fabrice,

On Mon, 20 Sep 2021 18:30:31 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with uclibc-ng raised since bump to
> version 1.17 in commit 9badccc9d4887aa2365d7350e3b26bd4250dad48:
>
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
> sae.c:(.text+0xd74): undefined reference to `reallocarray'
>
> Fixes:
>  - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for fixing the failure!

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> ---
>  ...-build-Add-reallocarray-to-missing-h.patch | 55 +++++++++++++++++++
>  package/iwd/iwd.mk                            |  2 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
>
> diff --git a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
> new file mode 100644
> index 0000000000..ef6114f1af
> --- /dev/null
> +++ b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
> @@ -0,0 +1,55 @@
> +From ec1c348b4fd67619fa0c2f55ae644f6a8014d971 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 19 Sep 2021 21:17:44 +0200
> +Subject: build: Add reallocarray to missing.h
> +
> +reallocarray has been added to glibc relatively recently (version 2.26,
> +from 2017) and apparently not all users run new enough glibc. Moreover,
> +reallocarray is not available with uclibc-ng. So use realloc if
> +reallocarray is not available to avoid the following build failure
> +raised since commit 891b78e9e892a3bcd800eb3a298e6380e9a15dd1:
> +
> +/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
> +sae.c:(.text+0xd74): undefined reference to `reallocarray'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
> +
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac  | 1 +
> + src/missing.h | 7 +++++++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index c6250401..51d9da93 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -129,6 +129,7 @@ AC_DEFINE_UNQUOTED(WIRED_STORAGEDIR, "${wired_storagedir}",
> +
> + AC_CHECK_FUNCS(explicit_bzero)
> + AC_CHECK_FUNCS(rawmemchr)
> ++AC_CHECK_FUNCS(reallocarray)
> +
> + AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
> +
> +diff --git a/src/missing.h b/src/missing.h
> +index 2cc80aee..a5b92952 100644
> +--- a/src/missing.h
> ++++ b/src/missing.h
> +@@ -37,3 +37,10 @@ _Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
> + _Pragma("GCC diagnostic pop")
> + }
> + #endif
> ++
> ++#ifndef HAVE_REALLOCARRAY
> ++static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
> ++{
> ++	return realloc(ptr, nmemb * size);
> ++}
> ++#endif
> +--
> +cgit 1.2.3-1.el7
> +
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 9737f2c626..58535b1aa1 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -12,6 +12,8 @@ IWD_LICENSE_FILES = COPYING
>  IWD_CPE_ID_VENDOR = intel
>  IWD_CPE_ID_PRODUCT = inet_wireless_daemon
>  IWD_SELINUX_MODULES = networkmanager
> +# We're patching configure.ac
> +IWD_AUTORECONF = YES
>
>  IWD_CONF_OPTS = \
>  	--disable-manual-pages \

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
