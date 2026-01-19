Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941F5CCF2D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B19081DB2;
	Mon, 19 Jan 2026 10:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6_Y69ET9IHx; Mon, 19 Jan 2026 10:09:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F061681CE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817357;
	bh=21agdmyUbdNld6zOhGqz8PP24ZJkmH2KavAzH+xjI3w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dlFJxV+NeWp8VlEKrFTwq4l30lybZ2VykX7GBTY8Pz8QPSFgAgifyGROxErv+MeQw
	 ISzjKZMBk32inEuPuGPlnHcC4jvw8VZ2cpf5Gqpz2kkAY5+nARwAGAWZm5Hz4vRIN0
	 DPzpXozqHKJcHsg4yCx0/i3ciIhbI0J7My1nSYW7Davo40Q6xoOFjbGWDbqUbG5d+9
	 fNDml/WNpDxMR/ZJUS/nWe9gEvLI/GP6z9sJf2BtGH8uCUz310QzVCuRAKL2cIXnn4
	 XhOAF1BbX43Fnlr4kPjG/vs3cNsnqeKJ8/Dtb8Q0Pmcy9kX7Z1gU9hVfI5CVk3IcbI
	 +V2sxgGEVnl/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F061681CE7;
	Mon, 19 Jan 2026 10:09:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A186160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 509EB60D99
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAC8QnK6jbaO for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 590F560D95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 590F560D95
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 590F560D95
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 620F6B97A1FF; Mon, 19 Jan 2026 11:09:11 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:10 +0100
Message-ID: <20260119100910.12611-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103132552.3979708-3-bernd@kuhls.net>
References: <20260103132552.3979708-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817351; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=7zXbz3DhZ8B89ZtMCL+5H2yEGZIWjQ6Ijwa8qpgAhD0=;
 b=gd3u2iB1erzrt672KNylrTOIVL70fEwfqrh2b+JoJWppI+FRAlRpCdO+n13eHaYvTNH51f
 IZlF4c+jfWVFLZ59DzJz/MG2K58q4p9UPluy+oOV/HvWyxrEFQrPbJXZo621/7Xx12mf9J
 0VYvVud6hZpeIvK22u0csHuH1ekCOEngL6VXqfO6Geku6gEEHNTlfYUCDDx8iV1/5f17ep
 SjzY4QmBIAMXNzEsiRNnTCxQ5UqtpBm6OtBgqvTvYYYYJ6VgfVRy6g+/Zlz9QhiIKxGSdx
 W4du5a7nOhFfukaA/dp3+P4XCKRgMPdQa4xX0h5zHu8Ztn49ctIWtIKRdWn3Ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gd3u2iB1
Subject: Re: [Buildroot] [PATCH v4 2/5] package/nfs-utils: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Package nfs-utils requires libtirpc rpcdb option enabled. Package
> libtirpc with commit [1] disabled rpcdb functions by default so let's
> select it by default to enable rpcdb functions required.
> 
> [1]:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> 
> Fixes:
> https://autobuild.buildroot.org/results/29adf2d04cf4c46e492af95edaa96983985d6b57/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> [Bernd: enable BR2_PACKAGE_LIBTIRPC_RPCDB only for non-glibc toolchains]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/nfs-utils/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> index 02cc7e78cc..89b8b5da42 100644
> --- a/package/nfs-utils/Config.in
> +++ b/package/nfs-utils/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_NFS_UTILS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
>  	select BR2_PACKAGE_LIBEVENT
>  	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
> +	select BR2_PACKAGE_LIBTIRPC_RPCDB if !BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_SQLITE
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
