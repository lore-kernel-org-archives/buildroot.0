Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A72EB64DA
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 20:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CAB6059D;
	Tue, 13 Jun 2023 20:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8CAB6059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFjpYIzpnTqx; Tue, 13 Jun 2023 20:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A850D60655;
	Tue, 13 Jun 2023 20:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A850D60655
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5921D1BF31A
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 20:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3222360655
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 20:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3222360655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8WLCAJlywwq for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 20:25:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E309F6059D
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E309F6059D
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 20:25:34 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout11.t-online.de (Postfix) with SMTP id 918D122A74;
 Tue, 13 Jun 2023 22:25:31 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.180.237]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q9Aa2-0mxWt70; Tue, 13 Jun 2023 22:25:31 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50508)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q9Aa2-0005qB-21;
 Tue, 13 Jun 2023 22:25:30 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 22:25:30 +0200
Message-Id: <20230613202530.612061-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686687931-5AE6F570-5CA0EED1/0/0 CLEAN NORMAL
X-TOI-MSGID: db6c5954-a704-4a22-94d6-77857524c6c5
Subject: [Buildroot] [PATCH v3 1/1] package/python-pyicu: fix build
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/977/977c043615603dd3541e23b81c5f11374606aff6/

Set environment variables to cross-compile friendly values, this prevents
icu-config picking up host libraries:
https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L89
https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L179
https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L216

This follows the upstream build docs:
https://gitlab.pyicu.org/main/pyicu#building-pyicu

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: use environment variables as proposed by the package author
v2: prefer pkg-config (Yann), as proposed
    https://patchwork.ozlabs.org/project/buildroot/patch/20230516173411.823978-1-bernd.kuhls@t-online.de/

 package/python-pyicu/python-pyicu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 512b2f857f..427ebbfe52 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -12,4 +12,11 @@ PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
 PYTHON_PYICU_SETUP_TYPE = setuptools
 
+PYTHON_PYICU_ENV += \
+	ICU_VERSION="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --modversion`" \
+	ICU_BASE="$(STAGING_DIR)/usr" \
+	PYICU_CFLAGS="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --variable=CXXFLAGS`" \
+	PYICU_LFLAGS="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --libs-only-L` \
+		`$(PKG_CONFIG_HOST_BINARY) icu-i18n --libs-only-l`"
+
 $(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
