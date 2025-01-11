Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BCDE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 19:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0EA683D32;
	Sat, 11 Jan 2025 19:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10I3lOJhaybw; Sat, 11 Jan 2025 19:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3FE483D35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3FE483D35;
	Sat, 11 Jan 2025 19:21:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A20A942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3593283D35
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YH6sPJZBMMGD for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 19:21:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F12C883D32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F12C883D32
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F12C883D32
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:21:41 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a9c9f2a569so20402425ab.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736623301; x=1737228101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FQ/G/dQYCaXohhK0LKQ1U6bc3Xynoq72w5oJ8ZK8KXw=;
 b=dyXstOk3NotvcaLVBWb7twVpZG5t3SctJFayWlV8UlhW3NQL6dVcjJMeJNvzCJ3RPn
 OQkMlURBGIhFopH+slBxxbSTfs52hB71Gk2iEyBb8AuC9pv2KGXec1ERAmWLL1Tc7z3b
 UwNpEZ8Pn2YOO57Okx90eORXK4koFshsQYUBKJU9SMeG1GtRKzkmxSipiBzqL4+Twg67
 1dffPkUnKSfJnR22b6WPs05b69v64UE0c900FypU61ZFDcQNUM8WFFyl/QnVQhWcVHoc
 x8qVDgjRNKAlgoWEqV454ucTx2GtmEnEMfXc6Cz/+fyDcEdB3gdAVwH2MWiytyg3Oe+M
 rkOg==
X-Gm-Message-State: AOJu0YwG8WOXyoc8saijszy8VJqwT0n8XfE9MZniE5WFAuWSjOnCxnmf
 iIHOUKgkD4en27EmHcqjGHjXPE6p40vQ/f/2V5RTX/WXUdENBmEhzRnRxG3McNo=
X-Gm-Gg: ASbGncufRZUr4UEQcN74xpduGPi7yaCcwymAKRT4Nv/eNrhOs8m1A2NY8PfG55YQfLA
 a1HkvfsSxP38In3KVwG7fL6khNo2YVESJxDAwdLGZO2CqJr6Vkkm3n0RwkGcQ3q2IllTJToKBOO
 NOTo/+8jiZ8HXhXlivVLBhIOsB9mGM5G/8n6bUZEeeHcc9DNk4aee0QgF2J9l7jEw3ZHiTWjMTN
 zJrfVQYow9XCjJ5VIZn/51P9nXxQ6y5emQCaFnqZGbeug10bnSRl7J1/V6AtOnFSwpwS2npM9sQ
 tq+inxKlfYumG71du5c/L7DVi7T7LKo=
X-Google-Smtp-Source: AGHT+IGhl08oCOuQ63my2c8yDV7jWGJZm8p/wuJfdAbHIBMHC+LCyVrW3MGDYTx2+3jHFQV1W3oD9A==
X-Received: by 2002:a05:6e02:194c:b0:3a7:7ec0:a3dc with SMTP id
 e9e14a558f8ab-3ce3a88a2femr122714945ab.14.1736623300788; 
 Sat, 11 Jan 2025 11:21:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5fa275sm1649380173.21.2025.01.11.11.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 11:21:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 12:21:38 -0700
Message-Id: <20250111192138.2967261-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736623301; x=1737228101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FQ/G/dQYCaXohhK0LKQ1U6bc3Xynoq72w5oJ8ZK8KXw=;
 b=d8EPguTiPbATygyKF8L3w7CAo7TVlVtxovwXLC+cY4wMlJVNz5HiiuhCSttExBl3ct
 LOZeBIJIpoe0Y5svKaO62hxqg+CMhv2LB5FgwTPr8pUfvt2YeFoSzdWJUPcMqMGo/5uA
 EQQCX/rLzUfbVA1h5UKe7DyIgLObvxSw9jEQGn73v5TZuzFWcPn4OTM1zRAkvq9Eh8IP
 ZZP0HtMaHTrnJ654gmPNkNYYDjPUyacoGbbZ6MCL/cuf9jv4+Cgg357HWZl0BUukoBJD
 aPemVO35rz8j5T59KC0zGleMpzb6XkmwyP7sNRZtnIVlu8k9nPAP4YrLxFu+zPaTNI3n
 ExfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d8EPguTi
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.18.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 3918383548..ca2d42bf58 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  d356afad18b20095b766ad47bedcb34a  yarl-1.17.1.tar.gz
-sha256  067a63fcfda82da6b198fa73079b1ca40b7c9b7994995b6ee38acda728b64d47  yarl-1.17.1.tar.gz
+md5  80b89d2b28be7345a38f099b2f839d7d  yarl-1.18.3.tar.gz
+sha256  ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1  yarl-1.18.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index c7d846521f..160dec8a1b 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.17.1
+PYTHON_YARL_VERSION = 1.18.3
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/54/9c/9c0a9bfa683fc1be7fdcd9687635151544d992cccd48892dc5e0a5885a29
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/b7/9d/4b94a8e6d2b51b599516a5cb88e5bc99b4d8d4583e468057eaa29d5f0918
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
