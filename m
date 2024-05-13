Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBC5C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44EC0405D7;
	Mon, 13 May 2024 20:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mF1g4e8O6E5l; Mon, 13 May 2024 20:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E133C40782
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E133C40782;
	Mon, 13 May 2024 20:49:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15C691BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EA1340782
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPekVtsioqkH for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:49:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E627405D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E627405D7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E627405D7
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:49:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB7CAFF803;
 Mon, 13 May 2024 20:49:50 +0000 (UTC)
Date: Mon, 13 May 2024 22:49:49 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240513224949.169828d9@windsurf>
In-Reply-To: <ZkDCDNPE1sawl6SP@waldemar-brodkorb.de>
References: <ZkDCDNPE1sawl6SP@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715633390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIL/JoXyjunRxyn8I8FEeHh3rwrIL4+NuMe7xFzcNWg=;
 b=NMmu7v8TKI45VeDaUhatozjBMxAXIIby7UwjqG5v2wQLgzwU4tYZS2ERgXWt+jD3cxeP1A
 XbGqZfC3seHZJ0qOnkZ3jLYbGDDnDDyMWfnBUx/BgwaQirr9cf8EbHYsiak9nKdDjBXmg6
 6IenbDaaEvmA8zayeamiRlhg7ueY/ltdQ8qrgtmEjOYHkos70CxnVfNahm8DaGAoSY0oSs
 T5WfIVEcP4D3OykaCHqvDp/8/GQ64oGh+V+fAMdFc8OCJVGsHxWzzUlimRg5eO2ZXyNS0c
 RsqOCZxZjMHqnJpD8BJlLCmKOPAvX1zFjGEh8+3REeiKoUetfnG1iLtV7vmzpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NMmu7v8T
Subject: Re: [Buildroot] [PATCH] package/qemu: update to 9.0.0
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 12 May 2024 15:20:12 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> diff --git a/package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch b/package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch
> deleted file mode 100644
> index 91506b14d9..0000000000
> --- a/package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch
> +++ /dev/null

The removal of this patch needed a .checkpackageignore change, so I did that.

> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 8d53ced300..91e0de884f 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -289,7 +289,7 @@ config BR2_PACKAGE_QEMU_TARGET_RISCV32
>  	bool "riscv32"
>  	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
>  	help
> -	  RISC-V 33-bit architecture.
> +	  RISC-V 32-bit architecture.

This typo fix was unrelated to the bump, so it should have been a
separate patch. Therefore I made a separate commit.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
