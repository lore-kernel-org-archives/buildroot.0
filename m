Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C8FC4452A
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 15:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F2D80CD0;
	Mon, 20 Jul 2026 15:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBGxYw2y7Usx; Mon, 20 Jul 2026 15:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9701A80CD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784559771;
	bh=PEh0/OKUW2GstWqMFUpv2RF4vutG4Mx2wKNxBcc44nc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YeC7g3I4y39NlEl3IfcAcoMas/sRVC9Wgn8o8bo6ndmqEi6mPLOsjRKMUoj1TOIwH
	 jYSzkKC0A1VFLE4Dr3cS0GtVPTHVzFrlkqdqt+e0vjZFLLIpREzKWhfh3D7jYdY0L/
	 58w+osFpoaZmyYsrhTqXj94aSrkT6FdofgUAitxCnks49FUXk+dX84CxSNYg1MDKWC
	 ne/mYGxgqFSWOR1uABgcNC0HuXBgTdcojOWlrD/lKZ3gbpYZXl/0bK0N2jNlYjmTZM
	 3c2JvByBuSSYdI4n+42+OusEVQfl/LDiiwoJlObaJr5qfWbrGVt63WoI1CsUsMq5c6
	 2VHfaME8Grt/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9701A80CD9;
	Mon, 20 Jul 2026 15:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA3BF206
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C48B80CC8
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APL3Wim8FW0E for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 15:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CFC780CB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CFC780CB0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CFC780CB0
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 15:02:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso3163165f8f.0
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 08:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784559765; x=1785164565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2xTsDvXo5w06yOrnkkZD/KfGs30DzrSVEiUQ05CWou4=;
 b=HGIsh/729d+VAZMSLqg9qTIfh8UIxCnQg93isUmczJvUb4HGDkCLVNtkBI8mWo49Oe
 X4bId1tG3xYhp9qrcaPe/Y9zlPQKPswfgEv6XGs89DaWZ8o0FDkHVY/Icp+gVMc1CZGH
 21h7eOXvUdjr/1q5H25A3ztyfsYLYdd47tsez92/7XsqrN50AmWZ7May0GseV8lJsSY2
 /sJVPj1PFpazxdUCyeX77tRes99II6w+ott4+cEt3KbhIqnkIQrlvDT+A2Vy97kWXOyt
 Cj+sl+o63+ilJoxRsScZsxEFBkDax4/hlnzBoAWEK8XRfGYp4h2qKYjws229xt9TY5sB
 yoNA==
X-Gm-Message-State: AOJu0YyaZGeGjR3q4twV+GkBqZf80tn7ZPUgjSICayx+2/49bTdxBiES
 GYskwSpOeZHNRors3orxm7KhNKWADAAleRpSVRdCcUBohjnLIOctiz5YzcWm7g==
X-Gm-Gg: AR+sD10vN7TEjSuaaLls0G9dUy2FeTOXnvSGznLoa2NjJOUa5Q9T5UpAwB874T9qbqJ
 mGPpjZTJsDkwyNR8tPivx+xN4KN9HIdAD/pnie1CS6+znxdTSyqjl56NDEldpHYUoW8M2ceHxv6
 c3qxpLmCaINUu0IEniAI0BAkv1BPkCHDUWEwyEGWniR99mVUpEuvEJyDHl4l8sT25VZXz0eqTAw
 hy2Ea6QM2RDSfe4uPN3ZkT10rvv4ZyxgBONM/Ztdpt9GT1yZPOYeKMOHQceOeN9UZFYrU+1rk1w
 U0Lu/d1HLDIhYPSO3QkoksiLv4OOTFNPjz84RP7/X9a9ry/wjDDR612IF5zEpaaaXVNOk3K70eg
 Vv5F8pa/Fmsy8SvSdeXd9JNHvuA5VEqZSab9UZ0JFodlHpv/GvfZCyTJpORkMpGgGk8hM9UIYiR
 qNoTlk5Irxpen4R3Y1CC/Z6r+17z/e
X-Received: by 2002:a05:6000:25f9:b0:474:da39:e5b3 with SMTP id
 ffacd0b85a97d-47f623ad9a9mr17432582f8f.2.1784559765176; 
 Mon, 20 Jul 2026 08:02:45 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm28681532f8f.35.2026.07.20.08.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 08:02:44 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 20 Jul 2026 17:02:30 +0200
Message-ID: <20260720150236.243961-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720150236.243961-1-francois.perrad@gadz.org>
References: <20260720150236.243961-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784559765; x=1785164565; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2xTsDvXo5w06yOrnkkZD/KfGs30DzrSVEiUQ05CWou4=;
 b=mtilXU37CCTMVY8BuaLu4U4pixM+OWxXPXXkkzG3VveYl2uiLlHsJhFGKLsZVXOWpW
 vAnZVvzKIXm0daWeNxxLGcGEz9AQ/sKm6vG23iVE/LRsk0Vfy0ojeaoDSIB1m8XZip47
 2BZP+mFcilSHyqd8h66VxOrDzU6ABFaRrIPqoOHiHmuPcYoREx/MqZfcrjN+7NPQC5Hd
 OernDIJ8Bou3Uhe4k7CmvgBPfakkaXmwopoK9JbjJfKeFyorDqm8JEVQB7uZdZGo8jn6
 +pV18WKfGcMOvbc3F7mA/EGg+j06kcodZ5eN6ZmO5n1eQaO49TFATnOb28U2H/zPTVSq
 p6Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mtilXU37
Subject: [Buildroot] [PATCH v2 3/8] package/harec: new host package
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

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS               |  1 +
 package/harec/harec.hash |  3 +++
 package/harec/harec.mk   | 26 ++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/harec/harec.hash
 create mode 100644 package/harec/harec.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 442fe4e6a..0b99456a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1176,6 +1176,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
+F:	package/harec/
 F:	package/janet/
 F:	package/qbe/
 F:	package/libtomcrypt/
diff --git a/package/harec/harec.hash b/package/harec/harec.hash
new file mode 100644
index 000000000..0c3679bfc
--- /dev/null
+++ b/package/harec/harec.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5581bc16dcf22969c7d33b0f2a9535ba37d4cf1bb39dec252e98ff2781175629  0.26.0.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/harec/harec.mk b/package/harec/harec.mk
new file mode 100644
index 000000000..df1096680
--- /dev/null
+++ b/package/harec/harec.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# harec
+#
+################################################################################
+
+HAREC_VERSION = 0.26.0
+HAREC_SITE = https://git.sr.ht/~sircmpwn/harec/archive
+HAREC_SOURCE = $(HAREC_VERSION).tar.gz
+HAREC_LICENSE = GPL-3.0
+HAREC_LICENSE_FILES = COPYING
+
+define HOST_HAREC_CONFIGURE_CMDS
+	cp $(@D)/configs/linux.mk $(@D)/config.mk
+endef
+
+define HOST_HAREC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) ARCH=$(HOSTARCH) all
+endef
+
+define HOST_HAREC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
