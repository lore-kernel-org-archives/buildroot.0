Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A296C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 22:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D5AE41DB6;
	Sun, 11 Sep 2022 22:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D5AE41DB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N44-V3EnJgwM; Sun, 11 Sep 2022 22:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D024417C1;
	Sun, 11 Sep 2022 22:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D024417C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A80461BF34F
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 22:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8114F417C1
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 22:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8114F417C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iYs_Hi7vGxj for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 22:40:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6AC8417BC
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6AC8417BC
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 22:40:23 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id 62so5696548iov.5
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 15:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=LGnC2+Cv2RB1HSi7QIvLmFlXlIhL+9mEsIXknUbttqQ=;
 b=KqYiwJ1YC1JimyRiFOfwz6zgNpJK1aO1kcQHWUsrsiPOWkvKRgvb2lRYpk6y4fh1yc
 c2f78/JbEkBISXEoTLuF3BlbF2ytmjGjGlqppe5VI5CHKhRpH6MV5+egkcrq9LL5uhWo
 oRxCVqlMleltZMeuJS9jcqkI8nCWmt50KlXQ36t+AGmDF8EZ/by7YCnJJUkY/HiBO39Q
 9z3X8oceNaBWxb+rdatqKBfjeGjh6Ul4JHF2yhBmk4nBGyloePoV9jC7yvQW/FwH8bJ2
 aupNyvBdh0Stai6KiGzwXEVrO5jRBd9f9k7I1Rdew5bWb004yMXALQfsQY5j+jeuioy9
 rBHg==
X-Gm-Message-State: ACgBeo0X25XZbB7tyFEK06VCijhFhMOktcCdCEGGOe4HYewP1xsySJ4U
 tdmZm1x1x6NvIj8wgWqfHLqQAy29VyI=
X-Google-Smtp-Source: AA6agR4Lf+Nj9+scg8KOOsKUAYXoukhUA3AwHEH4ddAK4IMfJjllAw2W4K/dkN8xxpfGWiup/waQIg==
X-Received: by 2002:a02:3f20:0:b0:342:c96d:2f8 with SMTP id
 d32-20020a023f20000000b00342c96d02f8mr12785780jaa.74.1662936022366; 
 Sun, 11 Sep 2022 15:40:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05660229c600b00688eee7588asm3317743ioq.32.2022.09.11.15.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 15:40:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 16:40:19 -0600
Message-Id: <20220911224019.3708406-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=LGnC2+Cv2RB1HSi7QIvLmFlXlIhL+9mEsIXknUbttqQ=;
 b=btB/+uW09c8deQbrwof8JDHtO14xZUXi2W1qqf4bAp5V9pRT9+uk+uuGOU2WPuBR/X
 FVZTNxilVuB+963wn8IP+d4lc/3viLPDeoJ5cZvCJMH4ouRlcXyyrbIJL2q1F8d0D7le
 PXecnZUgbybY+mD9uZXj5gOkOaSH0BU8TiMITG0dcAzwb9BGUahijpHzqltqjusDaRYo
 gDXCxt5ydHH4ljOpQfinj/SW/ZvkAgY/oqj5SlZClzJekHUysmJv9bFtesARsoI+7gor
 JEyX0l9IF3gGKxLVbE77EmFBLPuW4RXWo9148cHSHmCCyLVQRoxwd72jGtGKiM9Dvx+i
 09Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=btB/+uW0
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.5.1
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
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 9b6976933d..107910b6be 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  2c1022bae07f6aceebe08cd5e8848469  aioconsole-0.5.0.tar.gz
-sha256  9b719b270e7cf6f2454eeaf16c20a025b73f0d4d352d157baa77ce9ad1df427d  aioconsole-0.5.0.tar.gz
+md5  ae7bae13cb8aab6b1a4d2c25284ffcd3  aioconsole-0.5.1.tar.gz
+sha256  c8ddd9fd21db71ea51fb9b0d20d21d11c409c92988edf07c935d705fa60e026b  aioconsole-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 4e4bb6231b..dc0eb36158 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.5.0
+PYTHON_AIOCONSOLE_VERSION = 0.5.1
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/ee/9c/f8bc72c09eae047197d820b1618314323c780005b9a854b99bed75407d43
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/71/74/cd64dbc518f71486b235f0e1538ea4b7cbf4375a8bdc6f96c9c9595291ab
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
