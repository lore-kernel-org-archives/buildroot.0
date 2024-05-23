Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B4CC25B75
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 17:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBEC182381;
	Thu, 23 May 2024 17:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPDZLXjJdYPt; Thu, 23 May 2024 17:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD89F82382
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD89F82382;
	Thu, 23 May 2024 17:00:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 290381CE650
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 17:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 143FA4084D
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 17:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DUgIlq_RlHJ for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 17:00:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 866C640855
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 866C640855
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 866C640855
 for <buildroot@buildroot.org>; Thu, 23 May 2024 17:00:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-354b7d76c52so1711488f8f.3
 for <buildroot@buildroot.org>; Thu, 23 May 2024 10:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716483609; x=1717088409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RIRBkYiSN36St0+h037LfVHYyk+SkkEY0+jc6k7pqEE=;
 b=AiZwxQT2f2sBfskNDv8mCN1Fqq36JMcp68Vd1JoSMuT/T2CjYsgrJ5e5ht7QXjdYAo
 IniV+IrSeZM7UnFVWi7j9lH/ZT31am+YfZ34pyQ/4itme9CJIrP8ezMxAngFeVjjneKj
 Auivwd0VTndXY3tmWSHg1k65z5sbGQ9+evmMa5A7Dz5ISTHGe3dQO07Iwl52pvX2phIc
 Cwme1BcVKf0Vc0k7PPnR5LEFU8XNu4cuaznhdzODQg9+tCNbmtSRdPQLO9i/u9WSfjim
 BlvQQmGaev0OdZE6rGraTTsvQl8GUCtGb7cVo4LHRbPVAEwUz4hcKwwnjFKkUWUTtg4e
 Tavw==
X-Gm-Message-State: AOJu0Yw9az0HLWv+V/6AOyby3CtKxHtcVHU8ufucvjOlTeYdNCU00PZg
 um63jEqj1XpGPB9yRNa5qJYcI53XZb4m0nWS1gDGUEhBIjs1ysQNIV5NmA==
X-Google-Smtp-Source: AGHT+IE4OutDg/1LyWQ/pbJTlOIGGGV4/vHIHymm3mVR+AJ85QFA6N5uBMgoZ98gfCxi55s8YL+ZWQ==
X-Received: by 2002:a5d:5849:0:b0:354:ddb8:b5e3 with SMTP id
 ffacd0b85a97d-354ddb8b709mr5805751f8f.11.1716483608836; 
 Thu, 23 May 2024 10:00:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354f1c78d48sm3507695f8f.14.2024.05.23.10.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 10:00:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 May 2024 19:00:05 +0200
Message-ID: <20240523170006.1488807-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716483609; x=1717088409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RIRBkYiSN36St0+h037LfVHYyk+SkkEY0+jc6k7pqEE=;
 b=FrQALNYVYyseGAoB88T97knN+mulhKR4pBGPkfklkLwyI3GQGNCkWKZGyUDqver1dZ
 4P4Q8isyIFEimSmT6aYdlZ4vvMv6F8AfgI2SGLLQyupbKnH64QOtCuxW+D9IOKMUg62G
 wSpph5XykUy2JirHrFLCeCOtvHXVzORDooGgWRDnRlWzCa7jQ+jT28e/BpBAoJx2L7cJ
 5h+moUg0M6IHCYRqeT/Tj5BJ8us5bajohQ/z8GpHGeL/WAfgOD6xi2aHIZbi5wmbJVYF
 eE/p/Ix8ruYZX6WvRb7kWBM2TOo05UMgaSokDSnt058dqbi8nTCjhl1XtxsyowX+sG6j
 wueA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FrQALNYV
Subject: [Buildroot] [PATCH 1/1] package/atftp: fix build with pcre2 >= 10.43
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of pcre2 to version
10.43 in commit fa9e575776ee3d3d47a31fee3c09a94753c77cc7 and
https://github.com/PCRE2Project/pcre2/commit/014c82d7bcc2873cdb1f3abc5e5348587f477ba4:

tftpd_pcre.c: In function 'tftpd_pcre_open':
tftpd_pcre.c:109:37: error: passing argument 1 of 'pcre2_substring_list_free_8' from incompatible pointer type [-Wincompatible-pointer-types]
  109 |           pcre2_substring_list_free((const PCRE2_UCHAR **)substrlist);
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                     |
      |                                     const PCRE2_UCHAR8 ** {aka const unsigned char **}
In file included from tftpd_pcre.h:24,
                 from tftpd_pcre.c:35:
/home/autobuild/autobuild/instance-10/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/pcre2.h:949:1: note: expected 'PCRE2_UCHAR8 **' {aka 'unsigned char **'} but argument is of type 'const PCRE2_UCHAR8 **' {aka 'const unsigned char **'}
  949 | PCRE2_TYPES_STRUCTURES_AND_FUNCTIONS
      | ^

Fixes: fa9e575776ee3d3d47a31fee3c09a94753c77cc7
 - http://autobuild.buildroot.org/results/46565c834a8162a651944885104027610a65f9c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...pd_pcre.c-fix-build-with-pcre2-10.43.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/atftp/0001-tftpd_pcre.c-fix-build-with-pcre2-10.43.patch

diff --git a/package/atftp/0001-tftpd_pcre.c-fix-build-with-pcre2-10.43.patch b/package/atftp/0001-tftpd_pcre.c-fix-build-with-pcre2-10.43.patch
new file mode 100644
index 0000000000..b5d109730d
--- /dev/null
+++ b/package/atftp/0001-tftpd_pcre.c-fix-build-with-pcre2-10.43.patch
@@ -0,0 +1,45 @@
+From e75d656e1e3465dea1fdf605cb8fe7e25286bdd3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 May 2024 18:29:09 +0200
+Subject: [PATCH] tftpd_pcre.c: fix build with pcre2 >= 10.43
+
+Fix the following build failure raised since pcre2 >= 10.43 and
+https://github.com/PCRE2Project/pcre2/commit/014c82d7bcc2873cdb1f3abc5e5348587f477ba4:
+
+tftpd_pcre.c: In function 'tftpd_pcre_open':
+tftpd_pcre.c:109:37: error: passing argument 1 of 'pcre2_substring_list_free_8' from incompatible pointer type [-Wincompatible-pointer-types]
+  109 |           pcre2_substring_list_free((const PCRE2_UCHAR **)substrlist);
+      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                                     |
+      |                                     const PCRE2_UCHAR8 ** {aka const unsigned char **}
+In file included from tftpd_pcre.h:24,
+                 from tftpd_pcre.c:35:
+/home/autobuild/autobuild/instance-10/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/pcre2.h:949:1: note: expected 'PCRE2_UCHAR8 **' {aka 'unsigned char **'} but argument is of type 'const PCRE2_UCHAR8 **' {aka 'const unsigned char **'}
+  949 | PCRE2_TYPES_STRUCTURES_AND_FUNCTIONS
+      | ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/46565c834a8162a651944885104027610a65f9c3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/madmartin/atftp/pull/1
+---
+ tftpd_pcre.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tftpd_pcre.c b/tftpd_pcre.c
+index 24b2770..7b3d0e3 100644
+--- a/tftpd_pcre.c
++++ b/tftpd_pcre.c
+@@ -106,7 +106,7 @@ tftpd_pcre_self_t *tftpd_pcre_open(char *filename)
+                logger(LOG_DEBUG,"file: %s line: %d substring: %d value: %s",
+                       filename, linecount, subnum, substrlist[subnum]);
+           }
+-          pcre2_substring_list_free((const PCRE2_UCHAR **)substrlist);
++          pcre2_substring_list_free(substrlist);
+ 
+           if (matches != 3)
+           {
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
