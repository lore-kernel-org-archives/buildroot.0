Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57991D0BB48
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E02881272;
	Thu, 24 Oct 2024 05:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyfsgHQt1DFu; Thu, 24 Oct 2024 05:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32BAF81282
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32BAF81282;
	Thu, 24 Oct 2024 05:30:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA5BC2073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAC74608A0
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpRUJk76b6YR for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:30:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 710C160833
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 710C160833
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 710C160833
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:30:13 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83ac05206c9so20541639f.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729747812; x=1730352612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OVF1FY4va8PexfaVOKyoqY66KDcjV82GhVAKtfiMgrg=;
 b=OWvziWb9uQaC1VCHkugZPReG6QKZw70sE3Q1+0Ma0nhSjLMRALqbYco2Q70yUc5EeW
 ovpBXnbCjcHuIUBqvUfs88yMpseVGnJir8HESa47NVvj2zvtt6oUQBs0/N3HKz/+YD6D
 zbbQuerFkOZiviQq3WHQ0JgqaKOzZXGxEWT4/VDAEyf3SByTbdq4f90bX1uBC3GncAHR
 A+qw02hqFqfb9YjG3EBgRVMUNl06JFM6zK+0s1OhDE1NBiFpS1sTREWPrkBTyp+WZhv8
 Qbp2WP3n5ZYvQs5LjFH7C85CQaCQnjVzmqz/X1ifmFWmt6Ji0iFrEP5PzbCY2KRcq6C3
 UR0g==
X-Gm-Message-State: AOJu0Yxgd8Lo2zBWvEudr8InGFwUdxMO77DW4wGYGSo/XMMtqZRTF2Hm
 52kK/a+6cdj8/e9BgFF+KvObcUhWnDsthzm5fzxXoBYvYb9jpeQr/PifuQ==
X-Google-Smtp-Source: AGHT+IFTGoiTfXVg9p1Jb+OsgaySx4eoNR68pC/PYtPjv41Zya26V+fhPh7fTiYWoS+bH6KGtLJiOQ==
X-Received: by 2002:a92:870a:0:b0:3a0:a71b:75e5 with SMTP id
 e9e14a558f8ab-3a4d594450dmr41648385ab.7.1729747811902; 
 Wed, 23 Oct 2024 22:30:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a400aa0bd2sm28902855ab.26.2024.10.23.22.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:30:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:30:09 -0600
Message-Id: <20241024053009.3402423-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729747812; x=1730352612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OVF1FY4va8PexfaVOKyoqY66KDcjV82GhVAKtfiMgrg=;
 b=W5COeaTrT6pu44OC8MLLVeqXxO60O+nIFzn8EDkfiAasCCIvBfA8AqByVcllTBOyy2
 o/t5dLe8O8kjbz/zuWK8i49PuCJXDJHGLj9g5l8+fMKyuj13aaaIyZWSCuepsq2fcP7I
 tAiFl5P4Mf9e5jY3KAaEPBhoYkBFB+VoreuU2S4m3jG0lxobkmSNNZFhrYkVIuxR2OVV
 XmENoWBtDcEzra9wgYb4Za5bC5AnqeRSIcc19O5WwGuB8oOzAuzUUsgigMsmD6XhG6AN
 3ePcLl0663yCwO1DA17B8+HSN0NzaAYDCX/01o6/vwPPIj6HiIg8Gi2M2sn6qsruOT16
 HupA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W5COeaTr
Subject: [Buildroot] [PATCH 1/1] package/python-referencing: use hatch setup
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
 package/python-referencing/python-referencing.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 5514c1b2aa..ce0e895548 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -10,13 +10,9 @@ PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/99/5b/73ca1f8e
 PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
-PYTHON_REFERENCING_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-hatch-vcs
+PYTHON_REFERENCING_DEPENDENCIES = host-python-hatch-vcs
 
-HOST_PYTHON_REFERENCING_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-hatch-vcs
+HOST_PYTHON_REFERENCING_DEPENDENCIES = host-python-hatch-vcs
 
 # This is a runtime dependency, but we don't have the concept of
 # runtime dependencies for host packages.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
