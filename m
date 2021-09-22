Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7925C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:37:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF3061184
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DF3061184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EBDF60AC4;
	Wed, 22 Sep 2021 06:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJcGybUZygiA; Wed, 22 Sep 2021 06:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F3D60ABE;
	Wed, 22 Sep 2021 06:37:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16B1D1BF409
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FD324070E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BOvk98NPcel for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 06:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD91440704
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 06:37:42 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id w1so1663180ilv.1
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nTglbYwqw5Y7UhQ8q4/ukasBM1dbbTejp2GPIRVtE5Y=;
 b=O4X9rmlNGn4lgNXMnFYO7LHskeqNQXtbIlVbse/AXsDJa8eVwf0t0kJNS9e8n0WrDb
 ps/gKvZr3+nWyE56Tq/WVzg4QR+p55AejFYPsAGrDzR7EQjOmutFd4da/r4dMjZ12ipP
 XuVDE9qDj810Zson0G3JAbuteNubaOgKcBU1BgpM4fqDB58gQok8rEmdkJ82zaH2dvx3
 wkun4EQ0c7s3QfSaqHKKb4mWMMVoQgzsQafru68JVDSJ0M2LXvY8AgnnWZtD0g2HqwZR
 UocTzr2qIR0pj+KjMPyeKnsTz3coQVr8tsHYDz8ryGgkdIbX6Ei5FhCJvVLqi1d92eJM
 hO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nTglbYwqw5Y7UhQ8q4/ukasBM1dbbTejp2GPIRVtE5Y=;
 b=SsRxoLAr4pcKYJCJRY4pbTEMBiEAhQZr8u9NIkOv0SZiJyalwbmyNHj780wJIxA1IK
 PnnglrmZ0UAAw64EXJtjq1L5aY2AogQX4J0wP1WTwcT90wvZ9Hhwwoj0s2UZcuAojwgP
 jvsqzklyJNnupWakcMqt/1mXw/RMrG0796/6d2F0JSlZH+QWo7T8tScenAXRtM+oazAP
 wsJr489PVgW/teZyU+EhzHCIByt86kd7NcoTRFULJkX09wuiKa8K3X52oGz2jiyk9Dcg
 OQZRE5A0s/EaJG1LnIwacZPvSY+jtKvg6hR5B7vFT7LcdW4q/WegUEmeiXEP9ahcdQzq
 otIQ==
X-Gm-Message-State: AOAM532G+Fv9nO6n58/Kahe7rbFmzW5kbDdiMK9+zDlR1UAxJv3DLSeD
 VeRsa+kVfKexJYn6KofZkSyOa+Sn6Bk=
X-Google-Smtp-Source: ABdhPJxW+lFCzO2F0M9tsbk4b6EsQx0GOZJAArqoGhn/zibsxGeB/5uBO2ctph5GvOod6SmKv3wHcw==
X-Received: by 2002:a05:6e02:b4e:: with SMTP id
 f14mr12660716ilu.172.1632292661811; 
 Tue, 21 Sep 2021 23:37:41 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id p73sm595126iod.43.2021.09.21.23.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:37:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 00:37:40 -0600
Message-Id: <20210922063740.4066870-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 1.1.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

License hash change due to path change in:
https://github.com/python-greenlet/greenlet/commit/8448b094d1b81788ac9cbaf86a184712f1daf5e0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-greenlet/python-greenlet.hash | 6 +++---
 package/python-greenlet/python-greenlet.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index eed8e59713..ad216b0368 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  9aebea08f7beb6b87143d0588578c984  greenlet-0.4.16.tar.gz
-sha256  6e06eac722676797e8fce4adb8ad3dc57a1bb3adfb0dd3fdf8306c055a38456c  greenlet-0.4.16.tar.gz
+md5  a3fbf41851a6b5e1e823e8c18905877c  greenlet-1.1.1.tar.gz
+sha256  c0f22774cd8294078bdf7392ac73cf00bfa1e5e0ed644bd064fdabc5f2a2f481  greenlet-1.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256  bbde55d5456a1e912633ed3f66d1dbd9504e3e3dce4f4c2015043cdcbc56e697  LICENSE
+sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 9243afe514..e9feec5321 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 0.4.16
+PYTHON_GREENLET_VERSION = 1.1.1
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/20/5e/b989a19f4597b825f44125345cd8a8574216fae7fafe69e2cb1238ebd18a
-PYTHON_GREENLET_SETUP_TYPE = distutils
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/72/7e/d8586068d47adba73afc085249712bd266cd7ffbf27d8bc260c33e9d6133
+PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
