Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1DBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 21:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0041183E85;
	Tue, 26 Apr 2022 21:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ydE1pa_SN0eb; Tue, 26 Apr 2022 21:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032E783E7C;
	Tue, 26 Apr 2022 21:22:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E19DE1BF59C
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDB7A40B85
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNVoq3IJ2AKK for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 21:22:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4C0540496
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 21:22:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n32-20020a05600c3ba000b00393ea7192faso62563wms.2
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 14:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z/Nad7E4orsVQ/KGhHAyj/asySfq6HpwGZwn6mDgSfI=;
 b=o0rY+HGBti0abCkIpZmE46+ndLGDE7bCjSW90sh4EMF8S6PglPNQFnZ/jio5gJnR5J
 UoDrumNl6a54Ng+szK+WI7EvJPeKOb1jzqj92HZDLZs48EICzZGzfJ60HIejEPH21exp
 l2+LWnF72QdrgArikUzyIJpNxguoK4JxzN7979rWbhJdoRWc5jtBa/gZotMbLzt1w0KE
 iX963AO/U0sL0f71acr65bcOvGgrB5bjWKPLlqJU071qGE0Ay2Lh0geHcn72xDvju/uC
 h3RlEmusb9JoqkiA3LMV26hkOydrhFXOzch/N2l5L+rYtcMYvs4rak0kOGo2hS3cMKDx
 7ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z/Nad7E4orsVQ/KGhHAyj/asySfq6HpwGZwn6mDgSfI=;
 b=UCua0+yGnN34sEIUld4HlzbcMRp5vuMykL/lDaSwVe2vRz7yE0e6IVyLkhYY4Rst38
 cMw10iTUWxMD22J1lP+5/8n3e+XVkcySosfkMbiGjmX4bD3bWG/07N7uNHwRe9SpWa8T
 oI8iZXAtLw8aDJztpS5musNvU08gDodAycijfd9bJrWCvYu/U+xiL9NTjIZIyk8DEncH
 TsCgy9cVUvHjzD7FcmaN1IofpB1dTaA0j+S2VLnCbqdBft/xlbCtHf8m2crwZEp0xIKs
 flwlPv7XFMKs2aSTKh/Jg9Ivh/Ve+iw122+WpoWGJHMFjqWrNHzuh6IrDkBLv/p7aUoH
 z+9Q==
X-Gm-Message-State: AOAM530edg2E8TdYakhMohcQt+SMQUWqFu92BGMeKvVEBXqBn3Q4tiuu
 akXj6vyluFfVoc8w7FZN/OGuBrtDoB0=
X-Google-Smtp-Source: ABdhPJxdXCGESr4iYaMGBhwqguNqFE8sOlznlj7aVv1Rs/p0BsWdtNotm6JkSOrrWfW8BJouEppWUQ==
X-Received: by 2002:a05:600c:1e86:b0:391:62c4:fb72 with SMTP id
 be6-20020a05600c1e8600b0039162c4fb72mr31636863wmb.119.1651008157486; 
 Tue, 26 Apr 2022 14:22:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm12836895wri.4.2022.04.26.14.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 14:22:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 23:20:26 +0200
Message-Id: <20220426212026.712081-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptodev-linux: needs
 CONFIG_CRYPTO_USER_API_AEAD
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

CONFIG_CRYPTO_USER_API_AEAD is needed to fix the following build
failure:

ERROR: modpost: "crypto_alloc_skcipher" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "scatterwalk_map_and_copy" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_ahash_final" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_aead_encrypt" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_aead_setkey" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_skcipher_decrypt" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_destroy_tfm" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_skcipher_setkey" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_aead_decrypt" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_aead_setauthsize" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!

Fixes:
 - http://autobuild.buildroot.org/results/a06708369c233f6e60a1a3ffd7a77a4edd932c9a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptodev-linux/cryptodev-linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index f9026053c8..d0c3bc5218 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -23,5 +23,10 @@ define CRYPTODEV_LINUX_INSTALL_STAGING_CMDS
 		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
 endef
 
+define CRYPTODEV_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_AEAD)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
