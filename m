Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EF5C678D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 13:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A1761062;
	Thu,  2 Mar 2023 13:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A1761062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkkYJqb1K5Xq; Thu,  2 Mar 2023 13:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6157861192;
	Thu,  2 Mar 2023 13:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6157861192
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D8D31BF290
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 13:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 176E5820A3
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 13:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 176E5820A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1ZXq_3SpgLD for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 13:47:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CA8182003
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CA8182003
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 13:47:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so1531718wmq.1
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 05:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=krrViPZNauAPp6yuwSTpmqCaP4KzHry5PYTYSBlgW7A=;
 b=w1MYiJ17P64h8nhwsEBlhNRhpz4+PeQ1QjttDkJMfP4zByxy2mGmAXHPpKEsCtXfh/
 2X8PYcTsLZjGKvXxFZRd2+FI1o0nBx4ZgQtDSuCsg8gbTlwAkS9owy2ATxAyT6wNiMIo
 HqIDj7Ar8ZjuEk3QaJv8LJp3k9oUfE9xKB+h0z9D58uUU14iYwTRbkLKx9Uz26rHCF1J
 3+fex/al65nM2z/8yB1IJMl5FndSAw/X+NFUrolDg8+xXCOWgzHHuy6Ts75uTF7E8PGp
 +I/Z7BNZXHTZzYL2y/yPc3k7pn8+raRu3dlFZtEz6OgAU8DhfrzTZ8fGVg/HT1715Vm/
 DS4Q==
X-Gm-Message-State: AO0yUKW38w2jGWy7OG8ZWg7IsPdq/fYHPDtzGyHc9boL3TWHpD3txG/y
 UjNFemhLyKbwj9hKsjPnusqeskHtKwSlcygW
X-Google-Smtp-Source: AK7set/s/Kpb8mcVhZpjXTEwdQv+n4+FEP2Ty3r1P/UNNSenU/OoxJBY+laZUym6+fFyBKfqVCGsdg==
X-Received: by 2002:a05:600c:5408:b0:3dc:433a:e952 with SMTP id
 he8-20020a05600c540800b003dc433ae952mr7424886wmb.33.1677764821183; 
 Thu, 02 Mar 2023 05:47:01 -0800 (PST)
Received: from P-NAN-LIMA.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600012c300b002c5694aef92sm15258205wrx.21.2023.03.02.05.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 05:47:00 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 14:46:54 +0100
Message-Id: <20230302134656.1780843-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302134656.1780843-1-sebastian.weyer@smile.fr>
References: <20230302134656.1780843-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krrViPZNauAPp6yuwSTpmqCaP4KzHry5PYTYSBlgW7A=;
 b=gspe8ecdVCJy08a0zNNZ8/Pn6sQ+xiRkZNEgXpxmeOHlgpldyK8MH86WNtOF8W52+H
 MkeDaICbCfIGqAOBaM6m2Nkw6FSO4AtV02PvBuYAXPgP6ag++Pi78PRTENwoY5N7t1w3
 WSPrQVflxo66d5Qcp9yZ04z/BiDGLrDe76JtYhVNBMwBNup0M348HippWhO9u3Sy5QJc
 TNuw2ctfQ6m41LJcEB1D9GtAtnpZY24/9j6b7v8R74GVO3IuX1laPV/sl4CMAS2ZVqt3
 /OmFVRI6vjFn2IOygqBSg/0Ri03l0Sb/bUo6RAYGSabVaumUghmzh0wLncmE2uGalVqg
 18cA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gspe8ecd
Subject: [Buildroot] [PATCH v2 2/2] Automatically place default files for
 the nushell environment and config in the appropriate folder to avoid the
 prompt at startup, asking if you want to create them.
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
These default configs are optional and might not even be necessary, they
only prevent the prompt at the first startup of the shell
---
 package/nushell/nushell.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index f1b691ada4..32732137c3 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -10,6 +10,15 @@ NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
 NUSHELL_DEPENDENCIES = openssl host-pkgconf
 
+define NUSHELL_CREATE_DEFCONFIG
+	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_config.nu \
+		$(TARGET_DIR)/root/.config/nushell/config.nu
+	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_env.nu \
+		$(TARGET_DIR)/root/.config/nushell/env.nu
+endef
+
+NUSHELL_POST_INSTALL_TARGET_HOOKS += NUSHELL_CREATE_DEFCONFIG
+
 # Add /bin/nu to /etc/shells as in package/bash/bash.mk
 define NUSHELL_ADD_MKSH_TO_SHELLS
 	grep -qsE '^/bin/nu$$' $(TARGET_DIR)/etc/shells \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
