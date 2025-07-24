Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F32C83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 09:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A0224128F;
	Thu, 24 Jul 2025 09:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlkX7lo1jBVG; Thu, 24 Jul 2025 09:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C88541282
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C88541282;
	Thu, 24 Jul 2025 09:24:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8876F115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 09:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A06241281
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 09:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0jq0IzByQzJ for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 09:24:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=stefan.nickl@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B3C1841280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3C1841280
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3C1841280
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 09:24:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-455b002833bso3180905e9.0
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 02:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753349081; x=1753953881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vEs8B9vxG420/UsO4Lf9KQ6YTkUPUN1MOo25J3m6YdM=;
 b=Kry/piy6uupA9RJvZw7oKVeHwA9GvrmH+4EfxGktQp0Uyg/88eqVTWtxNtcwjc3UOi
 lFL6b9IlCTYuG8Fg0fN97DyB+pgKGA2jUFRXxhCIX0eHyhBy+aHcHTTzVmJYGx/30zY9
 WRO4hDMJFJ/0UmLbDsEe7+3XhIQSFw7s8VR2EvfeWwcOn0ILaGcf53WKtct8ZAlcgit6
 IYt025OSe+zuQUzjVYpCRZD6VIdMr0nO59WaRA/nnNOB9hbV+7dAZjl8VyXxjPgqu33k
 bghOn+vexe+CxwC1gu3AzfCyvBkIeslNluo4Ey+bO0iYBcsGVadZ3iZpPL8YROuZs7Jf
 tp0g==
X-Gm-Message-State: AOJu0YzknJJONHpCdulrwSDUzSHiABMu8on6a2dOA6kVVPEBWkhBtUd9
 WzJGZsAhJqN73faFO9W1PNLdP/sg/DBy0BOaQAm2XbmsnQc22Z2SHKuizGIORq5P
X-Gm-Gg: ASbGnct3/2JzMOejFx0ntb6G3KLPMrEaA4LWVYkTxQOa5jm9A+A8LTOTcHGGEbDfP6a
 xGrjrbxsW8nC0/95/6SlqQZxDe/nDzaBAp7sJ8UboqsWul+mvaNOfBf2D/+PmfEL2f229nlTyju
 hyWzV30kjLNBnrkTSTDBYQAYPoZl6L5wEbi3wBEATwKyGiIny1xRDv2TdIikWLsSFYGGi6dlu2u
 +NBcPapgn2USOZ1mOKFN1fcFCTH24xInG73shzesw8mBi2mF0/OmvuAyIcYvbHllr6E0qFuxz4q
 AXNVrCYKe9T7Jo+09g6rOLllm1CY9iRRLN04D7ULyp9nOoHu3yuOgUExyIGBBbEcNxVw+4pm+HM
 o8aaVHK/oqMwnX/G9o/1PyGDzthqk9A/RHVXnGAZaBEBk6TY7FibYRiLCNuLvsBePvrc7M6Wcvl
 wONpxl2I9l6yxbJweG4PQ=
X-Google-Smtp-Source: AGHT+IFFgBOP91FhFjkdCe74nvuE+4rfkUlcVt1ZTTSfM0pJJ41Xep2bv6ii8XddPMNE0Z/m44neRg==
X-Received: by 2002:a05:600c:3b9a:b0:456:1ab0:d56d with SMTP id
 5b1f17b1804b1-45868c8bcbdmr50688345e9.7.1753349080983; 
 Thu, 24 Jul 2025 02:24:40 -0700 (PDT)
Received: from ultra.fritz.box
 (p200300d1973ff600a1ab5b988c9d795d.dip0.t-ipconnect.de.
 [2003:d1:973f:f600:a1ab:5b98:8c9d:795d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054f338sm12519405e9.13.2025.07.24.02.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 02:24:40 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 11:24:39 +0200
Message-ID: <20250724092439.675354-1-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753349081; x=1753953881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vEs8B9vxG420/UsO4Lf9KQ6YTkUPUN1MOo25J3m6YdM=;
 b=Bq+OGWxnAGAF5IS0rsHztAzBs1LzHE7hP9l+5f3PWimLXmCvtY1xxXbQLKUfxvmzkd
 taEtkx2r72BufCX71BcmaTYc2teRroorWpCjd/6OajbsL6RaFQ43jbrJ5LHNiU8SEIlc
 a1tfTVDbuZHsJ8iIPT2X7QN8shiPXfWOqP3i4llJlIqoLW/Nm43PaR5R6gLLb1OtaANb
 e0c0ti7fLNzrOISyeBfzaBRgnbka+13Wvt03l0XOTKlZ6Pz+iNVPVmasHDUjz+g7kYmH
 cvQbE3gtXdyZgSxp4NLUk7e6yyq+82Z1OSBBWqrDyVtpkbyUjydYOA5UndIraY88SNNl
 5Xfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Bq+OGWxn
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: Add option to enable
 AT commands via D-Bus
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
Cc: Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 package/modem-manager/Config.in        | 6 ++++++
 package/modem-manager/modem-manager.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 6990996a86..975a45902f 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -35,6 +35,12 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQRTR
 	help
 	  This option enables support for QRTR protocol
 
+config BR2_PACKAGE_MODEM_MANAGER_ATVIADBUS
+	bool "at-via-dbus support"
+	help
+	  This option enables support for issuing AT commands
+	  over the D-Bus interface.
+
 comment "QRTR support needs a toolchain w/ headers >= 4.15"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 932c163175..899e3071a5 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -48,6 +48,12 @@ else
 MODEM_MANAGER_CONF_OPTS += -Dqrtr=false
 endif
 
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_ATVIADBUS),y)
+MODEM_MANAGER_CONF_OPTS += -Dat_command_via_dbus=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dat_command_via_dbus=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MODEM_MANAGER_DEPENDENCIES += systemd
 MODEM_MANAGER_CONF_OPTS += \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
