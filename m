Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368D3CAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 17:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8BF46110C;
	Tue, 17 Sep 2024 17:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUxedi7oFxaC; Tue, 17 Sep 2024 17:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D6B61114
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1D6B61114;
	Tue, 17 Sep 2024 17:46:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BA531BF35F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 862B541C74
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpm8ByLHEOpk for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 17:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A7B641A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A7B641A6D
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A7B641A6D
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:46:54 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82ceab75c27so273789839f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 10:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726595214; x=1727200014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6cvdG329tOSRc+CYiTweS1xqCI1I7xRtvimPQnQQRyY=;
 b=qkM9NnqT050y/edxTQ9TaODrX+agfUmqJJFviHJNHH7rdkGbeXdyeI2yrnlTKfa8gj
 n8TDYtx9UeB5z1q77TZ59N5AqKKvQhcUQhGvoxEFIUjHwBevf1rrCIExDLPcmiN9wmvM
 o7BGB6X/ozqMb2EEyOPcploA53tavU0T7M66mgiK3mJqIZU3kT2CYUvFhSWGijcv3UK/
 LgDjd3OPocUFh3T20hXpELWRoHUfm2tzHK4soGHSqlbyaQgalc2uP5KgvizPEvlf9oZH
 CrSnypUe9MDcRqNSepvPSlR4k9s9NppZ7QKkUuIIVzcTqGPbDhgoEFBqMa2+IQpkKELh
 qpEA==
X-Gm-Message-State: AOJu0YxEyLKaJeImzZex9yzcIjDCk/mwsVmhsH4xCiHIZBDFx/ZlPEsw
 bWLt5A4+qe9WkayawceCD0lX0XUgEIcEIkOc7Db9tz9qJoaJvJjp94Mx4Q==
X-Google-Smtp-Source: AGHT+IE0AUsG5ppHJeIHvYVDDIB5Jxa+gNdjke163aSRhcdKdBt80lq9F//YqU9eTsIUKVU5uxhPIg==
X-Received: by 2002:a05:6602:6d03:b0:7f6:8303:ba80 with SMTP id
 ca18e2360f4ac-82d3780c296mr1308680539f.11.1726595213566; 
 Tue, 17 Sep 2024 10:46:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d4935632bsm215359239f.52.2024.09.17.10.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 10:46:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 11:46:51 -0600
Message-Id: <20240917174651.3846612-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726595214; x=1727200014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6cvdG329tOSRc+CYiTweS1xqCI1I7xRtvimPQnQQRyY=;
 b=CoAepjRWQDXjfQC/dMFuFzWrnP2UXDhRBwMIYWSF0igs510ildgoQNeZCrtckMNGxC
 03/aQrCddb85JubuyrqiRd65UEBdvIAdQD/Egr6gA2e/R7igrtWkuTS8hnLx3SyKfM9u
 ZtDlnp3Dxjj+HcxDaOjDolytE0XhqdqDJWcHy5MQZlUfuHW9XTUglQ/3qRMchQJQp3RT
 YQ7joqw2/NxLwuslj+mB+E8N0gviW9dLdps3IrUT3rGfKb1LLV9zS9ZOqqqTTAUlYJjJ
 8v1ePtKYOv40jduY4+IYhah94tY0hfEZSOLEgmsMd8GoWtziEMtnq3Sqs0efJdV+ucxg
 BMZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CoAepjRW
Subject: [Buildroot] [PATCH 1/1] package/python-netaddr: bump to version
 1.3.0
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
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-netaddr/python-netaddr.hash | 6 +++---
 package/python-netaddr/python-netaddr.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index f969aeecfc..1ad35966bb 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/netaddr/json
-md5  c0d7b080da18c851ea436389813d7652  netaddr-0.10.1.tar.gz
-sha256  f4da4222ca8c3f43c8e18a8263e5426c750a3a837fdfeccf74c68d0408eaa3bf  netaddr-0.10.1.tar.gz
+md5  b0307617f8f3aa73bbcfadac52d91df7  netaddr-1.3.0.tar.gz
+sha256  5c3c3d9895b551b763779ba7db7a03487dc1f8e3b385af819af341ae9ef6e48a  netaddr-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
+sha256  36dcdc429f76107d1697396ca0d8c43b343808c98beacb3405f472a76b65bffa  LICENSE.rst
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index 79e55a739f..7c26b16bb4 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_NETADDR_VERSION = 0.10.1
+PYTHON_NETADDR_VERSION = 1.3.0
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
-PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/af/96/f4878091248450bbdebfbd01bf1d95821bd47eb38e756815a0431baa6b07
+PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/54/90/188b2a69654f27b221fba92fda7217778208532c962509e959a9cee5229d
 PYTHON_NETADDR_LICENSE = BSD-3-Clause
-PYTHON_NETADDR_LICENSE_FILES = LICENSE
+PYTHON_NETADDR_LICENSE_FILES = LICENSE.rst
 PYTHON_NETADDR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
