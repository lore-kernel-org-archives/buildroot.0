Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25861E7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D29D240729;
	Thu,  9 Jan 2025 21:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rd-n9ayuhvX; Thu,  9 Jan 2025 21:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEDF64072C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEDF64072C;
	Thu,  9 Jan 2025 21:49:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDD17940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D05E083268
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJpQQoTJJCpu for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F13580B45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F13580B45
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F13580B45
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:49:29 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-844e12f702dso44287039f.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736459368; x=1737064168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzE16+Rwnlb7M7k6USBEPI9HyqL3uX4iACtrNk/tKRc=;
 b=Mll3l9FBQWavcQckKynn1p3GGD6cxXpiIq9uIi+hC6gNLT28HFx0tS/lQNTRvB9xP1
 fOGS0kUGmcTp3Bm8b/IoglbLUAWjp59D7plXmz8Nk4p+gn7pQ+1JRzjZv0Y0/xgHrRVM
 4U7tf3k9745bfsTSy0e8CXTFgZpbW9SRu5ykY+bF9AgY50oKDcXtjh+V45pKmvCOZB8P
 LXpr6T3eZbGCxOMhl8qszO7kTR96vT7bVk8ISsRBUM+vGhzA1fW5tDmVa3tn02VLu2By
 wl8l5bfM6VeokZnq+lCl2N1Tm98paps3bIIG1fvt0tLjN7JhvcSL07igFcbKAuhsDZno
 DBqQ==
X-Gm-Message-State: AOJu0YzZMN66v2phm5TO9eBd+b7XQTfCAorqxzGWcOV9SrSZo4ho6F1z
 GjuptRCObEkCnhRCEXOQA2V3d/n8SdONAneDJYyRt2U4UILuI86tn1F7FAxD8eo=
X-Gm-Gg: ASbGnctBlYy7oy+MjC5FkS+v7nKUYNn6dzoLfrdKBBH1KjxRX5XBryna9Xjx9KVERvS
 +CbkBGSlf+otwrB5UxDfv4pOJCFKZbecKPf8FGCWqoCJ39/pX1OElUD7ezptCVboglu5igndOB2
 +Bbdk4gnUocqmh6WceiHeN6R7X96idA4wGycpuLtrRZiZ+skFHgpL0DgXrzHTVWcICii2ODNMy9
 8ThvfkdyMIhMO9WCEbDkruzPFRN/9Irx0QP8c5eGwb1uFjA9nZLnuFauPV4GWuViX/3emuA8d/9
 YfVW//7+BLZnMlNVKDXc4EwAx5FXgEU=
X-Google-Smtp-Source: AGHT+IHuAw+yW4aTCoLAxr8FO64ziXHJZyTq5g3At2aDX7Hr1Skf8hdyfOTtKEVxi8qDIT9DqocOFQ==
X-Received: by 2002:a05:6e02:168f:b0:3a7:e701:bd1b with SMTP id
 e9e14a558f8ab-3ce3aa760a7mr71612765ab.20.1736459367893; 
 Thu, 09 Jan 2025 13:49:27 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4af56490sm5941265ab.49.2025.01.09.13.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:49:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:49:17 -0700
Message-Id: <20250109214917.2422338-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736459368; x=1737064168; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SzE16+Rwnlb7M7k6USBEPI9HyqL3uX4iACtrNk/tKRc=;
 b=AXvVHyqizqTC06HwyFWlydI7tVov/ds13Q5i67HqAdKbLV4U4HptyRtWe9oi4Q7tRW
 sGlZTyXjuyLPgrbUswqyYrZ4Y9f0YmFCjUxjunZoSpTw5kuc1UriIFJpA8KqHlBl1dvX
 jpEGjZa0VdumIHppkOr4LB7IP41wIlgZCqnRRqHeLJwOsPX2QsPEN46hsgYziHweCzH5
 sezefM9AbvtbMabGI5gsC38A5R9b44EuTr8J6v8dR8ke0wbK6FaiIp5QusqqvJO4lux+
 3bh9VOBI8zz2vhHFod8V+4N4nBPU5KqZkNpu2V64M1SVkDiz+y0lO7nmQjLwjEYFBiqy
 LmiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AXvVHyqi
Subject: [Buildroot] [PATCH 1/1] package/python-jedi: bump to version 0.19.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jedi/python-jedi.hash | 4 ++--
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index 99034d20bb..7ecce429aa 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  0951191b506b660bfdb90c3dcd5b3254  jedi-0.19.1.tar.gz
-sha256  cf0496f3651bc65d7174ac1b7d043eff454892c708a87d1b683e57b569927ffd  jedi-0.19.1.tar.gz
+md5  bc2dfcc3fdcd7a1384867b5c6f5bf519  jedi-0.19.2.tar.gz
+sha256  4770dc3de41bde3966b02eb84fbcf557fb33cce26ad23da12c742fb50ecb11f0  jedi-0.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 5d54642a07..7cd69f9053 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.19.1
+PYTHON_JEDI_VERSION = 0.19.2
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/d6/99/99b493cec4bf43176b678de30f81ed003fd6a647a301b9c927280c600f0a
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/72/3a/79a912fbd4d8dd6fbb02bf69afd3bb72cf0c729bb3063c6f4498603db17a
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
