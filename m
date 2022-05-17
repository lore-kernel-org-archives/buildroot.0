Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC58C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 10:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3B4813D9;
	Tue, 17 May 2022 10:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qn7iZILf-dyy; Tue, 17 May 2022 10:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6A8481362;
	Tue, 17 May 2022 10:16:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 124811BF28A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E54940474
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTC2zM1IUsF7 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 10:16:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A272400FD
 for <buildroot@buildroot.org>; Tue, 17 May 2022 10:16:30 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id s14so16923785plk.8
 for <buildroot@buildroot.org>; Tue, 17 May 2022 03:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HQPAXnosapTSFzYNKYRzofKLlReLdd96P07hG6NBuNg=;
 b=EpWU62i15xfk+d3o57SjtZjS0moU41Ili9kW6/YVZoBIK0grydccaHQ5+4hf49/ADf
 WTr2Q4qB6AemBR/+im0EAQjsh1+JF4wLhwXeCEaswu/6k7357fkv4WhXlsqWJjWY51Wx
 up3q3GFtSCYiwKPFYHb3IJD20PHYfJme2poNZ8DkoAxg6A+jO0rKs6es5SDsbSXRh/aE
 u3UK0Ubzsug+lyoq4gWCrJ7Gxr2KVrRV/s2X8pp6z9jMq64jCGV7fOJG+YpLjdbCNREh
 JgDwEflDe+7/oSGBC1uqD7Q58e5ZcW+ndIaGd2IZCgkhL89PTkbBDLjZ7vTe55HD5DZv
 9sVg==
X-Gm-Message-State: AOAM532TMqPEka3NZKnz4wSDr8BpBEucLRh3aIMnk1dv588/uxe6b/oB
 E6T5oyfsuBRV/k61sepugcSjJiUJ9Wgz4w==
X-Google-Smtp-Source: ABdhPJzEKgjyojJxGuP/r1OduLKjbVPFCQ5bKhMNrmfAdP3PY9p5v+W6m0Uooc4z7tDeTqeDH8FMvQ==
X-Received: by 2002:a17:90b:4f43:b0:1dc:c1f1:59c9 with SMTP id
 pj3-20020a17090b4f4300b001dcc1f159c9mr24194546pjb.183.1652782589445; 
 Tue, 17 May 2022 03:16:29 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 b7-20020a1709027e0700b0015e8d4eb1c7sm8680572plm.17.2022.05.17.03.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 03:16:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 03:16:24 -0700
Message-Id: <20220517101624.3242600-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/pkg-utils: avoid overwriting =m
 with =y
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The KCONFIG_ENABLE_OPT is intended to enable a required kernel configuration
option when a package requires it.

However, this will often override an existing enabled module with `=m` with `=y`
which overrides the module to be built-in instead of separate.

This is undesirable behavior; we often want these as `=m` and not `=y` to reduce
the size of the kernel image.

This patch changes KCONFIG_MUNGE_DOT_CONFIG to prevent changing `=m` to `=y`.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/pkg-utils.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 7d1aea7710..96b15b3d46 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -21,8 +21,16 @@ KCONFIG_DOT_CONFIG = $(strip \
 )
 
 # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
+# If setting to =y and the option is already set to =m, ignore.
 define KCONFIG_MUNGE_DOT_CONFIG
-	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
+	OPTION=$(firstword $(subst =, ,$(2))); \
+	VALUE=$(lastword $(subst =, ,$(2))); \
+	if [[ "$${VALUE}" == "y" ]]; then \
+		if grep -q "$${OPTION}=m" $(call KCONFIG_DOT_CONFIG,$(3)); then \
+			exit 0; \
+		fi; \
+  fi; \
+	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3)); \
 	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
 endef
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
