Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E27FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 09:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F2AF8432E;
	Wed, 29 Apr 2026 09:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOJULCRHDB7Y; Wed, 29 Apr 2026 09:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E938432A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777454633;
	bh=1UqVOmAVmytzA/CMvSPTrR/uHtkfCTux3TOCr2EPkRA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IgVP5a20KSgFUOg0uYxKXmOmnWQlwRDzEleSvXMJxyaM1ts4V4Pd+W1KL98oakgev
	 1yxp7fyJBY9FLjfhJTv7pnYcl/+4b37jf5gLmvGdbbCc9FoskJJp1LJDtFg0KPwo+w
	 E8P+t4yJHzv5xtVJNJhRKDP+8d6A/d8JISGw2NhGtdDDYFMBAVJ4eNHvPzuuriJQ/2
	 jNcCnh6JLG7ukKixuQa8flnPMhlehELvkJb2LCemMFx+t7KnYN1wboDtWJY1wG4Uuk
	 AD3AsEEhmw/3TbBcGbObXIEMed+6/NUCWxyvreOVb6ZEvOwHnpd/HjzqetEQRFK1eP
	 /OMJ1a2kQAV+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E938432A;
	Wed, 29 Apr 2026 09:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8061B273
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F588432A
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucNUTskncQ7H for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 09:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org;
 envelope-from=mwalle@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 513BE84327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 513BE84327
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 513BE84327
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:23:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8592F60018;
 Wed, 29 Apr 2026 09:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2198AC2BCB3;
 Wed, 29 Apr 2026 09:23:47 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Michael Walle <mwalle@kernel.org>
Date: Wed, 29 Apr 2026 11:23:38 +0200
Message-ID: <20260429092343.979523-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1777454629;
 bh=AYcG972LzvQJ8wHe1RUD20P/Hr3HpndvK7Fj1/cAOF8=;
 h=From:To:Cc:Subject:Date:From;
 b=ii79+PShUjXkP/09KMlJPBVZhYAenzbl/SkOAuT7zmecSQE8FoCk5KjCzVlVr7e1I
 EVuUibpqKALi4FuCsNvvN887sXE7d5NlCoHP+uD2rEcs/gQdS4uRYl19dRSN+lxwPm
 JJFPTOJICYfcAPYK/6d0jyCoUnrXQJ2YgJaqpQ9XSNQC5AdsiIY/adlbw06/MzQv5m
 akVLSsaLcdY4fVvfLPf+ej7PRC3SvDvA3UlQReDvl2D0mg5icqy44TiU0PPQ9E1LUd
 wNFfDF+biYnqW2OORsLv7DDp//jb5BhtvDD8SEyYroA5jUbReY+162rhkmhI5xEe7i
 bAeiIWXLV6MTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ii79+PSh
Subject: [Buildroot] [PATCH 1/2] configs/kontron_smarc_sal28: switch to
 external Bootlin toolchain
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the precompiled stable toolchain from Bootlin.

Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 configs/kontron_smarc_sal28_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 181a92daab..09d3142589 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,6 +1,9 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
