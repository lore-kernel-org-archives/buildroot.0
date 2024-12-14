Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D49E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 19:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F3686061E;
	Sat, 14 Dec 2024 19:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXlu6xm0i8ND; Sat, 14 Dec 2024 19:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62AF4606C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62AF4606C7;
	Sat, 14 Dec 2024 19:14:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F06A1D0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D22268460D
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROY8H0a2f0LG for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 19:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9D8281951
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9D8281951
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9D8281951
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:14:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 952CDB0055A;
 Sat, 14 Dec 2024 20:14:19 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42850])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 20:14:19 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 20:14:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241214161101.3283121-1-bernd@kuhls.net>
References: <20241214161101.3283121-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <80b096b070c4e57f622de6d02832c6e7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734203660;
 bh=YVfEbq6Y3fawADdij6WoVXP+e9d113s9AwonbukhjVk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nYtJHi1Zm1WhVKFvmC/XaU9nAs5GXBQ4c1erybfrpbOVUf6MpdR9VUyzQ4EaxeaHm
 s5C9SG2cTTPW6yW0ArKCuDnARLxZO87Ig46FxcO2H71T/8CY1n6mSPY0GnowO8HZo2
 CcjLudC24ovVUdm06IwwGasHr57XY1aN75ugn1z9YHvpaU77hkBBWvDNObcQlHpFQi
 hBT+JXwTG7yO+wp9xaY8hBun//5V8XE8W0UJKukymhoXwK7rIkAsUZRWhUHTMzZWf2
 lKgwKLp9leazY8i5qJP+K5n1Cm/bygi1s28CEOgC+ZJQX6RXnOsSU7U3+u9FaM/YJ/
 J9Bj/kS1LIzvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nYtJHi1Z
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20241210
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

On 14/12/2024 17:11, Bernd Kuhls wrote:
> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/linux-firmware/linux-firmware.hash | 4 ++--
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.hash 
> b/package/linux-firmware/linux-firmware.hash
> index 97004505c6..9125352475 100644
> --- a/package/linux-firmware/linux-firmware.hash
> +++ b/package/linux-firmware/linux-firmware.hash
> @@ -1,5 +1,5 @@
>  # From 
> https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
> -sha256  
> 943fbd19883cf8eadf89e0b22422549db056557b1ecd30a56400615971369671  
> linux-firmware-20240909.tar.xz
> +sha256  
> 2bb035708576d076f97d4196a1c22e0a4d33fbb0210d05428d0bf4f243e99af5  
> linux-firmware-20241210.tar.xz
> 
>  # Hash for license files
>  sha256  
> 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  
> LICENCE.Abilis
> @@ -40,6 +40,6 @@ sha256  
> 8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  
> LICENS
>  sha256  
> be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  
> LICENSE.qcom
>  sha256  
> fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  
> LICENSE.radeon
>  sha256  
> 2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  
> LICENSE.sdma_firmware
> -sha256  
> d6a8d8b935d275e4092a0ec578eb430f9ef70bec34165d18bcabfa4a81f65724  
> WHENCE
> +sha256  
> feb7f80e7805e0c88b1ea7588410822710e5c3c5cd5b685f75327a4d35798447  
> WHENCE
>  sha256  
> fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  
> qcom/NOTICE.txt
>  sha256  
> bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  
> LICENCE.e100
> diff --git a/package/linux-firmware/linux-firmware.mk 
> b/package/linux-firmware/linux-firmware.mk
> index 9ffd52dff5..76bc6127f7 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LINUX_FIRMWARE_VERSION = 20240909
> +LINUX_FIRMWARE_VERSION = 20241210
>  LINUX_FIRMWARE_SOURCE = 
> linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
>  LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
>  LINUX_FIRMWARE_INSTALL_IMAGES = YES
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
