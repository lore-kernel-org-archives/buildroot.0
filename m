Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE04DC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 08:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6EAF82EB6;
	Wed,  7 Feb 2024 08:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQMeqfNxuwsP; Wed,  7 Feb 2024 08:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9424383521
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9424383521;
	Wed,  7 Feb 2024 08:55:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 031761BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED05240A59
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCXRZOAtmYfK for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 08:55:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 423F840BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 423F840BB4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 423F840BB4
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 08:55:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 89D8213F8C0;
 Wed,  7 Feb 2024 09:55:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 09:55:23 +0100
Date: Wed, 7 Feb 2024 09:55:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Message-ID: <ZcNFe1ZYKxgVfuuA@landeda>
References: <20240206192543.7179-1-ddrokosov@salutedevices.com>
 <20240206192543.7179-2-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206192543.7179-2-ddrokosov@salutedevices.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707296133;
 bh=+mWea27hm6URrCzYqs++JVFIT+aBxasu5/fWdvtXF/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jsirCrP0fC7PtOHV7RoKT5vWDjbsTCUUedt/3P0xVZfYzjBym1Vy5mYTbWeoW273F
 SD30PSqQhgqlXLxtSxu3g/SR/o0CGnKrRLVl2PAQRRuS8IX69Ft4zb5t3zGequjx+Y
 dgmyzl2S+fAQ5C8W8U/vCjRPfGA0AEpzcqiN0QstmusBk5z0NxFxWcO6EExTp3lk+a
 50goHTWSMN0hx1rxf5kvPAxAbcujHZH24GTGlX9wVO4EUeHVOeatU0VGb7q0qviuF2
 EHwNguSKvIytbISI6xQOlEuAsTsWgg7wf6ZGzXoEu99rgk/cfIe9wAuV5F2BFWtdtw
 ZFLsfiqxUZqgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jsirCrP0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/linux-tools: introduce linux
 mm tools
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
Cc: chopps@chopps.org, Herve Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org, Alexey Romanov <avromanov@salutedevices.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru, rockosov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dmitry, All,

On 2024-02-06 22:25 +0300, Dmitry Rokosov spake thusly:
> This toolset was designed to facilitate the testing, monitoring, and
> tracing of various things with virtual memory, pages, and slab objects.
> It is an invaluable resource for identifying and analyzing
> memory-related issues, such as leaks and bottlenecks, and can greatly
> enhance one's understanding of memory utilization within a system.
> 
> The mm toolset includes:
>     - page_owner_sort: userspace helper to sort the output of
>       /sys/kernel/debug/page_owner, which helps to know who allocates
>       the page from kernel context
>     - slabinfo: the tool which gets reports about slabs, for example
>       show empty slabs, modify of slab debug options at runtime, display
>       all information about a slabcache
>     - page-types: a handy tool for querying page flags
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>

I've applied, after making a few changes:

  - don't depend on linux, already a patch dependency
  - don't set CC: default is based on CROSS_COMPILE
  - no need to fully recheck at install time
  - move the option for alphabetical ordering
  - fix check-package

See below for a few more omments...

> ---
>  package/linux-tools/Config.in           | 18 +++++++++++
>  package/linux-tools/linux-tool-mm.mk.in | 41 +++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 package/linux-tools/linux-tool-mm.mk.in
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 8a0b6d5802cc..ede966ec792d 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -185,4 +185,22 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
>  
>  endif # BR2_PACKAGE_LINUX_TOOLS_HV
>  
> +config BR2_PACKAGE_LINUX_TOOLS_MM
> +	bool "mm"
> +	select BR2_PACKAGE_LINUX_TOOLS
> +	help
> +	  mm is a toolset for testing/monitoring/tracing vm/pages/slabs objects.
> +
> +	  - page_owner_sort: userspace helper to sort the output of
> +	  /sys/kernel/debug/page_owner, which helps to know who allocates
> +	  the page from kernel context
> +
> +	  - slabinfo: the tool which gets reports about slabs, for example
> +	  show empty slabs, modify of slab debug options at runtime, display
> +	  all information about a slabcache
> +
> +	  - page-types: a handy tool for querying page flags
> +
> +	  These tools are available only from kernel version 3.4.

    $ ./utils/docker-run make check-package
    package/linux-tools/Config.in:244: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/linux-tools/Config.in:247: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/linux-tools/Config.in:250: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/linux-tools/Config.in:251: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

>  endmenu
> diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
> new file mode 100644
> index 000000000000..5431e0574b04
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-mm.mk.in
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# mm
> +#
> +################################################################################
> +
> +LINUX_TOOLS += mm
> +
> +MM_DEPENDENCIES = linux

No need to add an explicit dependency: the linux-tools micro-infra
already handles it in a generic way; indeed, there is no reason for each
individual linux-tool to add a dependency on linux: they all have that
dependency.

> +MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"

No need to explicitly set CC: the kernel Makefile sets it based on
CROSS_COMPILE already.

> +define MM_BUILD_CMDS
> +	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
> +		MM_SUBDIR=vm; \
> +	elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
> +		MM_SUBDIR=mm; \
> +	else \
> +		echo "Your kernel version is too old and does not have the mm tool." ; \
> +		echo "At least kernel 3.4 must be used." ; \
> +		exit 1 ; \
> +	fi ; \
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> +		$(MM_MAKE_OPTS) $${MM_SUBDIR}
> +endef
> +
> +define MM_INSTALL_TARGET_CMDS
> +	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
> +		MM_SUBDIR=vm; \
> +	elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
> +		MM_SUBDIR=mm; \
> +	else \
> +		echo "Your kernel version is too old and does not have the mm tool." ; \
> +		echo "At least kernel 3.4 must be used." ; \
> +		exit 1 ; \
> +	fi ; \

For install, we do need to know which directory to use, indeed, but we
already do know one exists, as it was used at build, above; so we do not
need the error case. I've simplified this part and added a comment to
explain it.

Applied to master with those changes, thanks.

Regards,
Yann E. MORIN.

> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> +		$(MM_MAKE_OPTS) \
> +		INSTALL_ROOT=$(TARGET_DIR) \
> +		DESTDIR=$(TARGET_DIR) \
> +		$${MM_SUBDIR}_install
> +endef
> -- 
> 2.43.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
