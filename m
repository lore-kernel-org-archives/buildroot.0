Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F08C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E294402E4;
	Mon,  9 Jan 2023 03:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E294402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKBVAAHdanWm; Mon,  9 Jan 2023 03:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF0B340140;
	Mon,  9 Jan 2023 03:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF0B340140
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C34591BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BD6640140
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BD6640140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ci8G1eeADKUU for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:32:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B002740127
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B002740127
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:32:34 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id n63so3988611iod.7
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8a1T21m7MsG3ZmnEIOrwOwJ61sTePCiPD2A6yCyph1A=;
 b=JSj0YLd2QbuPBg+PqaXxo7IbUrEhc1zPWmdoD4fikBOQk5CQqur/0uOlpvCUo9UafT
 m31b2g0LMhOF/DZc++yEMI5/hsRp871q4xTt6FU5cuf0QqUZ+sqxFRXg8Z4gkfy/z/Og
 Dbaer1L/HrHbtFU4zcuckB2joplni5Yym6SRvBiEoqwyo9pgM/TFrFfmInf5n+H5Som0
 Ry2csQzzSKN42MruY7QyZk/1PdbJobyTKDJ/Y3grgG4CJp//tJK6JC2r22UUIAsFPljh
 N+LrTtpdkHbi6stgFHYbZ2rmuSpR+A2zVbfEJZDCAEmnfJha/cJF/3heeHk3rbvITFwt
 8BUg==
X-Gm-Message-State: AFqh2kqHgIRgGJkzGCGdmzPVcmup+G1WAlikGubuvNxrg6XIFksnR0Wb
 ZbF2SRMBm5qk+yzHwGx8ossxGWYnar1yeA==
X-Google-Smtp-Source: AMrXdXsYgw2vvrFSuVYOgcamhsRU3qQCxcNAQ2b3XZwrvzPk5ux/W3HBW2Awvcsx5Pb58LKo3JCOfg==
X-Received: by 2002:a05:6602:298a:b0:6e2:f989:5a8a with SMTP id
 o10-20020a056602298a00b006e2f9895a8amr38831624ior.11.1673235153565; 
 Sun, 08 Jan 2023 19:32:33 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bf602000000b006e02c489089sm2807942ioh.32.2023.01.08.19.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:32:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:32:29 -0700
Message-Id: <20230109033229.2111340-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8a1T21m7MsG3ZmnEIOrwOwJ61sTePCiPD2A6yCyph1A=;
 b=qOUAh8gUudYK4sznfz5/sFr4/U1/bYlWqN7KX6dy93rOKejAUxfm6ZDhIFqmxun+vk
 h1ezdKYWxZ0PkOQ96ePkePjASC5lvqeOzS5oPqfPbC5G2ltMgDDeKaiJ7D/LxdwK4dRq
 7NUpFB1ueB1jvN5MjdbSHMy5B10BEXdtCP+XMjpgc4q1I6ergjJ3fm/WWJ1lbTT6BeUn
 eefA7CYwBlYBGiAoXNblZ+a9fqyAOd+urXh7T56DD9N0ctIFaiJTVoPLMJ4/rcRvzWII
 jzEjtGuS4rc+xutAEmXrmYZwwRmjrFJlVUFVaxA/Y8cIk6Xnwgpm1JrJg3o9EIn61MbQ
 YcmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qOUAh8gU
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 39.0.0
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
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index a01c8810e3..da3ef0ad98 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  2abbeb6d42e8844de036bf2e0d78a42feeee1d57ebf29a07684490f98bdcab37  cryptography-38.0.4.tar.gz
+sha256  f5bd4646a673bfba2a837e18e55890b754dd5e1efeb494e31d2c4c116ac1496b  cryptography-39.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 4254fa3557..6868ff4633 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 38.0.4
+PYTHON_CRYPTOGRAPHY_VERSION = 39.0.0
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/e3/3f/41186b1f2fd86a542d399175f6b8e43f82cd4dfa51235a0b030a042b811a
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/12/e3/c46c274cf466b24e5d44df5d5cd31a31ff23e57f074a2bb30931a8c9b01a
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
