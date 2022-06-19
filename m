Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F254DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9695660E5C;
	Sun, 19 Jun 2022 16:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9695660E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDEGnFIFjnS3; Sun, 19 Jun 2022 16:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD2FC60B15;
	Sun, 19 Jun 2022 16:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2FC60B15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E26C1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5697A60E35
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5697A60E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tHNXYFZ7dFvp for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:48:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2CAE60A90
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2CAE60A90
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:48:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i10so7918661wrc.0
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZxwX8I7IJaqcoWpp/OSPwamk6AI6fG0Y0MzMFtE1t0=;
 b=IzMr0L9j/DgVF5+jsRXIj421raHpiJoWdiu0ULbgx5RiIHxBq43PLaqJWw/fDNpLHu
 QOS5O+6srcqooxEoTlQm72ZmcUullzv5VuVXAcpTQ9ciyfBQN7Tc0aP9pjWDR02TX2Ps
 DJ6wxYkXTLQW6o/IvXBRfrTyLDneqieHTwbkyu0cHf7dTYkfEdChYfV8pOcubhQU7S9g
 hJ4qBZ01K2Nh+m1qdQX/EayYXvKHlivv6nozWNjEb7sH+Acrrbabce8bxy2N2t5h4HZb
 ES4MYcoKmzHrUR2kdXP6fBMZQqJ+Oug5AGWgrtVAeKjZo4S/p7B/tT24tj5rtB9F5dG6
 vcSA==
X-Gm-Message-State: AJIora/jpwxKfH0eXOSsGKgb6xH7S8RBCKrb6StPX9Vo7wJNgbySUYSx
 PvJT7H8SJOAcHhLiAuaOzyFs40zPNI8=
X-Google-Smtp-Source: AGRyM1t5oNhzsdS/wycM0+T1JCIriF0s2ovNWcULJ5Uk5JTQc7AiHyFfkrYxMd34FFUIw88mNAtNdQ==
X-Received: by 2002:a5d:4601:0:b0:21b:9035:d295 with SMTP id
 t1-20020a5d4601000000b0021b9035d295mr413020wrq.63.1655657334715; 
 Sun, 19 Jun 2022 09:48:54 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f123-20020a1c3881000000b003973ea7e725sm19815285wma.0.2022.06.19.09.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:48:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:46:08 +0200
Message-Id: <20220619164610.649145-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619164610.649145-1-fontaine.fabrice@gmail.com>
References: <20220619164610.649145-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZxwX8I7IJaqcoWpp/OSPwamk6AI6fG0Y0MzMFtE1t0=;
 b=hP1r6HaKnH+rDhmgvCupm+UhTEEUXCyb2nFFBmr9R5+JuEvXt16Qhcf8S1QZntdmYp
 ZKUeAFpRlM4UHG21qkbhW+k74KSlX8atZxVyGnK8mLPjc2lVbKXD0KNR7LaqILbVM1GW
 lCRuUUlQkP+2K8lsTmTtAppeOWmga2x5srGQ3UbFiDTz1duSws3ja3+EWgvNb6Pb6K/8
 exL21ZikArKTwvFe5WJO9RPLu8hCF9O97bjxLU8rpE3KE5at0u9qZ0tiCBd/lnc7+MMG
 Rjy/wKsbN+0N5Y015pUApC2BBzLpeZylTijGWciKd+G8R+ezrcsQrjj/F7a1w/I13YYI
 YzMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hP1r6HaK
Subject: [Buildroot] [PATCH 2/4] package/rsyslog: add rabbitmq-c optional
 dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 400fc6b99c..1aa2256062 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -111,6 +111,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-pgsql
 endif
 
+ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
+RSYSLOG_DEPENDENCIES += rabbitmq-c
+RSYSLOG_CONF_OPTS += --enable-omrabbitmq
+else
+RSYSLOG_CONF_OPTS += --disable-omrabbitmq
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 RSYSLOG_DEPENDENCIES += util-linux
 RSYSLOG_CONF_OPTS += --enable-uuid
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
