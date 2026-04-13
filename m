Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA0DF34C5C
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 15:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB4C844C1;
	Mon, 13 Apr 2026 15:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4V1BotD55DOL; Mon, 13 Apr 2026 15:12:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44606844DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776093170;
	bh=yZc9KGVCml/lKWjOnF5mt4ymNYD8J96XLpxuDucDfYA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDtgZnfFYIGRByDFkDvaah7zRfLJinINBGK92CkB7xTE5N0Fl9UMLUDkG5A6Ya+4z
	 zI8wS33HXQQnt/+qPM0B4/O/FDItzLufcjnLVgXJNdCqnVlYBkTip9P9I4VjuLqggY
	 Lwx18PH4t40ZfAmiGUrgMkqxd8VbCoo5vOLGB4D61eFgy/5e9aaD6DBfc03hWexAe7
	 stfyPlcVZBmZHb5POC2LvuKe8cvMSbU0BqpDA8gNuBEpDwd9DyJaMnYKun1/xKKb9V
	 1P3I398TZdfpAkAsZMad5T4heJyfmiE6185debUG2sKRsM3Wy0zysGlLB3+gZ35bdg
	 1u0YkLG9cXo7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44606844DD;
	Mon, 13 Apr 2026 15:12:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 452DC283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42A1B6178F
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXrfwTpA-5J3 for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 15:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5EA56607F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EA56607F2
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EA56607F2
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so29550315e9.0
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776093166; x=1776697966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZJTEujh9VqjWm/Xtg1JDKnfQADPyKE3lies8tjOp0Q=;
 b=a/eg2QWiYDu7P2MDBxw/hpSazHW1NNqWNMbORc3BKUqtWC+/54HYg22y2H6IYhrwId
 Rfbny6tkCfWACFADBD/W36AgF5hJnRMjDRrx172qqGsnycPw4V/5qc3XylEXh05E9X06
 e/drNVGpGlEcMh4xDXIF1cX3zxf1o65LtE+a0pKDumNKlV66bpuzoSQmumRWlTzeQ2tU
 yOFGpAiAwhftfNMmDvwAgIq52xPX25XILTyjiT6RdsANExkylqwZu+A3d6eVjBeHSiK2
 yxuKhosklYjZ4Fap5kFckyLVoTrv/BjM7BbW0AJDYJpr2mjZ9AFt+9riM5eY35ZwDlj9
 kjJw==
X-Gm-Message-State: AOJu0Yx8hX+hPcSQ9Uqk0CSKqxNc+sVh2SS35JVb3xrc5Do+oO029/zE
 fRrYLfyOvhWHsLuQLUUTY4NtTBg85HBPb5CL+NJ9QMHW4QIARITGLZUt7/nX8w==
X-Gm-Gg: AeBDietmhZj07UkLQDJKG0yxseubwhjy1EkPizaBjkVHeSoix9Ib/+ERcJrmDmhPlRz
 kaC2jYVV1IKzqC8k0Sm5q9u4o4xeskyASGhjPmXEAh+FEr7vZ9e/Fus8mys2jamSXAYViSvOx6j
 DNiC4e1MhyDMH4XP6suorJ6cmDM005AVdiWmIEilDbDu/pMv7dHQ2Cus9Ssk3y32ilaQxuunsBu
 poxu7LalIOqI7wTiY7+f5oHqX5NNbKl8tIQGBQObt6fPe7SlRdoLnb9udZ0Sa/hNicGcZeUwgrC
 InVzHO6kZtKjc3Mx2GzebpBqDNQh+TC5G07samXEHTHmx/AFMW0iQ6xgbOh1Z5OvyhzgjXRqkjj
 w62VE1wAvOWRoii9P30zuw42RfUbpVwZjW91c72asvBxR+mf6bmfZTsqfWBH+2LoBk+RgJWEivp
 kXgrh+QGsvy8oD/jJs
X-Received: by 2002:a05:600c:444b:b0:488:9c3b:ff40 with SMTP id
 5b1f17b1804b1-488d6acd9fbmr151420075e9.15.1776093165699; 
 Mon, 13 Apr 2026 08:12:45 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:e29d:2bc5:1d06:3359])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd10b1dbsm244379245e9.2.2026.04.13.08.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 08:12:45 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Vincent Jardin <vjardin@free.fr>,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 13 Apr 2026 17:11:47 +0200
Message-ID: <20260413151148.42226-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413151148.42226-1-maxime@leroys.fr>
References: <20260413151148.42226-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776093166; x=1776697966; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ZJTEujh9VqjWm/Xtg1JDKnfQADPyKE3lies8tjOp0Q=;
 b=mzkSPqekuK9iKzoGlIzPhbYreEWT2DUjxSJvcHUsJhSZuFQGK0m25X7dAbAiFsVlUL
 HJ50OcO8JIyxD9u0HEPA3SV9okW3ygl6GkCj0dDzITdq7AnjYEAQAaBL5Tr9/ljcaArW
 MG/FTIVoD+oyX85kulWJ7gm+Xu6n9/losPkyB1fTSTF7aR8sVy9HS1RRUD54rFwC8Ed7
 LeavkcgvqUSaCjx3vtW/B5+Dolx12k25SaFE+Lq+7aKWBJj/+F/RuY+Cuza3bzgILzKb
 BQ8TBHo1fjWmpsTy/HjpMGpnUlWbEvdHM02y0IO3tiYhl9xhbQwKdi8HEV9+gHprs1dY
 d+hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mzkSPqek
Subject: [Buildroot] [PATCH 2/3] package/dpdk: add option to disable target
 installation
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

Introduce BR2_PACKAGE_DPDK_INSTALL_TARGET (default y) to control
whether DPDK is installed on the target. When disabled, DPDK is
kept in staging only for build-time use.

This is useful when DPDK is only needed to build applications and
is not required at runtime on the target, e.g. when an application
is linked statically against the DPDK libraries (such as grout).

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/dpdk/Config.in | 13 +++++++++++++
 package/dpdk/dpdk.mk   |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index b658145e5b..69c5edf634 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -37,11 +37,24 @@ config BR2_PACKAGE_DPDK
 
 if BR2_PACKAGE_DPDK
 
+config BR2_PACKAGE_DPDK_INSTALL_TARGET
+	bool "install DPDK on target"
+	default y
+	help
+	  Say y if you want DPDK libraries and tools installed on the
+	  target root filesystem (e.g. /usr/lib, /usr/bin).
+
+	  Say n if DPDK is only used as a build-time dependency from
+	  the staging directory (e.g. for static linking), and you do
+	  not want any DPDK files on the final image.
+
 config BR2_PACKAGE_DPDK_EXAMPLES
 	bool "Install examples"
+	depends on BR2_PACKAGE_DPDK_INSTALL_TARGET
 
 config BR2_PACKAGE_DPDK_TESTS
 	bool "Install tests"
+	depends on BR2_PACKAGE_DPDK_INSTALL_TARGET
 
 config BR2_PACKAGE_DPDK_DRIVERS_LIST
 	string "List of enabled drivers"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 080f924329..2f744e519f 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -74,6 +74,12 @@ ifneq ($(DPDK_APPS),)
   endif
 endif
 
+ifeq ($(BR2_PACKAGE_DPDK_INSTALL_TARGET),y)
+DPDK_INSTALL_TARGET = YES
+else
+DPDK_INSTALL_TARGET = NO
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
