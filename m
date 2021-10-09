Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B7DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 17:03:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49CC6109E
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 17:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B49CC6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5129E606F0;
	Sat,  9 Oct 2021 17:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WGTEcIkkdbw8; Sat,  9 Oct 2021 17:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A725860620;
	Sat,  9 Oct 2021 17:03:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF6E41BF83B
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 17:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8B2A83A3A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 17:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kx2iNHNhP3uv for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 17:03:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B46783A05
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 17:03:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i12so27331894wrb.7
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aBur4zIW4VxJXPbnGWlL9OzuTvBRJYD44aSUmVJFPSA=;
 b=SXu4ukl7RzZPPewAa3hDwBHC/ZVxw3aKPqg71STHuOjC23dvffufedYP5rzZrxoAq+
 2a2jr7hPxHdzSzGWyX+HDqrMHQXOD8HDvBvROAozszAY5GyJozfqZRO7WHI0eqjEpp73
 ojq11GImZP1NXYNKtEsQfmjrVO1tQhM55CwgWoctJWQZICqWCwIfuomAFDGF0YDAXA8c
 HUuymISMisKnATINAMidQvLUWIpog7wZi9QqxInvjMk408EQyAtJhIX2N203viqs+5FD
 lOoqSZ5OXkOTtPWJaZrEFc1UR7F4QYAgddqpfDR2LSqDW3DZkEkio2vcxhFUG2AWlBOd
 +5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aBur4zIW4VxJXPbnGWlL9OzuTvBRJYD44aSUmVJFPSA=;
 b=eQkduiVoMFvtdE56zW539kZqluQ6yRMEmWm3NC4jesgydGeCaDM9Iulj9R7b39q29W
 lBJgQPE0+nG6hvzYpTy5+w1aN+r/nOgWinBmE7w18rl2t3TU8fHT4RBwBpuay23TyP5R
 gw8oIfpkOvoiaSoNC2KlN1AYZPhsNqr4G0UaI2QaJv6Noctn2C0w55JMKRBYxo/QCilW
 IEivhTEf65jxueDXuJj20xtqA3aW4fX3iRw4JKXKqJsG8IDRO3MPsBC5hdd8rpp7blYq
 UOuoOXgAkL/b36Xwjj3r5wJqLLeXlIPBo2JKG6UQkmTN9lPfPY2QbZ3V+REHqrTguhXY
 1tOA==
X-Gm-Message-State: AOAM530s5RlqFrLfhySOTcDqMZzRa5qeBYZbyuD/TzjH2LIlQFkVen9u
 y7FV1lLaDtc/rKDcnx1vwdnrPj2JSZY=
X-Google-Smtp-Source: ABdhPJzcIMyT4UkmdAYRNPLsKNBcWJ5uYib6sugrVMXZB2e32g3lN9D7tSKgDo8VroQ+ZrNp783nEQ==
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr12125185wri.425.1633799027251; 
 Sat, 09 Oct 2021 10:03:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id a5sm940068wrn.71.2021.10.09.10.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 10:03:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 19:02:42 +0200
Message-Id: <20211009170242.486738-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix build with
 autoconf >= 2.71
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work.

Fixes:
 - http://autobuild.buildroot.org/results/e8bea26f6b12adf16335b24836a7c5c31911af6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ac-fix-autoreconf-with-autoconf-2.71.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.71.patch

diff --git a/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.71.patch b/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.71.patch
new file mode 100644
index 0000000000..9522f611ba
--- /dev/null
+++ b/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.71.patch
@@ -0,0 +1,39 @@
+From 857ac91a03a096601f62b358fc61355d4cc25b9b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Oct 2021 18:51:13 +0200
+Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.71
+
+Remove the whitespace before IT_PROG_INTLTOOL as suggested in
+https://www.mail-archive.com/bug-autoconf@gnu.org/msg04851.html
+to avoid the following build failure with autoconf >= 2.71:
+
+ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e8bea26f6b12adf16335b24836a7c5c31911af6a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable as upstream swicthed to cmake (
+https://github.com/transmission/transmission/issues/1573)]
+---
+ configure.ac | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fd1132fda..04e0e19bb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -555,9 +555,7 @@ dnl it should be safe to re-edit 0.40 back down to 0.23
+ use_nls=no
+ if test "x$enable_nls" = "xyes" ; then
+     use_nls=yes
+-    m4_ifdef([IT_PROG_INTLTOOL],
+-             [IT_PROG_INTLTOOL([0.35.0],[no-xml])],
+-             [AC_MSG_ERROR("--enable-nls requires intltool to be installed.")])
++IT_PROG_INTLTOOL([0.35.0],[no-xml])
+     AC_CHECK_HEADERS([libintl.h])
+     GETTEXT_PACKAGE=transmission-gtk
+     AC_SUBST(GETTEXT_PACKAGE)
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
