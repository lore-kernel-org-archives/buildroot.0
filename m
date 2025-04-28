Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E38CC36005
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 07:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD20360B89;
	Mon, 28 Apr 2025 07:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgsCvxlRNv3U; Mon, 28 Apr 2025 07:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFF6F60B93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF6F60B93;
	Mon, 28 Apr 2025 07:35:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E0931
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 07:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67A7F408D1
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 07:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swKKeiolVh8M for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 07:35:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FD2140851
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FD2140851
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FD2140851
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 07:35:28 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-22423adf751so44980805ad.2
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 00:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745825727; x=1746430527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IdCY4+xVPziynCbnLFnpLUPUPksP7i+GsNnn7DTqEoI=;
 b=Z5diIO8GWPNm5jehUSa6pv7o31pw0VvGitRPs3wDHNXDCreT+KahI7YJKGTf48jN12
 2SKsNhw7HrJavnSdkqCb55GW331iuSUzKnr967sWHdN/3bz9maHDjsqs4PLi6YfaW6M3
 Q0EGMRMKUNedclnFD1rEXW/hY3MiQChc8dmYqVSlVtWI/VU7ruC9hwhWqeKJpzNrsSWD
 PhzxlGE4ck4uDAhxxvHhxNmKAuTacpbKznACUnZ4UTV2t1iqqJfi1SG06/qPSkmNZMEQ
 WxPqeGvAfwL0UxjC8viJMS5gh8n4XEMX1n0WDAcjrfPj1LVrok2/Izs9AdxF+pyijPLi
 La/A==
X-Gm-Message-State: AOJu0YwybGGHStqHZON1H7rNycN/rETr+s4PdGTl0ERRs/YmLRdDVAW+
 ORZ/Z0UxQo54RSPa/C8qTaeIqE7h3NTCV239RuG0hx5YsLu20bvVhdFzvp3k
X-Gm-Gg: ASbGncuyZZeL6/ol+24Tatnd9R5RBGmEXh/BlNkvL80OAqQF5TfwGgDJpHaW0jJtzlV
 tYmW4+uBL+Y3HI9+sdj02uhLL620bhzwptB9LkeBjBg0KI8Fnc7jKbJoCwcFGuZTUqpkJXedKvN
 tnAqKknD0FtKj93bxPsa+U/CwRpoSISCpgjkEAfNxnPxzzWW3NfB8i45Vm7sSm7TTvQck9p9cag
 qO2KfO3W7J6rpS54EvE3KIn5cIZjGcAGqTz1mSD+5IOv7RHwpbiJX0r7d1Qc+n4WRjfJCHfl9EK
 6CF5dBC0rNtqutes7RaZj9AA0y1nSh09grBTBS0FUqNQu1FoSuFtZjdMZr5gwErb3s4QFQDctt8
 cVpmdZzDOhd4lnbGyDB5yH52vGyg=
X-Google-Smtp-Source: AGHT+IHJbUZu09JOSLsYMCdiT24a8NJBGD2shBHj9CZEGNw4ZEwL4HQwpLeJeHZRbQ5GjgyTFegiLw==
X-Received: by 2002:a17:902:f684:b0:220:c911:3f60 with SMTP id
 d9443c01a7336-22dbf743566mr150721915ad.47.1745825727222; 
 Mon, 28 Apr 2025 00:35:27 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db51017b2sm75614615ad.176.2025.04.28.00.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 00:35:26 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Mon, 28 Apr 2025 00:35:22 -0700
Message-Id: <20250428073522.126422-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745825727; x=1746430527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IdCY4+xVPziynCbnLFnpLUPUPksP7i+GsNnn7DTqEoI=;
 b=isXP8rqnfQEtbKU3moVqY/h47Lb9pvWdQXtzuIlUtj+nvaPYAQEEOmNpvRuuN0amrQ
 qGWN4R1IKefnjpW01y2onrt8xTii7HnHwBzvJdCid8UXQ1wJdcFRdqgFT+FXok8y59eb
 rOLJDBsdirpKsgBhqJoHK6UpptH9ub3YUaNbV9meb8txVJMjDN7dUzLl4MW8af2u8v+R
 I3RrwAQL/hZsZgKf+pQmC4l8SPnpIS7Y8unV72A/iGdFdiOxyDHemQx9cgv4KuMLkrkj
 3fWOuyEPgW4dHv7PnJMLw1cJHajfM7WgmMfe1VAw49PPWMzMJnrBHkh0vO/2SJFsvd8E
 fBTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=isXP8rqn
Subject: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.7.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/libexpat/libexpat/blob/R_2_7_1/expat/Changes

Update hash of the COPYING file (year updated):
https://github.com/libexpat/libexpat/commit/2b2a24691a9888e0f3c179b8f05cbacb19f460ef

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 4975d0f864..87bbf86e1a 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  25df13dd2819e85fb27a1ce0431772b7047d72af81ae78dc26b4c6e0805f48d1  expat-2.7.0.tar.xz
-sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
+sha256  354552544b8f99012e5062f7d570ec77f14b412a3ff5c7d8d0dae62c0d217c30  expat-2.7.1.tar.xz
+sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5d40133f08..51b45b01bb 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.0
+EXPAT_VERSION = 2.7.1
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
