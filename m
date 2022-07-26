Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BC2C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A033606E7;
	Tue, 26 Jul 2022 20:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A033606E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAQRINdmeAA0; Tue, 26 Jul 2022 20:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CD2A606BF;
	Tue, 26 Jul 2022 20:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CD2A606BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38B991BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F4D740101
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F4D740101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fO9U4Qt9ANFq for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:12:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F395B400E4
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F395B400E4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:12:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id g2so13540639wru.3
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6nMM2dWvgHFc+3qmpC2YGA3WTUa24ecjoL1pckQ9bww=;
 b=e8Y/TUBsIDFb219IC2PlKmYpHdzm/Q2wiF71sAtvhf0SB4cjI7qUdYwws5oCLVzkYg
 k9HL8ZQ7YSTq8eJ82vDz/7TzccQN51clrl2x1Y5PRSsWE3N9m+hzR021JlfWILU0hSup
 ws18bep+REuxNib8Yqpedy5K5dyIMbsRiusgX6sd7WPemwzmv+nfvii+fCswbad/a8ZF
 ZLHVlxjDG/bxPevOEjcQvvkvdRuJvppycnTalsKJEoaYJHwGCP9TZBpetFezU7NhkhO9
 mNHmaSHabssEgfZUBtyDPe5bOrwwtsAaR3sKNDtm4W44bsl6sqWOaAbTFErE7TnLbU6C
 GWmA==
X-Gm-Message-State: AJIora/k6BEcXEoqXWs+XXea16pB1bGRRFSbOMKWIy1qVZIspuWvK2t9
 71vOVngYlm+LG7tFxLHJlOSoTPIlsqI=
X-Google-Smtp-Source: AGRyM1tgA6eu5144Y447245WeK0IXA3bjT5RtmZoTE5jNJbHPz7Ymbjyn+AW3IMGXU7nPCeniG8+aw==
X-Received: by 2002:adf:ba0e:0:b0:21e:6e22:3743 with SMTP id
 o14-20020adfba0e000000b0021e6e223743mr12098146wrg.612.1658866346840; 
 Tue, 26 Jul 2022 13:12:26 -0700 (PDT)
Received: from kali.home (2a01cb0680639d806be2c385179f3c58.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8063:9d80:6be2:c385:179f:3c58])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b0039747cf8354sm19778328wmq.39.2022.07.26.13.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 13:12:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:12:24 +0200
Message-Id: <20220726201224.215268-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6nMM2dWvgHFc+3qmpC2YGA3WTUa24ecjoL1pckQ9bww=;
 b=BeEB+KrTPkTnbDx8NpNtfwzApEonb0/fF1LWbh3HzLIpcou8yYZEkVtPf2cqfi1z9V
 KFLcvlQ0xMkY9J/umTSKOolJLabGfij5QQ/uzqZuAu45pAfIqT+qUZIgypN/THtDOrSl
 g5PKnFpHCIJo0J5IeTVfFWzyWb724pnHnMUPq7WsczkdvY0P8butjrl5+5WXPFFCD8eC
 rKFkVbpwb1vCNZX+BWbQRvvo0uZ+KCB3qgFzHuZU+Fp3XhxXMYueAh/mD57DUI71p7xC
 KxJ/qA3ap9e3Qxc2bTStuP0NICZCW1nbfi3K207LeagYk7f/isuOTXyCC9YRT+hHKdZC
 9SpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BeEB+KrT
Subject: [Buildroot] [PATCH 1/1] package/f2fs-tools: bump to version 1.15.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indention in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/f2fs-tools/f2fs-tools.hash | 4 ++--
 package/f2fs-tools/f2fs-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index dedd884957..8d5ff31f0d 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 619263d4e2022152a1472c1d912eaae104f20bd227ce0bb9d41d1d6608094bd1  f2fs-tools-1.14.0.tar.gz
-sha256 662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
+sha256  147d471040b44900283ce2c935f1d35d13d7f40008e7cb8fab2b69f54da01a4f  f2fs-tools-1.15.0.tar.gz
+sha256  662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index ced283d25d..2c4ee9185b 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = 1.14.0
+F2FS_TOOLS_VERSION = 1.15.0
 F2FS_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
