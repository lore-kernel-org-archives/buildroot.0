Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507BBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 13:52:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF7F61056
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 13:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EF7F61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25541400FF;
	Thu, 28 Oct 2021 13:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Gx9CjY6xuyx; Thu, 28 Oct 2021 13:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AD71402B9;
	Thu, 28 Oct 2021 13:52:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDD971BF846
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 13:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DABA2405DE
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 13:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsdKfSsZK7xn for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 13:52:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 757B240594
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 13:52:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1093250wme.4
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 06:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x0/MNfY4sw7aEBSmo198gjIgPGJrIbnisYXWktbXUYY=;
 b=MvbRL6WmU/CxlWYh6z6OmxLNuByNhaW5y/FZNQm2sj+zixOg8fcCp2z2NNimQW+xFv
 BnhLSYloRox3UODdKhxfq7s7dkiyMhac3Eq4uEnLcM6VtXJPXHe3RlvizPCCmM2J98mq
 EowB7Tt4m02f7L0GF4+S0gGG4fSFf+PBBbq3wuWbVSiio95UC4V6QRlYSPZmeKBSk218
 MKJ3l5EnJB2Q1Z/vRjYUh4jJwx7i/5rc5ad5fqwcNNvQ4sHOFTC2DsA3ak1Sn866hban
 0wlqXXgsRt6ITclkgKcjLoQiWBBkJ9SiHDh+w/WHrYsC3ph5hR/8ZxOz94jUTR912Qxx
 pIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x0/MNfY4sw7aEBSmo198gjIgPGJrIbnisYXWktbXUYY=;
 b=xulavxBLrXG7qzb3PuYD6Wvmm/wFonYoDnGcROrkoa+FVAK65jwzSsvKmaElOBWaQ2
 ebyWLZHNa7F4poTLK42j3raY/G8KAjTPa8wO4l78xJSkMnCEriSKpybCZfuj6LolbhTx
 Iyups0l9J9ryR9ZvHeQwlXosKFmZ53yF+CUJWD4Uh2SP+r4n3Z7FFKSKeidDdZtnfNuH
 eRojomZo+MxCyYy7yLG5+6vEMNfI4vMUTCWpmn5wd1cBEmIZpyyeIz70rpfFngcA+3UG
 qcit81eDUZkgH+3ycmihQQ9EPY30ebVvts2EMUAJ0+hfy/XskKqJJf1QJKZFLQGqpyuz
 4ycA==
X-Gm-Message-State: AOAM531cpjSpZPjlZdbFLoYGWagfE2OAIz9eNMk+JDQcf6Dl+OjtoWs3
 pHQiK/7PiNTZW9wYEXmmOjk=
X-Google-Smtp-Source: ABdhPJwZtBO/mHlJY2m1wSsnoLITRR7rEa2ssHc27bUwGqMi49QYKb1mJ9dwzlLuwPzsOkpGkcIoTQ==
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr4819806wmq.124.1635429151718; 
 Thu, 28 Oct 2021 06:52:31 -0700 (PDT)
Received: from camb691.localdomain (ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id h8sm3531801wrm.27.2021.10.28.06.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:52:31 -0700 (PDT)
Date: Thu, 28 Oct 2021 14:52:12 +0100
From: Cyril Bur <cyrilbur@gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20211028145212.36dcb38a@camb691.localdomain>
In-Reply-To: <20211011220025.7998-3-petr.vorel@gmail.com>
References: <20211011220025.7998-1-petr.vorel@gmail.com>
 <20211011220025.7998-3-petr.vorel@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH 2/3] make: Drop `type -p ...' fallback
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 12 Oct 2021 00:00:24 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> `command -v' is good enough as it's POSIX.
> For easier debugging previous problems removed separately.
> 

On doing some reading[1] I've discovered that this is a minefield.
Having said that, I'm pretty sure what currently happens isn't
good either.

My only concern might be that theres old RHEL (its always RHEL ;))
systems out there which could break. Some of my coleagues use old RHEL
VMs for their build machines. I'm going to try and see if I can get
access but I wouldn't hold up the patch waiting.

I've given this patch applied with the previous one a test and is
working fine on my system. I'm wondering if my tested by tag is
appropriate for the previous patch since I haven't tested it in
isolation.

uname -a
Linux 5.14.12-arch1-1 #1 SMP PREEMPT Wed, 13 Oct 2021 16:58:16
+0000 x86_64 GNU/Linux

make --version
GNU Make 4.3
Built for x86_64-pc-linux-gnu

/bin/sh --version
GNU bash, version 5.1.8(1)-release (x86_64-pc-linux-gnu)

[1]
https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-then

Tested-by: Cyril Bur <cyrilbur@gmail.com>
Reviewed-by: Cyril Bur <cyrilbur@gmail.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>



> ---
>  Makefile            | 22 +++++++++++-----------
>  package/Makefile.in |  6 +++---
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 2317655272..81b7173974 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -284,12 +284,12 @@ HOSTAS := as
>  endif
>  ifndef HOSTCC
>  HOSTCC := gcc
> -HOSTCC := $(shell $(SHELL) -c "command -v '$(HOSTCC)' || type -p
> '$(HOSTCC)' || echo gcc") +HOSTCC := $(shell $(SHELL) -c "command -v
> '$(HOSTCC)' || echo gcc") endif
>  HOSTCC_NOCCACHE := $(HOSTCC)
>  ifndef HOSTCXX
>  HOSTCXX := g++
> -HOSTCXX := $(shell $(SHELL) -c "command -v '$(HOSTCXX)' || type -p
> '$(HOSTCXX)' || echo g++") +HOSTCXX := $(shell $(SHELL) -c "command
> -v '$(HOSTCXX)' || echo g++") endif
>  HOSTCXX_NOCCACHE := $(HOSTCXX)
>  ifndef HOSTCPP
> @@ -310,15 +310,15 @@ endif
>  ifndef HOSTRANLIB
>  HOSTRANLIB := ranlib
>  endif
> -HOSTAR := $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || type -p
> '$(HOSTAR)' || echo ar") -HOSTAS := $(shell '$(SHELL)' -c "command -v
> '$(HOSTAS)' || type -p '$(HOSTAS)' || echo as") -HOSTCPP := $(shell
> '$(SHELL)' -c "command -v '$(HOSTCPP)' || type -p '$(HOSTCPP)' ||
> echo cpp") -HOSTLD := $(shell '$(SHELL)' -c "command -v '$(HOSTLD)'
> || type -p '$(HOSTLD)' || echo ld") -HOSTLN := $(shell '$(SHELL)' -c
> "command -v '$(HOSTLN)' || type -p '$(HOSTLN)' || echo ln") -HOSTNM
> := $(shell '$(SHELL)' -c "command -v '$(HOSTNM)' || type -p
> '$(HOSTNM)' || echo nm") -HOSTOBJCOPY := $(shell '$(SHELL)' -c
> "command -v '$(HOSTOBJCOPY)' || type -p '$(HOSTOBJCOPY)' || echo
> objcopy") -HOSTRANLIB := $(shell '$(SHELL)' -c "command -v
> '$(HOSTRANLIB)' || type -p '$(HOSTRANLIB)' || echo ranlib") -SED :=
> $(shell $(SHELL) -c "command -v sed || type -p sed") -i -e +HOSTAR :=
> $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || echo ar") +HOSTAS :=
> $(shell '$(SHELL)' -c "command -v '$(HOSTAS)' || echo as") +HOSTCPP
> := $(shell '$(SHELL)' -c "command -v '$(HOSTCPP)' || echo cpp")
> +HOSTLD := $(shell '$(SHELL)' -c "command -v '$(HOSTLD)' || echo ld")
> +HOSTLN := $(shell '$(SHELL)' -c "command -v '$(HOSTLN)' || echo ln")
> +HOSTNM := $(shell '$(SHELL)' -c "command -v '$(HOSTNM)' || echo nm")
> +HOSTOBJCOPY := $(shell '$(SHELL)' -c "command -v '$(HOSTOBJCOPY)' ||
> echo objcopy") +HOSTRANLIB := $(shell '$(SHELL)' -c "command -v
> '$(HOSTRANLIB)' || echo ranlib") +SED := $(shell $(SHELL) -c "command
> -v sed") -i -e export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD export
> HOSTCC_NOCCACHE HOSTCXX_NOCCACHE diff --git a/package/Makefile.in
> b/package/Makefile.in index 2ba4d8b381..4e993ecd5f 100644 ---
> a/package/Makefile.in +++ b/package/Makefile.in @@ -4,7 +4,7 @@ endif
>  ifndef HOSTMAKE
>  HOSTMAKE = $(MAKE)
>  endif
> -HOSTMAKE := $(shell $(SHELL) -c "command -v '$(HOSTMAKE)' || type -p
> '$(HOSTMAKE)' || echo make") +HOSTMAKE := $(shell $(SHELL) -c
> "command -v '$(HOSTMAKE)' || echo make") 
>  # If BR2_JLEVEL is 0, scale the maximum concurrency with the number
> of # CPUs. An additional job is used in order to keep processors busy
> @@ -222,8 +222,8 @@ else
>  TARGET_STRIP = /bin/true
>  STRIPCMD = $(TARGET_STRIP)
>  endif
> -INSTALL := $(shell $(SHELL) -c "command -v install || type -p
> install") -UNZIP := $(shell $(SHELL) -c "command -v unzip || type -p
> unzip") -q +INSTALL := $(shell $(SHELL) -c "command -v install")
> +UNZIP := $(shell $(SHELL) -c "command -v unzip") -q
>  
>  APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH
> support/scripts/apply-patches.sh $(if $(QUIET),-s) 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
