Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05FCE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ECD742534;
	Thu, 19 Dec 2024 02:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2h364Aza9vI; Thu, 19 Dec 2024 02:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A3A14253A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A3A14253A;
	Thu, 19 Dec 2024 02:20:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ABD7E9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6453C401F1
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7_VfOAYDrNB for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 388F940EA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 388F940EA2
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 388F940EA2
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:20:08 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-844c9993c56so27425939f.2
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734574807; x=1735179607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h8R6zoMre7Vn6v4WTNcRWHQSPCuEH2CM8LzMfwJnZyQ=;
 b=vWloji1y88XUP0nGbiBrnfRr9Z3A9JN/bYLUfE140Pb0Gx4O1t8Uc/Nv5aSc6rQFfr
 lZKtNfz2XBxtXYiEfJwKYasqG4cQ3XzeUdYMCh95Ootl6/W/F/wYPIZBmGebPNKgm4FR
 ctFqKa0N1RJ9ejF9eTSw23jikmC8wCdo0FUWbUP9SBzHECKirbinssTDKA4AHqP9vvj0
 xujppRVRFU7luzuaxSg8JISWQuaBoWqBbRnjsRcEEQdyK/iCLgFe0jEATB6KuEmZSNmZ
 M5TnBOU0J3HKHrHgqKMu1itLzpMZyjpMuDqGV8cpG2ueADxwBWuQ7bBQCAK6SS5Q6pXJ
 cY1w==
X-Gm-Message-State: AOJu0Yxn1HkPaVmTBUqOf+z3i9wRTVpPBMogu4OH82kdJQ21NyQy351E
 oXLBYwsg4g7mIieb8bfjJi66pebEVbMS4f6SQmCxSaJ4lGRy+j0LJe+3G2Va1Lk=
X-Gm-Gg: ASbGnctioq95aOv4+csuxX9W8sbq+TphEg5656PZv2N368okLZHUJEk1K25VuPMiHhX
 f9fcAzx5N8p2xndwlAuUqoQF3Vy+QM49uZA7FIReS8VX1/PN1mFj7RqHQvAZdpOqeXkWKaEhzXF
 E/t8a7J0zqJUezcVTH50q92MEwANMQiinXVfzwC6FlTF7pjXyZOSOLbDrHTz01D3VhaNSsOX+8q
 oxoShOFAWAmmsxZE5TgIEfhqm3lQfDOE/2mR6C0F1LjQzje++59tNgP2zXlQPb7XpW2d/wfPDH+
 oGV1hsdOGHq1ZHJtsAoyq9syh0oK40UdAQ==
X-Google-Smtp-Source: AGHT+IF9YXXWeHSc1xM+p6bzcXC7tTrK/Bz+S/m6bLluZXsbHnG0d+1pzK9oUu8DggERQKZZc0cIbg==
X-Received: by 2002:a05:6e02:12c9:b0:3a7:dee4:c41a with SMTP id
 e9e14a558f8ab-3bdc0ea6f30mr47254505ab.8.1734574806870; 
 Wed, 18 Dec 2024 18:20:06 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c199a3csm52738173.93.2024.12.18.18.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:20:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:20:05 -0700
Message-Id: <20241219022005.280924-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734574807; x=1735179607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h8R6zoMre7Vn6v4WTNcRWHQSPCuEH2CM8LzMfwJnZyQ=;
 b=UDgrJ0iOK0qhREmcYU5SAKfVGkc1F1yUh2QYAqC/9FJAAcN0Clsaa50G6DmPaRzUE5
 5U5oCO+inLXzXxvYS0ykPGQR++DchF9hLvAnnxXtYpFPU7RhrAULqNNQdIrzLlhIKCTj
 PWGX4PLzQPa2pLUuzQU9NTdU4aA8ImxbazCS8tyMjTeCHsHEyjY1I2JFdmaKRdkIFdu7
 Ttbc1tNl6y+29Kvh/w8ZOZ/rCKIydhpE0tEPHFGcAkFJoJzLpw3ZQWGKAJTzQe129q7Z
 pSx5pLgslrRe4DuZHeolayGUzOovs6qT0KYuPZ4y1wGTvdLFgMh560Hj1rL8IghQlo/r
 JHtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UDgrJ0iO
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 2.10.4
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
index b0db8ab4ef..635ae80dc2 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  84624d794e7d2b528fe1d34eeeeb481a  pydantic-2.9.2.tar.gz
-sha256  d155cef71265d1e9807ed1c32b4c8deec042a44a50a4188b25ac67ecd81a9c0f  pydantic-2.9.2.tar.gz
+md5  06f2a83ecaa1734954af07697bcc5554  pydantic-2.10.4.tar.gz
+sha256  82f12e9723da6de4fe2ba888b5971157b3be7ad914267dea8f05f82b28254f06  pydantic-2.10.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 2b9cd6c38a..622b297586 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.9.2
+PYTHON_PYDANTIC_VERSION = 2.10.4
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/a9/b7/d9e3f12af310e1120c21603644a1cd86f59060e040ec5c3a80b8f05fae30
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/70/7e/fb60e6fee04d0ef8f15e4e01ff187a196fa976eb0f0ab524af4599e5754c
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
