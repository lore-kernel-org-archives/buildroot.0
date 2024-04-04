Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A86CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 22:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3256D606CC;
	Thu,  4 Apr 2024 22:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xurX6Stm-8d; Thu,  4 Apr 2024 22:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BFD60665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08BFD60665;
	Thu,  4 Apr 2024 22:43:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3E7D1BF31C
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 22:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE22F812F1
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 22:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64BGaCo2PbVx for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 22:43:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A740E812ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A740E812ED
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A740E812ED
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 22:43:18 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7d33ccdb531so72117839f.0
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 15:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712270597; x=1712875397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MqrviXGfdFjsCCxxRdRJyO2IH33GaK/0D54XAChwVzc=;
 b=d5cqKkJouHhdOVyyt6sxtScSSGVHhoS/fkNysy2YavrmeqEiuppeTBNTYf5SYzp1Av
 s+PGu0E3Kuyv5mli5Lx4WWxBLlXIpCBskngwK9sDnNfPF+8GIwIoTSTGoUlr2z4JxK5R
 ffaw3KxmQzJmUqsIWkdE6KRyvEl63YjxFqwRViZ102ldixUQq+ycjWeJ8qTZUsDz6zuQ
 EnxPflEPYrSyvqoSb7McGerwF+NE6uwrUF3b0+Hbc51ek2IDT2hiRUB9CAukCbSeU4t/
 XVnuRNAy0wgXAOUpcKi1k9LZNqdnlzjouktYu9oxw5KvKVaayjL0oaP31RXljJLwdYId
 iwDQ==
X-Gm-Message-State: AOJu0YzWZIcDWAZ4VwTdEcXTT0Ok+qR3crrGVNu83gUSg1GU5CFgd8aX
 xru5JZH97kS/y12NknQF7GwtaYuzRQcn3BZvi6iRyvJxWy2J2y1Vh2ru3LIQzKo=
X-Google-Smtp-Source: AGHT+IFFOpe32CHVHebvS5/epokNVbC0Cl0jQUullnLCMh8liC8iTmYdfCBtPAcv9KLSWTRKr1fgBA==
X-Received: by 2002:a6b:f816:0:b0:7d0:316c:8fe0 with SMTP id
 o22-20020a6bf816000000b007d0316c8fe0mr4043713ioh.7.1712270597132; 
 Thu, 04 Apr 2024 15:43:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 h8-20020a056602008800b007d075af4084sm161535iob.10.2024.04.04.15.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 15:43:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 16:43:14 -0600
Message-Id: <20240404224314.923805-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712270597; x=1712875397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MqrviXGfdFjsCCxxRdRJyO2IH33GaK/0D54XAChwVzc=;
 b=meAi/lVb7+iOyhkKvqnnFyhW8/5cm4ERuzv/6DShdlat9e1pVsSaZrqzYiZap646u4
 KuqoYwn+nSQXEFKHHJblhHvF+S5F+oe7vEo1r+6r/eimzNujoq6MzJksyMGyzjLUS8h4
 J+3uRIKR1zFVomiQg4XOYlQNbqDR7qRHwLzmU9rZRPutmrycUsxZEy0WlF8ToFipmN50
 jYSCUNEhyd+e4vQTJZNtsl702By0hIgcKvGJL2fisO5K4moc4Aj7Vo2DMu7etvIL1fLY
 OxgrxLTKMUpDXKp+ga4SwmZ30AYPxGiJw+WjNg1LsWXxUtxdN5AODC4P0ljK8MVgeEFe
 UKhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=meAi/lVb
Subject: [Buildroot] [PATCH v2 1/1] package/cloudflared: new package
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
Changes v1 -> v2:
  - fix Config.in syntax/section
---
 package/Config.in                    |  1 +
 package/cloudflared/Config.in        |  7 +++++++
 package/cloudflared/cloudflared.hash |  3 +++
 package/cloudflared/cloudflared.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/cloudflared/Config.in
 create mode 100644 package/cloudflared/cloudflared.hash
 create mode 100644 package/cloudflared/cloudflared.mk

diff --git a/package/Config.in b/package/Config.in
index 0d31faf354..5ae5c5334e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2373,6 +2373,7 @@ endif
 	source "package/cfm/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
+	source "package/cloudflared/Config.in"
 	source "package/connman/Config.in"
 	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
diff --git a/package/cloudflared/Config.in b/package/cloudflared/Config.in
new file mode 100644
index 0000000000..3a1a715dc7
--- /dev/null
+++ b/package/cloudflared/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CLOUDFLARED
+	bool "cloudflared"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  Cloudflare Tunnel client (formerly Argo Tunnel).
+
+	  https://github.com/cloudflare/cloudflared
diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
new file mode 100644
index 0000000000..f3610edcf4
--- /dev/null
+++ b/package/cloudflared/cloudflared.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6e5fda072d81b2d40208a0d244b44aaf607f26709711e157e23f44f812594e93  cloudflared-2024.3.0.tar.gz
+sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
new file mode 100644
index 0000000000..a83fa8227b
--- /dev/null
+++ b/package/cloudflared/cloudflared.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# cloudflared
+#
+################################################################################
+
+CLOUDFLARED_VERSION = 2024.3.0
+CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
+CLOUDFLARED_LICENSE = Apache-2.0
+CLOUDFLARED_LICENSE_FILES = LICENSE
+CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
