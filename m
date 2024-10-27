Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF116D1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95DB4405BE;
	Sun, 27 Oct 2024 23:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvSMQNIhTWxE; Sun, 27 Oct 2024 23:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66D8B40602
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66D8B40602;
	Sun, 27 Oct 2024 23:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30205AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DF9240270
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUAgb3Wrd4rk for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D056040274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D056040274
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D056040274
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:44:17 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a4e5e57679so8485505ab.0
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730072656; x=1730677456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BtoRWMkK1Ymy+OBHLwY2R5FTYlbbooU21Mh6pERA3Y8=;
 b=B81+bKRKBkFz5BfAUHo4Ml+18P0j5FjQNog8j29iJ4rry8baHd99iRSIEHB+ad+ebt
 bOvBTWxfbQpe9chJB5erv6hnae4L69P6vBXOH7Zp73h0+Y/5nWGN3gHPpTav4qp/+bGd
 bRpb4tDp7xbMu8RtiIhKBgarUwfwurdZ/yy4AAHM5l40U8hRhwun8inCmjae83RYjDre
 LyHkkU1oNJVBKnsM2fDgcsuDzAzD2zR2BKAq/BJ9xIivt+60jXnN5seZK3pUr7LU/gIl
 QGLFaS8GwoIbW3x48NrOFqO5BEInFHhwHsXTcjJIf/UZK8DKZWBX8hq5Hjuww0N/mTyU
 Wdsw==
X-Gm-Message-State: AOJu0YwiDi/od1id4pWBeunfwk4f6q9rD/2gYlYrbu6vox85GV56LMWh
 rD7Xku7gNPT8ynyvPxnCDfm+7blaX78SlHjEUrBtdgsO60noeay119WL3A==
X-Google-Smtp-Source: AGHT+IGDNLsj3HfTCTmiSgltONDrKw3RQi5x72sC5IOIfVE4f7i+ytXChJMmPw1en2jM9xYXk86qFQ==
X-Received: by 2002:a05:6e02:1c47:b0:3a0:9043:59ac with SMTP id
 e9e14a558f8ab-3a4ed32628cmr52578395ab.25.1730072656562; 
 Sun, 27 Oct 2024 16:44:16 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72751cf8sm1375862173.102.2024.10.27.16.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:44:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 17:44:09 -0600
Message-Id: <20241027234409.3983354-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730072656; x=1730677456; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BtoRWMkK1Ymy+OBHLwY2R5FTYlbbooU21Mh6pERA3Y8=;
 b=D4TRe7ibhqyY3AQ4RiL052eSeueWd7XvRcRsV4tHNecfrcCQf4yIZC4BE4zZlJNKps
 8W+w0No4ndEZlCn7+pLctZNrqEnZbH0+hlqoO2kXRt7PEbauXDEFGtSHVliX5m661Kmv
 9FhVn4C+o19qT4Vd0V7v3HkdB5Ufe/FWUGK8zFDKdute3RLt3xMzaTVjv9o6yHKNNjO+
 EQwdLGszVPAS0GltdT9uE1OruUIFesw52B3sDRVQo2Rwb3f7BCQoelfcSOCM2/5gMgjW
 RcZE5wJdzBsjgyBUx8KVcXSSTCjLQnsH/jIwqg/CcUSl52CWA/eQ52rZShCE2V15JZte
 ZzhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D4TRe7ib
Subject: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml-clib: bump to
 version 0.2.12
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to formatting changes:
https://sourceforge.net/p/ruamel-yaml-clib/code/ci/9ff72c32e7be55987ee5fb4cd8803b54e28e8a3f/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash    | 6 +++---
 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
index 937afc3df1..2bb726819c 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel.yaml.clib/json
-md5  b72e549363fa1b9c4f9123e98f2b46cc  ruamel.yaml.clib-0.2.8.tar.gz
-sha256  beb2e0404003de9a4cab9753a8805a8fe9320ee6673136ed7f04255fe60bb512  ruamel.yaml.clib-0.2.8.tar.gz
+md5  53fa5737bbe5a07fac7db3d1a083fee9  ruamel.yaml.clib-0.2.12.tar.gz
+sha256  6c8fbb13ec503f99a91901ab46e0b07ae7941cd527393187039aec586fdfd36f  ruamel.yaml.clib-0.2.12.tar.gz
 # Locally computed sha256 checksums
-sha256  5458f90e82366f660f956b3c929ba5f7a0efdb99a99a847e2f51f2020ffbe887  LICENSE
+sha256  99f72489621ceea1254f9f0ea7c6e8a5e8e38b62edd1d983e6e1cb20d533f0a6  LICENSE
diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
index 25c3b44131..2a4d8a98d1 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.8
+PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.12
 PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel.yaml.clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/46/ab/bab9eb1566cd16f060b54055dd39cf6a34bfa0240c53a7218c43e974295b
+PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/20/84/80203abff8ea4993a87d823a5f632e4d92831ef75d404c9fc78d0176d2b5
 PYTHON_RUAMEL_YAML_CLIB_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_CLIB_LICENSE = MIT
 PYTHON_RUAMEL_YAML_CLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
