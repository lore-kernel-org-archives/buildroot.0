Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F47C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65AD2409E3;
	Mon,  9 Jan 2023 04:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65AD2409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2m01nNHVCA27; Mon,  9 Jan 2023 04:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49E81409E6;
	Mon,  9 Jan 2023 04:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E81409E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DCDD1BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2621340142
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2621340142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWW2_Imk4Xwk for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:51:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D311400DD
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D311400DD
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:51:27 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id e129so4068804iof.3
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T2IvlPgKhIgsLSkQ5dJSZPP2C6Ds8rBm67b/5FJrJ8M=;
 b=zIpZ+ScZRm+dGKSJbgxRf8/YjFLsj3K1m8NhvnrDk5hKn5tMFUH0DmyR9zYF8mqmLy
 5Sd6YaNbi7DHQpWzB8Mka48BKutoY81eJ3wYxrVr50PGud1aOxdVUkjXsvOdSI+3cMUM
 bjhLy46K+loq58pXFHt5d2U/StKn11STuQtVtUlkWOq4mW1DlTOR4L5cUrxpAJWGetu0
 6MyspXronkCA4ezqYwTDMqdi+Tf6pdtoMxPmLZbrzJEapu2kzI3RA8FYJSRdc30eUkL3
 4Sic4CKmP7NeD8LAcSfzW3GGrPs7QNvuhOXABvz+xz+S/K6xa2nTcve8RuuzSgITCY+Q
 Bylw==
X-Gm-Message-State: AFqh2krve+xKuj3QyjX27/NFMpWTHn+RcKQ0drrLUL1DxLn0zB5aA+qx
 pTeEqzxBGnQ4Av2tm02OdSR6DzirfPX+X2Cd
X-Google-Smtp-Source: AMrXdXuwWkjN9VjTZsUBS6YlKfZvBuVOeIlZE5uBO8tA6YikDU4nU4unrBc6Uawv6hM4h/QViVp47Q==
X-Received: by 2002:a05:6602:179e:b0:6df:5b14:61ee with SMTP id
 y30-20020a056602179e00b006df5b1461eemr43650673iox.5.1673239887009; 
 Sun, 08 Jan 2023 20:51:27 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 c12-20020a0566022d0c00b006cab79c4214sm2849628iow.46.2023.01.08.20.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:51:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:51:25 -0700
Message-Id: <20230109045125.2454698-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T2IvlPgKhIgsLSkQ5dJSZPP2C6Ds8rBm67b/5FJrJ8M=;
 b=DuHSM9eD2zQxIm7JvPX6kNdx56Lvs7zuAF3CCM9BB6Nia47SidsiErL66I2s3NsmpU
 Vjp6ZyuLtfoeeYYVhCdVgUYXoj6q8TPCwBfYuxBTlfdInj9Sx8WaTh+hvEEx2OIHiodW
 q0/OjenN8/Eyn2kJkSq7FTtnI/mZkH06vPsptdkXCn8pt+faqEo89loxppcS8ewuaYey
 jraVgCEDmqKTNpqyVekz0CZbpVER+HrwJ4WOXNhWRiYUGO38c8iZ23/qfL0+2ymEeYC7
 8dSRXdZ4930kb5uv8mfcpG9Vy22CBXuehKGL6VwYH+6Zk2n8zc8HvR7EzTc66k+3xtVD
 tISA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DuHSM9eD
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version 9.4.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/python-pillow/Pillow/commit/13306974e749871822dac413be66e699a0f4645e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 46da25dddc..d514bdfe56 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a6507c1e811a51071d2d6de83070e703  Pillow-9.3.0.tar.gz
-sha256  c935a22a557a560108d780f9a0fc426dd7459940dc54faa49d83249c8d3e760f  Pillow-9.3.0.tar.gz
+md5  ee6e9a6c729ed9e9a78ccd3f6e9d7143  Pillow-9.4.0.tar.gz
+sha256  a1c2d7780448eb93fbcc3789bf3916aa5720d942e37945f4056680317f1cd23e  Pillow-9.4.0.tar.gz
 
 # Locally computed sha256 checksums
-sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
+sha256  4e1755595052d843e2f350c930759f945ecf707bf812883948d181016b12dd0f  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 5ea9fcf264..c02968610f 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.3.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/16/11/da8d395299ca166aa56d9436e26fe8440e5443471de16ccd9a1d06f5993a
+PYTHON_PILLOW_VERSION = 9.4.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/bc/07/830784e061fb94d67649f3e438ff63cfb902dec6d48ac75aeaaac7c7c30e
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
