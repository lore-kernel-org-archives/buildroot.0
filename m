Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA22D1358B
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1814180897;
	Sun, 27 Oct 2024 23:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxjKVJXnlmCY; Sun, 27 Oct 2024 23:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11054812EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11054812EF;
	Sun, 27 Oct 2024 23:48:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AB8B1DAA
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A6BA40274
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItO4cJcZtZLD for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:48:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2EB040270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2EB040270
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2EB040270
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:48:54 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a3a6abcbf1so15015955ab.2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730072934; x=1730677734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T4BpzrBi0wAnshpgIK8g2Mu8Zx2h6JizSAPOR7QQp04=;
 b=Ohzq0fLnXUIZuMQn1GtyKqWjyC+SCUi49Q7V47yBbUp9k696TOjqK/pE6o0CQ9Ka5Q
 IUjPhQ2k0y51uPZsj9VM2UAqONGNM+z7FaZKo9prGfJ7UWKKeMuGtLbw/X1XGtp3+COI
 Rp7wupEPgG7IX7lfhjDfjX7P03agghUvwbDDWtceWSk+3a2rwMle9njeGQgZjd1LkEf4
 +QkQNHqYdrwmIZ04BDnBS1WVBD/L/T6ILpnrJ9FBdFiJH+jXb6ikUp6HHmkXS2j6BzQv
 6Zl3PSNQc8mYN4YJgD0J8Er2IGuJwas/52VjwJvTlM3qwv8H1gJ8dHKBGTIQzbuUE9bQ
 rWjA==
X-Gm-Message-State: AOJu0Yz4MawZjHvkc3kWhSQv3cc5h0V2rZzi4iaL68nlRwAEuiMZLD6Z
 SjdshemcaUZ0OWhHLoX5edRwc0H4c18Sp35JxFnBv/UnFmUaBJQ9VI1kMQ==
X-Google-Smtp-Source: AGHT+IF2yerxS8vlZa2152BpiEx2GPTC43MnL12z0wBHlcSHDd01uvhiMLsiEAOj2cQeUPHeuNtA3A==
X-Received: by 2002:a05:6e02:1386:b0:3a1:a243:c7a7 with SMTP id
 e9e14a558f8ab-3a4ed275e40mr50401955ab.2.1730072933646; 
 Sun, 27 Oct 2024 16:48:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc7277f977sm1349092173.137.2024.10.27.16.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:48:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 17:48:52 -0600
Message-Id: <20241027234852.3989358-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730072934; x=1730677734; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T4BpzrBi0wAnshpgIK8g2Mu8Zx2h6JizSAPOR7QQp04=;
 b=DlPWILRBjh76H9zUTf7m9rC7nlxNDrKZkOmJ7BE+7zKHsGYkWMCC7ZRIPgDJEuVAdB
 /re0XfCdKV+N1ECe43BCTxE2z+SK/YS53RaFYViDikRu7z2Ip87ZS11umR0ZqtABT4Jg
 kBAic4vJU/ol2QbN7EVoQWHIYjt8mnt4lpsR1y7Z9UyAa+g6axN5TGe5Ev4M0sH/5eQs
 I7GKUHsZT7KmSRQADnDs1TuS1r/8sdrDJAxZ4MzumgKA9as/RBs0XS2ZTgia/s5NgsER
 rki7V1eTHFy1ijdOd2M+E8z3rRwTesyMK5Y8S9qrbBtfxBnADNdUJigvj29bDefm7KlX
 /MSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DlPWILRB
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: bump to
 verison 24.2.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-service-identity/python-service-identity.hash | 4 ++--
 package/python-service-identity/python-service-identity.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index 9258e0ddbf..1d7f66fd5e 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/service-identity/json
-md5  64267a4351ee3c225ee12a11bb29fc44  service_identity-24.1.0.tar.gz
-sha256  6829c9d62fb832c2e1c435629b0a8c476e1929881f28bee4d20bc24161009221  service_identity-24.1.0.tar.gz
+md5  e575db51719742ec39191c896e4c2971  service_identity-24.2.0.tar.gz
+sha256  b8683ba13f0d39c6cd5d625d2c5f65421d6d707b013b375c355751557cbe8e09  service_identity-24.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  24bd0a9ba7d0eae08a3a6e32a1b09f8e6871fa0325520a2fcb00e1539eaa602a  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 3c04a9d4c6..7965811c6a 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 24.1.0
+PYTHON_SERVICE_IDENTITY_VERSION = 24.2.0
 PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/38/d2/2ac20fd05f1b6fce31986536da4caeac51ed2e1bb25d4a7d73ca4eccdfab
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/07/a5/dfc752b979067947261dbbf2543470c58efe735c3c1301dd870ef27830ee
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = hatch
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
