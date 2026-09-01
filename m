Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE16C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 14:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECC4360758;
	Tue,  1 Sep 2026 14:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6KGvI2XhVwJ; Tue,  1 Sep 2026 14:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788274355;
	bh=xhK8Z2yOG2A7yGTyC9Lnjc1iSQmOLqEZyzLYBGQJzq8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mck+7IlWMgwxmFCT8PTGZgNQTXQYEw8nujNhpCuHJjrDT85/b6ca/lB2dzaPvAtP7
	 hK7SJG4lEld7Lngso4J0OaLrk+9NX8R10pDoRc7sV0O6dOpCgCDDeOjFWHN13oeLnl
	 tpwcEY66hoTFncTaY9Gwp9yquePsXFi9w3sNDXUXcb5wFezX+3mzjkON1T0Mfa9Vr+
	 JkNr4UbmS5GA3Hv+3kTjdTAkMRjQhYl5TgDPGzgYY882NM8D0QQsjDJPE+mCjX9I4t
	 o+JK6o66YF2iIIq3Ej6ZeN+Nj/prBYpmlLZvEoUYfXDVW0l/BynQSTMtRPtIxY/iO7
	 gYS3Yhk9tJYJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0511F606F6;
	Tue,  1 Sep 2026 14:52:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FDF72FE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91921606F6
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWH8KYD3JbWO for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 14:52:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=q7SEzpvN
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C47F606C4
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:52:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49b8f86c6deso29002045e9.0
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788274350; x=1788879150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+m4OJGJnNSngmOQvaZ/VgtiyPn6ptrmypAL3GS3XINc=;
 b=q7SEzpvNzgW+8EjUgkq3aUoSXsF+o4dHgg1dl32WQWRBITGSPSi0c8nlJtoCsE96Q5
 A+yn4obeVcOQ3r6wAv3rqNlpx5K3RpAtd/yR2DW/RyaQa056PqMP0awgheTrLf0UVlXp
 9kHoaGLzNSC8cEcroEzNesxrd1qJTgvdNDTP3+WnbAy82I9AZPV4W+YPfl47N9cxBoRq
 RMduKlWGdDuwIxyctreAHgnzwJEM8xP/7wZ7Z13gcxzguqhgt+01ypSaj3ch/vZGtios
 epuHYSGTq1ctaqkIkfXmzANaIffw/s/UVBBqrR6iaEgS4rmWHGFgOJxVHFsdFci10zZP
 eYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788274350; x=1788879150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+m4OJGJnNSngmOQvaZ/VgtiyPn6ptrmypAL3GS3XINc=;
 b=C74ycgTY3vayB+QJa0Yge0vPhPezTJAMKZJAFLIlFGo+yhJH3kavOXpmiX7aL/4XSM
 0gN7ZNosLmGxq8RMB69PcEq/pwu//1CrNASN8xVGjhvMU5sxx5Y26JampwkHzAOixj4R
 eJOwvsn8UDMh9L1Hp6GlM9LSHKHCBfUcePQr/o5uaatFzcQqOacqt52x7XDrkbWiS34y
 y+R4P0+QUdgP8Mgf1rhpgJJBWI3G2JGKWX9K/vTfH4wLiH6T0mjKMo5P+E7CBmwjSu2a
 R7zuRZJf4w7xt6PcomraFLrP9ZlGcJ/K8KgDWtLIYUh6WL8XjSF1hjKDEzKGBvYMeRsx
 meIw==
X-Gm-Message-State: AFuF++kVrB5EjqS/p6BsPPQu1kppY7EGcOew5QsFBrrO1XaMYm0s0pl+
 Zpu+xjbvvBNgPgmkzrsLE6dWd8Xi0+QDUhBN1CqaPZ5HNCc2dqtj2SAtnpr1JA==
X-Gm-Gg: AR+sD135Gdgo/OsOmtdaDq5uRqpS+eLaq0J0HFMDLY174JHKHHTx/grmq4sqRL9Ya+N
 0jZ5hRHoxFRRNQDVXDrXT3FpBuqfwUA5PteaQcEQS8uC3eN2tRHMFj/OUXEv3JbbJfFmh80kjaH
 nvrnKmsHYjee7yY/LnV3IRk3S8nAkY+OPFJ4mZj7nxtFmLN+hrhmPlpLX9FmX7WWFKSRjKMTyhv
 yqfaZpjiEMwi01y4jIi2SdkTx5r8b/dEOKacK5B1mRRGgpGIKi/nkY4yWkLu5RsY53jMZb3jAoN
 e+dExdOxkMGvRojLQuQ+6y8xwFieLDwvVt7t3WQiCCpfc7VGH65uN0pSwaKwy7gwVAq3bgWayt2
 vHzAuNlBIc26cegMQ91I7Y4qrWtwYCR1XZHP43Z+FJsL+MCWjjY4eLigQLjsH+MD1b1HnMMpzW2
 sotlYwYm59o5N5jsPoCOli0FFpg/sXuF7TnI/kQhe9v4lW+HENAvBxQySN7dpgg2wDGQP6DZggX
 42i69UNbQw9rDaJ
X-Received: by 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id
 5b1f17b1804b1-49b91c3b7c4mr605648585e9.10.1788274349547; 
 Tue, 01 Sep 2026 07:52:29 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce44ea9sm67662635e9.14.2026.09.01.07.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:52:28 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Tue,  1 Sep 2026 16:52:24 +0200
Message-ID: <20260901145225.579733-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/uboot: support custom DTS with
 CONFIG_OF_UPSTREAM
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

Since U-Boot 2024.07, boards with CONFIG_OF_UPSTREAM build their device
trees from dts/upstream/src/<arch>/<vendor>/ instead of arch/<arch>/dts/,
so the files copied by BR2_TARGET_UBOOT_CUSTOM_DTS_PATH were ignored and
the build failed with "No rule to make target".

Derive the destination from the U-Boot configuration, including the vendor
sub-directory taken from CONFIG_DEFAULT_DEVICE_TREE. That tree keeps the
Linux architecture naming, so aarch64 has to be mapped back from
UBOOT_ARCH ("arm") to "arm64".

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 boot/uboot/uboot.mk | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5b3f46ac74..06417da06f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -426,10 +426,26 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
 
+# With CONFIG_OF_UPSTREAM the device trees are built from dts/upstream/src/
+# instead of arch/<arch>/dts/, in the vendor sub-directory encoded in the
+# device tree name. That tree keeps the Linux architecture naming, so aarch64
+# has to be mapped back from UBOOT_ARCH ("arm") to "arm64".
+define UBOOT_INSTALL_CUSTOM_DTS
+	dts_dir="arch/$(UBOOT_ARCH)/dts"; \
+	if grep -q "^CONFIG_OF_UPSTREAM=y" $(@D)/.config; then \
+		if grep -q "^CONFIG_ARM64=y" $(@D)/.config; then \
+			dts_dir="dts/upstream/src/arm64"; \
+		else \
+			dts_dir="dts/upstream/src/$(UBOOT_ARCH)"; \
+		fi; \
+		dt=$$(sed -n 's/^CONFIG_DEFAULT_DEVICE_TREE="\(.*\)"$$/\1/p' $(@D)/.config); \
+		case "$$dt" in */*) dts_dir="$$dts_dir/$${dt%/*}";; esac; \
+	fi; \
+	cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/$$dts_dir/
+endef
+
 define UBOOT_BUILD_CMDS
-	$(if $(UBOOT_CUSTOM_DTS_PATH),
-		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
-	)
+	$(if $(UBOOT_CUSTOM_DTS_PATH),$(UBOOT_INSTALL_CUSTOM_DTS))
 	$(TARGET_CONFIGURE_OPTS) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
