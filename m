Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC1AC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 17:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD9B60D75;
	Sat, 14 Jan 2023 17:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD9B60D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ncyyD4LKz-c; Sat, 14 Jan 2023 17:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 606D960D70;
	Sat, 14 Jan 2023 17:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 606D960D70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E70231BF3EA
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C24D1401DF
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C24D1401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6XM_b7SjN8N for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 17:25:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8A9D4015A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8A9D4015A
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 17:25:37 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id m3so17191345wmq.0
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 09:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e8Zbvi+osiWk7OVqTRxMHOpXw77fb+iA6cGS5+LOluo=;
 b=vXzqkkeed3TyytWbJ6fLKqfGP6uBIsVoxyKoCX0Q3fqPca/so8vsuMweo5HtcywiJg
 VzlqQSsn/BTehrbqskduMWk6dAssR+pgW4cKXBlTzkHLxGrBV+GV73Xn36mXSgcdGC/o
 H3gRceivNOdboqaJTY1pgI36BcGMJDnDKWUHTxPLUsYGun9JzZcvAqu0UQlDnXxCxirp
 7ciMcmLNCwQQ/LAsiGv9pbp5LKb5MQtAZieNPmNmjm3A2Q3Gtsw1oHjL2bNQhWxfdp57
 et/pbUVXE2M5jtqPTT5QbRSizFyFg3FKVfOcO3GP8oeriT3CMZVy15KPY8vS541+WQGk
 7Z3A==
X-Gm-Message-State: AFqh2koExCT7lHJ8XxvfechIUFEQjDon1xMSGZEjhcMpaX9rfcAFaOOG
 56gP1qG0/b7oJ1tyLh1aP/KnFO04IWw=
X-Google-Smtp-Source: AMrXdXsuIxgHbrUILWQ+Ubp8pnXd9ru9szruXimFe/Kh4+EBLADxqe+dswCde0ch4jjbU2odikSU5Q==
X-Received: by 2002:a05:600c:4da2:b0:3d2:39dc:f50e with SMTP id
 v34-20020a05600c4da200b003d239dcf50emr61070702wmp.7.1673717135824; 
 Sat, 14 Jan 2023 09:25:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t14-20020adfeb8e000000b002baa780f0fasm21647200wrn.111.2023.01.14.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 09:25:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 18:25:05 +0100
Message-Id: <20230114172506.1258341-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e8Zbvi+osiWk7OVqTRxMHOpXw77fb+iA6cGS5+LOluo=;
 b=a6zObuaazGKz+gXC8IVnPc1zysze5Qn52putWLqDlDCT+jTI/LTDBF5SsZpeb+N/MQ
 itDtFb/Z6FNsS0gCDICxA0kCRGE93Z4xjRTvm0Fhq3vcgNgN6TWfMuC4Rbjh/i9VzVrp
 ONC7gjEsRMPhftw3u7+CZclBtAxEGOWy7xzUMYcLUwgHqmtPPSVxPvPYt5fUdg4U/zrs
 wAHSX0xls50MWB8Ti4Puly5Oa6UOoxIPHXmxOiM1ITU9N1VQEVQt1Jx61iznfvBKCRzN
 4XhTkNY9/4HjTUEV0r7yHGk5n8eRzJ4TmVQ/bfoVmqJEofZJTEClSnWVM/bWOSuHJMCA
 c1TQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=a6zObuaa
Subject: [Buildroot] [PATCH 1/2] package/ulogd: dbi needs threads
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

Commit 3b3dbd0183265c3f7da49b0b331688fb7573383f forgot to disable dbi
without threads

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ulogd/ulogd.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 561429599c..7d4a1fde4d 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -41,7 +41,11 @@ else
 ULOGD_CONF_OPTS += --disable-sqlite3
 endif
 else
-ULOGD_CONF_OPTS += --disable-mysql --disable-pgsql --disable-sqlite3
+ULOGD_CONF_OPTS += \
+	--disable-dbi \
+	--disable-mysql \
+	--disable-pgsql \
+	--disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
