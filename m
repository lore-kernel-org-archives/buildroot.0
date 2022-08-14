Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB95C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 20:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0847840385;
	Sun, 14 Aug 2022 20:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0847840385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtlD9GbQJUNW; Sun, 14 Aug 2022 20:21:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC37B40328;
	Sun, 14 Aug 2022 20:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC37B40328
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16FC11BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6DB74037E
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6DB74037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CKNBXrjVeeZ for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 20:21:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D374C4016B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D374C4016B
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 20:21:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so1398181wmb.4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 13:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VBieHjGqbmRuFBKw+0XMPn94b28p3k6KUiaYnSiDOLc=;
 b=iCtlvW9BczzIG8Ys4RnCrHDQfZMdIyDJewX1511axVBU1DJ/NAkHaNb21W2MYf7eSo
 4jKD/9jH6rkVi9fkiHmSkahvfdgHGoPMl3TbjNZtAN2oqdsBc5goYbfvjnCgiF1T9dGb
 mluxJWAG8CR69wM0KjeQEel5mwmn6b6RpQzC7t0TGSVT/u6z956f6TrW5Y+rnvpXcwc4
 dx2vs3oK6ijMMHj17Gtr6weToNob50C2cJ39dwplBKd+PfDUW0zyt4zYgBPbHaMTzAhd
 LjGSXKjh+JSAs5o6Nq1NMew1hbtosdHb/6kVjw1Za5IVaY9V3MD/SgQZ5ZmcDOAxtdD9
 AVCA==
X-Gm-Message-State: ACgBeo0VtwrxZTMSpuVvFPJD92LK/i55VEkIcjf9dkvKByz4XbGThRC/
 UZvKmq5ViLGJnp7SBNIiz8W6xZ4RTRA=
X-Google-Smtp-Source: AA6agR4HkOS/A/nAJUrsNTU42vp3e1Y9mg7O4MM4WcJ2kqWcxO9K/6D1L4L1oF1Ct820hk6dLL8SQg==
X-Received: by 2002:a05:600c:3ba0:b0:3a5:b73a:8773 with SMTP id
 n32-20020a05600c3ba000b003a5b73a8773mr12607669wms.64.1660508477787; 
 Sun, 14 Aug 2022 13:21:17 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00a9b2226c9e455ada.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:a9b2:226c:9e45:5ada])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003a5dfd7e9eesm6674716wms.44.2022.08.14.13.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 13:21:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 22:20:57 +0200
Message-Id: <20220814202057.3698507-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=VBieHjGqbmRuFBKw+0XMPn94b28p3k6KUiaYnSiDOLc=;
 b=VFmgjbmjhT1JDJ/Ld3uulp/dIx/G74m+RcLI90cZsABNfw2+GnND2ILaPImqoxiA/1
 GgX58irIj0WEPIE5M39ava9gVXyDn7gRNBNcNw1/XgXsCC9/k8YXknejIjGvfx5tNcOV
 nRrxd+fXFL2kr5KSz5kHEK53Qej95Tepq8PLH+p74AYAzjT4AbwMId44FN4VUQfhUSnr
 IBKJr+dKSjc86rcqXnwpX/1QtY1LZfEKXcQbtwULUDjuawg7uZUt0YG3ojm0hkUR1kuB
 bX1b/c1lCbwJ5HnnOLKxM+SHdqG7/aZ1hxmLCQdqWzLI/98TY1eXayf8o7zjbfaDJHrG
 7qaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VFmgjbmj
Subject: [Buildroot] [PATCH 1/1] package/syslinux: disable documentation
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

Disable documentation to avoid the following build failure if a non
working asciidoc or a2x is found on the system:

asciidoc -o html/syslinux.html /nvmedata/autobuild/instance-3/output-1/build/syslinux-6.03/txt/syslinux.txt
/nvmedata/autobuild/instance-3/output-1/per-package/syslinux/host/bin/python3: No module named asciidoc

Setting {ASCIIDOC,A2X_XML}_OK to a value different of 0 will disable
html, man, xhtml and text documentation

Fixes:
 - http://autobuild.buildroot.org/results/47f876ccb56831cc1bb9e6c2f7dbce423581a0dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/syslinux/syslinux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 2df415fcfd..cc52c49aee 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -58,6 +58,8 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # be used.
 define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
+		ASCIIDOC_OK=-1 \
+		A2X_XML_OK=-1 \
 		CC="$(TARGET_CC)" \
 		LD="$(TARGET_LD)" \
 		OBJCOPY="$(TARGET_OBJCOPY)" \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
