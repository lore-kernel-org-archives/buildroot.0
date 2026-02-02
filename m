Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21ADE73164
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B4A56061E;
	Mon,  2 Feb 2026 13:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6dUpUi2UMNe; Mon,  2 Feb 2026 13:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC2A960719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770038333;
	bh=D22wxnKvETx0QH+3GYDmi6CN+kICL1FO3pbHctGoCfc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J7LXN2bt8d2IPJrdYqbqzUMvHvVie1QYv0FUfXVRteZ7yvQkPh5wBZ5CDfN+HnqEc
	 56ZtmaLh0G5efoqzy9JBgUTvAvN1ITI2QgvL+DIT6hHMZecURMiWZH86/jldOQL3e5
	 qivYD814xPssKRuTb0k5GaP/oi7GEyWEecXWtwO+7WR4FP8AEMFkWe08h1Eev2pB/d
	 wdA4ak98QABAQ/pdRYO/f3+lYvdT+C1N8Np5x2TsV2m7ljdZ6KbaRFtiqSXBHcv9Bv
	 4jxDdLPSq4RG0ApTEg0BoiXe4qxQn1YQ/clFX/Mgxp5JxvRHemo21eyKPaBKsRIAh/
	 sWiDC1ztOUJLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC2A960719;
	Mon,  2 Feb 2026 13:18:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B62BB149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACC90400D5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWOdIkqqmHuv for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:18:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D3AE400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D3AE400BD
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D3AE400BD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:18:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F308A4E423C1;
 Mon,  2 Feb 2026 13:18:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C7CEF60767;
 Mon,  2 Feb 2026 13:18:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC786119A8888; Mon,  2 Feb 2026 14:18:46 +0100 (CET)
Date: Mon, 2 Feb 2026 14:18:45 +0100
To: Markus Mayer <mmayer@broadcom.com>
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>, 
 Buildroot List <buildroot@buildroot.org>
Message-ID: <aYCjvj6p819w-_E7@windsurf>
References: <20251205003008.153577-1-mmayer@broadcom.com>
 <20251205003008.153577-2-mmayer@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251205003008.153577-2-mmayer@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770038327; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=TpkVwba07V+9x6kn8/yMR5V2uiX4J1VHevC4LVuhDs8=;
 b=eoSXSsJf9JEmDM8ZSGaC/5XjdRb51DAGp2sqR5Z6ButW9C+IqAKBfYoo81S6ewkf7gagi3
 AEeZ4F5yfctWTK55q6d9279T3e217sJjXRGRT2wU4xTD3X2hXL5d9sSXjOmjj9s1aW/iDc
 pWWJK23dexJ3x1A+IZCQPd1MbGhDm5048+JrO8lUC9/My9LOIG30gltmvCeVqvM2MRKqxy
 5hIjFEAcBnSu/iPqMZTkWFDbXXkpB1ekmX2xeO42mGB4XkuFgj32Ln05NHqztHucPI4kVR
 02dO9kujAxqaI/KJIOkTGoI6zfC41UbJ4Ab1biO22AjUVZh9HT9R4YS6gEVRhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eoSXSsJf
Subject: Re: [Buildroot] [PATCH 1/1] package/e2fsprogs: fix fsverity build
 error slightly differently
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Markus,

On Thu, Dec 04, 2025 at 04:30:04PM -0800, Markus Mayer via buildroot wrote:
> Turns out Thomas and I were working concurrently on two different ways
> to fix the e2fsprogs 1.47.3 build error with regards to fsverity not
> being present in older kernels.
> 
> Thomas' patch disables the fsverity functionality in e2fsprogs based on
> the kernel headers used for compilation while my patch aims to provide
> the missing definitions if the kernel doesn't.
> 
> By providing the missing definitions whenever the kernel headers don't,
> fsverity related features can be compiled in even if the kernel headers
> are too old. This allows binaries to run on newer kernels with full
> functionality, but it relies on e2fsprogs to properly handle -ENOTSUPP
> errors at runtime if the kernel doesn't support the ioctl.[1]
> 
> We both submitted our respective patches to Ted T'so but haven't heard
> back as of yet. After a brief discussion on the Buildroot mailing list,
> we are trying my approach for now.
> 
> [1]: Compiling binaries against older kernel headers, but exclusively
> running them on newer kernels, can happen if one's toolchain comes with
> older kernel headers in the sysroot for increased compatibility across
> multiple kernel versions (e.g. the same toolchain & sysroot are used to
> build root file systems with Linux 5.4 and 6.12).
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Since then, my patch has been accepted and merged by Ted Tso:

  https://github.com/tytso/e2fsprogs/commit/4aba12dc19a95626eb7fa1df2d19c5235c2bc848

And it was integrated into Buildroot as well. Since we no longer have
any build failure in Buildroot, I think to be convinced that another
approach is needed, you should first convince upstream first that your
approach is better. Therefore, I will mark your Buildroot patch as
Rejected, but if you get your patches merged upstream, we will
obviously be happy to backport them in Buildroot (until a new
e2fsprogs release contains them, of course).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
