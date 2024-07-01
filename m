Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB246C30653
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 22:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6358E60ABF;
	Mon,  1 Jul 2024 22:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DV9ConkJ3Eha; Mon,  1 Jul 2024 22:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 608B660AC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608B660AC1;
	Mon,  1 Jul 2024 22:49:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC9AA1BF333
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 22:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B95D7404F7
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 22:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FEzQA9D60yN for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 22:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C1A1404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C1A1404D7
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C1A1404D7
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 22:49:04 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-376243a112cso12946645ab.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 15:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719874144; x=1720478944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3cYvZO64RXlflb2rBO9R3qY/TmjW/JHPI+I8cH2yr3Q=;
 b=PZ35A6dWTahoHTs4XZbK2uOYI4VzfiPqNkmAkrkio8v8DE5z8HhE28TccMagR7ScNm
 JOOg9AiLAQ0UXi/9QXoCrdoQDpEKXKX6ReBcUnYBljClhBhJTNbEILiolLlJXvzEvnVC
 yhhCzwk30tp5umQAOQLt5C0/RK1xVFucf4evyVmYx22rOOmRdTW1Sd/wsgdgNd6UkAYM
 cAwCGDM9NFdqmf6XC13UdL+Yym/ltO3ecpgHOfvcE5/FAKghrIAnq/FkSuAncgOSVIxW
 8WmiMIFxjy9AVcPZTiWlNTKD9goXok9cM74vBiV1Uui7JIYip8j0BxMwvRWJmiIerS3Q
 P5tg==
X-Gm-Message-State: AOJu0Yy51rq+BjjxYWICJVnc1RZC6y5PuWQN6Rm+8Gl8j+L0iH7ONKF3
 04HTy//295C+sAViJkHI0LZ7OAG5r1QU86rCfvZKVWFNXTfuvwElE1iW8g==
X-Google-Smtp-Source: AGHT+IGYDtnRo6KTkFuGl9OIzY2uVrFt2/NUH9jWVmkoSsBmnf8wtWv02uVOlcQRBoDXGiL3/0LNXg==
X-Received: by 2002:a05:6e02:b4a:b0:379:361e:5067 with SMTP id
 e9e14a558f8ab-37cd2af74c9mr88700655ab.25.1719874143624; 
 Mon, 01 Jul 2024 15:49:03 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-37ad483bf35sm20929115ab.81.2024.07.01.15.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 15:49:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 16:49:02 -0600
Message-Id: <20240701224902.3117726-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719874144; x=1720478944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3cYvZO64RXlflb2rBO9R3qY/TmjW/JHPI+I8cH2yr3Q=;
 b=JBDnaQl9d+ghMOl41ZRsfVtoAzo+J2viq5TH/DRHK0ZE3m5w/8crzCvf+IKDN7SxXA
 uemWcMbtzDm1mozC1uy7W8acY1hRDKy5x5kb16dY4BYwPUDN4DTdaNvIWwon8H6pXruo
 w1EjRzFBRqQb7Q2Xktf4i6KFOD9gDetH5h8K0QAL4Qi6xkqKKSncCcXdIA1xkn/XV0lJ
 +Y2yH9gDZ8u3Q1qjvfnZTdcx73GhRnRz116oyJmuDUCCSnr/DqTFCoRvUV3mQkZQ6CBD
 u2+2+1Q3mTVA3FGFyQN+XWesF1/7A8E8b/uMMHJvxjQrjHJFFGrSMdrX4944Bv3PHV7d
 U0Xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JBDnaQl9
Subject: [Buildroot] [PATCH v5 1/1] package/cloudflared: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - update to version 2024.6.1
  - add select BR2_PACKAGE_HOST_GO
Changes v3 -> v4:
  - update to version 2024.4.1
Changes v2 -> v3:
  - fix version
Changes v1 -> v2:
  - fix Config.in syntax/section
---
 package/Config.in                    |  1 +
 package/cloudflared/Config.in        |  8 ++++++++
 package/cloudflared/cloudflared.hash |  3 +++
 package/cloudflared/cloudflared.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/cloudflared/Config.in
 create mode 100644 package/cloudflared/cloudflared.hash
 create mode 100644 package/cloudflared/cloudflared.mk

diff --git a/package/Config.in b/package/Config.in
index 48ef1a6fdc..805f21a3f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2382,6 +2382,7 @@ endif
 	source "package/cfm/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
+	source "package/cloudflared/Config.in"
 	source "package/connman/Config.in"
 	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
diff --git a/package/cloudflared/Config.in b/package/cloudflared/Config.in
new file mode 100644
index 0000000000..31319c01fd
--- /dev/null
+++ b/package/cloudflared/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CLOUDFLARED
+	bool "cloudflared"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Cloudflare Tunnel client (formerly Argo Tunnel).
+
+	  https://github.com/cloudflare/cloudflared
diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
new file mode 100644
index 0000000000..1aa959f8b0
--- /dev/null
+++ b/package/cloudflared/cloudflared.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c61ef286962c3bb9c5edb580b89dbf8293083fa09a8f0f59379fe8ec2d04cada  cloudflared-2024.6.1-go2.tar.gz
+sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
new file mode 100644
index 0000000000..1796972be6
--- /dev/null
+++ b/package/cloudflared/cloudflared.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cloudflared
+#
+################################################################################
+
+CLOUDFLARED_VERSION = 2024.6.1
+CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
+CLOUDFLARED_LICENSE = Apache-2.0
+CLOUDFLARED_LICENSE_FILES = LICENSE
+CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
+CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
