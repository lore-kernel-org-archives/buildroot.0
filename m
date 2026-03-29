Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4F2F3D5F4
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 06:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 559464099D;
	Sun, 29 Mar 2026 06:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_KyHEhImpsr; Sun, 29 Mar 2026 06:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FE5E409A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774766774;
	bh=Fyptl+TEaSw2Kt/uDNlKjJ4xGqbICtI6qeB1Adj4+VQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C4pocJEAd5YyCKOMBB8dOV0UxhXxp9ZIuUPEkEkSbAx2bDptg/PZ1avUYhjyeNAfP
	 lMjEvFy489UEvvocsvbBKACfHA3jnXxF46movwC8zDGjQbjXP+LxHZjAJhuwt6rB92
	 Alc4K9reKGvwCJIdKKgnZDj62v7ChaC1MSwDAsoT5fwzm7fVVFjOWqGoD3sCubqi/J
	 aAMaAY2RMqGsNjHdUWtzZSSWqnM5bzQJXSXBcl7Q97+VRYSbNmSjMtY/VYgEkkHq58
	 oUINhx0F0OmUsh4KZJKifGCCVYgsVrSeUP5Wi5ZD4fiJyCPO/5Pl4ZLa7QLwt8kcoc
	 YiFGxolNUDxkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FE5E409A1;
	Sun, 29 Mar 2026 06:46:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE8381D3
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 06:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C04BC409A1
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 06:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ec06AOkrYE_p for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 06:46:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E10E04099D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E10E04099D
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E10E04099D
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 06:46:12 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2b0ba3bfe16so27652775ad.1
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 23:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774766771; x=1775371571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+P/WDSUkVWxMCH65X5K5KZQHZfsepq3z6LfB6y4JEZI=;
 b=WO0PWzQOFOe6TMGjHBKpqYGQay9yaoRNzzA45NNLU/JATS6zfPin0iUa3jlmMuDrYo
 mWtcxnrDLrWDSlzg9qbYdQIB5eLRX5o1h4UDWPYAZjR0nRLnybp+38Od/aCJ8dn4kPHm
 2Xg8X/miYAgO54n9tOaTbfVX++YGVWJv6KpYXTQKMNlkHzZW3GAfVZzxmJu02j0XXyp5
 jNUG3DvPpK9OWsRGvvqirGCkDcuow1Oe88aZlKxLfXFPw0oymzcBtYtApqdAY/sgk7An
 1TSx8453yE3G6BLxQ4VXUlCUhVBuWnxONKPwQ2p25q7A7P2jf8kRV2ZlyB0NY/pnS0zR
 iF7w==
X-Gm-Message-State: AOJu0YziIblPzTNnRvTjhxAZlgHQXQTII3oRpVuoMaqfRWCKaNXws6wr
 58Vn7U+ozNCkSw/202RUCf7b9jIeUimk19xSWBSRojTYdvIWqJsSQY6Fvdap/Q==
X-Gm-Gg: ATEYQzxL7Euex0ONJbmrM9tZCIlw3J+3rESqXGytAN14u8u8x6IepqJTamPF2USHiGx
 2CQCMgrzV8otQo/7yWM2gEZRDPDbEfi24GYbSyyde+mn123SyxZY/LNxVi86HkCScdr1ejMCJs4
 ZQeAV3tdYC+UHT/KFK4PO2AxzwUTGedxpabtHOOBfIIWPmf3A9s8j6lThhhXbfaPGrTUZTAc42d
 8u2jKSijj8DODrr7xeVRqppIvdBOFRfhYnhIirlxupA5dSG2eHbDOGUDn9+LOE2TRECj0vgKEOX
 YKAry/bFrMWa/H9PPJ05zI6A3BOEVq8QrRCzGEuC9Fq5JH+ltDlQqzd4WgL/VXAprBg6hUQDHC0
 es7a54aNjddJLMpMTRt9e0U+MXJx6vLdAEN9dswEzA7DyF/oPsR8VpYqPMUpqVPjQW4pcwq6jT3
 DArtwEzaO6aWPHZkHhVpG0RAS3Q8Gp/YVC1Q==
X-Received: by 2002:a17:902:cf03:b0:2ae:4d6b:b2c7 with SMTP id
 d9443c01a7336-2b0ce4ee4c8mr74022525ad.9.1774766771476; 
 Sat, 28 Mar 2026 23:46:11 -0700 (PDT)
Received: from fedora ([2409:40e5:104b:2bf0:f192:27a:e37e:a94d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b242642b43sm52542605ad.9.2026.03.28.23.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2026 23:46:10 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 29 Mar 2026 12:15:58 +0530
Message-ID: <20260329064559.15124-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774766771; x=1775371571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+P/WDSUkVWxMCH65X5K5KZQHZfsepq3z6LfB6y4JEZI=;
 b=AWlYF/PalbWCJ5uSvk2ATcAOORZb+xmzwyOJdk1cQf/MWipJprqK1b2MA0QYbt+QnG
 73YeZuox37HZwomarRevEYz8Yr/yslUCWUlzsljkplzBCdXyfYLT3L0tg/cSdjFfucZt
 ogJz7GcdITK9p4ggqpd0bRbMBGU7O0A0FXGq5e+7dQUoIEUuwL6RlmKk/tCIDeeZp2Wa
 CXlSFY9Lo3o3HLdDIttumoJqpgTkN93Xv2ue5XC/R7jW2GATCc/woutYfCKvzw0w43Hd
 yatOs0oLD1k/AeBwU8xyBGaDryIDAufjwlzK34KaPbxGtNF3FRVbPKYArvpbh3CfoQlA
 H9/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AWlYF/Pa
Subject: [Buildroot] [PATCH] package/font-awesome: bump to version 7.2.0
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

This is a major version bump from 4.7.0 to 7.2.0, skipping versions 5.x
and 6.x. Font Awesome 4.7.0 is end-of-life.

Major changes in version 7.2.0:

Directory structure changes:
- Dropped 'less' and 'fonts' directories
- Added 'js', 'sprites', 'svgs', and 'webfonts' directories
- Retained 'css' and 'scss' with modernized syntax

Technology stack updates:
- Migration to Dart Sass (node-sass and libsass deprecated)
- Removed jQuery, Less CSS, Python Django, Ruby on Rails, and
  Require.js support

Icon improvements:
- Expanded from 605 to thousands of icons
- Icons now fixed-width by default
- Icons organized by Packs, Families, and Styles
- Backward compatibility features included to translate v4/v5/v6
  icons automatically

Changes to package files:
- Update package description to reflect larger icon count
- Update directory list for Font Awesome 7.x structure
- Update license information to reflect new licensing:
  OFL-1.1 (fonts), MIT (code), CC-BY-4.0 (icons)
- Add LICENSE.txt to license files

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/font-awesome/Config.in         | 4 ++--
 package/font-awesome/font-awesome.hash | 3 ++-
 package/font-awesome/font-awesome.mk   | 9 +++++----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/font-awesome/Config.in b/package/font-awesome/Config.in
index 694d74e5a8..40cadaf433 100644
--- a/package/font-awesome/Config.in
+++ b/package/font-awesome/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FONT_AWESOME
 	bool "font-awesome"
 	help
-	  Font Awesome is a full suite of 605 pictographic icons for
-	  easy scalable vector graphics on websites.
+	  Font Awesome is a full suite of thousands of pictographic
+	  icons for easy scalable vector graphics on websites.
 
 	  https://github.com/FortAwesome/Font-Awesome
diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
index 89bc411f66..29c64cd40f 100644
--- a/package/font-awesome/font-awesome.hash
+++ b/package/font-awesome/font-awesome.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-4.7.0.tar.gz
+sha256  8f433b74d3d4bbba2a6374a0a0ddf53be8e127809341e4c2578719229b43903a  font-awesome-7.2.0.tar.gz
+sha256  20c6f40715a567c97b80f6944beb8bb325835cab47ea7dcab89ee3b8e077eced  LICENSE.txt
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 5211ac22a5..2b1de910ce 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-FONT_AWESOME_VERSION = 4.7.0
-FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,v$(FONT_AWESOME_VERSION))
-FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
-FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
+FONT_AWESOME_VERSION = 7.2.0
+FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
+FONT_AWESOME_LICENSE = OFL-1.1 (fonts), MIT (code), CC-BY-4.0 (icons)
+FONT_AWESOME_LICENSE_FILES = LICENSE.txt
+FONT_AWESOME_DIRECTORIES_LIST = css js scss webfonts sprites svgs
 
 define FONT_AWESOME_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
