Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500B9C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 106AA8174C;
	Sun, 15 Sep 2024 07:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRPjq_2OPz02; Sun, 15 Sep 2024 07:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3638175C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3638175C;
	Sun, 15 Sep 2024 07:57:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED56F1BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9D738175C
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KP69OlpbV3VH for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E629B8174C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E629B8174C
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E629B8174C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:57:47 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so112695739f.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726387066; x=1726991866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qqmWbWeFQVaSSSPjnAkNMD+8kvBxDcpQTXE+y+dLMR4=;
 b=JNSwOT1I66LjZSWdYKwH95xuLuM8vY99369r6G0D+4uZKaFAeP5MK+9/mkZRZeICR3
 WHASSqA14ADtIOqYct1nw9ila/EmonbSI3/CX3F34EkkGPbU08d9zpBB/9cMJ+m9975a
 E2KLTGl8VDVeFS0xkCtmNr/0zx8v2LlcNIBqbvJUWFOXaJmWypEs2Ar4tliOE1jD4LkV
 coCe0UEQvtYpGPfaFzs7L6VNX9DfQUm4Jht0eM4MNcTtJ4mX5SraPUq5ncjFNaVdc7E8
 Za4KQSto29Ii5dsaK0kFT8+WhDDwRIKgYHYMXorUVY1OIdZOrDFKWxPYjMI8j2VgETEI
 Kxaw==
X-Gm-Message-State: AOJu0YzNID3xBpE9vE0i+PgMiTsHPKE+GA+QvV6PRvc5auWU+cAIA112
 EZtVBrBcEeoDXu9cduM2KLmypr71ikwFhHsbH2VfkfTpZfPDd3PlCIQ0UA==
X-Google-Smtp-Source: AGHT+IEQ+5vGUnmdehikd3Wnw4mR0IsgmZlUY5hspRBYkSPzWrLK861eIHRFyT7Yenz64yHqcSBJVA==
X-Received: by 2002:a05:6e02:168e:b0:3a0:4df2:52e2 with SMTP id
 e9e14a558f8ab-3a0848e8395mr123094265ab.4.1726387066360; 
 Sun, 15 Sep 2024 00:57:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4bf6sm814434173.18.2024.09.15.00.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:57:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:57:44 -0600
Message-Id: <20240915075744.1564975-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726387066; x=1726991866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qqmWbWeFQVaSSSPjnAkNMD+8kvBxDcpQTXE+y+dLMR4=;
 b=j71NAI7oQo9idc+M02gpQlr4mzcYcYczS+lg/3Xw5tHkiAFlhAvEm9EIr2L9rWo0wm
 d9wP+UCsOcsacQaIfXfzpMUwOgRYSkmKO3Ahs2nth4JK6YMtTSrzUAaxNm4Q+EVf99/k
 8cWA2KxQBN7FbsZ+EtZdzNEoBfNh6y9l34OAOpvRZGXZ38+Cv6DGLaSto4kjacHU6gk5
 xjJOlzALwJDx8Z71QzZPXf0WapYrG4YuXgvmZFP68g9FmfavcWbQtxfPORGBY0oVnEci
 5CjiGhDoXoBibxxVWs1F59p9GCjLKD5MGCpOfhfiLU7UDRcHKGsZFyANxww5jSg3HkT6
 tpuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j71NAI7o
Subject: [Buildroot] [PATCH 1/1] package/python-hiredis: bump to version
 3.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index ad33295ad7..d4d98d85df 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  8823961dc3ba19a6e63ab6329b3b852f  hiredis-2.3.2.tar.gz
-sha256  733e2456b68f3f126ddaf2cd500a33b25146c3676b97ea843665717bda0c5d43  hiredis-2.3.2.tar.gz
+md5  c0b7f7def9f945e8a900a4275df2d3af  hiredis-3.0.0.tar.gz
+sha256  fed8581ae26345dea1f1e0d1a96e05041a727a45e7d8d459164583e23c6ac441  hiredis-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index d86fb109dc..59e036c845 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 2.3.2
+PYTHON_HIREDIS_VERSION = 3.0.0
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/fe/2d/a5ae61da1157644f7e52e088fa158ac6f5d09775112d14b1c9b9a5156bf1
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/8b/80/740fb0dfa7a42416ce8376490f41dcdb1e5deed9c3739dfe4200fad865a9
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
