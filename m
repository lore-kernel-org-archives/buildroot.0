Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E275CEEAA76
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF4760760;
	Thu, 14 Sep 2023 20:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AF4760760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VUOulB3cZmLr; Thu, 14 Sep 2023 20:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 730C260709;
	Thu, 14 Sep 2023 20:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 730C260709
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BD721BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F07440B34
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F07440B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUCl_BQQ292q for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:39:58 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3862A403A2
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3862A403A2
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-402c46c49f4so15043345e9.1
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 13:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694723996; x=1695328796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gypIhSudxiPP3rlhWfWbsQVR0jOpklCvL8xBZRrcgC4=;
 b=k44VQOZH+uQKsoJ8TjMaHGv6KWwXyDBoCc9b8PIEE5co6XAUSU6A9RYg1wvwpf5Nq3
 ompR+3N0XwvaLHofrRuV+WwVR0awCcG3+OmLZvYaB0aJ4wHd8akPjie363KZYy8PEsql
 2AuXHzZnMxvhpHLOAc+3y05Wad8MjOHBA2VR3og2SsvAWOcT68zZDcUg0z4HUXf0k9y8
 avqrJ8L9eDfnXW16oWD3s2//6nzCNXn68L0YFIDpoV+2edV9OVubpgPQLVcRnFHzyI2X
 7ZB83PAUI8EVj1IaNvW6h9+14nkxMwH4lxc7+GYb+9VXBimrsQTsU5S+Ngfq+S1KEU8s
 QXIg==
X-Gm-Message-State: AOJu0YyMYijYCqEIaLnaoF23PqGqEwKg205lkbtjUYzJHpCXF5gdJigT
 a0CRC3xQCoXZqH27gQyKledTgQLLna4=
X-Google-Smtp-Source: AGHT+IHZGB7pzV2qS+wNnZ1AF79PsnU8NDPGgeiURJiXBr8fazhJkT511YK9YV4NVDR23K7AQ3suzg==
X-Received: by 2002:a7b:c445:0:b0:3f8:fac0:ad40 with SMTP id
 l5-20020a7bc445000000b003f8fac0ad40mr5593532wmi.29.1694723995865; 
 Thu, 14 Sep 2023 13:39:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b003fefca26c72sm2894372wmi.23.2023.09.14.13.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 13:39:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 22:39:52 +0200
Message-Id: <20230914203952.406379-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694723996; x=1695328796; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gypIhSudxiPP3rlhWfWbsQVR0jOpklCvL8xBZRrcgC4=;
 b=QT+YXRC9744glSx52MKJTW3ivIy8Pe8KWpTdUf+DAvf9jpELwVU12IUhcp3450NkE+
 rJPzNiVs+9Ns9G6mzNHqx4HOMF3UbG4TLE0RoekLpXP9btuLXDI9tF02kwCBGXVoKvph
 TVKxpKPRCXTP9Cf71PUflf+DzWtytw/UcAXS9ilXGarkqfErcT+FP+WyUuW6+pOJ37yx
 7FbSBxwF4yIyQRzuF7ruyrALGz7YU83GE56wDIWqG4q2OlXUNmhmPDyM+ocW7ktQeGza
 doMynWiOJ9NVAkE7+du0wQMfB7nLNmF9SoKKbV9qtNYfkI2pj3lWBfB4rrDMapoNu1Jn
 zgEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=QT+YXRC9
Subject: [Buildroot] [PATCH 1/1] package/libde265: add LIBDE265_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:struktur:libde265 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astruktur%3Alibde265

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libde265/libde265.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 60424c0de6..208fa24e27 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -8,6 +8,7 @@ LIBDE265_VERSION = 1.0.12
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
+LIBDE265_CPE_ID_VENDOR = struktur
 LIBDE265_INSTALL_STAGING = YES
 
 $(eval $(cmake-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
