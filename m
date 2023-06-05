Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AC3C7EE24
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 08:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 598118212E;
	Mon,  5 Jun 2023 08:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598118212E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wWj3NW9bICY; Mon,  5 Jun 2023 08:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB4C82112;
	Mon,  5 Jun 2023 08:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DB4C82112
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E22DE1BF4E7
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB6E182112
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB6E182112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMWIWZneE9qE for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 08:09:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E383820EE
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E383820EE
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 08:09:14 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-33b0cae115bso22448825ab.3
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 01:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685952553; x=1688544553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TwxA45XcVIhUgFHc/68ISARtDCiYn8P9Aa3nuaXEtRI=;
 b=iYsRbaDzuq8i8G3uI641W7holgVq4LlnM0Ze1uSl46rkEdIWMBnw7PsnF/iXyQFCyx
 Umgq8HdJD/5E64Eq741VRT2qkzMf3eOb4mCgmoZMOx9/V7IeG/IPIB2/nFQ0fTgKzVe7
 m46cOuBC7ncWW0DNFWIDvqfVqaZloY1JBEPISWA7kRG2+h2b7wbxaIKL68BSg0BOMfMv
 cpQSHFv3PFEDtqCdho8Xpmg+ycwLr9d+xdwNHTf8FraBtoxp7+aHbQVtSBhWmiyxGVvP
 Y8r6nA/XZGqyCCrqOLPdI4OYu+q+76xmaQ3RIfSl4HyEHBMPNExsiSSxPGV8gDfJh/5z
 zpxA==
X-Gm-Message-State: AC+VfDzCVyXrssladsiQ/n8MgfGAv3/mO5RmhBYzHU8n1VfFXTPpuDFk
 vRKnmNg/ovEd1rbOdwbwPL5Op/8gmhTK8A==
X-Google-Smtp-Source: ACHHUZ5Xn1XxFsOtzr4UJU7g98UpbAt4dvBZQfKUkjFF+6BAHSF4TvN20NQ0c/QiFt++kMFQwbPApA==
X-Received: by 2002:a92:dc45:0:b0:33d:6372:8407 with SMTP id
 x5-20020a92dc45000000b0033d63728407mr11049588ilq.16.1685952553315; 
 Mon, 05 Jun 2023 01:09:13 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 m11-20020a924a0b000000b0033d2eba1800sm2244949ilf.15.2023.06.05.01.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 01:09:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 02:09:11 -0600
Message-Id: <20230605080911.2027474-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685952553; x=1688544553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TwxA45XcVIhUgFHc/68ISARtDCiYn8P9Aa3nuaXEtRI=;
 b=s4Z9EZf6QZIwAm1YPMOzBwSe/e+T8UloqtzzNRCPOrcrTpFj4VQqomTnTORCqb7lyI
 kuUCtSDoc37HqAEJfbemIUkLxv1G3/5sTdtEvK1vAl3JkL6Lmb8406AyLd++dVUKxVEF
 FE/YNwieyJOPGhJvR27/vEkoO55dxVM2tQfrMBnZ31OfD2Z5oRhUfo+R/I62dc7o4Yy+
 63uzS15tZW74bYUCRMjxch189MYwEg0Vi3ALJNP/kCfsWo0OZTs0YGGo0r+h+hjnrjFX
 5n9he49l1YoqvbPmrZCZYLm/acJvyhC8vn/MYxf+CSDP/ShKVbmZeG6HwEZu+5qTVvsN
 o4LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=s4Z9EZf6
Subject: [Buildroot] [PATCH 1/1] package/python-installer: bump to version
 0.7.0
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
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index 97d455b87c..577b23a7ab 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  ac5fee994b04f228c151306f5ad96b04  installer-0.6.0.tar.gz
-sha256  f3bd36cd261b440a88a1190b1becca0578fee90b4b62decc796932fdd5ae8839  installer-0.6.0.tar.gz
+md5  d961d1105c9270049528b1167ed021bc  installer-0.7.0.tar.gz
+sha256  a26d3e3116289bb08216e0d0f7d925fcef0b0194eedfa0c944bcaaa106c4b631  installer-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 3430e46b51..094a918090 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 0.6.0
+PYTHON_INSTALLER_VERSION = 0.7.0
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/c9/ab/a9141dc175ec7b620fffe7e0295251a7b6a0ffb4325d64aeb128dff8c698
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/05/18/ceeb4e3ab3aa54495775775b38ae42b10a92f42ce42dfa44da684289b8c8
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
