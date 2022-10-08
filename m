Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC82EC433FE
	for <buildroot@archiver.kernel.org>; Sat,  8 Oct 2022 22:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CF7440A00;
	Sat,  8 Oct 2022 22:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF7440A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyXVXuYsJ4a8; Sat,  8 Oct 2022 22:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4F5F409E6;
	Sat,  8 Oct 2022 22:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F5F409E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC0031BF4D7
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 22:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B493360BFC
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 22:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B493360BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8d97AjVcWaL for <buildroot@lists.busybox.net>;
 Sat,  8 Oct 2022 22:07:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FAD460BF3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FAD460BF3
 for <buildroot@buildroot.org>; Sat,  8 Oct 2022 22:07:21 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id o5so4782020wms.1
 for <buildroot@buildroot.org>; Sat, 08 Oct 2022 15:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SZX1tQoCcjDYb+J7vycEoabd8aXPXkYPxjKQZDcKh0I=;
 b=IgwpOIeUIEZYoooSW+/9OQcx76BwudiheaTaKWqVwIkxXbZy4ktL3qBJFlBvotyjmO
 59C8b4bpD+d7fHeXxkndP3WRyrnaTUQrxRC+pXQYTDXduUwszr4ymoYSP7Akbx6pGdT3
 wCJGk9nvQXZswZAFE2HE3DaIq28/IM9tG/m6utgeSBpCaieagQB4xjrMKqKNuRPIcrEG
 ALSByswMqfLqqlO4+wc1eQGSH41QWPEdj//33v62+w5VHKTl/imHmMVT+4dQyRhjfCYP
 9OjhBQi0+UYTg3c//Nt4iRCrmERraMF8LUsWvGzCHiDa6QKHr7hIa+n11BjmQ7mp3lz/
 1Ypg==
X-Gm-Message-State: ACrzQf2fML3CKrhO0JTA0DtQI78+n5QRTlJDHtyYLxSCIDHP4IPO+w/R
 ct5LSUW6NDoSCcC/d0i0f+NnL3GmPzg=
X-Google-Smtp-Source: AMsMyM7ztAWoER3xS8TEOr7WMtoE0A5/a2Je0CFRbCCiVApCU+5SxECBZYFE/tQISKcVvHySz1H8AA==
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e639 with SMTP id
 j6-20020a05600c190600b003b4c979e639mr14307392wmq.10.1665266839368; 
 Sat, 08 Oct 2022 15:07:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c3b0600b003a1980d55c4sm4452637wms.47.2022.10.08.15.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 15:07:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 00:07:16 +0200
Message-Id: <20221008220716.150449-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SZX1tQoCcjDYb+J7vycEoabd8aXPXkYPxjKQZDcKh0I=;
 b=PBVjHsFLMU1WKRNm+OiIr4qDHvBN1jRk4IknmQg3IH9TKWoTRrBvohlyJd5MUWxCKZ
 hzbm6unYsfMciUSgQmsNcwsWM/S5S3j0ADuysc493j/aH1vPlstbRM3rp3p9PxoQJsu2
 VXGmEWYG4zlpeo4jioiY0M5JVejViP19BNTYHaSpwYG+iKTE+X1oGSgYqp7zLVYzwzl2
 xodVGMXpyc26niSG0ZSKspKI19/T1uwRjHmC9hajH6eX30wnBAOsPADkNtb8Swo6nPHU
 +8ZVCPB+YvGwNwZjnQI32Pbszb8yHd4cWlgnpGMXtym9LrChMMR6lSS1dfEMcVDPqtL+
 giXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PBVjHsFL
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: add
 TIMESCALEDB_CPE_ID_VENDOR
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:timescale:timescaledb is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atimescale%3Atimescaledb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/timescaledb/timescaledb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 00fb7d9842..12e5ca7af4 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -8,6 +8,7 @@ TIMESCALEDB_VERSION = 2.8.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
+TIMESCALEDB_CPE_ID_VENDOR = timescale
 
 TIMESCALEDB_DEPENDENCIES = postgresql
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
