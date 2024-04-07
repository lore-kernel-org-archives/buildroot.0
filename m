Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CC9CD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 18:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E145600B5;
	Sun,  7 Apr 2024 18:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTDSFcnGd4CY; Sun,  7 Apr 2024 18:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74F3F605C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74F3F605C1;
	Sun,  7 Apr 2024 18:49:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5FED1BF293
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 18:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B230B40330
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 18:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vL99tjfagxGO for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 18:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59E834032D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59E834032D
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59E834032D
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 18:49:15 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d476d7972aso49260661fa.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 11:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712515752; x=1713120552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5aeUX4qgY+YHpZyqkvPXFA5W/W90c2ZMg/whFUOdZW4=;
 b=GN3yoMvt2zkeeW3e3u3sWv4cJV+8FeSqRsHeGFkcj+LC4GtPRT3GF+vrUQbaoeIfU3
 gQLY3ygOp1Gk/BPAA9vkZmj8YLqrnVVyaIJK34H72m2SfwIvoD2WIyIzp2RGWdMgf0A9
 LJMgCQrmiPKOLZ+4wEX3lvDp6eBDvUBt+jCUqdj7bkZt1agLRVSOjwB+sZWIbfTXkb7l
 KQeTAUGSqxMPofbkM/rEBjwyxHnNtYNSaC0Yx3RkpXTp43Ay0bQmIVEGykRZxoCmgR4b
 ZvselPjwa8yqBHUw4jZjely0tmG+O+aiGs9prI3lO46cm9hoRKMNyegPw0oqtB1uJkuO
 WjVw==
X-Gm-Message-State: AOJu0YwfYp9tBR6Sz/4HMA2vl4LO4LlY6/d+MFvxST2ZUGYYiWlkG8pJ
 S2CDXM/lwjL55p2dDhsHnE9feS2PXWycWcy28VLG8IwRhN/A3aphiC18aeB0
X-Google-Smtp-Source: AGHT+IF+6ZLqKGucSSl5rFlENpdfp1n6LipgRroXR4PcufhFY3KFB+pGJamdOG26/q256WSlivDjZg==
X-Received: by 2002:a2e:7d17:0:b0:2d8:3e07:5651 with SMTP id
 y23-20020a2e7d17000000b002d83e075651mr5370267ljc.34.1712515751921; 
 Sun, 07 Apr 2024 11:49:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay4-20020a05600c1e0400b0041646c5fc21sm4737936wmb.42.2024.04.07.11.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 11:49:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 20:49:07 +0200
Message-ID: <20240407184907.3245610-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712515752; x=1713120552; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5aeUX4qgY+YHpZyqkvPXFA5W/W90c2ZMg/whFUOdZW4=;
 b=XTKC93Fxgc0m0CmXw1l2Id071p62Bq3eYM/rEVOEgMmJMfE9sIoHoafBQG6hZb8yOQ
 a81DiKy83QnR4fRbK4AIJC5Mbjd0jw5f2FDI+oTe8IxsR3wuVCGYfCxkMahEm5L7nUn4
 4X/+13OlXENf9v6ityxYNcdLpY1O4k1eYrj2nxrUrf+HzfIuOp5UrX8gEVNdHXEy4Ua6
 khHWd31dGZ4CKkyaJOWtGQYmXzV8qDZXFucHKwJN8LMgQZW5bG11W6UtD8kgDaw6dIUQ
 KjjtWjbD+TlR/DR4coCFrj9YckVG6IEdJrhnog8+57fdASK1GqsdBCxtJ7btIW1hDGyA
 p/DA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XTKC93Fx
Subject: [Buildroot] [PATCH 1/1] package/oprofile: drop unrecognized option
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

--enable-gui is unrecognized since bump to version 1.0.0 in commit
7f7dc71cc8545dacf23f9a25f33c184d15bed65c and
https://github.com/wcohen/oprofile/commit/0c142c3a096d3e9ec42cc9b0ddad994fea60d135:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --enable-gui

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oprofile/oprofile.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 265d6ebd18..512fbf9ea1 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -11,7 +11,6 @@ OPROFILE_LICENSE_FILES = COPYING
 OPROFILE_CPE_ID_VENDOR = maynard_johnson
 OPROFILE_CONF_OPTS = \
 	--disable-account-check \
-	--enable-gui=no \
 	--with-kernel=$(STAGING_DIR)/usr
 
 OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
