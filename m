Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F3DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DCB2405F0;
	Tue, 18 Jan 2022 10:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKhjYAekqIA0; Tue, 18 Jan 2022 10:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 866D1405EC;
	Tue, 18 Jan 2022 10:44:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC641BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C2AA405EC
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ooRc5logzWIU for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:44:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94209400C6
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:44:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lyPna40I; Tue, 18 Jan 2022 11:44:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502679; bh=61LpCDGGEpZMa89hfN2WjdmSk1HbTQqhH3v0VuOpcJU=;
 h=From:To:Subject:Date:MIME-Version;
 b=dgLu4X+IRPLKV/CgrMYcsD7W/RbdiiPsKKqjAjbnIrxV9BtOeVMj0X2U4QEHKPYlT
 OREmBd5DNKNug8ANHNlZ2oCuQDwfjQBbrr9sMjV9NWHdXT9Z8rGFNSQPcezIxIiJtd
 iRkx102B7C1aFfNynwScdFvpNIo8VLDOCRODYb+jWt85H0igqgPzQr2pNqh8/AWYJl
 PSLDAtjuncG+IjQp+FyMH/9OEi7WJaaF0NTnFaNYJHHOPKKV3aWW5LTEoX/YMw5hQ0
 ijbfT5Oj3IxrIot3hlC9hY3aNzVAuxNTJK4EQjETflo+4XaYY1VLrZCKpH1L5W80R5
 QZ8r+IugBa8Pg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:13 +0100
Message-Id: <20220118104338.2081259-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDfU5ctYDkpXaMLK3eGZNHKkYboZ4GJxg3K+j9BIfga8le458MBH9ZteCVyYQxRkGmLTbaYqQx+lNhK6miA7RmaV6CWnmK8T7m3ap4a3h3kJ/Um0WjtX
 6Y2z4b/+xQvibuLJdpQXs/VyA+uWPqGbf7r96JOolUCTUwklal9xwXuzL8/m2Ita00ziX8S+Rj9+U1HMFGzp48EHs9hjc58f3D1bzNZQwqY3S6V1y+17QeZF
 XCPIkxaaEtucuMSiSkBqF+AnN4QMp5HlPL2/Br6EQmvqPj1GPmSSaSqvPXYOnjhUhgQS2NuKza2uCdcKVBiIklWKJ90YukJ4XnSnta43/HN65HseYtS8hNub
 1xqheOwrMDKm6gkK7e5LomLvozwQi+IpQvViU7XLuxuXnIIEZV2zlPkGf5rne+N7uFxSPA0tUtsHLH/9X6wMkaHgRlUunhwweV4CRSJbg78AyYoV8XpVsV4r
 lq68Ry6y175K+/qwNnP2wxASy9Y19aJ5LHqCff4R6GCPZEb3tWw9AX7jWPFZCuh1bypn9BlS0nyDE1t3nCs5r2Mrc0UL6PS+H4eHYf1K4YVgJUFZqsmmsQZj
 WGE9rkyWx1Pi6gxu13/icRwEF2tqq/bZCsrMT1fY3NYAcZ3rGC0wa4U+EtrrcKAQ1NFKGgW10h7OycUZ79afKu9nZgb64opK6JIrWuYiRmcHNKWmd2KHop+k
 MnNkEE7KwfpAg3v6MJlx2xwjdWD91A5qw1gYBE84OpDYAfZ8xLu23ducOLta+MEnKUtG8YKhehynkAyKPwaWuPg40MnypWuw3puQrZknHloaFYqKkdnr+UI9
 0szZxs/j8SbE38HUIxxpuaQQik6ixByUwnNriceiKXB13x8DnRlbcC8YMX6biA==
Subject: [Buildroot] [PATCH 03/28] configs/bananapi_m2_plus_defconfig:
 enable NEON/VFPV4 FPU strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Jan Kraval <jan.kraval@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This boards has Allwinner H3 that supports NEON/VFPV4 FPU strategy, so
let's enable it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/bananapi_m2_plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/bananapi_m2_plus_defconfig b/configs/bananapi_m2_plus_defconfig
index 77a403ce81..9522c0c329 100644
--- a/configs/bananapi_m2_plus_defconfig
+++ b/configs/bananapi_m2_plus_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Plus"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
