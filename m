Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAC2D2CDF9
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 00:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF4E40639;
	Wed, 23 Oct 2024 00:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6F5BsWjc7gqp; Wed, 23 Oct 2024 00:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 544CE4063E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 544CE4063E;
	Wed, 23 Oct 2024 00:28:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13EA44C2A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 00:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E16E24063E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 00:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cG2DjcNLC04T for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 00:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C6D4E40639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D4E40639
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6D4E40639
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 00:28:05 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a3a7b80447so22059555ab.1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 17:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729643284; x=1730248084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H/3KbxUmlfNqPiNflXtpb1xgJ9tE3vt9ToEC9sCBR2g=;
 b=dGSSMlR2npYfZltxgk6RI47w8VEKtJTOangYpG6J01FBynnoaYsoY0k/fhuZrT+pum
 aZe3ufeDB5jbYrAMWvOw0i/FP9Kw7WFBuoDmLJyTwlb8Go9dZHLwwXXo6+h28AjYhmWR
 6WN8eCZb9OsupZlaq2n3V0ZztVBJsO5b90vkUxVSUGMvpA/2Z99NTUasyHZ48TvAZveA
 6NvxEbAPGPvl8FtW4+HBEnOuto3I2YP5gZ/Akt5JT/CArspeV/n6sgAX1iVJz4W/6blj
 f+hUFMCmTuCzMZHfmMdZjm755yLYzN0Mz7KR9znyETeEPzv/KMDtxFRTEnP6TXp58O5u
 ooew==
X-Gm-Message-State: AOJu0Yxv15nDl2dUfTN5aO4Rv4OrVlu9J+FIUexp4s9tS2e0ehzjImAL
 PK+JbwA5rZ1ifVl7Ux0Y0G20iB1YlhMqzwSfwTyXy5UooddqP7/Oql8Rzg==
X-Google-Smtp-Source: AGHT+IGMhPiYGRqAHwY9C2BEdbtudXSXsmCDG3PHQxEgjczQcNDu/Z72DdXj67aitH1LwfRKgQP9uw==
X-Received: by 2002:a05:6e02:20cb:b0:3a3:96c4:29bc with SMTP id
 e9e14a558f8ab-3a4d59607d1mr8374565ab.11.1729643284104; 
 Tue, 22 Oct 2024 17:28:04 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a400a7bedbsm20820025ab.16.2024.10.22.17.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 17:28:02 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 23 Oct 2024 08:27:45 +0800
Message-ID: <20241023002753.146238-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729643284; x=1730248084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H/3KbxUmlfNqPiNflXtpb1xgJ9tE3vt9ToEC9sCBR2g=;
 b=IKpmXdZBuqR4tO2/foBV5Ekyy/xfh8HhbiXus2HSpY+YPw9bBnPjIhuqKTEN5IxXlO
 31yIhDgmInwrCxvbqALsx6tCtzRUzhQYCFwIolqR1iClJ7DSMQwW3QMvqtwJmhRX8Epa
 23Ojz4oIHzz0NjuVBF3zA1ZsUxGyWCFjRyhTDy6Py2i/McgZAhBikWkjD0f+bF5gqaMf
 Qsiueja2oXgT5XXD0m5BYruVYLqK4uUvoFbuY37HpUHG1nxf4i2yG02finABDo7DRPpv
 98N484wfIaiN4BXZG0AV3t/zc+2lEdNWzKXrERwOLIXFqy3Qrj8AOJfyhc3Xj+k3SwTj
 iDig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IKpmXdZB
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.17.1
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

Release notes: https://github.com/timescale/timescaledb/blob/2.17.1/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index c6a03e6aa0..f8b6b2c5a1 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  155bf64391d3558c42f31ca0e523cfc6252921974f75298c9039ccad1c89811a  timescaledb-2.17.0.tar.gz
+sha256  6277cf43f5695e23dae1c5cfeba00474d730b66ed53665a84b787a6bb1a57e28  timescaledb-2.17.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 9b785e763b..55a4eace79 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.17.0
+TIMESCALEDB_VERSION = 2.17.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
