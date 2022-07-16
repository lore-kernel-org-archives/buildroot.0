Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A376C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 14:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 971C6607C1;
	Sat, 16 Jul 2022 14:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 971C6607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLeqOqCMip1u; Sat, 16 Jul 2022 14:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0565A60A80;
	Sat, 16 Jul 2022 14:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0565A60A80
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 828E11BF5DD
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 14:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F3BD6066D
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 14:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F3BD6066D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQ1MAU-AWOv7 for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 14:57:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 313D56064D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 313D56064D
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 14:57:30 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v16so10505400wrd.13
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 07:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1eo1yw083wEurAzD2E8Ttky0sbLZySy5YkkMsYSEM0s=;
 b=KyPsv85iR12Rs7QVQX6X2DQ3F7SEUz+Xy+nfinP5Uy7AtjMGCaRiN+sTnkzEDIUHoO
 cHhfwPJ11gfM9igOuwKsWwXsDMYzmo59kDgdvPefjyXptMHQATOw81AxHGmHdnn6W/di
 jW9mv5l8INebRIaEUWD69knNGhV2ykOWZh3o+OCn06mdfeKewtUVGRMj0ctsl8nzGV5A
 dkzNBDStX7+sAIEmwpmaZ5ZgfPugTF0d+bgDvgDdgQkRvqGfHLncjcz4e+w5Jd2iLILO
 ixnLnIDHgWsXNY06wzbXEQO2Hg0paT7oGvDrK8PlSUgMvQE3UsMYInYgVF5qMTbrVhoR
 SHYg==
X-Gm-Message-State: AJIora9gchDCc1Z0L/I4Uo30ZnmMk8BFz6T/tQ5mYu5ZFQ4F1BLo2fTM
 orxyIUJpNbCLoOMzOSA9kxzXeUYWO7Q=
X-Google-Smtp-Source: AGRyM1tZZi2GVh2XfwBC2UGeWwzzhfISJ1ctku17CidsoYcRyMbbyZWqSKjTa+uD3gs4sOaTq+EgOQ==
X-Received: by 2002:a05:6000:1688:b0:21d:7b36:926a with SMTP id
 y8-20020a056000168800b0021d7b36926amr16306102wrd.303.1657983448191; 
 Sat, 16 Jul 2022 07:57:28 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a056000104500b0021d69860b66sm7748154wrx.9.2022.07.16.07.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 07:57:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 16:54:19 +0200
Message-Id: <20220716145419.727270-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1eo1yw083wEurAzD2E8Ttky0sbLZySy5YkkMsYSEM0s=;
 b=miPdu6RBwAI8Gmxf5e8V7nWvhlABXpJi0nr+3v6TpyXGyYWiDzakfABQiWQ3mCC0bv
 q7kReoIWr8x0DCqjaqf2lP7h8efzCrGzRB8xBX1qYoEqADrW0oP+zqoXbqkNC+NKHqmS
 9pJ2AzfNhcUSJIl1UCpQ6zvEkdBsdkhb+7Gmy2RpFmQWp42NF3SOhdB4tphuq5ZJf1F8
 GH4Vi8d2vwQfHcg9FcFlSh/cyH0GowFEZN35qKsPvhLIo0k9nJ2568/J34nYkK5oZXTq
 Kqh2d2O0a5PK94+IyhapKpK7gX6l4NQI6qdMkIfjc5iSPBf+HEGfdg5y/sCTcrOu5KtJ
 6lSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=miPdu6RB
Subject: [Buildroot] [PATCH 1/1] package/libgpgme: bump to version 1.17.1
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

Drop patch (already in version)

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=blob;f=NEWS;h=a460ddfe78f18a03143c8dd87ef2c138392104e6;hb=ee50a38823daaa16b151a549a7dafef34bbd1e81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ore-Support-closefrom-also-for-glibc.patch | 36 -------------------
 package/libgpgme/libgpgme.hash                |  6 ++--
 package/libgpgme/libgpgme.mk                  |  2 +-
 3 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch

diff --git a/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch b/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
deleted file mode 100644
index b8db949cef..0000000000
--- a/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e Mon Sep 17 00:00:00 2001
-From: Jiri Kucera <sanczes@gmail.com>
-Date: Sun, 25 Jul 2021 11:35:54 +0200
-Subject: [PATCH] core: Support closefrom also for glibc.
-
-* src/posix-io.c (_gpgme_io_spawn): Use glibc's closefrom.
---
-
-Since 2.34, glibc introduces closefrom (the implementation
-follows *BSD standard).
-
-Signed-off-by: Werner Koch <wk@gnupg.org>
-
-[Retrieved from:
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/posix-io.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/posix-io.c b/src/posix-io.c
-index e712ef28..2a3a81fc 100644
---- a/src/posix-io.c
-+++ b/src/posix-io.c
-@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
-               if (fd_list[i].fd > fd)
-                 fd = fd_list[i].fd;
-             fd++;
--#if defined(__sun) || defined(__FreeBSD__)
-+#if defined(__sun) || defined(__FreeBSD__) || defined(__GLIBC__)
-             closefrom (fd);
-             max_fds = fd;
- #else /*!__sun */
--- 
-2.11.0
-
diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index ca2a79496c..7d02b9e139 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.16.0.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  6c8cc4aedb10d5d4c905894ba1d850544619ee765606ac43df7405865de29ed0  gpgme-1.16.0.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.17.1.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA
+sha256  711eabf5dd661b9b04be9edc9ace2a7bc031f6bd9d37a768d02d0efdef108f5f  gpgme-1.17.1.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index b42a1a363a..1b57b18872 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.16.0
+LIBGPGME_VERSION = 1.17.1
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
