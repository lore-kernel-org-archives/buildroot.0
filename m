Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506DEC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 13:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9F1581F53;
	Fri, 11 Nov 2022 13:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9F1581F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6DHZUN2NicEq; Fri, 11 Nov 2022 13:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7E5B81F4C;
	Fri, 11 Nov 2022 13:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E5B81F4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 354691BF860
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 13:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09B1540BFC
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 13:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09B1540BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5dYW4MvwdMd for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 13:33:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A920A40BF1
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A920A40BF1
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 13:33:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id i21so7628454edj.10
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 05:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UZMyBZAIcnXVmUf1dgOYdC/ejnJodG3wS5twssWyvdM=;
 b=p9T1UtesTZH9qCTEVIxTfq2z/dN44y1+8RNlma4q9KcUYNRnUAiLKbhJYRyWMr4d8P
 rxRXxtDOvmEZ0NrJ8I8TgAsaN4KqKC9pBnZgmSm6YZ70BP2fk+yRGHa1BwKBzamYjtig
 xilIAy7iLvogfAHgRP7zFQHmuyBwSiH0yI3ENgsqi4DAPKFQfwVeLzxs4Q7b+vLdybXG
 RRUEaH33Anj9XSeibzTQMOKv0uuyEdXkfhdBndxJnEs5i1kRcYVhu6Ku3OPBn0sRlkEq
 677v9gVGNak87dUTTzw0iCrZJmCbn2sICGqKmhBwgXcAdRNlYQvKkqPcCEy260PHQupI
 aoTg==
X-Gm-Message-State: ANoB5plxl7J1hqnV4r9jATAEG0xf67Yrr3P0RbmrVGqqpdBaSHsU6iND
 jB+F6KLhw+vh0ZBGFOhd2pUDusrJmGJe/w==
X-Google-Smtp-Source: AA0mqf6pfGgYOvQwZTRmPGTCO9BlyDrh4ppFZ7npAE7RDtBtHyogE2zsLgaF/+6UE/uIK1I3fsbZaw==
X-Received: by 2002:a05:6402:13cb:b0:463:4dd8:d6ea with SMTP id
 a11-20020a05640213cb00b004634dd8d6eamr1439972edx.426.1668173585485; 
 Fri, 11 Nov 2022 05:33:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-79-40-103-33.business.telecomitalia.it. [79.40.103.33])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a170906585700b007317f017e64sm878154ejs.134.2022.11.11.05.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 05:33:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 14:32:54 +0100
Message-Id: <20221111133254.1163936-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UZMyBZAIcnXVmUf1dgOYdC/ejnJodG3wS5twssWyvdM=;
 b=Y8403wJ5bgUVWPoTp7Q3QkcRrdfXk7IIVS00vPSfjiQVQvhix+Y8F9ewI7a0kp8ash
 srDFBTBLMZw1YfTOB7fSwGO6kn4coG46NnEHdzhLKNtVezb0u370KWJYiqDjUCK4c5lY
 quJ4EVS6IiJiefwvkVrvrChiN6ZALEqlk3Vt4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Y8403wJ5
Subject: [Buildroot] [PATCH 1/1] package/sscep: new package
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSCEP is a client-only implementation of the SCEP (Cisco System's Simple
Certificate Enrollment Protocol).

The goal of SCEP is to support the secure issuance of certificates to
network devices in a scalable manner, using existing technology whenever
possible. The protocol supports the following operations:

* CA and RA public key distribution
* Certificate enrollment
* Certificate and CRL query

Certificate and CRL access can be achieved by using the LDAP protocol,
or by using the query messages defined in SCEP.

CC: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/sscep/Config.in  |  9 +++++++++
 package/sscep/sscep.hash |  3 +++
 package/sscep/sscep.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/sscep/Config.in
 create mode 100644 package/sscep/sscep.hash
 create mode 100644 package/sscep/sscep.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 81e6cd54abcc..f0ba196ad06b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -681,6 +681,7 @@ F:	package/luaexpat/
 F:	package/xinetd/
 
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
+F:	package/sscep/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0f2..736428a4589d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1949,6 +1949,7 @@ menu "Networking"
 	source "package/slirp4netns/Config.in"
 	source "package/snmppp/Config.in"
 	source "package/sofia-sip/Config.in"
+	source "package/sscep/Config.in"
 	source "package/sysrepo/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
diff --git a/package/sscep/Config.in b/package/sscep/Config.in
new file mode 100644
index 000000000000..d4847f1b8a75
--- /dev/null
+++ b/package/sscep/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SSCEP
+	bool "sscep"
+	depends on BR2_PACKAGE_OPENSSL
+	help
+	  SSCEP is a client-only implementation of the SCEP
+	  (Cisco System's Simple Certificate Enrollment Protocol).
+
+	  https://github.com/certnanny/sscep
+
diff --git a/package/sscep/sscep.hash b/package/sscep/sscep.hash
new file mode 100644
index 000000000000..050f7feb1594
--- /dev/null
+++ b/package/sscep/sscep.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  489cc8e093986776eb3f15082bf766778f707176f3cd604bf0ef1008da06b8e5  sscep-v0.10.0.tar.gz
+sha256  e1328c292102a22c10e8dcfbfda33740f603767c73f8c5b5189c5513eb6b4dea  COPYING
diff --git a/package/sscep/sscep.mk b/package/sscep/sscep.mk
new file mode 100644
index 000000000000..f59f4bd03bbc
--- /dev/null
+++ b/package/sscep/sscep.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sscep
+#
+################################################################################
+
+SSCEP_VERSION = v0.10.0
+SSCEP_SITE = $(call github,certnanny,sscep,$(SSCEP_VERSION))
+SSCEP_LICENSE = BSD
+SSCEP_LICENSE_FILES = COPYING
+SSCEP_AUTORECONF = YES
+SSCEP_DEPENDENCIES += openssl
+
+$(eval $(autotools-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
