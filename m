Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BCAC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:33:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4608D610EA
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4608D610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0432883F65;
	Wed,  6 Oct 2021 16:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IX5abq8invsL; Wed,  6 Oct 2021 16:33:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6828B83F3C;
	Wed,  6 Oct 2021 16:33:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8066C1BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FD384050F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7W5j80JyLdpG for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 16:33:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67DF2404F1
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 16:33:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j8so10604932wro.7
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fcxHQ58NaHK13C0Vtx9Um4JFWacphGMqIO/Ctt+oOVk=;
 b=e9gAvBXzyEJ21fwom7EQu9Z05fAS8xoK6EzyuR/Yj3+g6CFmkMZ7i1ktDjnOYj1e3c
 yqUGyLOXvaKkeK5cdZJLpcZ3aLCarZuV05xnQtvDELyWAW2AKapOGN2EQXdATR2FuTu6
 yyirqFIFyxT8KlByZxL6vLjORKpgnqCc5jwNbLYmxaGg47Iv97DFjqKXlLhfEaK7o5Hk
 aANnJl0d98jgCJF2SDsYydHq9aFEEMjel3f2VnbqrKJg2u3vYnjGC345o5q3xnSqhzlt
 +cchWCh6vrH8dg3PPeam48u8nlxDrqrA7aBkcI3QzeV02mP7fpJmUC8X8ncU/Bf76w38
 mGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fcxHQ58NaHK13C0Vtx9Um4JFWacphGMqIO/Ctt+oOVk=;
 b=e8lAovGz2HzruCzYJUZSvvQXPQmaHkyisD7HByQYUxqzZw6v7qjzVu9adkpabfL5h8
 yy+00IFXcGmOVIB1ZFL3NyK7IAuf4ADMF0jt+Qkjo0gQHPByWmt85oSJxM4Ppt8BvgvD
 XTrlI2E0OaZSd+RG3RdrgvkACqDCbGsoskIquMQQUTqypl0EhdGlp3wQD02lZYM0MVwP
 cTiA+zuAT98gU2GR6GjayJ6ii6JnKH8V4YixfoOG0FfbDj1a33JeCjKDjvaNKggbt7fd
 rSxQ3OV7uGjeDrGQK2bp0sE5IBkJ6zno3TLGaPIUO6yCgVAfindAtRlPLcs5H3XrdzWM
 93kg==
X-Gm-Message-State: AOAM5309f5DMXKFnf7/0oJoR8wTUbEn3eN9YvQW0gmUYrMr+vID68dkt
 BBtr12cfdresiQrxjfJAMBqM3jFdGjc=
X-Google-Smtp-Source: ABdhPJzD3TvUS0kAll8cdkyfd0uQHYQ3RM4mJ+sVlUYQxArfTVBbdP32/Lohm/CbE0Xarwu1vZm4KA==
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr11230871wmh.119.1633538024562; 
 Wed, 06 Oct 2021 09:33:44 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:81e4:5e5b:3505:a040])
 by smtp.gmail.com with ESMTPSA id o12sm2158821wrw.73.2021.10.06.09.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:33:44 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 19:33:37 +0300
Message-Id: <20211006163337.22905-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-urwid: depend on python3
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

Although the package claims to support both python2 and python3,
there are some places which contain python3-only code (mainly
asyncio-related).
We can try to tweak some of the files in order to make it work with
python2, but it doesn't worth the effort since python2 isn't maintained
for a long time.

Update the reverse recursive dependencies accordingly.

Fixes:
 - http://autobuild.buildroot.net/results/356c6b09566c6020dc320eb89da791581571cb7f/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-configshell-fb/Config.in | 4 ++--
 package/python-urwid/Config.in          | 1 +
 package/targetcli-fb/Config.in          | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
index 90a295fc8d..a0326e9150 100644
--- a/package/python-configshell-fb/Config.in
+++ b/package/python-configshell-fb/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	bool "python-configshell-fb"
+	depends on BR2_PACKAGE_PYTHON3 # python-urwid
 	select BR2_PACKAGE_PYTHON_PYPARSING
-	select BR2_PACKAGE_PYTHON3_READLINE if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_READLINE if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_READLINE
 	select BR2_PACKAGE_PYTHON_SIX
 	select BR2_PACKAGE_PYTHON_URWID
 	help
diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
index f584a9258d..8fd2cac694 100644
--- a/package/python-urwid/Config.in
+++ b/package/python-urwid/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_URWID
 	bool "python-urwid"
+	depends on BR2_PACAKGE_PYTHON3
 	help
 	  Urwid is a console user interface library for Python
 
diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index 24ff3145f6..04c6a1ac09 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -1,9 +1,9 @@
 comment "targetcli-fb depends on Python"
-	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
+	depends on !BR2_PACKAGE_PYTHON3
 
 config BR2_PACKAGE_TARGETCLI_FB
 	bool "targetcli-fb"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3 # python-configshell-fb
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
 	select BR2_PACKAGE_PYTHON_SIX
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
