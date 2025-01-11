Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACB3E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC6E8356E;
	Sat, 11 Jan 2025 14:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1md3KVdYc6dc; Sat, 11 Jan 2025 14:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C6283560
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C6283560;
	Sat, 11 Jan 2025 14:50:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54C2A940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F49460658
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6srXZqO8n1W for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 14:50:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 569C660634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 569C660634
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 569C660634
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:50:42 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a9cee9d741so19595945ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736607041; x=1737211841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LVAv84JiZId9nPa+JLSWnT2fN10GfjsxYSWF1GtLh0w=;
 b=g4hcGKJAS3k5KyvwyYicKnE1DYazr9McozrTUVJ4SKO4OEPoNw23K0Ez31fL2WPVBY
 HcOMj8yIpPZaavENGeJgV/+WrzXyPsjePz9c76KCQ3UzDRyhOsZZr8wQjiIJpsHuFbdj
 3dNggSh5x/7FyWY70JFrpWwamN600pHUwtlip8MAfJCzVmdeNnd4hKMMfvL5MgqBlQix
 p/el1fRRGkIaL8LjWkc7kLaBl2ZKY/7eTTGOVt3QC0PoCNlhcrchzNnR5Or4tyXwlR7p
 L6RciuoZFAnSX1FzArFh7Ku5vp54F8FWj5PgkG509g5ELPqsAckBEkQOYoiQLtuFjrJs
 4bWg==
X-Gm-Message-State: AOJu0YyZGVJPji2FS0khvUc9lfu99ZqOO/K74ikTJSZastjLO0bLJGtc
 ffOzjU22Kr2EnWHfy+pWE3TDXZYl8lwB4Ccml23HL/0XJsDkyb6sTAYcGXPpAMI=
X-Gm-Gg: ASbGnct9S4dtXS6OycjBsLvuCkJlLgWu9vzfPeTAtqKNtUHV43zLUAFc1AfKowEbDtR
 rZX2ABZD2TrQwwfpSdWlCuf9O+HpKsRRZZd+oYC2JBlMpJ+eH+qW1cGkbjK8dmB7IaGWG7bQ1Uo
 MdV5889haaExmulUfa7BnXvA3EWBCyog+0GDcwU8NLo8RG5wnQYE09gYm5ZvbNuFY4bt4HXPm9K
 4VFRnxjLLfSdHJBUqhFzy89GhZDTG8jgFTz/qKTVBak0N+N5O3SasmBoAlbbDvCVbd4GR6IEBxF
 peplPUYO75vWahBlR71k7MWo+Ap9mu4=
X-Google-Smtp-Source: AGHT+IFjT0dIkqoKT56VKNKXiVBKnqHO8Si8FXzUraFYznmY92thTLEDliJ3cvrLBujQ0cZvcE7Ljg==
X-Received: by 2002:a05:6e02:18c5:b0:3ce:66cb:fa7c with SMTP id
 e9e14a558f8ab-3ce66cbfb1amr10711085ab.15.1736607041148; 
 Sat, 11 Jan 2025 06:50:41 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b613136sm1560168173.54.2025.01.11.06.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 06:50:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 07:50:39 -0700
Message-Id: <20250111145039.2759406-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736607041; x=1737211841; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LVAv84JiZId9nPa+JLSWnT2fN10GfjsxYSWF1GtLh0w=;
 b=EtFE6vf+l5cfds4/2MD6DzHb8JKrxvKV7WevmglwD3sv4e7WNcJG1pcL5SQ2EC0rXq
 zfqoQkLfuXwphOSP4s7t12bscNyOTK0Lb89E39ya5ionQMNjKYriBdqMlACAcioOw2RK
 yMePEdcrGRBYQdiO28TfVo+059RN7k2FswqnQEMKR8ppQnIuuA6jJ9+n1X22XUGZCEcg
 DWmv/LEvcpdeyCNUlZXpPuNRxeAtftFHvtDPK8yDdOYg4VTHdO6+xBHlnT0KstVn+Cp/
 GEvrBrtqXReERb5Xib61L9ZHxs1uJRcsQoi2NvGXSukdyvmUVMsEOtnDNGZtm8iF4H9Z
 /SUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EtFE6vf+
Subject: [Buildroot] [PATCH 1/1] package/python-pathvalidate: bump to
 version 3.2.3
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

License hash changed due to year update:
https://github.com/thombashi/pathvalidate/commit/e56c54b09815b6b2b501ae9762215d065b99e01c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pathvalidate/python-pathvalidate.hash | 6 +++---
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index dc6a1999e0..9793217fcb 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathvalidate/json
-md5  cc99f63c6f835eae4fe8643c79b8ca68  pathvalidate-3.2.1.tar.gz
-sha256  f5d07b1e2374187040612a1fcd2bcb2919f8db180df254c9581bb90bf903377d  pathvalidate-3.2.1.tar.gz
+md5  9b6599a16c5e3ea7b6dcad5ca7dc337e  pathvalidate-3.2.3.tar.gz
+sha256  59b5b9278e30382d6d213497623043ebe63f10e29055be4419a9c04c721739cb  pathvalidate-3.2.3.tar.gz
 # Locally computed sha256 checksums
-sha256  36289157e371aaae5b5d3ba4be87359ed07548cdc7a9f19ff61dc67cfc536a9c  LICENSE
+sha256  130a35b917df1951aefbf366120491d5124045a87ded123f20ded21521f4e3a2  LICENSE
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index f5eb257cc1..f666e07fb8 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 3.2.1
+PYTHON_PATHVALIDATE_VERSION = 3.2.3
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/b4/8c/8713d8dcd8e357b9358695b441ee974580a8addfaea4f01437df07577052
+PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/92/87/c7a2f51cc62df0495acb0ed2533a7c74cc895e569a1b020ee5f6e9fa4e21
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
