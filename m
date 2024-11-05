Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE13BD36108
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 19:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA3960862;
	Tue,  5 Nov 2024 19:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTQLABX6O_9a; Tue,  5 Nov 2024 19:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A018960878
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A018960878;
	Tue,  5 Nov 2024 19:10:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0CD3B8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9179080D05
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy5vboO_lmiF for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 19:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97C9180CC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C9180CC5
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97C9180CC5
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:10:50 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a6bd37f424so13156325ab.2
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 11:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730833849; x=1731438649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XaqKNVgj8nobZ4JBYSeXCratxe+pei01rVWhn0ZzXI4=;
 b=YsfAoo53NUAUD71tbeG0po99PvYoGQFKsXTyalMu9l/r1ljDHa5sYRz1fpNKGy2vwq
 +aRHmTVcgsu67HVFg1W143J38sNHEDjPe7rZ7uU+E/kK7T8J7LP8QmknBL+1aYAvfBBQ
 mlLQhh6UTfiixev9b9lgWAyh8eafNHCXwTz2a/YwtThBD/x7gHWijfIt36rgcl+cn8xU
 YSoZLGTTWw1R95Gf3b8SfQiUprcR0cMEaedhMdnlSMGM0p/yT782XK/Xd7VuoxdpfJkV
 gcjbqQMwxazlHdBpATFj/GqEHmcb2l2fbTsVjy9EdwH9YbhoAi2OKqOtl3VtXkVk6fB5
 yWrg==
X-Gm-Message-State: AOJu0YxSaxlzx60WrNr2HqGZ76Den/1092KDmFDPjK/jiY4mAkvRyzU7
 iGR8DyBXmL/wI//zy2fdXEPbNLuLQE/2D0AdhQpM0KIvfW28mKH1S1aXsQ==
X-Google-Smtp-Source: AGHT+IH08Jgy8/4MNPSidOO3yAFC5lDzO+n+XpDu8ZmffsP23EZRjVdFmmHUs+gdl8qorhKqoGZW4Q==
X-Received: by 2002:a92:d98c:0:b0:3a6:bf1a:17d2 with SMTP id
 e9e14a558f8ab-3a6bf1a1a5emr96625345ab.1.1730833849270; 
 Tue, 05 Nov 2024 11:10:49 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a99cbc09sm29641295ab.41.2024.11.05.11.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 11:10:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 12:10:47 -0700
Message-Id: <20241105191047.1578445-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730833849; x=1731438649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XaqKNVgj8nobZ4JBYSeXCratxe+pei01rVWhn0ZzXI4=;
 b=fwIm+v4vBre5nfw5hwmKu9SCda56b/Otb04R5m2lsbEkV8JR0sxu63sBPu7RFH5v1y
 SmLaZ38KJEFCaAC/TEfCX56N3BFkGKvsik3Ol77zVPV25iHO8U89nvk3mA3DlBAONTIt
 IbpPsok3Efb3sbYjxaqZRmhEWWEYEu6AOoJNB8XsELFZqz2MO5ZHq5mznIUG4lA59GWQ
 tmNZNvueHyiNOSkOoY6sylO9LuqOvKwFlf8jIbJgQgHwbiCiaUgeZ6KuvvIks/rNq1o5
 j5XjmQ6F1oXBnXkPz/oBJ/kb1euNpPwHpHH6o32jjqUbTo5xU4HbwdBcwGeNTF6MwzR3
 sWQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fwIm+v4v
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.18.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index d2ec964dc0..6243632685 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  74b67571ab1edd296ae68ed43843c308  sentry_sdk-2.17.0.tar.gz
-sha256  dd0a05352b78ffeacced73a94e86f38b32e2eae15fff5f30ca5abb568a72eacf  sentry_sdk-2.17.0.tar.gz
+md5  d68e388f9a261c00515e0f758303240f  sentry_sdk-2.18.0.tar.gz
+sha256  0dc21febd1ab35c648391c664df96f5f79fb0d92d7d4225cd9832e53a617cafd  sentry_sdk-2.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index a7cdd2d3d7..e2cbdcf405 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.17.0
+PYTHON_SENTRY_SDK_VERSION = 2.18.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/b1/83/7d0956a71ac894717099be3669ca7b8f164bccbcfb570b2f02817d0a0068
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/24/cc/0d87cc8246f52d92228aa6718a24e1988a2893f4abe2f64ec5a8bcba4185
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
