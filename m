Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E871CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 20:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CAFC40102;
	Sun, 13 Oct 2024 20:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrUtFhB3qA-K; Sun, 13 Oct 2024 20:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C573E4024E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C573E4024E;
	Sun, 13 Oct 2024 20:02:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 980241BF3BE
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 20:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8777880C9D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 20:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7clc2wibbWQP for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 20:02:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81C8D808AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C8D808AE
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81C8D808AE
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 20:02:45 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a39cabb9b8so10257305ab.1
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 13:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728849764; x=1729454564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4IwBhi3d++bOs4O+tmR6xlceSdh6AmPkgHnAAaxm5iY=;
 b=ClXBKAh5/4cVNNELmRAAAd9ASnWnCNp8UNTqsiUx5/jXb+bwRKHPn89FGoG4wOU3Cu
 Unr3t4is9ED4huFhoSIMKCb3nJZJ6QojSoNN5nfklloOcg30GimgdKzjzdNilHWmrfpt
 vkbB5+62kimrHkNDeanFa+JUzjjPxQ8QOu3ZLZ2/Ml8bFgfmapfA94cqCPSsBMsEx3si
 VLgk78QwBn3hnGguYvQdQ5xDSrMNaaRexNT1H9erUAkOi2W4tk9oZKODCMGGS0Hlhnmw
 VOAIEPvUsYXlU3ry8/71wrDBkHBVt39YTvTK3sjh40ljptwBEq0oBOOMmrn7UiRDXxTp
 csdg==
X-Gm-Message-State: AOJu0YzTiJ8odcHQ6aR3FZIaJ8QlAT8L1jA8686ZfjrtJTPipK30mgYN
 SXSp1hH4ZDoP4Ym6BnolkHxQrkrNu6r5BbwDM/bUIHu1hQ7K+Spn5EEBsw==
X-Google-Smtp-Source: AGHT+IH8jDeK1P0S+6za1aALxizEesPHUAfO2uVY9P4VgKyUwVkKvnkVnFAl915dLKHZprm/uI0czw==
X-Received: by 2002:a05:6e02:168e:b0:3a3:9337:4cf4 with SMTP id
 e9e14a558f8ab-3a3b5f21b3cmr61599705ab.4.1728849764116; 
 Sun, 13 Oct 2024 13:02:44 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbc3de4e53sm870180173.15.2024.10.13.13.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 13:02:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 14:02:39 -0600
Message-Id: <20241013200239.2816650-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728849764; x=1729454564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4IwBhi3d++bOs4O+tmR6xlceSdh6AmPkgHnAAaxm5iY=;
 b=BlfQ3aZYAhZaVgOl+yT6oXuV19R5HJUuCYqKHUMXd8JO10TQUPUKZYyg6g+YgJS+wA
 63Jkrzr3o2MsGe9RdnJPI0jEYxCMm30iZsYXMt9hO1ynrPeXPTeC1w6NJUlQahtNL4Cc
 dN0j11gfJe1SU4AvJQ5yLJyigPAdBFBMLMX9PvceMfz81Fw0K/4H7OuxkcdM/yU1RDuy
 9UE8QgGDP1pw9Yf/NYlFTCELLfnCA2jccaNmOtetiJpUTs+alObLvM6QnYiJC1rV/3Xl
 I5r9durkK0eeI/Dm8cgbMLUl9qhwT/JPdluoEm8DQR3I/JtfxnF8omHCDBncEw/TvVi3
 q+Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BlfQ3aZY
Subject: [Buildroot] [PATCH 1/1] package/python-zope-interface: bump to
 version 7.1.0
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

We need to pass the --skip-dependency-check build option since
python-zope-interface uneccesarially restricts the maximum
setuptools version.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 940ee595d5..149e8ad675 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  fd1cadffe80b9a1702636826c30136f0  zope.interface-7.0.3.tar.gz
-sha256  cd2690d4b08ec9eaf47a85914fe513062b20da78d10d6d789a792c0b20307fb1  zope.interface-7.0.3.tar.gz
+md5  4d644f1167c8a6b19b3690d301641820  zope_interface-7.1.0.tar.gz
+sha256  3f005869a1a05e368965adb2075f97f8ee9a26c61898a9e52a9764d93774f237  zope_interface-7.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 60cde26122..7eafa80460 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 7.0.3
-PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/c8/83/7de03efae7fc9a4ec64301d86e29a324f32fe395022e3a5b1a79e376668e
+PYTHON_ZOPE_INTERFACE_VERSION = 7.1.0
+PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/e4/1f/8bb0739aba9a8909bcfa2e12dc20443ebd5bd773b6796603f1a126211e18
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
+PYTHON_ZOPE_INTERFACE_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
