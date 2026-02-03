Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678D8E8B367
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1842F6064F;
	Tue,  3 Feb 2026 22:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wR_RNuvvlhZ9; Tue,  3 Feb 2026 22:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BB2260752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770156623;
	bh=2SomAPl26r7l8L49xdFDoiFpqCLQeYYmuGfVT8BeEGY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZoigHjkC1+tq/MTJbmrHenaJPiHk8jUvVXC0phN9ci868gKW8PavYPr+NGsImiDUx
	 liEbnYYRFWJefKKbwqukP+mvtyy0qO3E3Egplf9i9b+5yyvg1rl61Ojr5uscOAkrO3
	 bwlUT0Nltgv0UTn5HpS/YKE4p69sddStOxdUgt5cihQD0IVwikMGGCVupA9eAVnJgN
	 gCu4/xxVSWhGvssgcp/CedZ8upn1gJCCK1Mt2UWDS3dfvdI7q95+a0dTIAXPLJFVw/
	 DidJaXYve+P0OWH5BbRGYJrrkHJwWvOikwCwgQ3eUuLS4/uoThKpAQqRbmz6sJct0J
	 3Pje3AYYkjwrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB2260752;
	Tue,  3 Feb 2026 22:10:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E8F2F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6094040806
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H92NIjiY196c for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:10:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FAF6407EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FAF6407EE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FAF6407EE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D4E151A2B08
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9DBEC60728;
 Tue,  3 Feb 2026 22:10:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2D26119A8888; Tue,  3 Feb 2026 23:10:16 +0100 (CET)
Date: Tue, 3 Feb 2026 23:10:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYJw2tcO9_Rmx8OM@windsurf>
References: <20260103094508.1212757-1-bernd@kuhls.net>
 <20260103094508.1212757-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260103094508.1212757-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770156616; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=DxEQBzdmcueVLeTxmVQ2xv8JB5ZLn4/HRCL/BGxfrjw=;
 b=Q7rh+SGwrdt6r1gJ2m2iWGtOgQmirboBxjnINHV+SZTdOc+KyDvDuTz5QjjsDEfy0FtRcZ
 SnYGN7R26mpURgBXm3+wXRCgSGiqViGj1BRWrSt6vbtR6CGppRYwtEzNm59YP5jItlWJCe
 7hSZPZfHukpXRqHwDdpEAtQmpZsAWWIW3OpNDf3X4IJoN2L/kf2GqLDdItabHN7JEjWOq+
 UThpeCmOBS/V8Ar7LBKwP5weTHiiJbJwVL9uOEnS1lyMHzuIUjcoA4Fab24O+Z3AEfLANI
 OF0/2feXD2qnpzrJlCgwxmAWzCljajl8Jgs16tYRSklqfDOg6SV0VcaNkPebRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Q7rh+SGw
Subject: Re: [Buildroot] [PATCH 3/3] package/spandsp: bump version
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

Hello Bernd,

On Sat, Jan 03, 2026 at 10:45:08AM +0100, Bernd Kuhls wrote:
> Removed patch which is included in this release.
> 
> Switched to github helper to download the current git tree instead of
> using outdated tarball snapshots.
> 
> The currently used tarball contains the git tree as of 2020-08-14:
> https://github.com/freeswitch/spandsp/commit/6ec23e5a7e411a22d59e5678d12c4d2942c4a4b6
> 
> The newest tarball provided by upstream
> https://files.freeswitch.org/downloads/libs/spandsp-3.0.0-0d2e6ac65e.tar.gz
> contains the git tree as of 2023-06-16:
> https://github.com/freeswitch/spandsp/tree/0d2e6ac65e0e8f53d652665a743015a88bf048d4
> 
> and lacks the fix for gcc-14.x added to buildroot in patch 0002.
> 
> Build-tested using this defconfig:
> 
> BR2_x86_64=y
> BR2_x86_corei7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_INIT_NONE=y
> BR2_PACKAGE_BLUEZ_ALSA=y
> BR2_PACKAGE_FREESWITCH=y
> BR2_PACKAGE_WIRESHARK=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Unfortunately, this patch seems to break the build for me:

In file included from ../src/make_v34_probe_signals.c:28:
../src/spandsp.h:48:10: fatal error: tiffio.h: No such file or directory
   48 | #include <tiffio.h>
      |          ^~~~~~~~~~
compilation terminated.

Reproduced with:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SPANDSP=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
