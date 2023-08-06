Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4BAC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 22:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D9560E73;
	Sun,  6 Aug 2023 22:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D9560E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVkqEOS-UrSg; Sun,  6 Aug 2023 22:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 569A76060A;
	Sun,  6 Aug 2023 22:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 569A76060A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2794D1BF951
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 22:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9E3D6061B
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 22:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E3D6061B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v27hFyY9CVJB for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 22:02:58 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EAE0607E1
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 22:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EAE0607E1
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-790b080f2a0so175882439f.3
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 15:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691359377; x=1691964177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9kS/PUtZaHk50p+LIutZb78ptQQYnxbj6IRJtqruRE=;
 b=D61USYcf4RScDydtusFu4KwW15O5BaqfQCuirwIMZ/PMq5KvrZcdeOSudBRM9iGNwe
 rQq7wT2ocad/xR8c8CY1ZYA8hCPVvixZz16/8fZjDKFPF8dq2LqAu5B1ujHqCtYw/BEX
 gegihiuBgvnV0V3VHQlM+lX6jIsHFV3twRGkjoEdT5x4V34p0o1Cq5LbmIifx830IfYs
 qQfV+ABldTQ6+SNkLudZOAJd0EHO6fe8WzX3+H3nEF172VF0t/4BeMmhqS9ZLUuoLBIC
 a1Smi5FuNB6Hb7QZqSVdEXOF1esujbsO0PdnUh4smWIGkfZ5nolHHIvWb1LTCYCX3X70
 B1/A==
X-Gm-Message-State: AOJu0YxdX4pWN6DQcdlTw1jIxPgdQETJP5r0zsz8NpXqpd2ExdYIwSbe
 pwzH0TLiqrTAsa64Q0tZAwI3Dg9vUbM=
X-Google-Smtp-Source: AGHT+IFdeLxz1We2oLjnlr2A03RLv+7+1BTn5EtIriSwoY9YY+KhveWKo0YrPexgDk59q1bKOnDaag==
X-Received: by 2002:a6b:fa07:0:b0:790:e006:b9e7 with SMTP id
 p7-20020a6bfa07000000b00790e006b9e7mr8262134ioh.3.1691359377440; 
 Sun, 06 Aug 2023 15:02:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05663811d300b0042b144abf71sm1983168jas.179.2023.08.06.15.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 15:02:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:55 -0600
Message-Id: <20230806220255.4099091-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691359377; x=1691964177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f9kS/PUtZaHk50p+LIutZb78ptQQYnxbj6IRJtqruRE=;
 b=AEFWrvLBYfdAYDHy0LQm9RGROU3VqORX3yxB7dpjNYzUUFajIYSmvaxqrOsNaEItd0
 IfiYSn3Dm0bDhxvrao1aVIDc77E6gS9O5Fctv158JERA1cDxqkSmiyZPHAk3s05F38ea
 Pl4xkaX+RwDHWa/OL8EF4oKTvAWRdVjUhvse1VrLVIzUHD4J3NxcO+TeT2xLUbMGaC7Z
 7nouxkXhboGWYZbtEcqdzNO+8kSOb06pKrtEaCItMrdfUzjRocx8iPx9H6iiINCGlJQq
 i67xxQQyEVsfP1o9f9xSCii+551LbpkudVVQ5tr0rGYz2VeM6Y8ffNQT1wEij1Bv70Jj
 Nt3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AEFWrvLB
Subject: [Buildroot] [PATCH v2 1/1] package/python-botocore: bump to version
 1.31.20
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When we bumped urllib3 in 074bc42971181ee71d8ff5bd57641b7b7eb7580f
we broke compatibility with python-botocore.

This compatibility error was fixed upstream in botocore 1.29.122:
https://github.com/boto/botocore/commit/0a6d8e3c6325da395a04227599cfa292190d6841

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561482

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add fixes info
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 89f4c06de8..1f5e5c0d3b 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  805e638c353c532c2af7a7538d5bd4d6  botocore-1.29.115.tar.gz
-sha256  58eee8cf8f4f3e515df29f6dc535dd86ed3f4cea40999c5bc74640ff40bdc71f  botocore-1.29.115.tar.gz
+md5  efadef54dc1959898a42d4cae949572f  botocore-1.31.20.tar.gz
+sha256  485ef175cd011ebc965f4577d8cc02a226c46bd608dd2bb75ce6938328cff0fd  botocore-1.31.20.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 3e828fef78..b76d1c64d7 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.29.115
+PYTHON_BOTOCORE_VERSION = 1.31.20
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/9e/00/4560081a431aaa14c2257040d43f56c2ccba816d8bce3b8e1577a19f4076
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/f9/0d/ec24cb66b7651268462d5eb5d9d3c140a99f487db3ed58a45617991b11e8
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
