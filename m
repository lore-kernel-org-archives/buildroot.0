Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BE4CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 22:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A186E600D4;
	Thu,  4 Apr 2024 22:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeZtvDgCV1LA; Thu,  4 Apr 2024 22:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A47D360651
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A47D360651;
	Thu,  4 Apr 2024 22:38:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32BCC1BF31C
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 22:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FDA560651
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 22:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2VibIaB0fGA for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 22:38:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3043C600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3043C600D4
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3043C600D4
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 22:38:15 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7c7ee7fa1d8so51823939f.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 15:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712270294; x=1712875094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HjUl57jIkbwF2snN1jNruFLKJfCPoEkYzKKqsUIAcoQ=;
 b=k6i2/pULRiRiyEpLyHrzIwxCjZ9hBO1HXFdYyxhTlEEjWs7+1b0xA2No6PLeLOE8Wx
 GIsTiavnNshDahcVzm5XeNjLweRAsGzYe00Dd4JZVhngQMI/AQ4oqymOA+/6qMqXdThm
 AbNRDIvF2ouQpmVr3w2Q3rJDfG0DLtbWafTyHYRqFdIeorYza0IkqVFaK3YsrRsMckfp
 JyZ10wDp2/LCNxQfnX7XHMdv+C2PqyyN2iMsnc1uZkaFGHpaI8/N4DSVuTLuDVzfBEyM
 U0r31C9TMLZUwDB3WjYJiwQR5PLFYHBYPuZnU8oUpYN4PaBUDmbsFm+V7RCGUdOYHy/3
 TPIA==
X-Gm-Message-State: AOJu0YyK80U9voTICNgc2lC9K9SceYXSX8Yn/U1ErkMyM2Yu79GGRn++
 vdaccEh/saCBKFazMk6XT4A8V07bTZLFn007VBd22iNfC5Mb1HKIeKU+PYcFrDk=
X-Google-Smtp-Source: AGHT+IFDKTND/1cbX2z1sbj0K9vcCLuDNuz6Z4V0dY2NVhJn2x/2x720AKnDuisDdH/WFyosrU5z7w==
X-Received: by 2002:a6b:4f12:0:b0:7d3:569c:d7af with SMTP id
 d18-20020a6b4f12000000b007d3569cd7afmr2505751iob.4.1712270294644; 
 Thu, 04 Apr 2024 15:38:14 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 o16-20020a056638269000b004773b82c69esm178299jat.164.2024.04.04.15.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 15:38:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 16:38:11 -0600
Message-Id: <20240404223811.922613-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712270294; x=1712875094; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HjUl57jIkbwF2snN1jNruFLKJfCPoEkYzKKqsUIAcoQ=;
 b=NPK5zhBD54jFBey9e2LWJqHXtdAMauGYct7qYXDCFMaCY6giao1uvTScIwnS20A4Zt
 lt794lJI2ffLtOGR6qZBaRj2m4knE+Vhs8s856Ey8+CtfkLJ/h5DE6nIMNhTmjS7gGSv
 oPdqdcP5RaIqhRAxiZG0LJkLpF5kKr7DdvTYf4iRA6UZnAQ0/YQ0kiwJuwwxyHr66hRX
 307apEQZV9fLqyri6wHbkwEzT7O+MmC7damZ5BCeIWu8v1e0O+v1CULvQTPnq3T8NSgx
 gnzhzpDYGVuuxkRF7JY6TxVl4Yje2WWFhcr5/gxf0mJG0HUWdo2hAQ6K3gEij84OdrdH
 vpQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NPK5zhBD
Subject: [Buildroot] [PATCH 1/1] package/cloudflared: new package
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
 package/Config.in                    |  1 +
 package/cloudflared/Config.in        |  7 +++++++
 package/cloudflared/cloudflared.hash |  3 +++
 package/cloudflared/cloudflared.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/cloudflared/Config.in
 create mode 100644 package/cloudflared/cloudflared.hash
 create mode 100644 package/cloudflared/cloudflared.mk

diff --git a/package/Config.in b/package/Config.in
index 0d31faf354..e0bae1db6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -94,6 +94,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bpftrace/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
+	source "package/cloudflared/Config.in"
 	source "package/clpeak/Config.in"
 	source "package/coremark/Config.in"
 	source "package/coremark-pro/Config.in"
diff --git a/package/cloudflared/Config.in b/package/cloudflared/Config.in
new file mode 100644
index 0000000000..d112e4ecec
--- /dev/null
+++ b/package/cloudflared/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CLOUDFLARED
+	bool "cloudflared"
+	depends BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
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
