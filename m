Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BEACD98E4
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 06:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D427808BB;
	Sat, 20 Jun 2026 06:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWcyujbmEzqS; Sat, 20 Jun 2026 06:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B11F6860B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781936745;
	bh=LuhfAS8FE5OQcL4atV6YXkqtD9GOx4Mpsaq6Z8bvAjY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dv2ylesK5i+en20SNQeQG3ycOp2Q55YbjOPzmaRZETVwSZORJvtbA3q5zt5WLhKqr
	 wNw1rBPIBdWjwb02VapEMrsMylbIjDLnfvC+oB9bztvKBy1r+yY9wPFWNw4g+cdNdY
	 Fl9LFTHtMqB+z1HU1YHC6PiUH3xSwoLUyA5y2bss7SFVLxabGWs4/2lu7WVbeZGv3A
	 rzsaAWp9fBt79I4wmxd81aAH1vvLRY4kkq8dOMoVwTMXszvroD3NEwfmsByAXBccmZ
	 QfHk/g3lpts0tFL6+vUJ1Pm/JLyuN6OPJmQUoQU3QwOD3o79cdFIzmqHuFsfTcc+qE
	 g2y9Rrel3O0Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B11F6860B8;
	Sat, 20 Jun 2026 06:25:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D952367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 06:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F676860B9
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 06:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5s2MXLo7Dgkr for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 06:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67EC7860B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67EC7860B7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67EC7860B7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 06:25:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D395A4C00D7;
 Sat, 20 Jun 2026 08:25:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35692)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wap99-000000006SN-3l6P;
 Sat, 20 Jun 2026 06:25:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Date: Sat, 20 Jun 2026 08:25:39 +0200
Message-ID: <20260620062539.28289-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781936740;
 bh=KoWiCf3hhWmLP15tWnBMrecIFBB8AxQ053r9HAjdfzs=;
 h=From:To:Cc:Subject:Date:From;
 b=fzqfRegg4vL3zHNfAOIm2TmROnE0koAlC9k63jxcpkz/G4zkNakq9QUwMPBppRQK0
 sIh6J/mpnC9svoB4HZxkT8/L2gU3VRoDdnSn7jopCV6rQsUjRCWhKeHDONbEcjtihQ
 WhMMW9gwvPyX3M7kL8cs69jHat3fDnqzFXwsr43Rj9pL2iU5rIzAxGg2LtPQY/qNkF
 g5jfqCCs/YZLepH7vTk1uIGVV1Av1nHwhM58BHr5gD8QqaE+btqXXSj4b06ZkHq3kb
 lbmG0nED/unALACdj2C03+WJEZhggFOvatsZYwQZlH33RxdJcv/R+r+1Pu4KK4h8At
 6Mntl5bNlJm3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fzqfRegg
Subject: [Buildroot] [PATCH 1/1] package/emlog: annotate more misclassified
 CVEs
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/21de893608162adf032f0fda309e91bab2d5654c

 package/emlog/emlog.mk | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
index 7d63916ab2..ca29643c62 100644
--- a/package/emlog/emlog.mk
+++ b/package/emlog/emlog.mk
@@ -9,9 +9,18 @@ EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
 EMLOG_LICENSE = GPL-2.0
 EMLOG_LICENSE_FILES = COPYING
 
-# CVE-2019-16868 and CVE-2019-17073 are misclassified (by our CVE tracker) as
-# affecting emlog, while in fact it affects http://www.emlog.net.
-EMLOG_IGNORE_CVES += CVE-2019-16868 CVE-2019-17073
+# Add CVEs misclassified (by our CVE tracker) as affecting emlog,
+# while in fact it affects http://www.emlog.net.
+EMLOG_IGNORE_CVES += CVE-2019-16868 CVE-2019-17073 CVE-2021-44584 \
+	CVE-2022-1526 CVE-2022-3968 CVE-2023-43291 CVE-2024-12841 \
+	CVE-2024-12842 CVE-2024-12843 CVE-2024-12844 CVE-2024-12845 \
+	CVE-2024-12846 CVE-2024-46540 CVE-2024-50655 CVE-2025-30372 \
+	CVE-2025-47784 CVE-2025-47785 CVE-2025-47787 CVE-2025-53923 \
+	CVE-2025-53924 CVE-2025-53925 CVE-2025-53926 CVE-2025-5886 \
+	CVE-2025-61597 CVE-2025-61599 CVE-2025-61769 CVE-2025-61930 \
+	CVE-2025-9296 CVE-2026-21433 CVE-2026-22799 CVE-2026-31954 \
+	CVE-2026-34228 CVE-2026-34229 CVE-2026-34607 CVE-2026-34787 \
+	CVE-2026-34788
 
 define EMLOG_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) nbcat
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
