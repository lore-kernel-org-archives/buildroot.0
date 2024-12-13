Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E35E7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 18:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B19E8474A;
	Fri, 13 Dec 2024 18:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mwb-BSmVcy-m; Fri, 13 Dec 2024 18:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCCB8470C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCCB8470C;
	Fri, 13 Dec 2024 18:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 180A9ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 18:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED1D9846FD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 18:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylmQ3uMTnrjE for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 18:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC82784717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC82784717
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC82784717
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 18:17:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E188E2003C6;
 Fri, 13 Dec 2024 19:17:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58182])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Dec 2024 19:17:02 +0100
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 19:17:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241213175330.344448-1-bernd@kuhls.net>
References: <20241213175330.344448-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <6f9274dfd065ff7a5476613af361bcd0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734113824;
 bh=igTTwp6izcGS+/goV6Um3ltOmZGRDeYqQ3cdfJ6Z+G0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S0wQb4K1bbCP37GxeWEJBtRPjQOZXoV0iSPXq6iW8yR0Rgfu1Uf2AY/mHAr1niUOz
 UrOcTaDBmbu8HLGTQmnOjPWt1IT+VjGpakkG77kjmEe7xoLEgyAi+ZBDrZPkQD1pnK
 kaKOUrPHeRX/IJk5KqFBTvqTQG3BEEuPtsBvnIn36fzSkVveT1jutTnJxQl/QOJW6o
 xqBHVkC/oBqD/g7Sbbpy2I/Y/aTukiHnrHTTvDxREnQNRmGY7olU80l/Sj/hy2Oq0/
 4x7I9YS2uVCnmKiPBtubCV0P8uoKHsIOnOvaNOJRIoUA+Bc1HbRbxD28I5fZp81GSU
 6sWH6KwnO5IIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S0wQb4K1
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-lib: Make sequencer
 dependent on rawmidi
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

On 13/12/2024 18:53, Bernd Kuhls wrote:
> Add upstream patch and adjust dependency to fix build error.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9a5/9a53d3c1411699f581e3a90d7f517fcb6b9e3de0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  ...-Make-sequencer-dependent-on-rawmidi.patch | 35 +++++++++++++++++++
>  package/alsa-lib/Config.in                    |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 
> package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch
> 
> diff --git 
> a/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch 
> b/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch
> new file mode 100644
> index 0000000000..fb1d18df36
> --- /dev/null
> +++ 
> b/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch
> @@ -0,0 +1,35 @@
> +From: Takashi Iwai <tiwai@suse.de>
> +Date: Sun, 24 Nov 2024 08:32:29 +0000 (+0100)
> +Subject: configure: Make sequencer dependent on rawmidi
> +X-Git-Url: 
> https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff_plain;h=6880219ad4ba55ae8a94a34b7a987b3369f7c96f
> +
> +configure: Make sequencer dependent on rawmidi
> +
> +The sequencer feature requires rawmidi implicitly, and it became more
> +obvious with UMP support.  Add the dependency check to configure
> +script.
> +
> +Signed-off-by: Takashi Iwai <tiwai@suse.de>
> +
> +Upstream: 
> https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=6880219ad4ba55ae8a94a34b7a987b3369f7c96f
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> +
> +diff --git a/configure.ac b/configure.ac
> +index 1cd22a59..69aeb978 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -483,6 +483,12 @@ fi
> + AC_SUBST(PYTHON_LIBS)
> + AC_SUBST(PYTHON_INCLUDES)
> +
> ++if test "$build_rawmidi" != "yes"; then
> ++  if test "$build_seq" = "yes"; then
> ++    AC_ERROR([Cannot enable sequencer without rawmidi])
> ++  fi
> ++fi
> ++
> + AM_CONDITIONAL([BUILD_MIXER], [test x$build_mixer = xyes])
> + AM_CONDITIONAL([BUILD_PCM], [test x$build_pcm = xyes])
> + AM_CONDITIONAL([BUILD_RAWMIDI], [test x$build_rawmidi = xyes])
> diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
> index 6df03afe0e..360122f97f 100644
> --- a/package/alsa-lib/Config.in
> +++ b/package/alsa-lib/Config.in
> @@ -65,6 +65,7 @@ config BR2_PACKAGE_ALSA_LIB_HWDEP
>  config BR2_PACKAGE_ALSA_LIB_SEQ
>  	bool "seq"
>  	default y
> +	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
> 
>  config BR2_PACKAGE_ALSA_LIB_UCM
>  	bool "ucm"
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
