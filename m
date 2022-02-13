Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED2AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5959840309;
	Sun, 13 Feb 2022 11:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynJUJbOGZ6I0; Sun, 13 Feb 2022 11:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 810E540305;
	Sun, 13 Feb 2022 11:46:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 161961BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0482660706
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZpnJMFkLtWh for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:46:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5A8060671
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:46:07 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id e7so27817645ejn.13
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LqILVkqxvZk8J2puovNORNX1QGKykLCkyy5ygge+3Ho=;
 b=BVXj5TSC/CQQpSTMCor42opUa+FOiEfRobHnWT5qVcgbbrHUF/hrKIAA5/lVeIjtoW
 BHhSQXzpqPI49SeHQ5OwM9CBgdkQJoh36RYaSt/BTJdcWV76tihjoYOc1PYJqfyitItj
 ViFB81otojyrAiT0dAPZMWzUCORnvbny5lt4pFqsaHktJ5vkTfyYwdnyngnMiOTRbDCh
 b3TDg9qdDwvTlyiBsVRUuzRvjqsHYY9C2gpunCsdvGZzdV6kAFc61oOUa95pIW30YVMr
 IyipTPI8s/qeKNgNRkxJ8l9RysBwL9Tp7MtiQhzZDIYR1Ko9Yph54dweBr8eExD34ut0
 D5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LqILVkqxvZk8J2puovNORNX1QGKykLCkyy5ygge+3Ho=;
 b=PFqWnab1xeJpPMKuFf32WzDgG/Y5/yKsfV9bzxQWF7jEq2WwijGXfDcYeiDBAT9lGh
 Zp2FOdJI/IbtSZAOG2aga/SyCzlPR0r1TnKALdo8WnZuoAV+vLb94dxE6JdGELSZj2rX
 D8jJ7dTlU506ykP1yxM2xh8MxcxcGwCanD+97eQZvUPGnUD6Q0i9588QsKE+4jZfb9kT
 r9VUWwFArkLpMuHtnT8GHyffHgBtAKNoF4TNpDN7fFtNgS6wsRrArRSYrdkPLHPPMNdk
 QjEhsKTwqOqUXxMuwYP+P6ce+DKvKBCbNcPvEsHOzN6c88Yo4TIGlyPpUEJbTWAOkGeH
 vP9w==
X-Gm-Message-State: AOAM530Uk0TNnUalXMUNIFyO0ih2NLKQL23gl6CTB4pGAs0mjn/t1crJ
 MMkfSKfl4F+twQloBWScucwR1g==
X-Google-Smtp-Source: ABdhPJz6GhmtQm2gAwjUyUZ83KoIlI9qKetvWQzsHGyy1V+Zv+BpWQno3r3d4bWNGavC0OJ6EPSWrA==
X-Received: by 2002:a17:907:8a1d:: with SMTP id
 sc29mr580716ejc.617.1644752766024; 
 Sun, 13 Feb 2022 03:46:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g22sm5425787ejk.169.2022.02.13.03.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 03:46:05 -0800 (PST)
Message-ID: <c60cb2e3-c822-3f9f-0f16-f206f9f407b3@mind.be>
Date: Sun, 13 Feb 2022 12:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220202214357.2640301-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202214357.2640301-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] board/intel/galileo: fix build failure with
 host gcc 10
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
Cc: Nicholas Sielicki <sielicki@yandex.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 22:43, Giulio Benetti wrote:
> Building galileo_defconfig throws error:
> ```
> /usr/bin/ld: arch/x86/tools/relocs_64.o:(.bss+0x0): multiple definition of `per_cpu_load_addr'; arch/x86/tools/relocs_32.o:(.bss+0x0): first defined here
> ```
> 
> To fix this let's add an upstreamed patch[1] and add BR2_GLOBAL_PATCH_DIR
> to galileo_defconfig to point to where patch is.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eeeda4cd06e828b331b15741a204ff9f5874d28d.patch
> 
> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/2035821039
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  You can't imagine how much joy it gives me to see a patch from 2014 applied 
here...


  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...relocs-Make-per_cpu_load_addr-static.patch | 39 +++++++++++++++++++
>   configs/galileo_defconfig                     |  1 +
>   2 files changed, 40 insertions(+)
>   create mode 100644 board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch
> 
> diff --git a/board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch b/board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch
> new file mode 100644
> index 0000000000..1d206cc6d1
> --- /dev/null
> +++ b/board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch
> @@ -0,0 +1,39 @@
> +From eeeda4cd06e828b331b15741a204ff9f5874d28d Mon Sep 17 00:00:00 2001
> +From: Ben Hutchings <ben@decadent.org.uk>
> +Date: Wed, 24 Sep 2014 13:30:12 +0100
> +Subject: [PATCH] x86/relocs: Make per_cpu_load_addr static
> +
> +per_cpu_load_addr is only used for 64-bit relocations, but is
> +declared in both configurations of relocs.c - with different
> +types.  This has undefined behaviour in general.  GNU ld is
> +documented to use the larger size in this case, but other tools
> +may differ and some warn about this.
> +
> +References: https://bugs.debian.org/748577
> +Reported-by: Michael Tautschnig <mt@debian.org>
> +Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> +Cc: 748577@bugs.debian.org
> +Cc: Linus Torvalds <torvalds@linux-foundation.org>
> +Link: http://lkml.kernel.org/r/1411561812.3659.23.camel@decadent.org.uk
> +Signed-off-by: Ingo Molnar <mingo@kernel.org>
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + arch/x86/tools/relocs.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
> +index bbb1d2259ecf..a5efb21d5228 100644
> +--- a/arch/x86/tools/relocs.c
> ++++ b/arch/x86/tools/relocs.c
> +@@ -695,7 +695,7 @@ static void walk_relocs(int (*process)(struct section *sec, Elf_Rel *rel,
> +  *
> +  */
> + static int per_cpu_shndx	= -1;
> +-Elf_Addr per_cpu_load_addr;
> ++static Elf_Addr per_cpu_load_addr;
> +
> + static void percpu_init(void)
> + {
> +--
> +2.25.1
> +
> diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
> index 03ca23f414..a8fd0a6dcc 100644
> --- a/configs/galileo_defconfig
> +++ b/configs/galileo_defconfig
> @@ -1,4 +1,5 @@
>   BR2_x86_x1000=y
> +BR2_GLOBAL_PATCH_DIR=board/intel/galileo/patches
>   # Needed for TARGET_GRUB2
>   BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>   # Linux headers same as kernel, a 3.14 series
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
