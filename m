Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAC3C678D4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 07:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A0A41970;
	Fri,  3 Mar 2023 07:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4A0A41970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CqnVYq9mpsuO; Fri,  3 Mar 2023 07:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E47F41BF4;
	Fri,  3 Mar 2023 07:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E47F41BF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BD971BF3FC
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7461A81331
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7461A81331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y17EBOpfKABU for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 07:39:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCAF8812ED
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCAF8812ED
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 07:39:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id bx12so1326947wrb.11
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 23:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFZYGLu+jKyVom6DqTJTWQnGmObw6S30ZfS0DONUooE=;
 b=zfjFMHx2NscJ4zabDvUf6zMpr6nfb1YBv3a0Eku+AaJ3Qb0XjkXrt0BV+l9jGKOaN4
 Yi9hR6HeTp7NopJZGgeVV/jvtVhWC3R0R4j2YExnQq5DC6DB5uKe0PTeRQYUuLtM7g2g
 IENRnbtjPuoCD15teD475KbZBjcp+WdPdxf+Rtdo042S57UvbKNZJNin1324nMJuxqc4
 Ty1EhpmKVDKX5mWhe5+Kt2J/GifDq8kZzkGUDOz4wI149CVn/O3EuwwMw+xRA00iPHN3
 bv5kDeg94u8Wv27dWFswtJvMBV6p+vI/YeFh4zXrPmLGXUYbUHlgMPDbuvYDCwbGd08/
 CyWw==
X-Gm-Message-State: AO0yUKXdiRxLndQutgNJ4gjXs0v+EuFmj9IAgyP7WSoS8XNkuOIHTIaj
 SjmBFiwh7yUGgjlWwgD8jG1XxNmB4rxRWqfi
X-Google-Smtp-Source: AK7set/ILwlSS0WSSa8wv7hwuvYndkAbti10lvmDAd+sgrDFIBjdpujqT0MxWkv7frOqZCY2xDnMzg==
X-Received: by 2002:adf:f64f:0:b0:2c7:d7ca:4c89 with SMTP id
 x15-20020adff64f000000b002c7d7ca4c89mr668314wrp.58.1677829163334; 
 Thu, 02 Mar 2023 23:39:23 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:98b4:4a16:150e:c276])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a5d5150000000b002c559843748sm1419576wrt.10.2023.03.02.23.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 23:39:23 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 08:39:08 +0100
Message-Id: <20230303073909.1798364-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303073909.1798364-1-sebastian.weyer@smile.fr>
References: <20230303073909.1798364-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFZYGLu+jKyVom6DqTJTWQnGmObw6S30ZfS0DONUooE=;
 b=12HAvk2ZqoebJam0lg+YgXRHFFqRJLBhEYAJnh4tXWnEM5q6s4NusOh3+xdUg18E5W
 9UfzC3ArNfWcLgakL3hbWEAj1w8Y0Fgu/FGV7WI7aXh+bAre2LgGLPrljUqsU46QbDIV
 paKcY6IWnI5Bsww2CvaktOt2HOcuCrnwNr/At0abVCHEYv/aqQ4y1Fwy5LYsM2c23HF6
 l5m5QBiNYqHxDikduILmR5OsfjobuRHotb09PMjYXJrmARbXj6V+Jp+ciDnjjrbZo65y
 N3l2v6qWpCkYqTQwobF3f1pEcxQv1/pvmEvPGrd+V+X9XFbwwnfWif/b7V8j2MadOH+o
 JSpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=12HAvk2Z
Subject: [Buildroot] [PATCH v3 2/2] package/nushell: Add default configs
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

Automatically place default files for the nushell environment and
config in the appropriate folder to avoid the prompt at startup, asking
if you want to create them.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
These default configs are optional and might not even be necessary, they
only prevent the prompt at the first startup of the shell
---
 package/nushell/nushell.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index 7de02cfc6a..42a6765460 100644
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
 define NUSHELL_ADD_NU_TO_SHELLS
 	grep -qsE '^/bin/nu$$' $(TARGET_DIR)/etc/shells \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
