Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BE7FED9E8
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 16:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E611614E7;
	Tue, 17 Mar 2026 16:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3B_AxBiw0cG; Tue, 17 Mar 2026 16:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79627614EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773764592;
	bh=jMrhsFWr42Z2dMqrZ7pJgs9xviWBqh0PS/s5RSa66gY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N8YX9aJzgQMMaqU2HTKHZlNn24HgEwqr5C3IaGvDYlakb3E8SgOrvhCHWG0it50Pi
	 vRuukYJwk6SCG9CZHX88kjq0SwLCwOe9XRB1yLmzp4308+E66nvFH0/hqvqib1/9kR
	 TOPjG9GETaWSr7H4g6BzxQbFw7AxAcsHDFGLPreC0WYJ0kOb1k02wAjPFbZloVc6Dy
	 s4hfR2K1yihBwtthvZPDvl9oiCX/QQCsCxPtTc+pw3J82up+Fl1xRkBs4orKdlGIf0
	 BVG8xfRGv0pUqkWmNuRAlAL7ioX0klkYQ5Ch4GzkC2ggSS6RGQ0y7y0oHVVSlxbTT7
	 6ZirjPv9H0jtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79627614EA;
	Tue, 17 Mar 2026 16:23:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BADBD3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F182F614EA
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkvy0PpHh0W6 for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 16:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5C40614E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C40614E5
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5C40614E5
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:23:07 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 2XCCw2yacclBZ2XCCwU8mf; Tue, 17 Mar 2026 17:23:04 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>
Date: Tue, 17 Mar 2026 17:23:03 +0100
Message-ID: <20260317162303.3077615-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKRbJDBpd1lc696+uhvmp+x0dzkxzLkjdE4SPwn9Ljz4NwULLFznInToGAdyEvOiiZklELT8znffKfMx+ZpliX+MUf7wS9Yfc800nvzNeAhV2PIb3V12
 zdTc8dutWmbWu4f+StrRMcVEDNtRVJYU+oxmC6seDjTltwqheCJEmmGeggZ61sCi/mKrV2he4SRxtI2FtkqXJIeA97HcttswjXu0raTyP8AwGv+Ygt4naoa1
 KTIF9AFa74gVUKDj0zupLmtknnx43dhlGFsmIHnklD19muyIb6KaNM3auAr3rya3oUHJLxWe/g9t4UIOv7ORug==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773764584; bh=Hkq6sQZaTB4PFWUyxTQx+hTOjV7Jd2NiYNpgX6Vm0d0=;
 h=From:To:Subject:Date:MIME-Version;
 b=aNv60TifSc6MWROEkHGTPDnK6U1aPu1s0G88pUjBifaaJ1ebIwQmTEufh3ZrPUfnz
 DwDoHMDlnasZYd9Week3IZ/l5dD7jkk85pbevHHwiEWqErXF0jQ+Y5RTpbcfy93yFo
 zbcU89/aLa0fH+sYjujxDZMVlEvbL5/r7cZUkW9+W0GEul9ivMHPjkB//gaia9BJRu
 /BgKhPu1yHu4oT52lmr0jUhEozZHwdrS1450J4do56OgINAyhO9DMxo9g+ZzVd/S9V
 C9lmC3sPsExc1RhCyJ99gSZgaKTrDXn8XbVVwqH9VyAUm4f3tiTHmh0DSDsNExtleC
 qyB8dgzyCvPsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aNv60Tif
Subject: [Buildroot] [PATCH] configs/imxrt1050-evk_defconfig: bump u-boot to
 fix the build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python setuptools has removed the obsolete pkg_resources python module in
v82.0.0. This module is used by the binman command in U-Boot until
v2025.10.
Since the python-setuptools package has been updated to v82.0.0 in
Buildroot, the iot-gate-imx8_ebbr_defconfig (using U-Boot v2025.07 and
binman) fails to build with the following error [1]:

  ModuleNotFoundError: No module named 'pkg_resources'

Update the defconfig to use a more recent U-Boot v2026.01, to fix the
build.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922027

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/freescale/imxrt1050evk/patches/linux/linux.hash | 2 +-
 board/freescale/imxrt1050evk/patches/uboot/uboot.hash | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/imxrt1050evk/patches/linux/linux.hash b/board/freescale/imxrt1050evk/patches/linux/linux.hash
index 216d9b9d39..020dc72386 100644
--- a/board/freescale/imxrt1050evk/patches/linux/linux.hash
+++ b/board/freescale/imxrt1050evk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
index 440526977b..b6a925ea4e 100644
--- a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
+++ b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
