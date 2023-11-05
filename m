Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610FAC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 00:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E82E160D58;
	Sun,  5 Nov 2023 00:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E82E160D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY1IKp4KNV0R; Sun,  5 Nov 2023 00:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B7BC60B8C;
	Sun,  5 Nov 2023 00:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7BC60B8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0A1D1BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C093A403C6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C093A403C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnM3GsMHtQVY for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 00:33:44 +0000 (UTC)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CAC6403C4
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 00:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CAC6403C4
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6ce2add34c9so1875964a34.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 17:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699144423; x=1699749223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EFFmvVAExL9LupNij0baYGMMZWUjcTmRRvAZl07Ok38=;
 b=Qq3kJdnn/wOvBp2RfNN5eI8Dwl7eqvITGfNTUc0ICGItNGTWsS7FHLej5ngGV+Pxeh
 6kUsALoKzROz0VJZsf/UjaGUFM8vMp4kQJLzyYoEfJ/5TlNgeCCPC1FMbb2k0QlfcZ3L
 tQVUzwzN21LOXpBP91HshJ26B1uGrpAGqijydf09iMOuURJfX9IuKtLZ9i5n+/S0sX8k
 K/rtKMV0Qpg4TPqlm/Yk6NBReTGKE9EqGFE158q/RXoa1ebqlyqzFOcw2PCwoeMvg4BO
 zkeOwivEpAqqA8Ej/s8h9oQ/xONZqUKI+vc4Fz+z6OIG2RbcmrB50A44dbTvDqYF7geh
 N9hA==
X-Gm-Message-State: AOJu0YxoNhFqjbIgzOTXcgEDzERbLfT+40LUNQcHCRMp6fx/xGYylc0A
 tr20gF2n41iNQ/KRAq6a17Xak0OZLhI=
X-Google-Smtp-Source: AGHT+IGN5/nDCLcTCbrsPGoYmlUSrrdf9oEgvXhxaBJ+VUWbPeQBA1m5XTfX/VUMUUPunR9eGBEgOQ==
X-Received: by 2002:a05:6830:601:b0:6b9:6a96:698 with SMTP id
 w1-20020a056830060100b006b96a960698mr26043539oti.7.1699144423002; 
 Sat, 04 Nov 2023 17:33:43 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056e020c0800b00351579b7e4bsm1526253ile.37.2023.11.04.17.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 17:33:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 18:33:41 -0600
Message-Id: <20231105003341.2711310-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699144423; x=1699749223; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EFFmvVAExL9LupNij0baYGMMZWUjcTmRRvAZl07Ok38=;
 b=db0vekQIhvFxIUm6zPlY1AA+rDPrvErtcAroLTt2grZsV2fObB/9kgEH8FYurhOs6F
 ZJWGnE/n1TsLm+tcr+ScxQTbOwL7yYO81vrMEccgbo7G+JAnqKFwnpBkyq3TE6naZuPW
 4VD8S4w9vSw5bkFgLNXK7HTwlRGOkAGDrIiEMBcQrxBhEjrS9TI4h3T1eNT01YFqK5zT
 S4mxPKnDDLRCtlY679KJGS1URxzsV0G2r25bWsox1tvviq7FGw8BiyZVoC1fuuvAhbEG
 Gz0MGjMjfVBqZ+eZMRYxeT4yWb8B8/8sBwRkAtwF5M1wTG1rZS83wByGwFr1EKdkE5YM
 NVJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=db0vekQI
Subject: [Buildroot] [PATCH 1/1] package/python-asgiref: bump to version
 3.7.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 26d8e78e47..7f3bca57c0 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  562ecd896dcbf5576db8c29cb1881ca4  asgiref-3.6.0.tar.gz
-sha256  9567dfe7bd8d3c8c892227827c41cce860b368104c3431da67a0c5a65a949506  asgiref-3.6.0.tar.gz
+md5  7cd61836ec3c329f415309f88e92e0e3  asgiref-3.7.2.tar.gz
+sha256  9e0ce3aa93a819ba5b45120216b23878cf6e8525eb3848653452b4192b92afed  asgiref-3.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index bfd90f10e8..abd8962476 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.6.0
+PYTHON_ASGIREF_VERSION = 3.7.2
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/78/2d/797c0537426266d6c9377a2ed6a4ac61e50c2d5b1ab4da101a4b9bfe26e2
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/12/19/64e38c1c2cbf0da9635b7082bbdf0e89052e93329279f59759c24a10cc96
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
