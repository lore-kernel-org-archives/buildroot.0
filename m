Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D02C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:19:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6383761027
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6383761027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 114764015B;
	Tue,  9 Nov 2021 17:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0uxkX0l33-Y; Tue,  9 Nov 2021 17:19:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26F5740186;
	Tue,  9 Nov 2021 17:19:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6686A1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 561BE80ED3
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7diMUKibDJm for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:19:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C37380ED2
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:19:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i5so34303640wrb.2
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jnRbWdeXffiNO16BsL+aX9ACKv0FQwbCvDTFPPcyi/s=;
 b=pSlhu8WdMwT0izIKOYlazfz8PSVwQ/TpilFqx0La+EG0st+odlQsio8LoUhjvNBnDP
 k5EO9vn7gAvMCHvPjdCwG2kZ0APMI0jirAZ4VZG/+0OytGX+4pC3YFRNrM2DJiankXN+
 ZibtPDk0B1QQFBBqD+XSzkS36gKriN5/McQ/aQfeX3rlbcKHKrRMketH/hVQR5kDLLJ+
 XK+NlkPRVH7PlsLDpJqI/tc4EhW6PlmMVUF+qZ1hhZVvDOs1EFclD2SzyXNY+VhDMcUE
 eTr1zIpZ32QSo0W5/QXbe7vrgy3B9PfYklwdar5kGDlm2i+8DgSoabDy9HIkpYITYhR7
 fgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jnRbWdeXffiNO16BsL+aX9ACKv0FQwbCvDTFPPcyi/s=;
 b=cIj3XDhcSH0+h1jMQvkveg5qfl5COat6BCyluVgkA3DwgPIXZjV7SYr8YrXeBvR66b
 YtKWvHPm6KOTBjWgyNxls2E0FgYM1dLdqkRDfE5fgLK/vWvrIEZF39/Sb01p/qJCjocO
 R0pHRuG32cwpTJmoc7OW/b3j6mPBwIlszQgMOiMlpxKBKRPSDZxQplJkpeo8aQ1p0sku
 Zu8B8GPTNPOcadi1p0EnCN1hDxRnZl8VpPNg2XO2SOpT+JN5JkpYCIuA85z1sHRqpDtV
 BhA9M4QJjPxmzdBmk8cXlSBJEtE6+Nlthj4PgC7Is70ltqMA5PAbRxRwMuPPUjBNGh5t
 Bcpg==
X-Gm-Message-State: AOAM533N1lgxKfgv0FsqVIr1GqxVXYg41DWlb4gIL72Fw03YQb/hwMhN
 7X6aa7MJRE3jlAoFPHoyUF7bq68CYtA=
X-Google-Smtp-Source: ABdhPJyiT7JiyJOGaPFE9DuHuhs6mlIBnNBfP/BGa9mVPou18ywmLcg8wZX6KnZZwpsnod7v9L20xQ==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr11059837wrn.183.1636478360087; 
 Tue, 09 Nov 2021 09:19:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o10sm12010180wri.15.2021.11.09.09.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:19:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:17:23 +0100
Message-Id: <20211109171723.456852-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libdnet: don't override dependencies
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

Don't override LIBDNET_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdnet/libdnet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index d1cc0bf150..3d3fcbe605 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -16,7 +16,7 @@ LIBDNET_CONF_OPTS = \
 LIBDNET_CONFIG_SCRIPTS = dnet-config
 
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
-LIBDNET_DEPENDENCIES = python
+LIBDNET_DEPENDENCIES += python
 LIBDNET_CONF_OPTS += --with-python
 LIBDNET_MAKE_OPTS = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
 LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
