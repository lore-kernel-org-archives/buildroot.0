Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEDED0BB43
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E9274065F;
	Wed, 23 Oct 2024 22:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Bh8JVVj8hd8; Wed, 23 Oct 2024 22:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DABF0406EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DABF0406EE;
	Wed, 23 Oct 2024 22:22:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D1EB972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA07E406EE
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWoWltsZJego for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C60EF4065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C60EF4065F
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C60EF4065F
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:22:19 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83abe4524ccso11952939f.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729722138; x=1730326938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LYElX56dtAbn1qlhVBERoE6IhKaufR++2i9ZW6sVfRM=;
 b=vjyUiQeglCShSV5f3rU8JDazbTBr+62NU7yRA3KlbUxAgDLkZzghnrhsUrVnEWzJhD
 OojCmJWAyeFsLgs2kKBBzRzBPOBomGr5G/fK4kfiumlcJVUBK901+zWDNFPj5yzmAbBZ
 X8CzQ/U2Fn3iod9JlC1kq5S24el7Ma4iEmNGMMnPmgr/HikIe4NS/bHBERzvOKP8POoy
 3OSv+vCWNttswbY/sDgz/GjSOoPXKRs2ETk5QaERugqMKYDOHPLCeBeUH6nUkzjM/2L2
 MNmwdxFLwkHH6T2Ady9z6VQQotRVWJfPhhs8q9s2NMit7GFPMspsblNQ688a7wTbBrqE
 csqw==
X-Gm-Message-State: AOJu0YzHPalhdqYW08qRdbZhfG7CbxJ90DIDWP9n/fytT0Gj9e51Eu7h
 pEz8Nq/bAV4Ozzn+fsvpj7PceyWIbXc6JRmWBxuDs61eN067uLJiXYAqgw==
X-Google-Smtp-Source: AGHT+IFXxyipVsbaphEWL8t0G6RweOZ8vJ4gecmKZwRtDYRnpkrU1G/kXTZlFIMei+4pQE+X/e4eJQ==
X-Received: by 2002:a05:6602:2b93:b0:82c:ed57:ebd9 with SMTP id
 ca18e2360f4ac-83af61e4fa7mr546379839f.10.1729722138431; 
 Wed, 23 Oct 2024 15:22:18 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a52fbc0sm2434468173.10.2024.10.23.15.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:22:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 16:22:16 -0600
Message-Id: <20241023222216.3333274-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729722138; x=1730326938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LYElX56dtAbn1qlhVBERoE6IhKaufR++2i9ZW6sVfRM=;
 b=c35erNIwh5QSukGsuLF94Hn7pWJs8b68WMMharOwu1mZqc0ljLmasDlQyPYXIOj/Zr
 wgd/IpItm8WcsUbfW06NEnOvroG8vismn0Uh7MO90VpLVNeTUknVRlwBBR7gGKys9pR0
 pEZdHeQXUbhbf2RIyYS3EqgtlVfZsxgXDK17uA/frC/WeKsG9uJi9GvL4BGHVMX6rIkQ
 Z59NS3sMuQ+wcC0T/DGSBUFcz/OrpGXCZwva1ahJlK6zWUpNvA0f/+9naMrLmDnTeJCM
 n9ZOSCywUInENe7FnAP1w5IPkVyD9DFZNNI+BGBxEF4yX4ugm+jvs9rY6frxq9/mhgFC
 VHfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c35erNIw
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: use hatch setup
 type
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic/python-pydantic.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index ab0cd601c1..2b9cd6c38a 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -7,13 +7,11 @@
 PYTHON_PYDANTIC_VERSION = 2.9.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
 PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/a9/b7/d9e3f12af310e1120c21603644a1cd86f59060e040ec5c3a80b8f05fae30
-PYTHON_PYDANTIC_SETUP_TYPE = pep517
+PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
 PYTHON_PYDANTIC_CPE_ID_VENDOR = pydantic_project
 PYTHON_PYDANTIC_CPE_ID_PRODUCT = pydantic
-PYTHON_PYDANTIC_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-hatch-fancy-pypi-readme
+PYTHON_PYDANTIC_DEPENDENCIES = host-python-hatch-fancy-pypi-readme
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
