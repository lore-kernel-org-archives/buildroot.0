Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFAAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 19:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 935F2611CB
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 19:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 935F2611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A47C405E4;
	Wed, 20 Oct 2021 19:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ocXSOzWBhy1n; Wed, 20 Oct 2021 19:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA14E404AC;
	Wed, 20 Oct 2021 19:23:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77C281BF3F3
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 19:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58A95404AC
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 19:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OcF9V4YvQWXP for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 19:23:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 617D2404AA
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 19:23:24 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso12022952wms.4
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KDLSQ9kzxNeJ+k6Ll0IaWXoBwiTBEbk/wLpCmQbILec=;
 b=WEgEAjvfnjInJhnEvAwsLALNzNazQyfTVuAexXZaPjXVINX4H9+0QmY7rYv2kt/Q9/
 idBQv2EMPu030HnC3A6lcZsvqxM4zlx4dSuUMpU2reL6Nf2CrvPzkvE5rXEetYfqfFqA
 wGtYEJGZMXzo2hb9YsAhKDYOc48wvmYZzA/Z3RPsRtTAgSX1gPIWanaEQBN6DfMcc+6B
 aeIHU7rHLjYjl2PfIqZo8B0c67vaU4MyOlzoicG+DeguC0wcTcbtNlQGMLhAeVl2fjkr
 MpjdcDDKaaIUpNRR4q0mujMqgIPOyF2x/03foZAb6wIszLyuX8m9+uAjOJdtYhVUlRG2
 sbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KDLSQ9kzxNeJ+k6Ll0IaWXoBwiTBEbk/wLpCmQbILec=;
 b=dvIZb3icipGzMJGJmmoNy/gvFSeZvbKkeDAsJecxB06K5yX94aCFjTEHV1x/634hi0
 /0sN5HIveXtL9G5zpzjlC2kUFbrkyKmZ2j1C9oxG+BA45YhASIX6P0NCKx7Hj6NwnGCe
 7PUmGIo5bcO0qzKXqspKG5qMHOf78l+p9WUjcDNPkGg25agxayGCasgaRgAK3EnC4iVy
 IE7UFuQ2WRQW3cjLbK77FVM7hcjS7whXGUmqNuIhfiOqNy9b2xB7HQD+gKt4XMqeu/gl
 9VrhfsBl0cf864Ib3fNZXdHUXhssI+IxeH/PDdrIg3VcRMAf4qUDD38UOxYZTfydUr/b
 WXnQ==
X-Gm-Message-State: AOAM530bODdDffMXFJ4TfZHEDbroNPH9Ttf7kVuDj2jvU/rreLE4ujrK
 c3ypA7+CLHP7woa3aQdtIGrJVOyAhPs=
X-Google-Smtp-Source: ABdhPJxsUspLDOtE4BLhYnIDABNanriClvEi/g/PZMTK/soTHCtpveDdK7fWDkVG7M6UY7/iZQXEBg==
X-Received: by 2002:a1c:f615:: with SMTP id w21mr1304195wmc.16.1634757802200; 
 Wed, 20 Oct 2021 12:23:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id n68sm5741351wmn.13.2021.10.20.12.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:23:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 21:21:47 +0200
Message-Id: <20211020192147.3626317-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sudo: bump to version 1.9.8p2
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

Update hash of license file due to removal of trailing whitespaces:
https://github.com/sudo-project/sudo/commit/bf7d20b482edea8c4f2f945a27f51c7eaf6aa203

https://www.sudo.ws/stable.html#1.9.8p2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index ee30b32265..1b494af69c 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256  539e2ef43c8a55026697fb0474ab6a925a11206b5aa58710cb42a0e1c81f0978  sudo-1.9.5p2.tar.gz
+sha256  9e3b8b8da7def43b6e60c257abe80467205670fd0f7c081de1423c414b680f2d  sudo-1.9.8p2.tar.gz
 # Locally calculated
-sha256  505c5955c373514e2533a24a8346f44038e29cba874f5ca83beb171a7409089f  doc/LICENSE
+sha256  b678438594f04a7070a5fd125f7edffc871e13234baad318690b647bfc60705d  doc/LICENSE
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index df09161957..f2c074e55f 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.5
+SUDO_VERSION_MAJOR = 1.9.8
 SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
