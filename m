Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA05ECA0FFA
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 18:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6779840347;
	Tue,  5 Sep 2023 18:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6779840347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QPjy3hVggHc8; Tue,  5 Sep 2023 18:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 688164034D;
	Tue,  5 Sep 2023 18:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 688164034D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 054891BF318
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D30DD60BEC
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D30DD60BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qov3g73onpXB for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 18:06:34 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E48D60BDD
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 18:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E48D60BDD
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-56a3e6bce68so1408317a12.1
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 11:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693937193; x=1694541993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nguf83zuwtX4npPn6zoD6xJm68o4uQhxODjioaXI+LE=;
 b=Xg2WrjUzalCaz2XLHzJUS5n6Ov3JM42VLvV3zkHRsLGsuts95Wff6wbhoGqJHCbFxm
 K4P0xFrDH4z+CVtedI901BExh0b+LQXCq7USriGiu0ZaL0RJV/nCjLjm3AdhaQ8HVQRw
 1fPz70WL24kIYvPn1jbYdL0VzYHFcVV+eAyiUjLglLlQsT8uDa1nYvnPUutDNy2gGu/F
 CFZga1xTlkJksrTlVdnLCkZohOZ8c+i26AQT8O4dJMFYfsv2Vm9OAYVMZcPqW5jMDck7
 Dut9jHaVz0xolOZTeqLu+5pdDMU5g+hP2CehgzsgEz2wQhJFhy0eLxmjkEWBLh6bJ5yp
 JJ/Q==
X-Gm-Message-State: AOJu0Yxcyqd5p2MwMXsoPoTPqjakk+8XA0RxiVfSP/F0PSyQAZU5fsxF
 C+RzgkrhzQHbe7PS852vHIVR0Kpeq+c=
X-Google-Smtp-Source: AGHT+IHCz21Ad6siFOeJObqDt105E9cLeHNEFCxMrouWCNdyzR3fWFBFR68ljNrqHpTU8C6PuVzpmw==
X-Received: by 2002:a17:90a:f00b:b0:26f:d6f4:9646 with SMTP id
 bt11-20020a17090af00b00b0026fd6f49646mr9552200pjb.40.1693937192982; 
 Tue, 05 Sep 2023 11:06:32 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bba7aab826sm9658143plb.163.2023.09.05.11.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 11:06:32 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 12:06:10 -0600
Message-Id: <20230905180610.1610778-10-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905180610.1610778-1-aduskett@gmail.com>
References: <20230905180610.1610778-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693937193; x=1694541993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nguf83zuwtX4npPn6zoD6xJm68o4uQhxODjioaXI+LE=;
 b=OdF7+aKkCRpA3MQLob7GPZJCKxkdDSBc2ddOuS6Wng4CtFBkWiyK3TZxYXFOikCDAq
 KFyKgNiD5Tbfg89b6maYaOnId4ljWZuki2qkxfbWvyhu3yaN9G5nl5YIgzfZMFMRDOVf
 /PlPLVTu6+WgP3NSrKTCcP39piH8GKD9ZZPDNYmsL8QHqXnziOPjvWsmnvXqGmGZuQIy
 6FN47HkDXsap6zFxfeRSAjoqlAHNaS0mamGO3vty3SQvCeCtHKfC1XN8VSMAlkXCTsZH
 sA5YvvNWI4t34oxqMj2N/0nHrKHOsh+t6yPBJPKxKVGEo0CBxiWAkP7qM748YCvpg5Sr
 OVLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=OdF7+aKk
Subject: [Buildroot] [PATCH 10/10] package/php-yaml: bump version to 2.2.3
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Adam Duskett <aduskett@gmail.comm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.comm>

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
---
 package/php-yaml/php-yaml.hash | 2 +-
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index b4d14c5a30..4fa5dfbc16 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  119052f0461d57d86f44c252f9c9b2dd743486c701c1a0aba0aebecdd0d8b82a  yaml-2.2.2.tgz
+sha256  5937eb9722ddf6d64626799cfa024598ff2452ea157992e4e67331a253f90236  yaml-2.2.3.tgz
 sha256  68d9700294396c72089bfc7bf38a5b3654a53ae415f3bd37768848c14e86f338  LICENSE
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index 39a422e25d..e825e3146f 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 2.2.2
+PHP_YAML_VERSION = 2.2.3
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
