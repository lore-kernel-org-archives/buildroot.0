Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77089C7EE30
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 12:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E678D61284;
	Thu,  2 Mar 2023 12:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E678D61284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l46FWI0-KwpU; Thu,  2 Mar 2023 12:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1765C6119E;
	Thu,  2 Mar 2023 12:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1765C6119E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA28A1BF2F3
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 12:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B438082066
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 12:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B438082066
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6uv658650Jq for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 12:21:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A523C82064
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A523C82064
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 12:21:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g3so7452902wri.6
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 04:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJhE7oBud6V1JKW69pcaZhGnh4MCYuWzsTi6nK5KyZc=;
 b=F3PR0fMOVtZeuuCWSQ2GzfemzSCfpjsNnAuUwOePGFXrIQRVQgSP2cYuTf8u3Hs37V
 fLSke/Uh6z7BOSN/N1Txc0g+s2GCQb9WXIHYXdJd+EPMD8rek4X6TGc3AhMPYG3azrgn
 KWf374LGqcqXLWJmijRIT9prCrv5ADZdyizl7quFXFBkf0/OdQ0HGAPc51SSwAbNFmtT
 qP3YC1n0McTix+5tlXwQWjyoXrjRbQvNJKw9NqJqr7VI2q+OiZMGhS/gLKyaJkc1QK/6
 se/Z2f0/nt+ySrKMQDKHx2g49RDE2SKNJJNR5nOkm9WY6yeYiW9Mjvaz7zBtJhTvntw6
 iQcQ==
X-Gm-Message-State: AO0yUKVMmDc3Taf3Ht38M49qYZ7GWipUYLt/yy92kd8l4gcV6OMEk8E9
 jBUO37zbp+v2bYpQmJ4n+AMvXuapmhr8647U
X-Google-Smtp-Source: AK7set+ll86jRmRPMXIGG7jmRkgoO34d0UHAf1iCT3ndM+Sl7fJCwTYyoNgqkRMV+lUciyNtfxRFlQ==
X-Received: by 2002:adf:f405:0:b0:2c7:2cf4:baff with SMTP id
 g5-20020adff405000000b002c72cf4baffmr8288370wro.70.1677759679920; 
 Thu, 02 Mar 2023 04:21:19 -0800 (PST)
Received: from P-NAN-LIMA.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 i12-20020adfefcc000000b002c54f4d0f71sm15089688wrp.38.2023.03.02.04.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:21:19 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 13:20:43 +0100
Message-Id: <20230302122044.1769154-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302122044.1769154-1-sebastian.weyer@smile.fr>
References: <20230302122044.1769154-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJhE7oBud6V1JKW69pcaZhGnh4MCYuWzsTi6nK5KyZc=;
 b=P/0QiVaCpb8ju31oJvwJqw/MB0ucufB1Y5rF3pfTisH3VvIFa5d2bqbbk+NcLWlISd
 A1E31XBZAj2KCUsby24BFA5wU2COCu2oBOKoUzMKpDMAXMRyrFInE3307AuN/BoOGdPu
 4MZxXk/D8S4rfpZXzmzviNIF8dJUFHR29meJhfUV95Aq5yVuRCaGQWJc0gZlff/Jv0kS
 YBZQJ3tKdP05VF+7slnoX82MBuL0wxXfAgmZwVQJLvigwwAJjCrDyXMM08eNkN3n6ea4
 IqBWut+0KHW4MXtg371r+xFXOK/+1MRVLKA0R9cmwOYDpkNyBHREI0v62+9U65rBxtE6
 eeqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=P/0QiVaC
Subject: [Buildroot] [PATCH 2/2] package/nushell: Add default configs
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
 package/nushell/nushell.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index 6c77077a49..ff14180a19 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -10,6 +10,14 @@ NUSHELL_LICENSE = MIT
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
 
 # Add /bin/bash to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
