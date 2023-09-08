Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C90EEB566
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 19:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB3434057B;
	Fri,  8 Sep 2023 19:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB3434057B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7bJdzeJ_m0if; Fri,  8 Sep 2023 19:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F47740523;
	Fri,  8 Sep 2023 19:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F47740523
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D59AC1BF303
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 19:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC4D382FB1
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 19:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC4D382FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g87QnC-qYWBs for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 19:27:17 +0000 (UTC)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6B2D81F47
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 19:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6B2D81F47
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-573921661a6so1476365eaf.1
 for <buildroot@buildroot.org>; Fri, 08 Sep 2023 12:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694201236; x=1694806036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ptYKjjxmqLQgs9C7Y4873pL89DfiByOj3NLb4X4VYFo=;
 b=C0qIrEh1iEN+sN0JPLla4J1cZFZqIOC7oBD/HwHFgQSybnvmTSNs5ZuHeGsRs0TpVF
 n7eCk0UZ0r//6YpnaPj9icKkm8tkNMui7kde0x153clLhUeoZ1LfT/01w8dWqQv1ldHF
 PUCtMcYKh76Zyv5dWre3bt0KBUgdoGQVNG/XZgQSP2f+69KksRoY3xzV0Pgg0tK8uiHj
 cHagsOIMSiGHrq+8Fgw+Pn9qGrAzMuMGjYteq3W1hC/U5swprB4E0Ot3XT8aJSd4oB4n
 zZh47/c2X/qB8sB4D8dH6u7u3b3fE8sTHiIqGdQ7h7GqEEbm/j9CkaRwTFToxKgLDlPJ
 AAKw==
X-Gm-Message-State: AOJu0YyvL6T0buS0YPNBHpDNW2PUbUs8Eb5lxFYbW+iYtQBdRnlXzwRY
 Geq/lsN6Dd0BZl3XHEXwf3JN6vj8tX8=
X-Google-Smtp-Source: AGHT+IHki1LqeHYvkQfXk0Gtk0yhjHE2JplFz/HEewngzRMRljhgxuF9MSCLOFZb816NcZTsO+MLaA==
X-Received: by 2002:a05:6870:e305:b0:1d1:425b:802d with SMTP id
 z5-20020a056870e30500b001d1425b802dmr3717341oad.7.1694201236139; 
 Fri, 08 Sep 2023 12:27:16 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 4-20020a0566380a4400b0042b39b2289asm635258jap.102.2023.09.08.12.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 12:27:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 13:27:14 -0600
Message-Id: <20230908192714.2716398-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694201236; x=1694806036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ptYKjjxmqLQgs9C7Y4873pL89DfiByOj3NLb4X4VYFo=;
 b=mnhV2PQ4JdxlJUVL2UYUM4rrbqvADwcXv3jcvDOE3kEIxQPPEVuEg2fzpJbW8bI2OV
 fa8wksGS2DQdHlRQqXULnG3LaTE8REjbcQ6b2+rqSBU659njoRVmWy67knfl9qU77VBB
 7aE1NfDwQ28S7ATON5GyhX4EZCFsBO5qjm5tSIEzqvfkJEVYTy6S+94TYX4VjlOzpkH6
 UaRXvzeinG8vs6G1MYyBE6YyJxawoxK1AU6hbBHbRcmFuL5w8bKqth/9H29wlSn5Drqf
 YrwfXGVrL2+JZ1BAAwB1DK1GuRrzEjoowGXnqnjvVtOdm2TblQLiyRCwxx53TrAfE+KZ
 8YVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mnhV2PQ4
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.18.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove no longer supported soup2 config option

We now build webkit with soup3 so we need to set wpe_api to 2.0 to
be compatible.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 2ea3ddee08..9fb386dfa0 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.16.1.tar.xz.sums
-md5  1489740db6b4ea568578035c30b8b2f4  cog-0.16.1.tar.xz
-sha1  1235203085e7ccd8fc76eab6bdfcdb2e3ae38ea9  cog-0.16.1.tar.xz
-sha256  37c5f14123b8dcf077839f6c60f0d721d2a91bb37829e796f420126e6b0d38b5  cog-0.16.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.0.tar.xz.sums
+md5  9521458c72322e1b2e39e8b1cca93d24  cog-0.18.0.tar.xz
+sha1  73ec1684c31de7247ecbd5e852c16cf88416bedd  cog-0.18.0.tar.xz
+sha256  410bf70f9aa3812db72d75c25cefee421efa0391ab03dc3c37299dfaa388f4fd  cog-0.18.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index da4bfc7ac6..f41c114fa5 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.16.1
+COG_VERSION = 0.18.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -15,7 +15,7 @@ COG_CONF_OPTS = \
 	-Ddocumentation=false \
 	-Dmanpages=false \
 	-Dprograms=true \
-	-Dsoup2=enabled \
+	-Dwpe_api=2.0 \
 	-Dcog_home_uri='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
 	-Dplatforms='$(subst $(space),$(comma),$(strip $(COG_PLATFORMS_LIST)))'
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
