Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D274EC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A523D812B7;
	Thu, 24 Sep 2026 18:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEFwgUSwNJKx; Thu, 24 Sep 2026 18:58:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A004481313
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276293;
	b=aeZChgD7RFBDHxvUmzsAl6PNq6mtbP/RcuoI9J5oo2cwNEs2DCraMhPuRCnM2kKLvRKr
	 6RTKs99NkYJ9ILmGrD8ZXUnDq3rvPMLGbQz0KHz4oAWUCHxbOOL5eFl6B6r5kwOi5a+1O
	 KRje6yat1D/isSqSgpv28TWp7oj3p8fybYt9KougWBg/OUY7xLEYQ11Cwf6IYcCwNtWX1
	 RF07LxiZUAT1mdkq/t3AUXG5/k8uVuayC4NPEn++Taz3pbKN4sO7iiZO/MQo23LEwR6U8
	 V+JoJySuNN68v7VQTFefZ6rfzn41GxRl0fi3q3/FsQhxDvQqQpwEPAPML1/YgErA7Ew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6phnW4fJw2GZ+y+Cdodc5q+sSVfQNlxjLhOo5A+XYoY=;
	b=XPaRtlMP283t2hvuor7mPQTi9xfoIs8F1FK1+GNZKi3wNRemxsQv16aReFFFm9YpAsfX
	 P5JcX7x4nub2wss/6G84DottOCwJx9p9+FEifvNQgPcon9IqYmhzAFeRhHugt4CG4qVBK
	 D0wFWo6j4cgJ19Tl6N4keBeeuRMocfnZikSJ1PnMm//XgZtq1Eyz2cnzetAR4hQllPG0n
	 /1g7p2nt7K4sqWpBjFBWPF/rIR+snEOq4lF0AjUPKUhSkiLo1Cf6+L8F3ataGDj4KXjvS
	 2pcuHL8HLs0lMx+yFLaPd1YduvKyoMmrgxsuWHlsHNDecIIMqJ4PIRG/45NiaeQPgUw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276293;
	bh=6phnW4fJw2GZ+y+Cdodc5q+sSVfQNlxjLhOo5A+XYoY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nliOkCtJkHm+xy5MSbZaq22dgWFxaLntkdon4fNt0Yj+jjXo0Qa4qSg8zegecUl+8
	 mx3lsEM+AmEQDNLA4saHAm6x6O4LJnpDL94p7yJGDzRb0DdXZW+DkH7jtN7K/GaEnX
	 qgFAUKj79Y2WZbV+pYea7id+y+HXobBisBjrAU98Lf9qj4lhE2/FsiNHuclBb5/TAZ
	 WNyaeu/UPwuxkXFUehWObNq4zl9xD0EyvDPwhwXGEjj/2OCKQd72R9Y8pJeqFQ+lXj
	 lasuBzilP1s99bN/nHbFuvi+rJ53Et86qLm70dsUSq5ZX7jmVbVCPWI/DUQUqYH3BY
	 0N2PCYHBIokAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A004481313;
	Thu, 24 Sep 2026 18:58:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB212332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98D7740AD2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id clnOiESADfLd for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 22E6140AE2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=MWKqvn6OErjqBe8Mn3AYuOOzM+BmngxYOqIBIJ7ciSSfNoV28nwBKz2GYlTbLieCuCJo
 Iig+Mvlv3pPUkCcDVbSxCEVasslK2fVmCdaL1EQRSSVokn7UDXAcf7SecdupxAy6hEprb
 4MX2b7yjJDWL5EFIv+YzFLY7lIvS7og4pQ+Kd/oWqoma2ubQvJk6g1vbVjsC7ncPvG3im
 WejVa1CDPKKp2rJz+5LOfHz2nW4EIukajDMxXOV3n7qx1ZlhmGVhZrxiiGcPuyClPc2HR
 LmC+jy/H9pU36QJReOKW0pp8xWMLO/Omf7xxyuRe6xlTPy6THiTlNSIbv2ggV3NUf4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MNCqCADjQ0DVWf3ZHnQVlf7jgqzfVVGhQ257sTwxdb0=;
 b=kBzARbFlaQTLE7dVxQmQ1jjCrwxgFa6w8vjW9HNH7yyCnhjwXIkIgN6txJSeKI6gHfwf
 S5DAAk9fHY7UVmzvEm7gshI0BOXI2Q4OOQCEjh1Q5Vohx03cJP9Bc4mzOxHn1MrjUI+nb
 ja+JW/WVJizrf0rdDeFFglCGB5BLYlP/rvVw/K3XO4WBqHxva0QkOYoGT/ahr7MaGED+6
 hLg6pRcF0M64IQTpHuG4vr7epWhC2Dm8jVLaUbf728kjnlVVbZEJDX/gTJhkKNUykw6Hb
 Udr6fWpD4FVM7ZjQ/Rk+EHW0cR7EEJ9pt80f6adGvXAGIY4hnSaLBPzueYVq1OSOCCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E6140AE2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB528976B0; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7f7c1db4d2405d6a2b9e2d0c01cbc943964e512b
X-Git-Newrev: 4b02e8db6bef99424b95fdf4497e8d8e53c4e2b1
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.BB528976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mali-t76x: add
 missing license information
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1052441011579380927=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1052441011579380927==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b02e8db6bef99424b95fdf4497e8d8e53c4e2b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Added MALI_T76X_STRIP_COMPONENTS = 0 as tar archive follows nonstandard layout with license file being in the topmost directory

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a4346a385811e3ef2ba209ded9a604f1cd7f38fb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mali-t76x/mali-t76x.hash | 1 +
 package/mali-t76x/mali-t76x.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mali-t76x/mali-t76x.hash b/package/mali-t76x/mali-t76x.hash
index a754b98074..61671eda29 100644
--- a/package/mali-t76x/mali-t76x.hash
+++ b/package/mali-t76x/mali-t76x.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  5a0b00438edc8066b374481d3332a43c07ec2bd3bc73265983a968970f754902  mali-t76x_r5p0-06rel0_linux_1+fbdev.tar.gz
+sha256  b0ca7cedaf4f604a1c863ea71f741d6ca1474aebac7e606ec43d725b3c74cc63  END_USER_LICENCE_AGREEMENT.txt
diff --git a/package/mali-t76x/mali-t76x.mk b/package/mali-t76x/mali-t76x.mk
index 387685c033..113c541a91 100644
--- a/package/mali-t76x/mali-t76x.mk
+++ b/package/mali-t76x/mali-t76x.mk
@@ -10,9 +10,13 @@ MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T7
 MALI_T76X_DEPENDENCIES = mesa3d-headers
 MALI_T76X_INSTALL_STAGING = YES
 MALI_T76X_PROVIDES = libegl libgles
+MALI_T76X_LICENSE = ARM Mali GPU EULA
+MALI_T76X_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
+MALI_T76X_REDISTRIBUTE = NO
+MALI_T76X_STRIP_COMPONENTS = 0
 
 define MALI_T76X_INSTALL_STAGING_CMDS
-	$(INSTALL) -m 755 $(@D)/*.so $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(STAGING_DIR)/usr/lib/
 
 	$(INSTALL) -D -m 0644 package/mali-t76x/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
@@ -21,7 +25,7 @@ define MALI_T76X_INSTALL_STAGING_CMDS
 endef
 
 define MALI_T76X_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 $(@D)/*.so $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(TARGET_DIR)/usr/lib/
 endef
 
 $(eval $(generic-package))

--===============1052441011579380927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1052441011579380927==--
