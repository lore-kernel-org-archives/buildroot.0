Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798C5C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE90B61055;
	Sun, 24 Jul 2022 02:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE90B61055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UCxO0c_7Gd4Q; Sun, 24 Jul 2022 02:11:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24B6260C02;
	Sun, 24 Jul 2022 02:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24B6260C02
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66A6A1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40ABB847EA
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40ABB847EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogGgKMeY_axP for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:11:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E885847E3
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E885847E3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:11:04 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id h16so4046118ilc.10
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=leGe3gJ26FUNYuarxlzXTDwUwHAteUkRNksPr6d/Kxc=;
 b=5BV6iQQ6f4ye+9qiFzPlx+JxO8i7f9K+Uj7vzCsitrq4AzzOfJQqLKvijiwI56TkWe
 gFagfQ86hdUZ1RmKV9ibpLnOdpW20AUqTX+soNL1XsXx/q6DgSHKJA9CAK88DQh5xCaQ
 gXIUY4gpv19aStYlo84EdJPSMkLWGsW9XMV+HFWNY24vDlDce2mA9dkXmwN8v5oYbU2R
 4WoSFIqcK3kqO8L2y2LnttoFHiYoXhrJdZuZ/VMNFgVosM/8X/ra4/sx+zLaknGEYtYJ
 3mylR0Dhcwoalyous6mRshhOTmtyaYoEjtHFAWRF7ulwpwy7vEqX422JAMkFr9yhvnpE
 8PGg==
X-Gm-Message-State: AJIora/jtMcPnxaFSRKN5Xe2jDCqJCO8TQRV8LsdG5ZYMfzaW0hCIciX
 eg8ncfdfvKLCkYsBaMdu6RFG1FoTQYUBNA==
X-Google-Smtp-Source: AGRyM1vVMhQErt+0jXMNyaseOWYcPaLHmEhcUE+eBXi3R90RIB0UoHitbyuM4AvuJp3KmbDHRQrsxw==
X-Received: by 2002:a05:6e02:174f:b0:2dd:d06:7603 with SMTP id
 y15-20020a056e02174f00b002dd0d067603mr2387098ill.313.1658628663182; 
 Sat, 23 Jul 2022 19:11:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 m4-20020a02a144000000b0033eff75fb32sm3753534jah.15.2022.07.23.19.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:11:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:11:00 -0600
Message-Id: <20220724021100.1013814-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=leGe3gJ26FUNYuarxlzXTDwUwHAteUkRNksPr6d/Kxc=;
 b=fJa6mqfbdD3K9gF/hTYkCXMxcbgZbO7RoB38i5PETnsCqlnyxnpRC0QF1dzVmoSWQx
 dukI7H1eIHoIygA8JY5Qvojf9EbzB1d5wmLyX3wZ97y/3Li6/C5s8+xC7zrvlshZ/9qk
 5tkqXqvFJAlOv/yuc4xROpIm6Iu8RicvWWDNDNFNCLtSNHPi4OFPI7iyf3aFjGKFuu7P
 Fk2uguMUbIQzVJqJMTSriyH9ygVD56tEOEp0Zl8e8kksxfjOF8KIGZDO12r1VKcC9Ljr
 8B3YhPWt0mlOnt7Aw1LAKQPegc42mMviw5ipveWcw6sBuFMVVaOz9XvpIkEYEthjxCuI
 4Gqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fJa6mqfb
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.5.0
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
index af8b5c4de9..9b6976933d 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  105adca78033ef1f0b62d8e81d3efcac  aioconsole-0.4.1.tar.gz
-sha256  0c0acb66b4e72d6606c9fa14ac9eb001a222c37c885b8fbdf65f41824cfa855f  aioconsole-0.4.1.tar.gz
+md5  2c1022bae07f6aceebe08cd5e8848469  aioconsole-0.5.0.tar.gz
+sha256  9b719b270e7cf6f2454eeaf16c20a025b73f0d4d352d157baa77ce9ad1df427d  aioconsole-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index a58fd33a61..4e4bb6231b 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.4.1
+PYTHON_AIOCONSOLE_VERSION = 0.5.0
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/c5/16/a9de89d859eeaa0f9fdf5675a97ea1416265e1ebc039c7b9ea2c9e5433ac
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/ee/9c/f8bc72c09eae047197d820b1618314323c780005b9a854b99bed75407d43
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
