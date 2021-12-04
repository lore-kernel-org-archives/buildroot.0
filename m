Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596EFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 23:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB3DF40493;
	Sat,  4 Dec 2021 23:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHCMYcz1ezJu; Sat,  4 Dec 2021 23:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DCB540483;
	Sat,  4 Dec 2021 23:40:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C19551BF34F
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 23:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE34483112
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 23:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRHLK5ARXxzA for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 23:40:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71497830C5
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 23:40:18 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id k21so8507542ioh.4
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 15:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DgiWZamhu0Hrpu5yU8OhHZBjDiF7wEVY7x16Ko7ajX4=;
 b=Pb0WT6RioE47zvrZqBLCeOFrICFI80/jak/zWFi0OMAZC3iquj/he6MZgXFylYh2UL
 3PAbuMl6MJEP4jhbqvNE5VJM8zY4KsabhhKJn2bIMRFAbr81l+x2+fUNfqZ3y0/9BAFO
 sLTmxhxG52yK+FRJVU+LdjP3710CIr4BjhmLdFcPQhAXkdfAHgQK8c7zSDIbQLKOW/01
 sOwWVRZc/NOx8iRW//Pw5Ig9pqqywwVJ9OEN/aZ0w7+dZSc4AdEW+YYSqnWQspX/xf0q
 Jfd2vZ2wyuxg0nKMMZq7tVJPKlNYWB2Bn67SQ9U/iJTx50pcKY1/US+kfYt/xdDZjMTB
 kgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DgiWZamhu0Hrpu5yU8OhHZBjDiF7wEVY7x16Ko7ajX4=;
 b=xUWrE+CXkweOZc7QP6BPi45vGiL9a1cX0pxnYuZZX8bJf18HtYbTbDeUIO9QGQTmF8
 pLMBKfSG4agOtX6IAJED+n0+ERi+Z7SKYNdYfnLFpj2VQtNKz8NLMxivKvQv+5GBcomI
 FQrzp+5sO5mIFa5d7V3VTTp8vBhay64GHtHB3/kxqTPDEuIFic/EpEGwaHpeo27EGuaP
 XmNa9qwi/k5MskH9b1phD9fj/O1q00VqBwOT2tHKd/sAhqK5A9dMY7DA4BD8hIKUTnCE
 rPAw61BoTKXBiv65cIK0H3DG3YpByS7a80XRf3HdPQUOPI3e5RojhlqvpHx0dZ8ET3oh
 biOQ==
X-Gm-Message-State: AOAM53328YKfqCBFGWP3xF42KdScO67lJegCPfM4I35CXR/uj8UvDxTW
 vErhdPq4p3ThLjCxl/UopITk03jNnCY=
X-Google-Smtp-Source: ABdhPJxZ7l3tiLnueg5HaiSkR4ru+3rNUmtoFp8XEO6rsUXaka+x9FEJ+8vLy16Uqz5PV8wfzK3RAA==
X-Received: by 2002:a6b:6815:: with SMTP id d21mr26702890ioc.206.1638661217375; 
 Sat, 04 Dec 2021 15:40:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id o14sm3954820ioo.36.2021.12.04.15.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 15:40:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 16:40:05 -0700
Message-Id: <20211204234005.2051254-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/iwd: enable required kernel
 dependencies
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
 Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Required kernel options are listed in check_crypto() in srv/main.c:
https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/main.c?h=1.20#n268

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - remove optional kconfig options
  - remove a duplicate option
---
 package/iwd/iwd.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 96bdc56e93..1d0322edc3 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -63,4 +63,27 @@ define IWD_INSTALL_INIT_SYSV
 	ln -sf /tmp/iwd/hotspot $(TARGET_DIR)/var/lib/iwd/hotspot
 endef
 
+define IWD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_KEY_TYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CBC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CMAC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_HASH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_SKCIPHER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEY_DH_OPERATIONS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS7_MESSAGE_PARSER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS8_PRIVATE_KEY_PARSER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_X509_CERTIFICATE_PARSER)
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
