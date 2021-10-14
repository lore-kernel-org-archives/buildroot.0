Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3B1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:40:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF8E160524
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF8E160524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F63E40255;
	Thu, 14 Oct 2021 21:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEtB-1ofVSRT; Thu, 14 Oct 2021 21:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 428E740469;
	Thu, 14 Oct 2021 21:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76B341BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 734856074A
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dqSlHSXihfp for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:40:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 697B36070F
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:40:32 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id t16so29656171eds.9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=lvsH8j+gtrxF43diIZn7Mx1GKv7uQy5cDLCuhz1WfmI=;
 b=WXlVq749A96Tfx37AD6fZ2Qz+QzwKkoRonGePCaqfbcaNQWWDvwl3P3kHcwsat3adf
 FD7acM7EA53bFmwplH+ma39eremR2V0AF+mb36ml7JLXGKgXbFXzayzfjcU8zgdN2cRt
 UkGRkLW8TCC3Hfn+UwEBHvX8ydfo2swvYf+nb9EgJC3w0IfHYIrPYsC3DMOXcYpEDVUY
 5UV+3PBwwCfxqxIkK233J+/oX2e+nmQJiHryKJ4TBCNsMI63mblkkjenLBNKhFCok/QR
 ir7Xnktojx6HOhm8b0tWreIiJQBaD1naw0wNgVRvf5DzO12WkxkUEYHlwUZYSixZ0Vth
 +nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lvsH8j+gtrxF43diIZn7Mx1GKv7uQy5cDLCuhz1WfmI=;
 b=8FxOweXCLoC4XLgF3U1OJTVkKEhl/HTCb105glGZpnWTPwu50kN0fY8Lg7PPM/9hve
 v6RimxSS/3vGBvD3HIWf91Vs0BK5MQMMcC5nAvqmOzfv79+jdKNyDl+vuLjEJTa61LPV
 9KLq7PAwlYWl2xcoAmpiUCIFAY83oYtqJfvF/7qFLRxYSneQ9Ls+faeGsLIAbHoGMCGg
 /9EeHPHeLRhy/VYbYVlosp0KkFP4F7YzqesOKGBvtLqEwM0dTG9WSr4JanxXTz83tuHO
 aASUTCUn1aRs2MVWu7Dl60zfhbq2ppq/MR53nhsd8rwh9tar84x/fSD7YQVpp+An0ZnU
 RLyw==
X-Gm-Message-State: AOAM53207Cbxg+Dejf+ym7cV57QFt8NidzkGAUHajgROOmhP+S1CBbFY
 4q2CBDRk4dYG2yHd3zg3mAL1QQ==
X-Google-Smtp-Source: ABdhPJzsAGRmH57UTo+09I41ebDKf83ZqHzBLI1WVIssLj5Hs5XvrgDNBtBpj9XV6oov97W/XwB3ww==
X-Received: by 2002:a05:6402:27d3:: with SMTP id
 c19mr11942866ede.70.1634247630495; 
 Thu, 14 Oct 2021 14:40:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jt24sm2878430ejb.59.2021.10.14.14.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:40:30 -0700 (PDT)
Message-ID: <0f125eb1-932f-bcfe-4376-b1356e0b3bc0@mind.be>
Date: Thu, 14 Oct 2021 23:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
References: <20211010094051.108966-1-gilles.talis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010094051.108966-1-gilles.talis@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/iozone: bump to version 3_492
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/10/2021 11:40, Gilles Talis wrote:
> Reworked existing patch to make it apply to this version
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>   .../0001-Add-new-targets-for-iozone.patch     | 22 +++++++++----------
>   package/iozone/iozone.hash                    |  2 +-
>   package/iozone/iozone.mk                      |  4 ++--
>   3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/package/iozone/0001-Add-new-targets-for-iozone.patch b/package/iozone/0001-Add-new-targets-for-iozone.patch
> index e6bfc18de6..3cc184ec8f 100644
> --- a/package/iozone/0001-Add-new-targets-for-iozone.patch
> +++ b/package/iozone/0001-Add-new-targets-for-iozone.patch
> @@ -1,6 +1,6 @@
> -From 1584ffbfda3277b82997b9f1e0ef31a7061560e0 Mon Sep 17 00:00:00 2001
> +From 5b1e973b2333e838624abf195b3ba9716591f304 Mon Sep 17 00:00:00 2001
>   From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Sun, 26 Aug 2018 18:39:06 +0200
> +Date: Sun, 10 Oct 2021 10:15:26 +0200
>   Subject: [PATCH] Add new targets for iozone:

  It would be nice to send that patch upstream. Or check if it's even still 
needed. The largefile part, for example, is not needed any more. And maybe 
uClibc supports aio now.

  Anyway, applied to master, thanks.

  Regards,
  Arnout

>   
>   linux-noaio is for linux targets without AIO (use case: uClibc)
> @@ -11,18 +11,18 @@ And make largefile support optional via CFLAGS.
>   Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>   Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
>   ---
> - src/current/makefile | 56 +++++++++++++++++++++++++++++++++++++++++++---------
> + src/current/makefile | 56 +++++++++++++++++++++++++++++++++++++-------
>    1 file changed, 47 insertions(+), 9 deletions(-)
>   
>   diff --git a/src/current/makefile b/src/current/makefile
> -index cfef879..7925e62 100644
> +index 3a54701..3b17b1b 100644
>   --- a/src/current/makefile
>   +++ b/src/current/makefile
> -@@ -168,10 +168,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
> +@@ -172,10 +172,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
>    # GNU 'C' compiler Linux build with threads, largefiles, async I/O
>    #
>    linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
> --	$(CC)  -O3 $(LDFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
> +-	$(CC)  -O3 $(CFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
>   +	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux.o libasync.o libbif.o \
>   +		-lpthread -lrt -o iozone
>   +	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
> @@ -43,14 +43,14 @@ index cfef879..7925e62 100644
>   +linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
>   +	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noth.o libbif.o \
>    		-lrt -o iozone
> --	$(CC)  -O3 -Dlinux fileop_linux.o -o fileop
> --	$(CC)  -O3 -Dlinux pit_server.o -o pit_server
> +-	$(CC)  -O3 $(CFLAGS) -Dlinux fileop_linux.o -o fileop
> +-	$(CC)  -O3 $(CFLAGS) -Dlinux pit_server.o -o pit_server
>   +	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
>   +	$(CC)  $(CFLAGS) -Dlinux pit_server.o -o pit_server
>    
>    #
>    # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O
> -@@ -814,13 +832,33 @@ iozone_linux.o:	iozone.c libbif.c libasync.c
> +@@ -841,13 +859,33 @@ iozone_linux.o:	iozone.c libbif.c libasync.c
>    	@echo ""
>    	@echo "Building iozone for Linux"
>    	@echo ""
> @@ -89,7 +89,7 @@ index cfef879..7925e62 100644
>    
>    fileop_AIX.o:	fileop.c
>    	@echo ""
> -@@ -924,7 +962,7 @@ fileop_linux.o:	fileop.c
> +@@ -951,7 +989,7 @@ fileop_linux.o:	fileop.c
>    	@echo ""
>    	@echo "Building fileop for Linux"
>    	@echo ""
> @@ -99,5 +99,5 @@ index cfef879..7925e62 100644
>    fileop_openbsd.o:	fileop.c
>    	@echo ""
>   --
> -2.7.4
> +2.27.0
>   
> diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
> index 61e8ff3abe..1255392e38 100644
> --- a/package/iozone/iozone.hash
> +++ b/package/iozone/iozone.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  5eadb4235ae2a956911204c50ebf2d8d8d59ddcd4a2841a1baf42f3145ad4fed  iozone3_490.tar
> +sha256  93c9142d61e6a71ea43b0a266bad7f49f07ce5f5d31b36f8edf4dd386795c483  iozone3_492.tgz
> diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
> index 32d57ea76e..2282a44eb8 100644
> --- a/package/iozone/iozone.mk
> +++ b/package/iozone/iozone.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -IOZONE_VERSION = 3.490
> -IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
> +IOZONE_VERSION = 3.492
> +IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
>   IOZONE_SITE = http://www.iozone.org/src/current
>   IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
>   # IOzone license details can be found at:
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
