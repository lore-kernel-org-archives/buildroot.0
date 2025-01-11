Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A56E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09DFB607E2;
	Sat, 11 Jan 2025 15:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxEeDRHIFAEq; Sat, 11 Jan 2025 15:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28CFA60886
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CFA60886;
	Sat, 11 Jan 2025 15:42:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04390942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E65B6411D8
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lBpVn-9n4T4 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:42:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE37D411D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE37D411D0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE37D411D0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:42:13 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-844e12f702dso94760539f.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736610132; x=1737214932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ALgYaHSMBGNxQPWUWth5G5WzYOFkIm1W533Jr720+8U=;
 b=fwktbXQgZRxhAWIp82L+6+Acm0ZYPdyGm5iK0IvbVRybtMMz5zEJFMPT1OI8PmWwo7
 8HUQVWV8qYrt29aEwb8+RCxQMHo77SDzVJIIYg01Jvhf2z5KH4ccTEl/0tNT0uhNc4al
 gzKxm24eKAvJpah7w2fx5dkhTLAaEGJ7appDgv993rK5Bxc5DJjxd/cnpoeFfYjfHHwW
 M56QoSmcmbTeW5RPJZ5gqau8zCeUCiKVFtMsvf7dshscDuhIqrDwaBYpcd+F3l9GzR/b
 t908gg2HdRveJbX/ovSqmi5JNbFsUM6RAndQnmCMCqZ10GvLeYQXQ/M8Ywr91WU5M7Wm
 x+lQ==
X-Gm-Message-State: AOJu0Yy6ixRRwS397c8MQXeyQh+BYkFlMlrS5Lo/3CBBjqfXhYJIEs59
 hT17Q/3Bd0Xk4lZHShClTcrARh/yeqKuKw98Y2nbhlC9OlPPZ5FZ48QVEDWqIMg=
X-Gm-Gg: ASbGncvWhjSIAQCBA36GO/HDEqXv2Ps2OoN+ohb1NDQgh//zO8VzE76UINrXo43XwXP
 lfWwm5bacJAA3NcFXVHBFbbos62P9Fke2qIMKvEWq6ecq93EnJnLYq7xt3wqxN/cKnh/h7mdsPp
 MZ1ZvveH2hTPbDmkg0HxnkxpGhcgH+KOf1N4QZxc2YyP6HfayhNpFmzA4AzNn/PNkl0vFBrTyjl
 kj8AMS3jo4aV0P67blAKDHWhmQfUrfkTt8Ir6YqikCAzYKMZMWAzvFFgbr2SHhn51Rc3pWsHrVW
 u81IZ0Y/yfDJ8mukq3iPJZ4VJ+zHKvM=
X-Google-Smtp-Source: AGHT+IHGdxmbEdKeaBkTBvlPXMjF4/gq8dCzqENzmgKS5X5VTTJZzVHi3bd33OlwjePPJqSAromQQw==
X-Received: by 2002:a05:6e02:1c2f:b0:3ce:cd:bfef with SMTP id
 e9e14a558f8ab-3ce3a9c7eedmr113361605ab.12.1736610132624; 
 Sat, 11 Jan 2025 07:42:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7488e0sm1576540173.133.2025.01.11.07.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:42:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:42:10 -0700
Message-Id: <20250111154210.2852396-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736610132; x=1737214932; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ALgYaHSMBGNxQPWUWth5G5WzYOFkIm1W533Jr720+8U=;
 b=FwLMhmsAz6AUp5cEDL1ln0IhvIftorujqUS4lVf+LlpW8QB+zUGMoArILOwZ+59MOl
 L58GFmvOAwqEGNuWoSx5lD7S0TPEO2LmIFGEMGigawDnNYR6hPUJpgr44vGgslbePvwh
 xOiOTNmSjCE/4luY9BYixDXgoiKkKi7J8vpvTdCDhpNas8pOtIBFWQwtI9EgvcAv2caC
 Om7YhpMDM8D9hNoYQQZEdKu6v1FJt/Ol7UOfhlswwTltjoKhA8DhHW9wDrKrqqJ4i9xo
 b99QgFfMaT+dCCUH8qsXsYsGlc5C6k1js0c/WF0zf91BVY8y4dpZrbhxAIKxhS8Dfhzo
 N1Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FwLMhmsA
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 2.10.5
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
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 635ae80dc2..2c814b2f40 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  06f2a83ecaa1734954af07697bcc5554  pydantic-2.10.4.tar.gz
-sha256  82f12e9723da6de4fe2ba888b5971157b3be7ad914267dea8f05f82b28254f06  pydantic-2.10.4.tar.gz
+md5  be725b089172d10a9c95605fed30cdb1  pydantic-2.10.5.tar.gz
+sha256  278b38dbbaec562011d659ee05f63346951b3a248a6f3642e1bc68894ea2b4ff  pydantic-2.10.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 622b297586..8b9da3d45c 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.10.4
+PYTHON_PYDANTIC_VERSION = 2.10.5
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/70/7e/fb60e6fee04d0ef8f15e4e01ff187a196fa976eb0f0ab524af4599e5754c
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/6a/c7/ca334c2ef6f2e046b1144fe4bb2a5da8a4c574e7f2ebf7e16b34a6a2fa92
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
