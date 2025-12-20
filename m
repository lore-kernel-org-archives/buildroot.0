Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C02E668B1
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 15:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A7F40920;
	Sat, 20 Dec 2025 15:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1beGytcVBL2; Sat, 20 Dec 2025 15:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1CE5406ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766245627;
	bh=H0rY3Lo+fY2T5rUerMvPXdsRhDXNtAgDmBP6Q7vVa5g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ATiW2offH2OxnUoai7N4rNBW3YNbTAthaBBWn2K7KZr5K7Hpj0M5Hkoj1f/e/1RJQ
	 YjKBt279AsegXBlL+KEvetL+l2P6GRU8Fwp3LgzLDAAJErwooApH9QXSOf7P5l/ZIc
	 oPdmM7tM5MTXvuwRkNK85+LVdmBeuaDn+0Ha+xjTM52r2Lw7zeYcgC77Ce+OLNXv5Q
	 KEHRiG/f5kan2f4uS4kbn4z9UARKYbBgap1fjoCt7bfIQoKKj9efm1ZlM9aCi+dhyi
	 0tDa0x72WlZcgQq/scFcVoZay3wX4aXo+Fj7jnBkTdUYLXRZeCOWOMtOjzKGOMu3rj
	 is2MpDlh0W6kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1CE5406ED;
	Sat, 20 Dec 2025 15:47:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E3FA23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FFDF816DB
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zquuQ11fRAoi for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 15:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B866F816D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B866F816D5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B866F816D5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:47:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9CACF19F593;
 Sat, 20 Dec 2025 16:46:59 +0100 (CET)
Received: from [37.167.178.5:29206] via [37.167.178.5] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 16:46:59 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 16:46:59 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20251215074254.999761-1-thomas.petazzoni@bootlin.com>
References: <20251215074254.999761-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <100f7f0552a1cf2d6549c70aac7d5654@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766245622;
 bh=Xr4tTNCA+sHF6DAHmIiV1524+pP6sDV/Fj1KGmeh9e4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EQlsJudj5F3JUWa/UClZWyYEHrancMn5XgNgOVtMzFjw9iitaqSly9+ZtwJCZGCnE
 kdgewclCOus1RtrPfrAR6ncg+sD1L4NYQduWwUMQ1B5undhdGtHR2lRI+1oZ7/24t4
 yjtzlODjp65VRRNtOPvRMlPrv5TylrlH6gbunvLQWy0iaJNxuyuMa6LXQzPJgBn8KR
 jPousTT/iOqfKiNJ7yFc4wt+057OtpCwQaRE/wxDELf1FDdKUuuKMCL/ByrnYOqKLO
 eY9xW4FT0hzgPVgFsIEeLO+Zk3SXdnZxeXE9VxC9D1x85Yndsyezk5SbvyFXEnPK9j
 CZRJIYi8FoTTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EQlsJudj
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix imagination Vulkan
 driver build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/12/2025 08:42, Thomas Petazzoni via buildroot wrote:
> Since upstream commit 6e189ba6c17a2ab9b60e6fd65fc6a44a17dc9e8f, merged
> in mesa-25.3.0, the imagination Vulkan driver is no longer
> experimental.
> 
> Therefore, since Buildroot commit
> 3e296a151195f9d32dbfd62d6c75d08b822be6dd, which bumped mesa3d to
> version 25.3.0, the build of a configuration such as:
> 
>  BR2_aarch64=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>  BR2_PACKAGE_MESA3D=y
>  BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION=y
> 
> fails with:
> 
> build/mesa3d-25.3.1/meson.build:4:0: ERROR: Value 
> "imagination-experimental" for option "vulkan-drivers" is not in 
> allowed choices: "auto, amd, broadcom, freedreno, intel, intel_hasvk, 
> panfrost, swrast, virtio, imagination, microsoft-experimental, nouveau, 
> asahi, gfxstream, all"
> 
> Fix this by using the proper Vulkan driver name.
> 
> There are no autobuilder failures for this issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
