Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B054EC4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF3C407C3;
	Mon, 12 Feb 2024 22:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xEKt9Qu0U1uo; Mon, 12 Feb 2024 22:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D39F407BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D39F407BC;
	Mon, 12 Feb 2024 22:04:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D774B1BF34E
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4CDD40763
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-l4nITr6cHn for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:04:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BE60407BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BE60407BC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BE60407BC
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:04:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 255C81C0003;
 Mon, 12 Feb 2024 22:04:23 +0000 (UTC)
Date: Mon, 12 Feb 2024 23:04:22 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240212230422.5e1aff0b@windsurf>
In-Reply-To: <20231229214418.9331-1-fontaine.fabrice@gmail.com>
References: <20231229214418.9331-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707775464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zf4qTYaa4aRWOWRwxu0UkluWG/Piq8bWpbftvUnWHeY=;
 b=IxDbH4Mj8aaKN+xjHGPozK9cBIEYDv9am+S03Rvq2zZIbBYBFChCmn8QvgBVn9CNA2t/Kz
 a2KDVpHbCylXPAKrHoxd2XQOGNv0Drf3MMKv+ayDDhhGhVQVNn90eN7tdEgZG0RLobtPBM
 4Vfp8EDCH6AXGHooaBG+6stcIaal1+CcldyLHFL6bqzr7Ew4+aoAlaCoLV/y+TrM5Y22Vn
 MRlqGN1TioEwXTELvBqCSxlNv76STElPRadujw2DYpoWTP8S4fiTz7/LKWCdLrrpsKthBR
 gGSg6QuiyQikMvBVhYm2x3fDVgWyGJRC4PJZ95cWi3Dl/zbk8lHu6IZTvGtmAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IxDbH4Mj
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: fix openssl static build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Dec 2023 22:44:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following openssl static build raised since commit
> 80fa5672da85a110e60be0d2143e85f9e08a0f4a:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/12.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/lib/../lib64/libcrypto.a(libcrypto-lib-c_zlib.o): in function `zlib_oneshot_expand_block':
> c_zlib.c:(.text+0xaec): undefined reference to `uncompress'
> 
> Commit b9a062b354953f3fbfee702bb5b5007598299925 can also be reverted as
> pkg-config will also retrieve -latomic to avoid the following build
> failure:
> 
> /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-1/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(threads_pthread.o): in function `CRYPTO_atomic_add':
> threads_pthread.c:(.text+0x208): undefined reference to `__atomic_is_lock_free'
> 
> RSYNC_POST_CONFIGURE_HOOKS must be added to call reconfigure and avoid
> the following build failure after autoreconf:
> 
> autoconf -o configure.sh
> autoheader && touch config.h.in
> configure.sh has CHANGED.
> config.h.in is unchanged.
> You may need to run:
>   make reconfigure
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6c1636f7556e7370a4c9f6d02c63cf3e20dc985c
>  - http://autobuild.buildroot.org/results/49abbaa1eab94b248bff434b40728065d687e278
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...py-in-crypto-lib-instead-of-MD5_Init.patch | 28 +++++++++++
>  ...-pkg-config-to-retrieve-openssl-depe.patch | 48 +++++++++++++++++++
>  package/rsync/rsync.mk                        | 12 +++--
>  3 files changed, 84 insertions(+), 4 deletions(-)
>  create mode 100644 package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
>  create mode 100644 package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
