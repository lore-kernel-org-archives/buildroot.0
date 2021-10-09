Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A95C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 07:51:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C0AB60F6F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 07:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C0AB60F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF0FB83AB9;
	Sat,  9 Oct 2021 07:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWBLdQWZ_-SW; Sat,  9 Oct 2021 07:51:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5918383AB6;
	Sat,  9 Oct 2021 07:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 485BB1BF3DC
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 07:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37E8183AB6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 07:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_S8fmhxQ6v3 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 07:51:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6BCE83AB4
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 07:51:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e12so36666468wra.4
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lh2/nhFp5DGQ2u+p1VG2SNzPy7N5UD1xET4zNZEDD88=;
 b=GwZkpP0DH6qeAKuAIukqPW+wv+SR0wQ0cvi8L+KwUFKBN5WFejIjgIow+RTyxJrrLc
 k0bnkQfugce1hxScDlixYNxjzdXtZ3/76y3Qq+Tfl70b4iwNF0Jj8/gMHZdNjWN8e+rs
 s3EmZRM8OJ4ncLxXTYaF7tawFiI+oQO6fICuaxLlt1rGTfO9kO+f28+5LrdufMhC0eMY
 7hrzOeB7sfn0ujf2YdfNuO9UlMYm+yW0r05GrGh3+11uJhv4Xdv9lG++wkhNYODBnGb/
 nDfUO8K5URa57dqE0WvDHvS1Xsk6s5/5GNFpWpmPbs/bnSVCyIYtw7QFvmUY4QKDWs5F
 Xytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lh2/nhFp5DGQ2u+p1VG2SNzPy7N5UD1xET4zNZEDD88=;
 b=x2GDHgexvKFklfj5tooqfG2bB8gBsL6YBBbKllOLiJaZZH+TwkKfkY/Ua1DJjjEeVc
 jWib6//vJBMkA5e2VNxkZevD8eOyF4JRyXlCYX5BAmtnrZ9Vq6xgfIV8LbsFaiNlYMTk
 fZi/OyI/s2BCKIFY/pc0vDIO2X46FRg8EIa0OKySal2qclcajt8ySrR9rmIWtMOKWssQ
 RpFjvpoqcDaAgncPD1757Oash0ajgSVj5mmmdVYFL1f+EGMxCMf9VXeLYE/G3Fsk9fFx
 oGt8J9MisK9S+fPi0L2Zjnit2GIpGLIKthiATUGNHwNmLmKHd5TcCQH41aarJCMfOqIT
 QQiw==
X-Gm-Message-State: AOAM532zeDZD1OreG7nsNaYo5h7re/nXrU9arKK55e397zu1OxYvTgWt
 LYRbx6LMZELkY28qLZ0RAt+/d/bipy4=
X-Google-Smtp-Source: ABdhPJxQy8z5saiVMCBAxu0wtYORBimXYoVAcHKiKIG6rD6oLkyboQUdncUeG8MSyWXb7mj40fG1Rg==
X-Received: by 2002:adf:9b97:: with SMTP id d23mr9407608wrc.135.1633765866648; 
 Sat, 09 Oct 2021 00:51:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u2sm1472852wrr.35.2021.10.09.00.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 00:51:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 09:50:04 +0200
Message-Id: <20211009075004.370428-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ltrace: fix autoreconf with
 autoconf >= 2.70
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

autoreconf: error: cannot create config/autoconf: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/433599039d6e1ee301465f9867e169c121a0646f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ac-fix-autoreconf-with-autoconf-2.70.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch

diff --git a/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
new file mode 100644
index 0000000000..efe993ec88
--- /dev/null
+++ b/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
@@ -0,0 +1,35 @@
+From b8d5d086489ff20339e221323a60c140a9820e67 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Oct 2021 09:39:52 +0200
+Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
+
+Drop AC_CONFIG_AUX_DIR to avoid the following build failure with
+autoconf >= 2.70:
+
+autoreconf: error: cannot create config/autoconf: No such file or directory
+
+Fixes:
+ - http://autobuild.buildroot.org/results/433599039d6e1ee301465f9867e169c121a0646f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent as upstream is unmaintained:
+https://gitlab.com/cespedes/ltrace/-/issues/8]
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b9c39fa..486589b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,7 +28,6 @@ AC_INIT([ltrace],[0.7.91],[ltrace-devel@lists.alioth.debian.org],
+ AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_SRCDIR(libltrace.c)
+ AC_CONFIG_MACRO_DIR([config/m4])
+-AC_CONFIG_AUX_DIR([config/autoconf])
+ AC_CANONICAL_BUILD
+ AC_CANONICAL_HOST
+ 
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
