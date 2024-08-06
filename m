Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7938AC52D71
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 16:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C453A402F8;
	Tue,  6 Aug 2024 16:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1A1usmqhXJcd; Tue,  6 Aug 2024 16:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F8F40218
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6F8F40218;
	Tue,  6 Aug 2024 16:47:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D48A1BF32A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AF9340211
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KS8qj69mouJE for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 16:46:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBD03401F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBD03401F4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBD03401F4
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 16:46:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E162C0007;
 Tue,  6 Aug 2024 16:46:54 +0000 (UTC)
Date: Tue, 6 Aug 2024 18:46:53 +0200
To: Eryk Szpotanski <eszpotanski@antmicro.com>
Message-ID: <20240806184653.6cafab45@windsurf>
In-Reply-To: <CAG9w5kMVs04gOeqXtsjYUPJCgcpGNFkpi6C4J7fnsJgVdCvRqw@mail.gmail.com>
References: <CAG9w5kMVs04gOeqXtsjYUPJCgcpGNFkpi6C4J7fnsJgVdCvRqw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722962815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RsDgr9OlyJxqe5E7YPv+wSBN5atsSaEhkOJRMdeaZk=;
 b=QUw9+KJ710m5vBDWUgMuK4bqqleHrT4D1+JdT2kUeEFEKDm65webMzRJHlsXQCkPZ4omhV
 Gm5c4O3aWXcIKSvsuglz7zNXzg/fi0TjmsAty0xtUSwXTZF0rgrxarKDT+UWgrEL8CMgos
 QpKclhC60Tjxl4vZrTYmyAHJxol9Y66BhBeU/1ZtDtf5ajZkv9WBdJ+jy2R5cjwmIQtNvl
 Vbn5kkKo5+34DpPK+x0GtukN6g16S0+gES2Z0LWrcRNQ3v4URQCxIZkxfayZB3iXrKuMDY
 mBps+e69eTIInuFMsVmHTttoQoZrVd6fdjZESrWrbPVM8BDGK44keSpwzXUJrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QUw9+KJ7
Subject: Re: [Buildroot] [PATCH 1/1] package/riscv-coremark: Create package
 with CoreMark benchmark for RISC-V
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Eryk,

On Tue, 6 Aug 2024 18:39:58 +0200
Eryk Szpotanski <eszpotanski@antmicro.com> wrote:

> From 3c09f5c971248c8c9c05a8bab79a5ddb45b40eb7 Mon Sep 17 00:00:00 2001
> From: Eryk Szpotanski <eszpotanski@antmicro.com>
> Date: Thu, 9 May 2024 12:34:08 +0200
> Subject: [PATCH 1/1] package/riscv-coremark: Create package with CoreMark
>  benchmark for RISC-V
> 
> Signed-off-by: Eryk Szpotanski <eszpotanski@antmicro.com>

Thanks a lot for your patch! However, it looks like you haven't used
"git send-email", so your patch is badly line-wrapped and cannot be
applied. Could you use "git send-email" to send a new iteration?

See a few quick review comments below.

First, why do we need a riscv-coremark as opposed to an
architecture-agnostic coremark?

> ---
>  package/Config.in                             |  1 +
>  ...ype-to-match-it-with-definition-from.patch | 27 +++++++++++++++++++
>  package/riscv-coremark/Config.in              |  8 ++++++
>  package/riscv-coremark/riscv-coremark.hash    |  3 +++
>  package/riscv-coremark/riscv-coremark.mk      | 22 +++++++++++++++
>  5 files changed, 61 insertions(+)

Please add yourself to the DEVELOPERS as the maintainer for this
package.


> b/package/riscv-coremark/0001-Update-clock_t-type-to-match-it-with-definition-from.patch
> @@ -0,0 +1,27 @@
> +From a6c8e2e00e5534b340885181d99ecf19286a9ff8 Mon Sep 17 00:00:00 2001
> +From: Eryk Szpotanski <eszpotanski@antmicro.com>
> +Date: Tue, 6 Aug 2024 13:44:21 +0200
> +Subject: [PATCH] Update clock_t type, to match it with external definition
> +Upstream: N/A This patch adjust the clock_t type to match it with the
> definition from RISC-V toolchain

Why is that not applicable upstream? Especially if upstream is anyway
RISC-V specific?


> diff --git a/package/riscv-coremark/Config.in
> b/package/riscv-coremark/Config.in
> new file mode 100644
> index 0000000000..c9ed47befa
> --- /dev/null
> +++ b/package/riscv-coremark/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_RISCV_COREMARK
> + bool "riscv-coremark"
> + depends on BR2_RISCV_64

As asked above: why is this RISC-V specific?


> diff --git a/package/riscv-coremark/riscv-coremark.mk
> b/package/riscv-coremark/riscv-coremark.mk
> new file mode 100644
> index 0000000000..819fac2313
> --- /dev/null
> +++ b/package/riscv-coremark/riscv-coremark.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# RISC-V Coremark
> +#
> +################################################################################
> +
> +RISCV_COREMARK_SITE_METHOD = git
> +RISCV_COREMARK_GIT_SUBMODULES = YES
> +RISCV_COREMARK_VERSION = 6e1d72b864e45f67031ffaedb0b01b5d030d6d3c
> +RISCV_COREMARK_SITE = https://github.com/riscv-boom/riscv-coremark.git
> +RISCV_COREMARK_LICENSE = BSD-3

Should be BSD-3-Clause

> +RISCV_COREMARK_LICENSE_FILE = LICENSE
> +
> +define RISCV_COREMARK_BUILD_CMDS
> + $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D)/coremark
> PORT_DIR=$(@D)/riscv64 compile

Could you try to use $(TARGET_CONFIGURE_OPTS) instead of just CC="$(TARGET_CC)" ?

> +endef
> +
> +define RISCV_COREMARK_INSTALL_TARGET_CMDS
> + $(INSTALL) -D $(@D)/coremark/coremark.riscv
> $(TARGET_DIR)/usr/bin/coremark.riscv

Please add -m 0755 to this $(INSTALL) invocation.

Overall, it looks reasonable, really the main concern is why do we need
a RISC-V specific version of this? What if we want coremark on other
architectures?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
