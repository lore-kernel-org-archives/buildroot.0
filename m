Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECA0E668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 15:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0171D40980;
	Sat, 20 Dec 2025 15:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_X9V0kGORQf; Sat, 20 Dec 2025 15:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEFBF4097E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766245656;
	bh=+TbuKHfI4FuBFcqlZxxV5epwibw7mJegel1ia/5f+ng=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HCKqyk1YBbw6zu5dWs00VfkBMhUdDC+v61a6xZnSWbH3ZukmFqKhzIJ+O5qKvYNN2
	 31MyMf3KDzfy0mK/a7tGB3W0hC0nMYAh7AoGEDVjxgu615jwDrulNzTRq1C58QCVmk
	 UNw2efEpneBqK97SF7FPMpiONJVMYepUhOfEE21FpmGN5Ttft150MUnVp74sJf8biI
	 8SKxrjv4fAtm+EXNq0+8KgRGgTqwtxViGgHJd33KfHLCkY68omGpNHmdI9Nf4ZzDvi
	 7+trKIjOQfEJWqklsNCcPnDeyQGfFbJ0ySkm8kyCtdessUgvtvGK9KbyBMUnhhnL59
	 LnY1IhA7vTRQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFBF4097E;
	Sat, 20 Dec 2025 15:47:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3F3E23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D63DF4047D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yS22d_DEW_Um for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 15:47:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B1034009D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B1034009D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B1034009D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:47:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 263692003C6;
 Sat, 20 Dec 2025 16:47:29 +0100 (CET)
Received: from [37.167.178.5:29206] via [37.167.178.5] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 16:47:29 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 16:47:29 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20251215210234.1123314-1-thomas.petazzoni@bootlin.com>
References: <20251215210234.1123314-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <820a90964da61ab327a082ac10c14744@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766245652;
 bh=/FxaEpFJ9aDVuv9XjdbvURSzuD3O1C74IIjSjjG1WJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O/aYfcv77ZUs9NSKFN6mv/MfmUZEWf2nu30/Ddtmdc7do9E+uMrWLjommGpQpHDY1
 8X5jLhyEfQd5MjIhU5AwLKcakUS1SGLX4+QKM9D704uPtq4ANGNMCvEk6E/wZSWfMl
 0Xt/eT7O78nScT4l2zov30wLcj+Z2VzPkuTOqSqAlFB4NIlmjUg4LAYNV4LmgCCptd
 EdbEUIm6sUtG15dFNiwAxiuRiXFGH+/jWZiNbAHkYKzCdHk9SsBOnLdBjJw1N3k86A
 uQyHRyLzv6VV3qhz8lrKxtDiRYxD4PF8jGZJ+guCg+wTiL/U4thkqC8X5CxAvmxmqA
 QfDHeRnmHAfQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O/aYfcv7
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: add missing dependencies
 for imagination driver
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

On 15/12/2025 22:02, Thomas Petazzoni via buildroot wrote:
> The build of the following basic configuration enabling the
> imagination Vulkan driver
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION=y
> 
> fails with:
> 
> meson.build:847:3: ERROR: Feature llvm cannot be disabled: CLC requires 
> LLVM
> 
> Adding just LLVM as a dependency is not enough, as then libclc is
> needed, then LLVMSPIRVLib, then clangBasic, then the pco_clc tool.
> 
> In fact, like the Panfrost driver, building the Imagination driver
> requires building host tools using host-mesa3d. To fix this we:
> 
> - Make the BR2_PACKAGE_MESA3D_OPENCL option selectable
> 
> - Make sure that BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION depends
>   on BR2_PACKAGE_MESA3D_LLVM and select
>   BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER (the latter being needed to
>   build host-mesa3d)
> 
> - Make sure the host-mesa3d builds imagination
>   tools (-Dtools=imagination) and install
>   pco_clc (HOST_MESA3D_INSTALL_PCO_CLC). This requires introducing
>   HOST_MESA3D_TOOLS as a list of tools to build, which then gets used
>   to construct the -Dtools argument, as we can now have both
>   "panfrost" and "imagination" in this list.
> 
> With all this, the defconfig above builds successfully.
> 
> This has been broken since Buildroot commit
> 5e818c16a31a902ec29a250f920f43c76e2d9868, which introduced the vulkan
> driver support.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
