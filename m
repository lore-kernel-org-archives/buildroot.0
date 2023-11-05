Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAA9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 321E9404D3;
	Sun,  5 Nov 2023 07:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 321E9404D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01mfZnuNwImm; Sun,  5 Nov 2023 07:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1056D404DB;
	Sun,  5 Nov 2023 07:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1056D404DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1331BF5A6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 419BA60FBA
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419BA60FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WarFzMKP9tRt for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:53:16 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49F2C60FA2
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49F2C60FA2
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7a683bd610dso124761839f.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 00:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699170795; x=1699775595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7LfxvbaOVwUIWpIslE2zf+FlgU6k007k7/C1wpOvsp0=;
 b=Lx7574xY7oVAyn+a6U4e6JPBJo/kmrUtedUskzyqneYS6ZW/kdnNJJmb2FStRpASXR
 F42tdGRLPNzkF7XHwTQr/cfeOdVwef8bwJ21dxucFlF1VIWEFweuuIvYsRcKwuo54Skk
 SXuuiELxNiZggtqLxtMMw4LB1NESkw45creReJoKSli22fMVlYZkRKd6tKQchJ4HLcW0
 chCuKxczI9T5IseAYaKAcW67IWW8TkbjT7wy1PCEZbJcwx3N+RJ2rycx7fSQ3Qa9BW2X
 hEZTvn4qUXkCb1Kbj9ItgQ8hl259NoAhRD5Hp6WY1TfFRsh5OmCTVGQaioM7Ser9KZMo
 JKbA==
X-Gm-Message-State: AOJu0Yz8JTiDSgGLwSQw2Bn3y+3dTGJOltG002W34fNuWAZA9ukBiszL
 Snj62JX5Weeo9X36JirlTMVSFLKY4Ss=
X-Google-Smtp-Source: AGHT+IHZpJuN2kJrYjLdEySyqq8DwzzI+o/mQ3UU+qVOvi4qFCtmMfDRB8dvS0pmumQYt20KHmn4Qw==
X-Received: by 2002:a05:6602:2c82:b0:7aa:125a:b0c4 with SMTP id
 i2-20020a0566022c8200b007aa125ab0c4mr36908505iow.5.1699170794885; 
 Sun, 05 Nov 2023 00:53:14 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 do6-20020a0566384c8600b0043a20ad93c8sm1540467jab.41.2023.11.05.00.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 00:53:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:53:13 -0600
Message-Id: <20231105075313.2889997-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699170795; x=1699775595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7LfxvbaOVwUIWpIslE2zf+FlgU6k007k7/C1wpOvsp0=;
 b=AX3XHSZV0NeLC702TFJYFa1o2fmJ49sL5hl5EsE2DOQqQ7pcFVWbpdrrlk6/7I6WOI
 RVKvqCCYnbWvNerswOLqL1AGOE9xlQjB98Tf3FTqMRhCLsmx3b7YRx/ZffcEL/SbeaOQ
 doo6zO20nElnZgtWWBmZA2cRs6+aSEjPafat7tdGYeLUzIe6vsJiU+jrz45XSHaq5WhA
 ymiagXedswGf2MTiTArRQYolRIorjIAXmvH5fA639LPhFykesaTG5SdSSasIUyErS4Fp
 iSYIvnSr7WpwntC7NYbk6fPOfOm6Rh5tjFCvBtQL8VLoK1gI8W6IbTCdOLXnxVKSVsAO
 PhFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AX3XHSZV
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.17.2
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
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer applicable CVE-2023-24816 ignore.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index f11ad1e18c..f68b3ba78c 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  a1ea9b6e43c5568e5031974eb3a6acb0  ipython-8.8.0.tar.gz
-sha256  f3bf2c08505ad2c3f4ed5c46ae0331a8547d36bf4b21a451e8ae80c0791db95b  ipython-8.8.0.tar.gz
+md5  ac2ff5bad97aa09befdf7f0f27323699  ipython-8.17.2.tar.gz
+sha256  126bb57e1895594bb0d91ea3090bbd39384f6fe87c3d57fd558d0670f50339bb  ipython-8.17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index aa274314eb..1335121688 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.8.0
+PYTHON_IPYTHON_VERSION = 8.17.2
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/f5/39/89664d8c3e4dfb0a73862cbbff8eb4028a1e3d4305da80ab0a493848ed9b
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/a9/e9/c83d1a5756bf44f1802045a54dacc910d3d254c5ec56040993978d8c1b8d
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
 PYTHON_IPYTHON_CPE_ID_PRODUCT = ipython
-# Affects only Windows. Can be dropped once we update to >= 8.10.0
-PYTHON_IPYTHON_IGNORE_CVES += CVE-2023-24816
 PYTHON_IPYTHON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
