Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1C9C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 09:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D4BE40339;
	Sun, 11 Feb 2024 09:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5RXlKrytwWiR; Sun, 11 Feb 2024 09:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4429B40606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4429B40606;
	Sun, 11 Feb 2024 09:39:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C57001BF3C6
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C051060826
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgcWGPmXK_rZ for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 09:39:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6B7360815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B7360815
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6B7360815
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 09:39:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4101fc00832so19257495e9.3
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 01:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707644341; x=1708249141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+O0ETwIt+xdJtzAagUoj+xjkhnXPLUodIlB5L6OiMd8=;
 b=hb2hCyE9WfTRW116/OBesXM4s2ej30x5jdOmOTJoDZKS0JoIwH6xYYw8ahpXCpWZg5
 9wSB8DQ2fUiL1ny9qvPlJK7boUiM1Jh4UxA5/RBWXO7wQvGBiyeaJvH71XYD31/15Rnc
 f8qKOOMWglOux8+NMjraYt1Ly5yTtTi5BHRmDbNXJstz6IRZEVRAr621QgziZwGSlQ+Q
 HU+eQZQXJD7Ff9smGviCtiXJcD5vKjo6qq6tpzJrvkfOnRXz2aWZpQj+VoW+L+x2aNl1
 payIMy5erFn+j0MMbtiyw3D9PWktQRJwhuT03pcWeNcHu40XNiy1A9H2nyS84thswCss
 8jIg==
X-Gm-Message-State: AOJu0YwiCeuPv9xnUX9bv3F/EW4YJsYvZmu53krhj0ZPlVy3MdF4ff8v
 Z7td2xcquc9gm95zd6EDbtyiuChnCDjJPL8yS6LUNR2+A8m8ieKK0/yncktcLEY=
X-Google-Smtp-Source: AGHT+IGir94SIbOEYd6fS5APcnaDdmDIObO2Ob8FnV4kF2FYSpqZhKHDsxPEtaG10Wcav8tOrK2kAw==
X-Received: by 2002:a05:600c:35cf:b0:40e:cdff:8d10 with SMTP id
 r15-20020a05600c35cf00b0040ecdff8d10mr3999557wmq.6.1707644341081; 
 Sun, 11 Feb 2024 01:39:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGEj0mTi/b78hz9AGvjkH11MO4g5YTcsmHNdCyGbLqfepBZmhQy2BUGnFh3b44AFIxjrZyZXypuwUDQZQOLHcBpLtt4XzV1xaFrA==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fb11-20020a05600c520b00b004109088e59csm3575312wmb.31.2024.02.11.01.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 01:39:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 10:38:58 +0100
Message-ID: <20240211093858.14022-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707644341; x=1708249141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+O0ETwIt+xdJtzAagUoj+xjkhnXPLUodIlB5L6OiMd8=;
 b=GTpltzhSjkG/mp4etFG3p9wzjo0j/h5eGxGOjIEgPGq1C6YC50NXcCWaFztFbcOPLu
 Wj9zSHhiLVqg/3deUGhzhLzq8I/gtX5i6ihyZAQlq4FxaAWLU8WpHB4xy3WPowsyJFpY
 ofWwqMTuX+SuTwxgziMPf19Q9ISrpt4D3It675NiN1ufbQsAWvPyS+yus0k7zCoSMlVO
 OaoBbfST4RJPtDZ+CNh1mRkrM86JDMottof+yY9IH3bp5enJvI44TtExFY1KtUAd8Ezm
 ttfHa4A6DTfaLxbGaVQbRtYjW0/s6mDXGR3SKv3ouLZVXJUhkzDgsDUS9m7Tt0wfNeiq
 Qkjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GTpltzhS
Subject: [Buildroot] [PATCH 1/1] package/minisign: needs threads
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
 Patrick Oppenlander <patrick.oppenlander@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit d90ac63d9b3448a239bb9aa8030326699a3fdc3d:
  Could NOT find Threads (missing: Threads_FOUND)

Fixes:
 - http://autobuild.buildroot.org/results/8d63a88291de945661a936d2437917a3428de276

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minisign/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/minisign/Config.in b/package/minisign/Config.in
index b852903921..a211177925 100644
--- a/package/minisign/Config.in
+++ b/package/minisign/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MINISIGN
 	bool "minisign"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_LIBSODIUM_FULL
 	help
@@ -7,3 +8,6 @@ config BR2_PACKAGE_MINISIGN
 	  signatures.
 
 	  https://github.com/jedisct1/minisign
+
+comment "minisign needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
