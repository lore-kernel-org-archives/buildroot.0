Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800A3CCF2DD
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 18:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F926406FA;
	Mon, 19 Jan 2026 18:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ztiR3_OC1nH; Mon, 19 Jan 2026 18:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4265640D8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768849078;
	bh=/cH6LOEqga+ED8vaSGoH1i8f8WKQTdw1opgqDfDzmdo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qndW+3AUtiUWeMVpq6in4DMeoPPm9CcHyKEYFJ5a8G77IY4vDoGH4nQKAKTQkn4A7
	 19gOxHsRYR+4MZc4+3eFiQ5mw2r9uTSyhQNQ49s6PgXfX9odQHwQ/52xFHq3mXZLp1
	 hzFe2J1cOLaW/Aavi8oyLu3OKcE8+nAH7RSTwfxu6xSGBubqO0raIg/9g9gBvUSlTk
	 lWSOEq5fyRxn3S1MqQaQ4/hrPb69JzU7bVvPJ6V+h4VJTH37+nKaoDYYNSzqNQlH3z
	 tqMCvhYCd44M0zwte9SS5hjrGeONqjaUCN00vKmE6NTdLwZ+tVGEGeG13smIioCbTz
	 a+esaMxkB7YjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4265640D8D;
	Mon, 19 Jan 2026 18:57:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 180ED2A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 18:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0685F40D8D
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 18:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdP6IFoP_kXP for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 18:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF604406FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF604406FA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF604406FA
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 18:57:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id ECE4419F72F;
 Mon, 19 Jan 2026 19:57:51 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 19 Jan 2026 19:57:47 +0100
Message-ID: <20260119185747.712783-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768849073;
 bh=sjMB8bkK2LIKxSb5M8A2V0iwObfcW4DJX/Xux6ciGOA=;
 h=From:To:Cc:Subject:Date:From;
 b=uYy6BN/WGpQON48uMaF3uqevEqV8Wjd8zaUcA1jb9YAVxm1frh4AGqeClo1Q1M0IB
 yfXoPUXjdiUxTTlnrx5QcM7T1Pi1fZyKNo/hUWxMAAzTCxIvea3CM7mFU1JypudYdV
 5PGlZHmeYvxthjgI1WgkKWvllEJ+sLJCIZ1IvUAzhOyLZTOmt5DVy8k+22urgOMVsI
 jZ1LvQJJvj871s4WovKTxkxDLfPF7m1BFfFa4AHDzG0m1Wm6NvlsgFHMSAbw/b8DdL
 1YfwIKBvZIvN4J7K/pIf4/ZUebE1iuq/mZtJCvhqWO5fRKGeqYbwpdibXZpxD5Drl+
 F0tBt20EtTeKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uYy6BN/W
Subject: [Buildroot] [PATCH 1/1] package/acpica: bump to version 20251212
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 20250807, see:
https://github.com/acpica/acpica/releases/tag/20251212

Upstream changed the source archive from a github user attachement
to a release asset. This commit updates ACPICA_SITE accordingly.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12771565841
---
 package/acpica/acpica.hash | 2 +-
 package/acpica/acpica.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index e88107e9c7..75a3fcbd90 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  eaca4c0248db872a055ab38b0deab4f5f577d1a0cada0fcbc0d80955e2a98e33  acpica-unix-20250807.tar.gz
+sha256  486423245f8154dd0bb5ada9ae057d670210dcbbc4386e62aeccdf5bfdad5f19  acpica-unix-20251212.tar.gz
 sha256  dbfa87ff77586ffd8da1185981a9695e80db09b114b3b00c194a9bcc2292a95e  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index e236a81ed0..cab0693ef5 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20250807
+ACPICA_VERSION = 20251212
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://github.com/user-attachments/files/21674610
+ACPICA_SITE = https://github.com/acpica/acpica/releases/download/$(ACPICA_VERSION)
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
