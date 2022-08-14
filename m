Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A982C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC76F40A7A;
	Sun, 14 Aug 2022 19:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC76F40A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKACaQM3N_CO; Sun, 14 Aug 2022 19:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CF96409FF;
	Sun, 14 Aug 2022 19:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CF96409FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5705B1BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EF9683F08
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EF9683F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PqoPKeYsdYIs for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD5FF83EDE
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD5FF83EDE
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:21:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso5130709wmc.0
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 12:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=zWJh3/Hd3uIik3W2221WTEynWcri/lv5M6s40gLN8Ww=;
 b=TxxxAj26gdQJTxP6/yqhRP3qaU8lb2tHXfa0pYKdc7JEZkOJDnd1tEk7HGiszPtG6F
 9YtPf6sHz4VORKqktQ0W7QRDpRXXCbAjQx681B1gj+7sSQDtlT3sm9A2pBPTA/DwhRRp
 NHAkpVhI+ndXSObAntqDQpscPThHwJV7PbgCdZDewXX9rq2RndEKtA6oLAAHecf+Z374
 FtvUIapyRyWKlxJ5HZ+glQvQPDsGGGGoEP39Lic9U0AVRfBbdMGbZq9pcRwhQA+J8Sah
 2plvtQhc6s8Ue/ktsgRZ8yLBo0GdobNAmBmIX8i0nHIGkBgEsfFICnL1YwUAOn6Sccig
 Cpng==
X-Gm-Message-State: ACgBeo3i8/VflXduHUHww5cjMxx57AyuL3m3zzQQvhS9xdqP2SkaQS9n
 rzhS6rWx2c6qRboLEyiJ1cjSAVo3vv4=
X-Google-Smtp-Source: AA6agR45hTBvvXly3DR7/NycBIE3zZBIAKaGqzdcrtOQ41i6iCggo2vnTOCArred/WHbx8DU5UFDqw==
X-Received: by 2002:a05:600c:500d:b0:3a5:53a9:c8b with SMTP id
 n13-20020a05600c500d00b003a553a90c8bmr7979222wmr.48.1660504885807; 
 Sun, 14 Aug 2022 12:21:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0046aa77f88f4c2228.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:46aa:77f8:8f4c:2228])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b002216d3aee78sm5143625wro.86.2022.08.14.12.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 12:21:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:21:22 +0200
Message-Id: <20220814192122.3189556-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=zWJh3/Hd3uIik3W2221WTEynWcri/lv5M6s40gLN8Ww=;
 b=cHf2Gww339IaqzuoehV335LrDrplkc/jP4IWhMHCEunYIbjnfvON9oEDpEe2yPAmQi
 ILNSruzHwgR1NrLMMth06bBCiTmKKGmmGU7JvB7wneAF+WE5z/cWLwbKOdvXWvzR7Ch2
 +XbwopG1zUAFBYmNBBMJCQ4TT7+G+iazTUHMXuDavLakNCN0tNcJIGTlhcFwBH9PY3xB
 jROPHM/aC9e0qUw6CLnzUZ51hgGIFWRHcxPKh1l4jeMAN1TzBQDGtQvZhv5QpoA193ji
 I6wfO3VyIvL6rgHsPra6lpijE6Do+TFLQ/PHjiO0ZwO+6rOGGx0fD7RKloszDQoaercM
 krFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cHf2Gww3
Subject: [Buildroot] [PATCH 1/1] package/python-txdbus: drop comment
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d forgot to drop comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-txdbus/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-txdbus/Config.in b/package/python-txdbus/Config.in
index f3ea4c78d6..e299596611 100644
--- a/package/python-txdbus/Config.in
+++ b/package/python-txdbus/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_TXDBUS
 	bool "python-txdbus"
 	# python-twisted -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	# python-twisted -> python-cryptography
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
