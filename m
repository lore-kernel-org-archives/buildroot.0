Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C7CCAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 22:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 273F260BBB;
	Mon, 15 Sep 2025 22:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72zIGUHFvu2z; Mon, 15 Sep 2025 22:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6316B60BAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6316B60BAF;
	Mon, 15 Sep 2025 22:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD4922F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F2C740490
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrXY2Cd3g_JF for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 22:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B49FB4047D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B49FB4047D
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B49FB4047D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:16:15 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-423fe622487so27650725ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 15:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757974574; x=1758579374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UX90NNJYBA6MOJDUc+Ek7ZgepeLwjEo5CeeOhcGhDRg=;
 b=SdxtcNYxTSN0UaMhjJXqQlEY9YSBD5zE5ql0KAXs/4B6JxRph2tEwRMpR2B42mvq39
 J5xfD8tlteiUldMbIat1lK4Y/L2jlmo7+bLZrnc4a3gY9z1YVQbLlXiEhaQnulLMa0mx
 RrCghDgYPAwzQ2eBBrWib3aGf2RXjocT8xVc1U87ozbKxFjEe1CqfIcBX4agUdRNJufy
 wh3FCXvxMW2Rr4lJ56VeJT7r83WjnqCUwkJyl5VYddl6p/b8DBjmaAncToklEQmEaygM
 YBHWXTxmTLoSzivQr+4PsxpkfLicd0wrDVEXcSftOpXZLOC/r1ir0IkKxNc9w7iWI99+
 GwgQ==
X-Gm-Message-State: AOJu0YxrJeT9WJ59cOmZYadQur33G6RjhrOBH5Qq5/kXdrpI7GYatX7x
 M3itJF6JOw5at9ff5czghS63tiomxpuj5J9PdrVEAVya2iyjQiP02WmjoHUPew==
X-Gm-Gg: ASbGncv9tcajzl8GdkToPRUWmjaWMswu6NU9yC+olQ660CPikhGZBpXL3L68XROgZMq
 q3+R0OR0WPijQM3f3I/51FL/w6mEm1OXeXuTuQ6CAo3YlrpXfT9IAuXz+U1Xj7vu1VZHsm+TGop
 wcNJZfRJtIUIY3P97kam4ctBvB5+3ZYXHdAwfimzSqL2QpsVTaZH8rnfS6q0Mho6r/ZKT+IomHy
 6aqNNqwp6Iztp01L2mkTY+VckcWp1I8nn2hzKhYknPEC/qH8OWrvRCJVEW2EtUYa7+s/b8Y1JPw
 FSZDc02nW9yvQ17NUB6GJLPUiUmMG0G8cQ6ukblL6rhiPSmvB3KjCV+iAzzK/Grx4ZD6yEWJM+U
 zkwSczXOgMjRaOXnji2zSIJjE87Zi4MjXRPUReinjeKur3aWXyJNKDo8LD3tc/kwqYkoQWKmrgh
 5aiLtmHo1nMxk=
X-Google-Smtp-Source: AGHT+IE/rmYDyIfc5FLo3VGwiLrP828hOuATi7fpOkUmrN4DDSk4jh+gxBlNsadXpFdWYODqgXmPtw==
X-Received: by 2002:a05:6e02:1908:b0:424:9a5:855b with SMTP id
 e9e14a558f8ab-42409a58679mr32724385ab.16.1757974574356; 
 Mon, 15 Sep 2025 15:16:14 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41deede654esm62767455ab.9.2025.09.15.15.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 15:16:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 16:16:12 -0600
Message-ID: <20250915221612.1606744-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757974574; x=1758579374; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UX90NNJYBA6MOJDUc+Ek7ZgepeLwjEo5CeeOhcGhDRg=;
 b=FiXQu7ToF5tU5+tbs1Nt8RqnI1go/iuK0BtUtvjmoXmdIQNS3ur8re6rsJ1Jqj7NHZ
 b6X2rV3kUeugxVzhzIaV2m6/W+VyeVmRj4P6bQqcsKOAwoJMFWhJftxG1K0TiZzCxEiL
 VBhbgkNJ1qsRXNY74fE6XI7gnkHxcM60bQbAqnFTe9FpxN2XyvbbR4uZMpTIo0ZaYocj
 C8JXW5HNn26j2vRmfC6+RpNcRx+8s1vnxJrio2/cwVS0qWxxKoP7iloukYG0jCWGXtaG
 0c3jL6/dswkvfRuwxuQ2e+mcQCJHvUSpwWn3fvm00IyrfzF061QlqRIeIt1B+ykwuqvC
 s6xQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FiXQu7To
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2025.8.3
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
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index bf722c97e8..723e2eccfb 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  e7e7a03aeed4290cc28cc62975aa0149  certifi-2024.12.14.tar.gz
-sha256  b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db  certifi-2024.12.14.tar.gz
+md5  bb7ee7c24518dc4314ce7a83ca24263f  certifi-2025.8.3.tar.gz
+sha256  e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407  certifi-2025.8.3.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index fe5b4ff690..996e451d33 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2024.12.14
+PYTHON_CERTIFI_VERSION = 2025.8.3
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/0f/bd/1d41ee578ce09523c81a15426705dd20969f5abf006d1afe8aeff0dd776a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/dc/67/960ebe6bf230a96cda2e0abcf73af550ec4f090005363542f0765df162e0
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
