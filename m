Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7E1C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9936C81F98;
	Thu,  3 Nov 2022 20:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9936C81F98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pol_rtbqbo8Y; Thu,  3 Nov 2022 20:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD0A81F95;
	Thu,  3 Nov 2022 20:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD0A81F95
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3C9F1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA2941856
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA2941856
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtlgDUI5aN_y for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:28:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F184090B
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40F184090B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:28:37 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z3so2359779iof.3
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eGBti7R7DuRBTrcc9RP5wMysis3fQtwwKa3DrJ5eFZk=;
 b=TCLCeT42KsWvvhdtCl1dwVdDQxtEh85aST/xxXqgMJj4aMDOiqE8IQpeyLk2+Qln/T
 dcY+Yzr1mM3a9GU9Su7oLFQJnn5+9ekAjXQBLuPGb1TS/+DbTMebuhKI+emeFWJamRHG
 5In42xkmP/Hl/diXDpwePrYXUZ1KWF8DCSB3EE5/B4VSDxaCAzUXKWIY7x5GTPPtKaOt
 pDtPQs4Jv/ytQk80oskP+9vVKA5CSp7PLdHoDj/f0WsqYk8fE4uHQjWAD344m0f+iQv6
 UpuVP38/mmEH9IwMmRfRL+G4w1VVH/Jnt9UvGiRjynu7Kx0WLB/+DXYOTVBah+UuDyI4
 7Qvw==
X-Gm-Message-State: ACrzQf1uNPsChkFzoE50yxaRoC1xgu0PYBlCVMlsaKa1/Ugc6kGDpL/2
 LjGAo9OCZKxvt9HrL0nBLm4O/MNdkqxdiAX/
X-Google-Smtp-Source: AMsMyM4le4dPx/XPVEAfpqG6gV/WpX30NWvd2Y8WATAV3jytsnoVoeEP1CWnbRDJTqn9xTdarZBUsA==
X-Received: by 2002:a05:6602:13c8:b0:669:c3de:776f with SMTP id
 o8-20020a05660213c800b00669c3de776fmr18481779iov.124.1667507316016; 
 Thu, 03 Nov 2022 13:28:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s28-20020a02cc9c000000b003740de9fb65sm533546jap.46.2022.11.03.13.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:28:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:28:33 -0600
Message-Id: <20221103202833.216075-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eGBti7R7DuRBTrcc9RP5wMysis3fQtwwKa3DrJ5eFZk=;
 b=dL3KU4Y7p1hogeptcrgDoomV6PUvASoZ2PHf75K1tpUjbI0wGoW+phbK2auiAlgNca
 C7EJ6SbCJzFLvliHhCgfOrgv8FsU8j1WihKODkfGqaxAZK5MY9ZDfeGYALnUURyrabVl
 hpWuyOizMdvEW8L6HjQzjQuqAY7XljTSRDPJxFoYmEv9QjoUN6GIpQqwl++XNE7RF8NT
 VELNbpqqVxMme0EG6v7wog9P/ex2FOHMK+Kbk99b6O1y1+/nRgweJbr6MpQWckPX2MLE
 Ya6BbSTGfX/n6xPcxKwlaCcSM7vM1jq4KyZtv8qiyqMlBuYK3WBJLPvHEM0W5d/ssjhm
 ao8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dL3KU4Y7
Subject: [Buildroot] [PATCH 1/1] package/python-validators: bump to version
 0.20.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Drop no longer required six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-validators/Config.in              | 1 -
 package/python-validators/python-validators.hash | 4 ++--
 package/python-validators/python-validators.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-validators/Config.in b/package/python-validators/Config.in
index e700369910..8a2ddb49fb 100644
--- a/package/python-validators/Config.in
+++ b/package/python-validators/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_VALIDATORS
 	bool "python-validators"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	help
 	  Python Data Validation for Humans.
diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 2845a2e8c0..4f4e1c21f8 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5  2f0446f2a15aa694be0cfd8728eb4444  validators-0.15.0.tar.gz
-sha256  31e8bb01b48b48940a021b8a9576b840f98fa06b91762ef921d02cb96d38727a  validators-0.15.0.tar.gz
+md5  f03b5acb91079450bae664726ae01948  validators-0.20.0.tar.gz
+sha256  24148ce4e64100a2d5e267233e23e7afeb55316b47d30faae7eb6e7292bc226a  validators-0.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 5bed051911..731aca11f6 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.15.0
+PYTHON_VALIDATORS_VERSION = 0.20.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/c4/4a/4f9c892f9a9f08ee5f99c32bbd4297499099c2c5f7eff8c617a57d31a7d8
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/95/14/ed0af6865d378cfc3c504aed0d278a890cbefb2f1934bf2dbe92ecf9d6b1
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
