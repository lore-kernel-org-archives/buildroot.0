Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FA9E6F06C
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 15:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41A20423F2;
	Fri,  1 Nov 2024 15:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7E3y9X4dBOY8; Fri,  1 Nov 2024 15:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEEB04239D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEEB04239D;
	Fri,  1 Nov 2024 15:45:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C672F60
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 15:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB8D04239D
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 15:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEFYZsQzbRcf for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 15:45:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 829C541E76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829C541E76
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 829C541E76
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 15:45:47 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so65636839f.3
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 08:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730475947; x=1731080747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mt/HEZVhXmCGiVQ97X2k0J0bgMb3PrkRDD+kecgRjMM=;
 b=WSyrQ/6w+eN7B93eSXiqyrKue+b3uZqmOsgJs7um/2QB5aoazj/mUaObtDEQuzM5mA
 WlicTgEVuouBnRR9x78ITEnfnBlnhGJrlDv3wPdNqBO0CvvlJGzM9J+db8GMttLGkUcc
 24Fp/hqwnMKhg1Z6EcHTxvgoYcOPQwvYkeo3hfs3kudp9K2GjPvZztRXQsM5425AImxD
 c0EOnEPQl5jN8Bn1hR5UKm++Pmz8ABpNRtIvh+8ENBigtlPyiBqiY3RNGrwRxHWFZapt
 WJ8Bcg9QAnna1NyxsXlWnudfzMbFmHHbu6ytsTFgN+Q0NugBL32uh5K1cat4bIzEPGbO
 +8AA==
X-Gm-Message-State: AOJu0Yw+JDHmejZ8rf2Wr25raC6DmDwvgZu5UvKzObht/Uzse8Ff485c
 F7c4uuSpSFyZWcJfCqHgt6ekWImsuFMNbjaQXJSTv1Xk1sy2EniNADjl2w==
X-Google-Smtp-Source: AGHT+IFXubRIHRgr9Q7k7cteZNS/hF5faLTMnWq0tdISkQZIGQ9bx8SZPl2kcMu7P9/fJxtV1XJcYg==
X-Received: by 2002:a05:6602:619b:b0:83b:28e2:4985 with SMTP id
 ca18e2360f4ac-83b28e24d1dmr2018565039f.12.1730475946744; 
 Fri, 01 Nov 2024 08:45:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b67bb8455sm86656939f.31.2024.11.01.08.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 08:45:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 09:45:43 -0600
Message-Id: <20241101154543.367803-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730475947; x=1731080747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mt/HEZVhXmCGiVQ97X2k0J0bgMb3PrkRDD+kecgRjMM=;
 b=R4vP2BWc0KEfqfo0ZAzrymBI6SxuX2mbuz0ha8YDnpazrKvEg6Mzip/iHUs7XhGtLQ
 uEvqngsB3eQ3QOTmhkBo1VrD4W5ofmaIOoZ8N+izcMRgVtHxznXwMRK0wcHwBuChRiof
 tz+5/7xg9Z98CEC3KHdqo8A/wLeW90NFVlT7k0DLjPdJWJum1UUSp2AhFdWE5VdoAyz5
 89W15UQMaXm6z0X4GRuvqkAOngJbxeLb0RHgqvdEj+vCbSNxJU5t7gCLXkplAxDNFXsA
 D8wU9FRPqJqUk1d0krRbT1fqFaGkUby6n3ChTzSIwJC/+0i5neLTtT33ba8UB3TJzxS6
 gyAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R4vP2BWc
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.8.1
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
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 34ab684400..945dad6a66 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  a644cd04d15488d61fc18c1d3b9816c5  aioconsole-0.8.0.tar.gz
-sha256  64c93c17ef878fc68b4b379b9ed7fbb96c6fbc1b4e9a8378f9f899299ebdd37f  aioconsole-0.8.0.tar.gz
+md5  f14c575a38cc70c1bd26d83157cd1adf  aioconsole-0.8.1.tar.gz
+sha256  0535ce743ba468fb21a1ba43c9563032c779534d4ecd923a46dbd350ad91d234  aioconsole-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 0a23557b6a..646cf3181b 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.8.0
+PYTHON_AIOCONSOLE_VERSION = 0.8.1
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/89/dc/523222a45a83e69319724362db1664185970bca20c7d643c9261cfcddfb1
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/c7/c9/c57e979eea211b10a63783882a826f257713fa7c0d6c9a6eac851e674fb4
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
