Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5C6C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 20:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00FCB42C8E;
	Thu, 26 Oct 2023 20:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00FCB42C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhHwLN4vEIxH; Thu, 26 Oct 2023 20:12:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7230942C40;
	Thu, 26 Oct 2023 20:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7230942C40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 123661BF314
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 20:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E718842F70
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 20:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E718842F70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQobMbj1UVLC for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 20:12:05 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2398940184
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 20:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2398940184
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c518a1d83fso21838951fa.3
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 13:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698351122; x=1698955922;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mT0+uAv713Jqla3tKUU0LyBRyntNLnriW6DzzPHH34E=;
 b=DRf3QejD6v6dqXpSHFuJXlOOnUg6fDe0gbqBR0ceuVUiXJmvsJtFb11mcWZBjhm9rY
 yXYdfeeFbPJRyxFOzVBa2LKcBffJXtyXNcXs20ibSTMRFbzk51/Yf3PCr1nXgGYcDMO3
 coVHYLcoUpY9/1A+vwaBIiMhr8km60BLiZgJnK+FfxVW9AB1rSV1/10Q349L1p2e0aUc
 rjEETT7DKZcLzVN7SOqOPe8e5GUS5P/BN1Op6fSiOD49DVhuyS9GfV+Z5XWVnelhZQ0N
 fkPiiV8tB8JmOKgWOEVlJxyqagsFmQ/x4w+9X2VwA/Z2o/2Mwap0IQORu//qb5CC8j2r
 R6TQ==
X-Gm-Message-State: AOJu0Yx6Z6jiSoTg+4Al0In0fh9jVaOWGLUCkeD8cpQoD4HsZ54xOuaV
 dY0s7s6kCBB3Ws2sCnUCLDTQi6qoHNAFnw==
X-Google-Smtp-Source: AGHT+IFRHSak+y5LaeXdWct7OBM76Y0UWZnNmywyoUZ8Gtir1eh75aL0Ivdx8LntY/rkSzIauDxpOg==
X-Received: by 2002:a05:6512:1081:b0:507:a5e7:724 with SMTP id
 j1-20020a056512108100b00507a5e70724mr426431lfg.38.1698351121339; 
 Thu, 26 Oct 2023 13:12:01 -0700 (PDT)
Received: from nibiru.lan (109-252-110-141.nat.spd-mgts.ru. [109.252.110.141])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05651204cf00b00507a682c049sm3118788lfq.215.2023.10.26.13.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 13:12:00 -0700 (PDT)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 23:11:45 +0300
Message-ID: <20231026201145.130747-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698351122; x=1698955922; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mT0+uAv713Jqla3tKUU0LyBRyntNLnriW6DzzPHH34E=;
 b=i0nJwp2kDEc3cbDThjjIEExup2uOH8og50dKQUoqfQoxPVZgE6Ed0B7/0T4W8T2qH5
 LyLHO2FmF3XWSy2zZT+jxgLZKTjx3pPs0rQnv5uyrNIgOR2jSeo6IVJfReJmZUBTui+m
 CHUn3AtwnA5yDCy7zZGU0ZelTwatIHr7iaVjojfTD3mRY24aqhenG05QIoURQ+Yx2ucT
 aht4N678PXZX+mKaV8MsXphFFNvM6Xt50qy16inxrVn7MIUFbg4GHT/6W3PtzcW+d7OS
 4aDypAcaawl8RAbYF6XXSObN8qhQZSMhFz/sktkwodSpScQZfdpNKTZLugcejgUJ5zvk
 MYXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i0nJwp2k
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 1.4.0
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.4.0

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index f5fc8d6868..379864e3ba 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d44f59abdd64d8f1ca3af7db58bc6518cb081fc9ff16285c3d75a68f5c073d10  v1.3.0.tar.gz
+sha256  ca7405c7f0f9ae3023dcfa37bc68974c4b8a1c9ea2909b970e0aedc3e8657ee6  v1.4.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 2a6b67d6e3..2c3844094e 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 1.3.0
+SDBUS_CPP_VERSION = 1.4.0
 SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
