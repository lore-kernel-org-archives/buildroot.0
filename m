Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E992D3A675
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 17:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E538042E;
	Tue, 29 Oct 2024 17:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6n3aUsgHSeF; Tue, 29 Oct 2024 17:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFF0480C90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF0480C90;
	Tue, 29 Oct 2024 17:15:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EBC459E2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D9FC6062A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYcY7GNzLUyq for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 17:15:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13D496064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D496064F
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13D496064F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:15:09 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83ab00438acso2076539f.0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730222109; x=1730826909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gkyQ4XMiRGz6Wd1BfbZadqrUOUASHssu9R524kLX0S0=;
 b=Tx0/cJGETjzRKJU8C28MPFkSXRvd2UwLSo4SXVWgnDaT0vi6aiAWvFK4xGBIcZKBut
 H0sK8Vn/nhm3XWGNmO4Qzjvia+KReeyxR3tZz0FeBjHuL+8SjAy6t6YgyGiEBTw2ahmY
 c5tv+PrS3jtGiafbMlCF/7T6bf3dp9HNDvO2N0owqVcuhVlPUSKO72lm+NOeSJAiKBKf
 Ob9cwdOXG1Fg/Q+jeeysqdxqiHL1GxqaRXeUcq2dy5r7YdeM9dk8XEtan3LxbXByORCZ
 Z5U/v/xfH/Pi9qCD9ZmtbHaPMzddFwH18AdmruYUBon4EzK0CehKv0LAQ7+cB8ExjDt2
 wFAg==
X-Gm-Message-State: AOJu0YxfViRlDiaQxIMiJowzS50lVm157yHMqOo6DDLIbk8eWsAxKjK8
 ZmpnRt7sP4icmHhTzrJpCFynyW7Fg+LSSQDWppyKo3T4wtlkfkTgv6X4BQ==
X-Google-Smtp-Source: AGHT+IGaXwB0yRNt4dVJojLQio9IGYZ8WzAW1vArVlOMpjGFo8Y8uzHIEd8iBObt3+5ILa4gPqlgUw==
X-Received: by 2002:a05:6602:3423:b0:82c:f7b1:a9fb with SMTP id
 ca18e2360f4ac-83b4bea15a0mr227675739f.5.1730222108497; 
 Tue, 29 Oct 2024 10:15:08 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137f6c07sm214469239f.29.2024.10.29.10.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 10:15:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 11:15:06 -0600
Message-Id: <20241029171506.1047564-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730222109; x=1730826909; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gkyQ4XMiRGz6Wd1BfbZadqrUOUASHssu9R524kLX0S0=;
 b=mlimOFFOZPEcN81YD3r32AF65iZU9U2pTpJVm4WxlyKr6Lptgfe3nvXX/ta5RcWvKo
 di50lpHxl/MTP3VIcnewibuw/6tgyillVuZXvfLbma1tAUbUYZyI01I8VrDYRze6coz1
 8xezAedY0c0oSD8fGs4xFXfCAptf9E3eL8h17CSJW08kdDene81ThX2bmt3n2/jfTBa5
 c1u9ZI0WZWnqDDwc4ZQQHoslGEHrlL/9X54xmoPLEyuITtDDRqCl1tUY3L1sMjB5ghB1
 O3ThUTkNXyuP1RjWCEOT3npGxzSqUsb+FmSpkcrib/0+VpbVC9LKETyjpCD6Vmf2VXDw
 ejhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mlimOFFO
Subject: [Buildroot] [PATCH 1/1] package/python-twisted: bump to version
 24.10.0
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
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index a414058ca7..03c637c9ed 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  f89c2542ea9cb39c5343472fdefb4a22  twisted-24.7.0.tar.gz
-sha256  5a60147f044187a127ec7da96d170d49bcce50c6fd36f594e60f4587eff4d394  twisted-24.7.0.tar.gz
+md5  bbe77df51bb6375ac61b9be634ff59f3  twisted-24.10.0.tar.gz
+sha256  02951299672595fea0f70fa2d5f7b5e3d56836157eda68859a6ad6492d36756e  twisted-24.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  78d059391dddba18a695c1998ac9dde68160a1df1635f34adcfb3ecba4564802  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 01d2dff391..424efdadba 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 24.7.0
+PYTHON_TWISTED_VERSION = 24.10.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/8b/bf/f30eb89bcd14a21a36b4cd3d96658432d4c590af3c24bbe08ea77fa7bbbb
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/b2/0f/2d0b0dcd52a849db64ff63619aead94ae1091fe4d4d7e100371efe513585
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
