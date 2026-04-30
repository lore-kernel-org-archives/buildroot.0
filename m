Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ED6FF8873
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 12:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD4A61C33;
	Thu, 30 Apr 2026 12:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8n9uHluqTki4; Thu, 30 Apr 2026 12:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9570961635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777553171;
	bh=a6wM5w3/XfPOGwmjebvfbrdtnbykSuT8vfF+4MHTEKk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QuQIsCQEYxKFaX/QTo6RJFpDoegzgfyS6k6IWx7pf5ktKho0yHq2mETo/bTQWJitO
	 62xT9YjrMpqDgCsNhXfb+XC9WBjJ3Xo0c442Yb8KHlWj9iTdnPz8ecfH0KvXiX4r0p
	 wsZ4CnC1qj28cWi6rHdRnPUUVXXKlJYKYceU8lhh0oRLV6hg1Zs4pgcZUZU8K1Q7vA
	 vcQV0FsLAVuQy5s9RfYUCwmVUupXj+I4xWE6mp/FDRpBfUO8ZzcXVcemV0a0VI0Ip2
	 7iWjyJc/NXfz9MDdmodkQz6l1Fuq02TN6uE0/uARu242mucyvf6PFnytj3qApbh6Ql
	 Fm3YgZvD/kDvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9570961635;
	Thu, 30 Apr 2026 12:46:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5156C192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4319284BB0
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4g246RJYGBE1 for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 12:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06BB084BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06BB084BA8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06BB084BA8
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:46:08 +0000 (UTC)
Received: from [172.18.252.108] (ip-185-104-138-116.ptr.icomera.net
 [185.104.138.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8A9D12C86F8B;
 Thu, 30 Apr 2026 14:46:05 +0200 (CEST)
Message-ID: <f17073a5-410e-467a-8b29-befc23b3dc0e@bubu1.eu>
Date: Thu, 30 Apr 2026 14:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
 <20260425085657.474422-5-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260425085657.474422-5-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777553166; bh=IifR3rxsM/WMcghNrkSi26btpgC9IHNNiu++PWwjiQI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Z/cEpjZY/xv3IwjEXUAyew6FdEgmLuJkG+a5QuMlOEo8YgfEtiid/3SlMcG+C7M7l
 tbnRr5W22gAeo9nw2P96/5Vn+F51c8WTqAY1kVJF1/MRqCdtG7rQJl8AB3e0D7DS/j
 a/N71cEF5Vknmj2++3/noVrWPbe77Ztxqf6qWy2bHdpwgh3AZ8/OTcheGD0e25NSlK
 NVxadkPkjQurkuI76GWdr/pK/T1p/X894tPe482ewwdRjwh2DcOCeLHsImHGnnh2Re
 akVn49U6Y/Ly9fEyTYKKOSewgDu5jnImXX+TT7m8H6yCQO0YkLZN5QgCJPJY1UR5RN
 hQE/TzK1G3c1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Z/cEpjZY
Subject: Re: [Buildroot] [PATCH 4/5] package/kmod: switch to Meson build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

thanks for this patch, I have one question below, otherwise this looks good.

On 4/25/26 10:56, Fiona Klute via buildroot wrote:
> The upstream changelog for version 34 states that the next major
> version will drop the Autotools build, and the 34 series is meant for
> distros to switch.
> 
> Notable changes in the Buildroot package:
> 
> * The Meson build handles symlink install, so we can drop the post
>    install hooks.
> 
> * The previous point also means that host-kmod now installs the full
>    set of tools.
> 
> * Explicitly disable openssl support in host-kmod tools. It is enabled
>    by default and the build fails if OpenSSL cannot be found. In the
>    autotools build it was not explicitly set.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
> [...]
>   
> -# /sbin is really /usr/sbin with merged /usr, and /usr/sbin is
> -# really /usr/bin with merged-bin, so adjust relative symlink
>   ifeq ($(BR2_ROOTFS_MERGED_USR),y)
>   ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
> -KMOD_BIN_PATH = kmod
> -KMOD_SBIN_DIR = bin
> +KMOD_CONF_OPTS += -Dsbindir=bin
>   else
> -KMOD_BIN_PATH = ../bin/kmod
> -KMOD_SBIN_DIR = sbin
> +KMOD_CONF_OPTS += -Dsbindir=sbin
>   endif
>   else
> -KMOD_BIN_PATH = ../usr/bin/kmod
> -KMOD_SBIN_DIR = sbin
> +KMOD_CONF_OPTS += -Dsbindir=/sbin
>   endif

Is the bindir/sbindir logic still required actually? I'd have hoped that 
meson does this correctly on it's own (afaict these are built-in meson 
flags, that supposedly are also filled in with some sensible default?)

Have you tested removing this altogether?

>   
> -define KMOD_INSTALL_TOOLS
> -	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
> -		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/$(KMOD_SBIN_DIR)/$$i; \
> -	done
> -endef
> -
> -KMOD_POST_INSTALL_TARGET_HOOKS += KMOD_INSTALL_TOOLS
>   else
> -KMOD_CONF_OPTS += --disable-tools
> +KMOD_CONF_OPTS += -Dtools=false> [...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
