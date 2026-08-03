Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB84C5518F
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 07:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C9E405AB;
	Mon,  3 Aug 2026 06:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zBVVpCCqKFX; Mon,  3 Aug 2026 06:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4F33405AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785740397;
	bh=d0yxRBQtFacKa70aKbv1wQIKAYi7XBVZflFLsCb5XFU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PCvVw0X7Jztaa/7t3t3rCe97q15tOOMVgeQQSgIHIpZ6xTBliNBvPD+Oua1ErCeu0
	 zyNMM6il+FbNV1XB/t5B+QYxosOiDX/shs01Vq26KRqB2dLI4cV/vyTRFhwW/TjXsG
	 JGL+M3QditNtiRJFkxavMxegQEGMx4tXcq1QMWiseazw/VLclMhNxV6cm7fkEJuI7z
	 /1X7xKLmXG3/vNyK+3ySHPL1aBQhhB9VMqZ0MY0EJ/16AQUcGENBiW0PZZC17wAKm6
	 DS6vQysd2UH7o1HeTv+3l+s6rx9jK+TSXowQcIKc7PVAax2YSk+32jt05ZA8RqimrF
	 Uf+U/5IHiivfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F33405AC;
	Mon,  3 Aug 2026 06:59:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C410C26C
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5FCC80C9A
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4G5RJuIER5N for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 06:59:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7616480C9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7616480C9D
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7616480C9D
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 06:59:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso19283385e9.1
 for <buildroot@busybox.net>; Sun, 02 Aug 2026 23:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785740391; x=1786345191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ce9F5z8mGf5R5ont12/7iHQZsSXsthEn1dHBTcu9jM4=;
 b=kexJiD6MpRapPeVbN9rdhazM1ewpake+yTtrITWXnssxVEt9UgIrnGIC79awc2w162
 hVmOMwVTHqpI/mk0WOx5n+OlgkgANy0asF77O4DVtOZNbDEg9kUoRtObKnKa2RvhJQu0
 UUrJqlB4CH5MiCU5gbB1xi9AUjBDd2bk67QmZK03aI5QpuoIHiqVPsiaRE76+AYbhns+
 HyrpX8nkKBsUU1CYrBxgUzGYBkRxna+FdeFH8msrnHiiaNJy/7ZenRny2oDA+IDqf+9c
 utaUJNRnk+9Dc/DFhbaWEPq432Fs24TbVIAyWbPRXAlLreoVKLmN8VK+f5iotWEtRUbL
 sNXQ==
X-Gm-Message-State: AOJu0Yxkx3/52kmW6SaGm/tZLaud3jNJTjnoIuFssl5/vsZPfl1+9PXL
 kCXvo5A3nQuZYU5+5+YQmq+Qqtuci5hmm7s0AYUr24WJ4vQwoewTigua9WuWaQ==
X-Gm-Gg: AR+sD112cZ8YWGVv/vzreNat+hcscZRwdKNipy2+VQ/xD4H+k6OlE1K0iAhOKJyEj1l
 HlL6f7e4UiPEACsVewgsq9jGcpkTnmPo8XBsTwVMcePHfqZxp4r3+V2oT4Ro3kR9RT860tFE5+S
 DvH+kEpRiHVz9tKYxKR7DFw1e2RCyqz1FnWzZ8pPyW1ZWrwtFezNAAexc2MU0YgsgU5ic+3kQoY
 F8j+m/4bTWcIKvhh21JYViV8AvT9X0eDue3eRSWvPG07brTS/MkuUZuO6VZPZeVx0D0Oz1gNOfn
 jW1m5Xt1PjBjvK6YBbt8noL+/r/yEN/vaKxrxYuZCx5qOVWZ8zQqS2Jcz4JurPOziNjMkDtyKXR
 CIYBSNzFwkMQg4uE1LqNJJba8Lr6rAXP1dkzNpUkUfG+lfzPOmqtdAyxbW6fPpuMKND27711zFc
 OyAzb5j4oRzuG/8CG+j/faspDpdkAsXAeVIU676dWuZwfdGzaxNyBzOXVhW2P8pZ8SE2fhEY29D
 N4m+jZR+7GZPuKgOB20FQ==
X-Received: by 2002:a05:600c:c113:b0:495:4689:1e98 with SMTP id
 5b1f17b1804b1-4980c674e1dmr146779025e9.10.1785740391410; 
 Sun, 02 Aug 2026 23:59:51 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b5b4a2sm234639805e9.1.2026.08.02.23.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 23:59:51 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 08:59:34 +0200
Message-ID: <20260803065940.224429-4-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803065940.224429-1-francois.perrad.86@gmail.com>
References: <20260803065940.224429-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785740391; x=1786345191; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ce9F5z8mGf5R5ont12/7iHQZsSXsthEn1dHBTcu9jM4=;
 b=DysL2J43dOLJDRJIP6SQP1zM+3JY07uwTZMFNKZV/pGtmJjvNu7xvbGMiy8ahmzfCm
 MVJ91zrvMPKanQAVj2KfhrlIedj+bkPaZN8j02VHNRit+H98cDw/WdsPAjBgLEiCcOcy
 JHJpPGEDJN03PzyA47+hhGmvmDaElHh/E/wKVsNwEjr7oLetXZ6aKnlVMIKywLZcyieB
 gn1M63IQXWDKwacQCgePU7Sw4Aob1xYnCrWYQo001NeIFP7vAp2dud8HucO+Cc61RM0f
 1tRZ4Hcs6aMULokQufZ5KtPh9Sy0xOBBw3RGaoylUsf8LjlozyzEpuFzJVYdFEZO42Ni
 SVYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DysL2J43
Subject: [Buildroot] [PATCH v4 3/8] package/harec:  new host package
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
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
index 000000000..d439eb3f5
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
+		PREFIX="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
