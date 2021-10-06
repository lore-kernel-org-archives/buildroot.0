Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4043EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:12:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC7A1610E5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC7A1610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C97640130;
	Wed,  6 Oct 2021 16:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIf9yAugrmY0; Wed,  6 Oct 2021 16:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DC3B40427;
	Wed,  6 Oct 2021 16:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 681691BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 522174077B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R812NsOs_9ln for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 16:12:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44FFC405A4
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 16:12:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t8so10529779wri.1
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JL0ZjrjbuqvhNPqigHr6qJd4r5hZn79b2CDP+jKG96E=;
 b=dJuJwQytnuoDbGbbgrc7Wud7PESk/mrnF+yz0W3lt9iKWgR5W5QhNArtO5Po7Mj8vu
 HvsBW/hTKMyTqryEvueP9D2u/lgIl/b+x4ejNvZc7ItXZtldVlv87ZKeVBl23aP3m5L/
 UDyEQEZjG9Tj6in4nvl+r9eFHVgANoqB8bybM9H/XkxKdF5Lq0hLYg9rJES7hMifbBlA
 hvpD+4EQXW4NNZTVECI7oHxGyNzz35JoBz8YAkFATulUfyrbghLV5MEL2C5Tw8QGeE7j
 XzVfYP6bv2b481xVdU8rbKRr3m6MUR1pMv1XXaMAqIlPN8uMBSpQExh8ft2gnR1sD//U
 f6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JL0ZjrjbuqvhNPqigHr6qJd4r5hZn79b2CDP+jKG96E=;
 b=hhJ93d+Dv52PygJ1hQrt61Wgqf9dd8nuyDVib6MPNbKlJFl5GAR/m5ysXypwW/KW7q
 xKqA/buY1x4ITweFAbj7hVNqQ9i7rDZn3E4BpJb/FzHJvs4ZfPVLuyavYJVCG7P4Wf7I
 6R2bOt2LOGG0J8rz4OW9ypmC1sDsIXDyRxPVIoZj+TLBiqezxi0lPkoKZde+aeJsYseZ
 Di4HJV7caARWGsN0vkMzZTR/HC/0PN5A3t4894fTvoZUQFgOhi1oTEJBUWMC7nJ5ZAsA
 ceCWlw1QWNiKff6MMVHln5t4Hu5/Qiycxk1CkPNZF1EjfYrXZ9HEDO8QKU5UEHAG/XcK
 bIgw==
X-Gm-Message-State: AOAM5311KohtazrTNqIQMcPf1dPWAe3GqRBkbvDM3FXe0d0I/iwC6yJV
 amJEa5RY+yyGrK2S+D2bOn+GRs2yvwg=
X-Google-Smtp-Source: ABdhPJxIivw+a0HymazZtadZGE2uCy4OodV1QJy+fgNdvyYTfeYqqPNkDH4M+PMajKEJKi8bM76CIg==
X-Received: by 2002:a1c:2586:: with SMTP id l128mr3890251wml.109.1633536721314; 
 Wed, 06 Oct 2021 09:12:01 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:81e4:5e5b:3505:a040])
 by smtp.gmail.com with ESMTPSA id s2sm20350388wrn.77.2021.10.06.09.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:12:01 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 19:11:47 +0300
Message-Id: <20211006161147.19864-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006161147.19864-1-asafka7@gmail.com>
References: <20211006161147.19864-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-meld3: drop package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This project isn't maintained anymore:
https://github.com/Supervisor/meld3/commit/ed4e7b30eeae9e03170f388f5c6fc31aac21bf7d

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                      |  1 -
 package/python-meld3/Config.in         |  8 --------
 package/python-meld3/python-meld3.hash |  6 ------
 package/python-meld3/python-meld3.mk   | 14 --------------
 4 files changed, 29 deletions(-)
 delete mode 100644 package/python-meld3/Config.in
 delete mode 100644 package/python-meld3/python-meld3.hash
 delete mode 100644 package/python-meld3/python-meld3.mk

diff --git a/package/Config.in b/package/Config.in
index 2f83c87582..9fed0ab4cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1073,7 +1073,6 @@ menu "External python modules"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
-	source "package/python-meld3/Config.in"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-modbus-tk/Config.in"
diff --git a/package/python-meld3/Config.in b/package/python-meld3/Config.in
deleted file mode 100644
index 9366b3cda5..0000000000
--- a/package/python-meld3/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_MELD3
-	bool "python-meld3"
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
-	help
-	  A HTML/XML templating system.
-
-	  https://github.com/supervisor/meld3
diff --git a/package/python-meld3/python-meld3.hash b/package/python-meld3/python-meld3.hash
deleted file mode 100644
index 69b303e60e..0000000000
--- a/package/python-meld3/python-meld3.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/meld3/json
-md5  1add16caefc9e6b82ef4f40532cb4918  meld3-2.0.1.tar.gz
-sha256  3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558cad5e775  meld3-2.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256  5fe11cd858707131b6ec1338b5c2cd68dd1fdb875e3ec967149bc6fea858ecec  LICENSE.txt
-sha256  2422945b49554688d529e1f8d4ac6e0ab77a817e8889158e1e56cf963ecf5c4d  COPYRIGHT.txt
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
deleted file mode 100644
index c7973d9c71..0000000000
--- a/package/python-meld3/python-meld3.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-meld3
-#
-################################################################################
-
-PYTHON_MELD3_VERSION = 2.0.1
-PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
-PYTHON_MELD3_SITE = https://files.pythonhosted.org/packages/53/af/5b8b67d04a36980de03505446d35db39c7b2a01b9bac1cb673434769ddb8
-PYTHON_MELD3_LICENSE = ZPL-2.1
-PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
-PYTHON_MELD3_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
