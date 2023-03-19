Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813FFC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 18:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F08AA60AEA;
	Sun, 19 Mar 2023 18:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F08AA60AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzAoUErnMBY5; Sun, 19 Mar 2023 18:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 344E060A47;
	Sun, 19 Mar 2023 18:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344E060A47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A25B1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 18:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23B4681768
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 18:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23B4681768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01S8dA76XFjN for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 18:11:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE7581764
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BE7581764
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 18:11:10 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id iw17so808891wmb.0
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 11:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679249469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=76+ft7xlZkHeiBgK9wbu+BQwMncTsuR8rBAiAWkwpbo=;
 b=DKJckBTBN1A8GzpwrFcShnGMaay2LRFZA5pYa4NoObbbNHn9mApfR676NIwwpTHS+l
 9T9VnzXr+W4IBMATpS7VgjAV2oGgcYD1qLNr6UpRVA7H8Hp5HTt7xnGJe/7zyo027w6a
 HuRun4mILlfy9uw1s0eFT5pazUePjAxvqO/NUzvOesrQy/EU2AFLEjwqD1zk0hqWcKY2
 5AozfwnliHMLOHKrOuuD/tV1EPfWhaqe2kfNfiMhwAAmfzsvEWe7SLHQwG6mAcD+Qi44
 6cU9tLwvuiD1Mg2cA+LS5nethW3Gz6ZZ7+Xh0dGPeIS0k3OP26Bhst/vj631yJ5P8RR3
 DKjQ==
X-Gm-Message-State: AO0yUKUOGrfO4pkDu5pMfTI3T1mdAuVQQHI9G/UhP4K5cwiB0lBXTN3t
 FtXiIjU4sTg65DD6Vpwi1puHar9sB9s=
X-Google-Smtp-Source: AK7set+2v7Slp8fSc5LBLTeyQMZdPVsVY3ekQh+jAIM0LLncYlZtRobHpGCoLySruJuDs+DcQOBDFw==
X-Received: by 2002:a7b:c38b:0:b0:3ed:2e02:1bfe with SMTP id
 s11-20020a7bc38b000000b003ed2e021bfemr6339139wmj.20.1679249468563; 
 Sun, 19 Mar 2023 11:11:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c220b00b003ed3034698esm8458294wml.9.2023.03.19.11.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 11:11:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 19:10:59 +0100
Message-Id: <20230319181100.23180-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679249469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=76+ft7xlZkHeiBgK9wbu+BQwMncTsuR8rBAiAWkwpbo=;
 b=Vyab8w+qKDTw5g+pX/veJkGEKtVEFvA28PJY1dTrIAT6+qrN0Wqa/4wkv+D1hNPc7t
 tk3r8RZ9JRC5VuIwWDXnZqlbyjQA/BIQhYKdF1EvJXpYXObRTEdlWh3VRRw5NP6Jwjou
 ecJSgOPvhVMT9h0YBRzzmoqdAdWtodWJDWzyKLgW5oQM0ekVrvue1Xpq9kssTWmXI5um
 3bru0T5jWPgyGN2QccN46IAi8b+X5OLk4b7psjWosL7fmfDEi+iidGi8kS48ekY0KeKj
 WUjqz8T6agnjQsIAZvMzIsrvZFxirH2gaTpBYyKybV+3QZepJcH1FeY0gxCI+lkPWEFU
 ge3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vyab8w+q
Subject: [Buildroot] [PATCH 1/2] package/xlib_libXpresent: new package
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
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/Config.in                         |  1 +
 package/x11r7/xlib_libXpresent/Config.in        |  8 ++++++++
 .../xlib_libXpresent/xlib_libXpresent.hash      |  6 ++++++
 .../x11r7/xlib_libXpresent/xlib_libXpresent.mk  | 17 +++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/x11r7/xlib_libXpresent/Config.in
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4de8922e0d..b91f97bb34 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -42,6 +42,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXinerama/Config.in
 		source package/x11r7/xlib_libXmu/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
+		source package/x11r7/xlib_libXpresent/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
 		source package/x11r7/xlib_libXres/Config.in
diff --git a/package/x11r7/xlib_libXpresent/Config.in b/package/x11r7/xlib_libXpresent/Config.in
new file mode 100644
index 0000000000..ee8f0003fe
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXPRESENT
+	bool "libXpresent"
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_XTRANS
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  X.Org Xpresent library
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
new file mode 100644
index 0000000000..e7f6ac9e5a
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
@@ -0,0 +1,6 @@
+# From https://lists.x.org/archives/xorg-announce/2022-October/003225.html
+sha256  b964df9e5a066daa5e08d2dc82692c57ca27d00b8cc257e8e960c9f1cf26231b  libXpresent-1.0.1.tar.xz
+sha512  a4551f49a68f4487eb70dc5b50b7f745fbc8b6842cfa60422afe3834af41c504a37bcfddb4e7e9ee084b250df256034290776c8eb7d8838e392eb626fff55d25  libXpresent-1.0.1.tar.xz
+
+# Locally calculated
+sha256  d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
new file mode 100644
index 0000000000..fd6f092b1a
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# xlib_libXpresent
+#
+################################################################################
+
+XLIB_LIBXPRESENT_VERSION = 1.0.1
+XLIB_LIBXPRESENT_SOURCE = libXpresent-$(XLIB_LIBXPRESENT_VERSION).tar.xz
+XLIB_LIBXPRESENT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPRESENT_LICENSE = MIT
+XLIB_LIBXPRESENT_LICENSE_FILES = COPYING
+XLIB_LIBXPRESENT_INSTALL_STAGING = YES
+
+XLIB_LIBXPRESENT_DEPENDENCIES = \
+	xlib_libXext xlib_libXfixes xlib_xtrans xorgproto
+
+$(eval $(autotools-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
