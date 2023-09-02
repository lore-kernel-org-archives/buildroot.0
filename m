Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AEACA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E900C40154;
	Sat,  2 Sep 2023 07:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E900C40154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1Ek4QOZwBpf; Sat,  2 Sep 2023 07:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B1AA40297;
	Sat,  2 Sep 2023 07:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B1AA40297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 697BC1BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5049983B0B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5049983B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHyVTYL32MJz for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:09:08 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2564083B05
 for <buildroot@busybox.net>; Sat,  2 Sep 2023 07:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2564083B05
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31c5c06e8bbso2327789f8f.1
 for <buildroot@busybox.net>; Sat, 02 Sep 2023 00:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693638546; x=1694243346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g3MVe3yEOy5aCHN7KhziVhNzwELugYAgpvapPxsArjc=;
 b=UqZZkoI54s9t/0okNoWON8gT2gCzJPn9u7hH63pdscCLb/p/7N4iEcVbeykI3hjAzS
 m64/kZ1CGYiTGgUyKlGJVBFwEMVs6dSGovm2N1H7VGK25MLBEtL30td17x50i8ztoU3V
 JqjDF1AJRzf9+YBsLdAsuAKYnGBR8uN0YESSVpiE9N+JUYJZgikSoTpv8MDHrlMK/dIp
 ptOpbgpZRR/wSLvU8bkMtBnGx7HhbKB9IhTnqV8gcnjmtyYfjIjCgbSJivRx27q7YWvN
 98J2KW9SkVyHk+s5hawZZlikArWbI6Qbjh5vaQj9XpZcEsvzimy9Vaut44jt81KxDJ2L
 67hA==
X-Gm-Message-State: AOJu0Yw8m1JfmN7EgdQhGiZzsYMv2GcdWlL5bAEi+YN47UNDyxXYOsCd
 HWNzArnl6h2b+kkdeTs7q8zdqS/TcgI=
X-Google-Smtp-Source: AGHT+IEA2mFLThpklwvblx8XuLrHDUzY0+S5Pwb2wH5t8vnOBaaiLb7uvNS0IMdmLYoD8XfsA6ih3w==
X-Received: by 2002:adf:e5c7:0:b0:315:adf3:67db with SMTP id
 a7-20020adfe5c7000000b00315adf367dbmr3914085wrn.59.1693638545592; 
 Sat, 02 Sep 2023 00:09:05 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 w2-20020adff9c2000000b00317ddccb0d1sm7462962wrr.24.2023.09.02.00.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Sep 2023 00:09:05 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  2 Sep 2023 09:09:01 +0200
Message-Id: <20230902070901.724634-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693638546; x=1694243346; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g3MVe3yEOy5aCHN7KhziVhNzwELugYAgpvapPxsArjc=;
 b=JWZXEIjk46jypOnbrkuO4jZwVsh5qNH/ZfJlPxxpLwJTmR+JThD6iYkO7oMum4DcV4
 h2cblwYAaHR2KsctE36ZozyfHSNLD3cTeKJScytf5KL/boyVCwmbmCfoKI+l4y+l81cM
 STVx76JKFoTms7g9F1nY8PlqDZQElZEaoV2n7f+GzLknw7aLe7CXiVIbwVcCNk4uatxg
 qDRCQP4XvSiOxwclLV3dwAMpOeFsC0moo095okGmkKpwLcoxhMg9G7ijw0WRetb2qeCH
 jreCgWs7NAINjb5gAlJIFmL0FFJCktW0o3M+iGgq9H4I+nnu5A2dEQY5wTM5Uda7yCLw
 Zf0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JWZXEIjk
Subject: [Buildroot] [PATCH] package/freetype: bump to version 2.13.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index ea03526c9..e7331d5ba 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.1/
-sha1  af9b6b754320a0526179f166e3f8cffce78526ca  freetype-2.13.1.tar.xz
-sha256  ea67e3b019b1104d1667aa274f5dc307d8cbd606b399bc32df308a77f1a564bf  freetype-2.13.1.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.2/
+sha1  2d8d5917a1983ebd04921f2993a88858d6f72dec  freetype-2.13.2.tar.xz
+sha256  12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d  freetype-2.13.2.tar.xz
 
 # Locally calculated
 sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index c6bc0673f..1f4bcaf34 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.13.1
+FREETYPE_VERSION = 2.13.2
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
