Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11A7FF8864
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB1DA40C96;
	Fri,  1 May 2026 06:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqPgaTLg_j9A; Fri,  1 May 2026 06:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED26D40BA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616699;
	bh=8p/AnVab3K/lz5SMzT8SRGhrTgXh5MUpWiX4ZRRhLZ8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dc+idd7pOSWpH9v/052zAxUL4Lw8f6Lyf8zbPU9a0fB+1W6Hc2VasoZXo5oQeHZVI
	 HAZrduKAmQm7/HThywqG5en/sNwVHoL2B5AEPeSzHQkjSXcdrWFpHcj0WQoci8ynLs
	 FFaEbuMsl6RXu1HmQwO7syUTmF18xYbSrBMxmkkNlKF8E/YZ33ocLmPOiJbSYOQ2lD
	 62OZJcn9wSs44eXy/u8YkYmmIhYwxOkYupgnAl7ynBgl4U6gFI6ANc2R8/tZ2a2qMs
	 2SBlkJhjIKrkStTXG+VVKMJXcJSr2phIU+SJM+zVLzdrFr9HphKvXvIfP+bAHpGWfI
	 ZiecoIW8zZEwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED26D40BA1;
	Fri,  1 May 2026 06:24:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF396204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5F7040AE3
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ab_s-zZPk11s for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A598E405C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A598E405C0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A598E405C0
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B07DA4C2BB7;
 Fri,  1 May 2026 08:23:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHQ-000000007tD-3t5l;
 Fri, 01 May 2026 06:23:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:22:57 +0200
Message-ID: <20260501062316.1942112-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616607;
 bh=5Yl3yZsESPnL3JlF2q0RAPsyuUABPtsLNyCeNyRtcYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iu+xByNtAIsTSkfI+RLM5mnKmAtGneXIybUCnXzIhw4Qy6E+K95nvNF60VSnSInIV
 vczH1jBkNifBvVXlZ+mlPy94oLaJ6q6NcF6tnb+RcZnjfSsUSLMQF28TW9SCg0Viv8
 8y1IKj1HwToc1Ub0ihmh1QuG0pQm4kCtirx7cAZiiFKIJW7FnFTuuPEGeUC1H9IS8F
 6JCBkj+YH2dy3Fo0Sf7juctZMG0drs2IEEMaeknH0+PvmtH+X7FZDjJkLLC+VkePEQ
 PRJ7ZIFD2Fs2WqKHKRM037+YzIKxo/oYIgGnZ8e1B/LausHBTKHH3klYpGLB1nZk90
 Lg4isLIJgyBdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iu+xByNt
Subject: [Buildroot] [PATCH v3 04/21] package/dump1090: disable -Werror
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error with gcc 16.x:

interactive.c: In function 'interactiveShowData':
interactive.c:334:49: error: '%5d' directive output may be truncated
 writing between 5 and 11 bytes into a region of size 7
 [-Werror=format-truncation=]
  334 |                 snprintf(strFl, sizeof(strFl), "%5d ", convert_altitude(modeC * 100));
      |                                                 ^~~

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dump1090/dump1090.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 1ecdfca47f..9a18c356cc 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -11,6 +11,11 @@ DUMP1090_LICENSE_FILES = LICENSE
 DUMP1090_DEPENDENCIES = host-pkgconf ncurses
 DUMP1090_MAKE_OPTS = BLADERF=no CPUFEATURES=no LIMESDR=no
 
+define DUMP1090_NO_WERROR
+	$(SED) 's/-Werror//' $(@D)/Makefile
+endef
+DUMP1090_POST_PATCH_HOOKS += DUMP1090_NO_WERROR
+
 ifeq ($(BR2_PACKAGE_HACKRF),y)
 DUMP1090_DEPENDENCIES += hackrf
 DUMP1090_MAKE_OPTS += HACKRF=yes
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
