Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBE5C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8486F40535;
	Sun,  4 Jan 2026 14:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsbZA3AyvNh9; Sun,  4 Jan 2026 14:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B878B40522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767537191;
	bh=/nS91wqMJKKSNXFM2uC4CxCjKiTrfRNEAIaByibmo/Q=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Y1A9Ga5VFVxjeM4laWqrCd54T0hcj1MqkvZNpF1XYE1Z3KO2z8zvYb9jwPgVVDoor
	 +TzjPzeXNdQrWtMHDBRvc6bZoJnjwwfEhN+t0hrWdJfyez3VPiHPQsur9LIKQUMazp
	 CPe+pQLk+VFG5ImpHXRm4x7s+8KH9O13bTzy7YuN0FZdbfnxsvbi5NytQmo3cRDAR1
	 HqtVv8h+V7+cwTTAKMSKSosrCj7mKcpxazi1Hosp7erLRtBJZE+bOodb+odWc1QakI
	 jtNHkOfX6eUrd/CQbjY/ausbJjiXcxKm3EStUVBx+c2YQq8nvIdV2R1KV9xue1iK7p
	 P6XjfBHIX4T0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B878B40522;
	Sun,  4 Jan 2026 14:33:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E28912DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4EDC4019A
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHy3H8rYqUjp for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 695894013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 695894013F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 695894013F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:33:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.121.67]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1vx2cG1Bmx-011rd0; Sun, 04
 Jan 2026 15:32:59 +0100
To: buildroot@buildroot.org
Date: Sun,  4 Jan 2026 15:32:40 +0100
Message-ID: <20260104143240.4126891-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260104143240.4126891-1-fiona.klute@gmx.de>
References: <20260104143240.4126891-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YeBrzOUzuKOx53uKQ7PLcB1Wc3EM6UahTe0uhhT3U+lVVogJ9ZQ
 0A+XkjFA5M+y/4m7uGO0kYjBCsf8t2JoE1NYCutmpzCNKwf/LA1L/VvR0f1vp3zpFsjOzJy
 4G9Xolfu+j05x7yRax56gwYrF2b2PTs5ikGgS2Y7Utj8uCSVw4yfP3I7MMaN8NEfM2YCSJT
 UQIXizqWYUA7pWDUGhxEw==
UI-OutboundReport: notjunk:1;M01:P0:MtuXKIfwqFM=;ocVv4NpAnCtPm8zt7uyqqwprR0c
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767537179; x=1768141979; i=fiona.klute@gmx.de;
 bh=tvyKd3FTYuhwUwOcFZrxCcUQej7+pAj39H8ar5at+u4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HLJ/0UT+nBW8IVGkQ6o1JM76ak7R9baCTaoRV5bQ4JQUzwERD4d1uvvY8pj3A16w
 PPEd5OMTicQ0bHsueMnpVKVxypE7CTk8+m0mO7MWB65ydQ/54fNrUkegbD0bwybKf
 1Afxy8s69FgNh3d6WEfomN7yW81Og6MPDtxDVLqjHUDJMM9Ojx2a/043bojiVWSYJ
 2uw1Aek2Ts2znUpNqn9X1zD7gtBt0UcUnD8AsVxM00yBzealD5W2NXrmzou8HPQ7c
 aYn5bLYg3O6ilNAzkqIWkfYxbyvAYtVuVtq7UFZ2XayR2sheN1Ly13KwJmwKbfHwi
 YLOds/OM9hR50m6HOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=HLJ/0UT+
Subject: [Buildroot] [PATCH 2/2] package/python-memray: require toolchain
 with C++ support
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During the build Cython creates C++ source that needs to be
compiled. The missing dependency did not show in the existing runtime
test because the Bootlin stable toolchains include C++ support.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-memray/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
index afd0adc901..75f13e8597 100644
--- a/package/python-memray/Config.in
+++ b/package/python-memray/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # elfutils/libdebuginfod
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
 	select BR2_PACKAGE_LIBUNWIND
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
