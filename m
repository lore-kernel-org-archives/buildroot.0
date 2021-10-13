Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940FAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:43:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F34F06054F
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F34F06054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC9060B03;
	Wed, 13 Oct 2021 20:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PoX5fHRCVBkl; Wed, 13 Oct 2021 20:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0651D60AC6;
	Wed, 13 Oct 2021 20:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1ADA1BF361
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97514831CB
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiAFy9DF3HJD for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:42:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E79A4830C0
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:42:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u18so12518722wrg.5
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 13:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+wMObbag+iAGCe8Cy9/ymLVizBZBgcVUi+cCMOuEKW4=;
 b=SbfwJo/MDN4RE/qZnGOfBs2QADRXlE4hfxa5wKkCKb0gcUkT1RPyqe4+yo869U4itv
 Hm12JZxq81PTaimL6ie5W1CYCPR2pBI7jUIAJhFhBeHpBFWpGnOx9j6a+umO/fAXptXY
 WDpHx+WH9Dzhtocgb71rgRTbBq7HlufPIuGQ5fiJdWGnkkWy9oqOUf8rTou7DaWtdiHd
 JqHKcYDTsD0qHcnJjDjGMvGNl+ZTt7B+gF0poATGYmZ+ZHH237xMzfJuR9AasO/z22Ls
 srCDqwU9u95Sd/k0JR7nYaw9fly7G/5D81AJsNl2lSPWks23Q3+JhjByBlViJH27qIuc
 jLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+wMObbag+iAGCe8Cy9/ymLVizBZBgcVUi+cCMOuEKW4=;
 b=Q1LaFdJI25cwjpJVF4dTEZ9wWptosDAXf53I7jkjqe+J4AoLmseaVRPHDM9mtFVtuG
 vOWDG0h3nADOsk6DbGHQjxVJeJlAdlPcbpF5uDH/eVcTnjcYxLYfFAqyqPgUYgDl1+kO
 I0923dhpGEZ8AxNsORoLVdMBj5aTBYovN2TXt2ymP7RJSXmrXFfoGkqJvbtzC1jR6E4k
 Gy3Doz27+KJ7MPYoY2iY4kzbJEUweEBd6DfEF0iN4gfctd0nwFZgssiKVFBjjubsK6i0
 OV/tXgj9eab8MSulu38RD0C6OAgjxndA9P9d1qltjLcyJuMy3jm4YxGKhfQB0XjHXgQp
 BpwQ==
X-Gm-Message-State: AOAM532KRNaO84fBtqp+kzH1gDtqNxkBzDpAkFn679laA+3Plm+2a37S
 Vt+UXTjQNC0MBpI61LxYQ2d2Am10tfE=
X-Google-Smtp-Source: ABdhPJzLUShqrA2X/zSa9jZYELXl8O2ceP3sdj+3zwRyblJtIpUOZoCtmbTcvfz2qKajk1J0FOPiVA==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr1542169wmi.15.1634157773811; 
 Wed, 13 Oct 2021 13:42:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id c204sm6246119wme.11.2021.10.13.13.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:42:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 22:41:46 +0200
Message-Id: <20211013204146.1882135-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-urwid: fix typo
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
1c10095945b2b9a0168e2a8f98a5c6a396b2c0cd:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_URWID
  Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACAKGE_PYTHON3
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_CONFIGSHELL_FB [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y]

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-urwid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
index 8fd2cac694..c141e8c0bd 100644
--- a/package/python-urwid/Config.in
+++ b/package/python-urwid/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_URWID
 	bool "python-urwid"
-	depends on BR2_PACAKGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Urwid is a console user interface library for Python
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
