Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1528C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F7CB405DE;
	Sat,  3 Feb 2024 18:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F7CB405DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D26BcLTwXabi; Sat,  3 Feb 2024 18:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A2F74054B;
	Sat,  3 Feb 2024 18:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A2F74054B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 072E11BF285
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D363F4054B
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D363F4054B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPAF2XL7WThX for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 18:42:35 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B419400A4
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 18:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B419400A4
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40fd55c7f93so1332045e9.1
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 10:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706985753; x=1707590553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nZrjwHaABdLkPOXN1xCfizIQUzC9sTg84Nq6fLoqr5k=;
 b=S8zh7MHGMRNTUS8Bh2hPrWLm9xkgflNr17e66Ej7AQoez8JnUhrc0Nzhyzt7scsk5q
 RmD5OGO2/qRHXV6eKidL65RyvRLS0bQGlh/QEGFBT4v4qW6nPndh6VgO3oajrnarrDyu
 TZbwjZMf3FrWIC5wzRlt5vm5vux1KO86pR+9vrsAzUuj4tOhWPmu8jmCleXu+tFYnT/j
 X03Jj0+sQYAXH7aLPmYizgA3MLmmcOqWF75BZuPg+nOcIcUfQ5WzPw72vffPK1O+LMPF
 hBqOXwrGBUvlqF1O54xESZwsiF5GgJ+xtWBYR26G8M9ujL7bq/wxlgiXbQXvETEbRWbU
 r0Kw==
X-Gm-Message-State: AOJu0YzJ95Ogr+IBUbGLpvzZuJUKgCDRWIN5ugaSFHeFGXvM95PXlUVE
 sowvpBmLkKRzypcQl48j7VGb2VjnVz3NcvAawMdgx3snUG6iRVMjZ+n/UuC9h2c=
X-Google-Smtp-Source: AGHT+IH4jIrCuCjnGJIEOXfXq1PnKxYo2m8gfcE0+ts2VkuPs7oIUMTQ8+TgxP42r6+FuLzngX+dCA==
X-Received: by 2002:a05:600c:46ce:b0:40e:d411:a16d with SMTP id
 q14-20020a05600c46ce00b0040ed411a16dmr1389258wmo.29.1706985753157; 
 Sat, 03 Feb 2024 10:42:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c3b1500b0040fd2f3dc0esm1749751wms.45.2024.02.03.10.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:42:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 19:42:31 +0100
Message-ID: <20240203184231.166287-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706985753; x=1707590553; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nZrjwHaABdLkPOXN1xCfizIQUzC9sTg84Nq6fLoqr5k=;
 b=NtGXtEBX20EDhhBsjWfGVBnkJz/2r6lzlIv/pWZCuEGCQe6xvGiakIxm+imccLwsr7
 +Z9k7J1S4g8RPFIIOuASqmpnZa+edOtyOkzkEoBVq9d08yJiIzbePLetyjlPvr9B03pX
 sFAhFUkORxlNsUt6ujaagV5N7XZcP7FXexy2Ces1dR9PxT5fqL8Nmq/e9aAG7zflLQn7
 GSOmC3cc9ymVeLhQaSgd1Y6nyLMg0Y+vBryFEE9USQLn+/hnAO5IGo/rx7RocVQ6UETW
 K3KxuA2tT4hOoUY2qWkrlOIeEVQUIGB9j4BjmBcKTftkOsmY89c6LoQezvj27z4n3iF+
 FkMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NtGXtEBX
Subject: [Buildroot] [PATCH 1/1] package/c-ares: update C_ARES_CPE_ID_VENDOR
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

cpe:2.3:a:c-ares_project:c-ares has been deprecated in favor of
cpe:2.3:a:c-ares:c-ares in September 2023:

  <cpe-item name="cpe:/a:c-ares_project:c-ares:1.17.1" deprecated="true" deprecation_date="2023-09-15T11:42:40.183Z">
    <title xml:lang="en-US">C-ares Project C-ares 1.17.1</title>
      <reference href="https://github.com/c-ares/c-ares/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:c-ares_project:c-ares:1.17.1:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:c-ares:c-ares:1.17.1:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-ares/c-ares.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 7a49b2639a..586fde9afb 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -10,7 +10,7 @@ C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
-C_ARES_CPE_ID_VENDOR = c-ares_project
+C_ARES_CPE_ID_VENDOR = c-ares
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
