Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B44D1358B
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 00:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8F640648;
	Mon, 28 Oct 2024 00:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hP2mW4cSCJV; Mon, 28 Oct 2024 00:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCDE740633
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCDE740633;
	Mon, 28 Oct 2024 00:39:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5132EAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3220E605DA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6emhPdO8v4lQ for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 00:39:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 454B9605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454B9605A3
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 454B9605A3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:39:42 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a3a5cd2a3bso15590585ab.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730075981; x=1730680781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cnhPVd98V57N9yJ23PPIK+Mep4W4K60VPE+zMOO7VXA=;
 b=UPITGQNczWQ+k/Q4sPOMLXUcJ14toHh8OgTF51Z3JfxC09Xkq1HO9rcwu1V957WyyU
 Peml95vfhQiaYKNVo3pu0Src3gCSfGNcN71KyNAzE52AyMW4pxKcnf4i07zOdN+kfFD9
 veTM1g74+fxQUEbT349rPdgDR8vbCvSkZRi7lTZUdPH1rDum5BbLCYLTCrONN6ui0+AY
 ZoX87Q/xixpw8Ys+XRfd95rFw5a2pbfOLXy/Mr2H6385YLWCpO5+Y3slr3GYCBMaEZ+m
 +sTzoS/4GNDOnBSBlSISstMYvvTvfQ0p3tbUZY6WlofV90krygngCGuJWiTzXPjCh5vn
 aNdg==
X-Gm-Message-State: AOJu0YwzMOa/ERque/T61Is2NrG5patUImBY/9aTBZBytnA9SGw3BlcZ
 c4QtcUjITAOODsb2WK66yHwKKlmdxO+obmLmzoJwnILb32R9+WBMZrBa0Q==
X-Google-Smtp-Source: AGHT+IHHTLmjE5E9DgyW8c6FQoDXVTj+trkVzkAtc9ZNBLPCgRIKk+Ndx4MKgRdhI8PkVlIg49MBvg==
X-Received: by 2002:a05:6e02:16cf:b0:3a3:b439:5d09 with SMTP id
 e9e14a558f8ab-3a4ed292f98mr65000185ab.11.1730075981023; 
 Sun, 27 Oct 2024 17:39:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72784f07sm1351188173.153.2024.10.27.17.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 17:39:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 18:39:39 -0600
Message-Id: <20241028003939.4110179-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730075981; x=1730680781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cnhPVd98V57N9yJ23PPIK+Mep4W4K60VPE+zMOO7VXA=;
 b=fPPSdcGN0RZQCYZ4QCyY7XZ+iaBAamcHPfEkUiNQeIFwsRyRO5hzf4YJXWoT00licH
 Z0h35IgsAvNql9gm0CRY36Us3I8LBAlXBhltM7b5qu/U0PMvkgagVYsCSiWRe+wVocHc
 WU+CpcfFBX7awSPcpCh4WD9iiOja4wSybI87neGQN/+MeqKXORxwFDJ1rECvsFxuKkvi
 W+bX3ZFfXLXL/9GNbqkUw4ZU1QYg7vQf3R5qcbK9YO37XL76MAUXFUNfa5sR5+GX9eg3
 Mmkel2/ueGCSogIfrsMTS7OZ9ZXPY5v3nFy+CL+AgaPIG+tIH7RvNwQL2qUts9DUJwp/
 V9pQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fPPSdcGN
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.115.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index a9e705c09a..6c7451ebd0 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  69eba948ff7e07753f4d797a3f938ac6  fastapi-0.115.3.tar.gz
-sha256  c091c6a35599c036d676fa24bd4a6e19fa30058d93d950216cdc672881f6f7db  fastapi-0.115.3.tar.gz
+md5  feecf6d0db305d63ee9e6fcb77c81673  fastapi-0.115.4.tar.gz
+sha256  db653475586b091cb8b2fec2ac54a680ac6a158e07406e1abae31679e8826349  fastapi-0.115.4.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index eb493c7a36..95eb565b23 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.3
+PYTHON_FASTAPI_VERSION = 0.115.4
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a9/ce/b64ce344d7b13c0768dc5b131a69d52f57202eb85839408a7637ca0dd7e2
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a9/db/5781f19bd30745885e0737ff3fdd4e63e7bc691710f9da691128bb0dc73b
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
