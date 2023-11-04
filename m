Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B7CC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F371C60D58;
	Sat,  4 Nov 2023 22:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F371C60D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0udHxiDLb8QC; Sat,  4 Nov 2023 22:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4025B60BD4;
	Sat,  4 Nov 2023 22:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4025B60BD4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D98671BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE5B28217D
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE5B28217D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTMlvDJ4aUb0 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:48:29 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3DFB82174
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3DFB82174
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40859c464daso24526885e9.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 15:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699138106; x=1699742906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ELAIP+c4kLEXxYMclzsmJXGG7JC+O0H05BU7rcId0tI=;
 b=XWoBbiUef+JD/sWxwxNS0TpYLbVDPbfD2ot5qUT0SCQGWd92HMiUo2qb+fUAUv6Ih6
 JqDNALXE5a80lnB5XKF4jb7DSa4WWKePzKyQMfG5jJGUh7fD9K4CW+sOLOkOirU2S3W0
 mFhYUmLT1KuKesCOcFORWcRaFG4OtaVH1RZPqKJt6LxTYrqW0WHDDXX+SsYcD+PIkxxr
 IHWcbRb5AtTok6S34ndOYoO9x4S+F7ggHJZakoQlf5Cq7AOumjsz2NsyA+tYLW5FoyMy
 IfEU3SSs4OICX+Mf+smQOYTc5O4yNximfd6tBYDXWWWfllUvY+QpUX8OBl2wh4WGlljb
 i/jA==
X-Gm-Message-State: AOJu0YxdULehjjAYjs/ksdvNVipqZBQwTnheNYD5FEybF4HYMSz3d9z1
 MvXge7lHly5FAEn1w7hsNJNZQPnXsQE=
X-Google-Smtp-Source: AGHT+IFXj+T9zS5Dteh+GWYM0pISd/c8QQfUe5OeCqufRHg4lA9/c8yK52VmpXQ9ADYAo+nCPFtQZQ==
X-Received: by 2002:a05:600c:3106:b0:408:404b:dc2d with SMTP id
 g6-20020a05600c310600b00408404bdc2dmr20505491wmo.30.1699138105820; 
 Sat, 04 Nov 2023 15:48:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b004075d5664basm7225454wms.8.2023.11.04.15.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 15:48:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:48:19 +0100
Message-ID: <20231104224820.374897-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699138106; x=1699742906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ELAIP+c4kLEXxYMclzsmJXGG7JC+O0H05BU7rcId0tI=;
 b=GXnr6A03oTuoEMa0toMBnzMZ62PSAIwxzzr9hwu+tBANxIZ79W6bjqbTosYVbGA80b
 uuzuOeDzY2RReKEnXHxcNrSZzCJyFEFvY2urLL/FtN3D8CFtPDgIqwv6rCDOsUWczGzj
 HU/rRvFBwL7aFgjY2b1Ro2pJlV9kO6BRsrruZhYY0IWCQzKZ68zG2AK9UcX0dh1L8zGu
 JHSr2V4lgndKZD6FWYSaQufoE38U0i63eN7wQFzrgqgC60J4XbOxNjFWt+K6zCS40/Vl
 6dqC27EGtFuq+Eb79ir5GUTw9evlnepmOoE92SQC+ovnzpYeTQ6k9BAgSPsjjV3E3rBt
 G3Kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GXnr6A03
Subject: [Buildroot] [PATCH 1/2] package/freeradius-server: fix python
 handling
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python handling is wrong since the addition of the package in commit
736c4c1655d93652a9a7e79235bbe726b3d46176 so disable python(2) and enable
python3 if needed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/freeradius-server.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index e493f7a17e..107eaf3ee4 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -46,6 +46,7 @@ FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_eap_ike \
 	--without-rlm_eap_tnc \
 	--without-rlm_perl \
+	--without-rlm_python \
 	--without-rlm_sql_iodbc \
 	--without-rlm_sql_oracle \
 	--without-rlm_sql_freetds \
@@ -148,10 +149,10 @@ FREERADIUS_SERVER_CONF_OPTS += --without-pcre
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-rlm_python
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_python3
 FREERADIUS_SERVER_DEPENDENCIES += python3
 else
-FREERADIUS_SERVER_CONF_OPTS += --without-rlm_python
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_python3
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
