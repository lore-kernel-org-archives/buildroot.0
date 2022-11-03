Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFD9C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A1081F6E;
	Thu,  3 Nov 2022 20:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53A1081F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfByUk2KWqub; Thu,  3 Nov 2022 20:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FD2A81F6F;
	Thu,  3 Nov 2022 20:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD2A81F6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3EEB1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F8BA61034
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F8BA61034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3wPUDfMNuFCh for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:23:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A433A61033
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A433A61033
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:23:53 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id z3so2349853iof.3
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q/PDshMIxu6dDZMuevl6mZwMBK31uSdloG+MwfTj6wc=;
 b=rapMye1JgSjGOd/oEX7jQtWN+KjmmlJ8sjpi3d0IathMAFG7hPe7yR81EX/xW63StA
 /0PyPUdE6tyxRyEZ+JWTPJttP1mRczNVWS9oncEl9N0P64uhAUwW6Xd9uuYp2SW9dLrT
 NhyqeV/Nfli7MXQTGPOOJ/3mA6Fn1UBqi36xLL4QZJP4QaxpO21F2rHwZfnmPlPHSjN8
 UEcRAYyKsI4N2bLYsJ8CETLYdvL90oONCbYGGIl+tEwm65gvpIgCQU0TjX+aANQhNrA5
 wZ/PhcuyAS/EIBaX9knZl4/X+UHczeNK8gguPHEJ8P3g5HMurrGUfCGCMCtvBhTXOk1W
 Bozg==
X-Gm-Message-State: ACrzQf3vJROS0xcwOmVbougc3gB1fyFmm/VJMHrQ6GKSGc0yY8G4a6OK
 WwsjmqpphseGkd8elhdYBn6KUtpoKjl9LNgL
X-Google-Smtp-Source: AMsMyM6Go1kR65RWmfDy/Yzdp52+7htwYRL5TMe4H0ZMlqMO/uZ85GUfvYPxrH8cyt69jYB+lvnx6A==
X-Received: by 2002:a02:a61a:0:b0:373:1d9b:3c22 with SMTP id
 c26-20020a02a61a000000b003731d9b3c22mr19986068jam.190.1667507032434; 
 Thu, 03 Nov 2022 13:23:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p7-20020a056638216700b003738c0a80b4sm518001jak.144.2022.11.03.13.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:23:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:23:50 -0600
Message-Id: <20221103202350.9395-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/PDshMIxu6dDZMuevl6mZwMBK31uSdloG+MwfTj6wc=;
 b=KaSF8cQUIABVfWcdBTEPrhY4yY+YN7bO2fcnVwHkd4tuVbMmnAtJRVxuZPigeyLepQ
 GtyA5Zu5jPmkMsUY//uWAmH9+3IL2IH3DNAgJUfaW4eclTWbsQUgHuMMR9d3pEVHxTuM
 +IdTnSdfJHz8g6KeA53S4UVXyDHej78H7fAH+gABZj0MITPsYYGcyDXDTsW+DqkBGQ6k
 ZY7xV7F0yS+RY6CJEvwe9ayVzQNQzlDcdF3QoJTUF1jUcWnXYsukfvxXa8wURKjOoceD
 XWHk/G2YV9DbVXDL6ciKzk6FeIl+U2/N7Vn6rJWb8yhRRSCSwfCFQSdWLKsGnnrI9Qrr
 oIHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KaSF8cQU
Subject: [Buildroot] [PATCH 1/1] package/python-twisted: bump to version
 22.10.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 63da0125b8..36612ff5e7 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  fd252d0b895ca2ab81b5b1454073d890  Twisted-22.2.0.tar.gz
-sha256  57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba500b4f2  Twisted-22.2.0.tar.gz
+md5  c9a5dad0813512fabd9de502738c0bf8  Twisted-22.10.0.tar.gz
+sha256  32acbd40a94f5f46e7b42c109bfae2b302250945561783a8b7a059048f2d4d31  Twisted-22.10.0.tar.gz
 # Locally computed sha256
 sha256  686f6426a775450eb3afd00bc3a5c2621f305ddb9c8478ee9bf28a368ef2dece  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 8a89d3dc82..29864c173a 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -7,9 +7,9 @@
 # When bumping this package, make sure to also verify if the
 # python-treq package still works and to update its hash,
 # as they share the same version/site variables.
-PYTHON_TWISTED_VERSION = 22.2.0
+PYTHON_TWISTED_VERSION = 22.10.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/40/8b/56e8870d412c550b3ff2d6714ee212c7e80a6634f4e720c3a26a983e7b46
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/b2/ce/cbb56597127b1d51905b0cddcc3f314cc769769efc5e9a8a67f4617f7bca
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
