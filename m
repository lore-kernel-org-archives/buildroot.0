Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7929C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 12:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3243A8183D;
	Tue, 21 Dec 2021 12:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJrR6L-xmp4m; Tue, 21 Dec 2021 12:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BF4B81766;
	Tue, 21 Dec 2021 12:46:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD10B1BF5E9
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 12:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBC7F60EDA
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 12:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gx9SB47tkHmB for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 12:46:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9263B60ED6
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 12:46:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v7so19384497wrv.12
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 04:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Hk+EJ8yBl++XEaxtwLu8oYTRoRFtB+HcHvpdJnl7pw=;
 b=K4sgFETJeocZ258NlxAOu9ySKfe3yP1FVKOcAYWh5u8A4pp4BoGn801A+eGqjXuUnq
 Q7EK1/F/E34qh8FKVpO0mhu2ary1ITciw9vUrQDcP/vCdtvABuNwJBCYiP3m4osE1e5N
 uDlMMy19KwXV1mwluAEdMOHo2pquy+YG14oThlNCDl0KdizSbjVV/4sQg9oRV2zXrpf8
 CiN2eZS44SIq08gv+YJhzduq095ieoAMazMZtuzQiUwJWA1nydoKWbSlZNBDPr0GnXps
 j61fNz4lt3DmQbWExKdW0e+3JjiscpF5+4xsmZzed38/gNomQTz/guDh4q/Aq9Z7+YK4
 G+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Hk+EJ8yBl++XEaxtwLu8oYTRoRFtB+HcHvpdJnl7pw=;
 b=PEi8OsSc2XabaKDLe/YiDizoeQIOKLkFuqB0ZSytAzC3qi/4uHXhlfzim7xa9Trclb
 gEaDhfs8LVxxC3kvLi/33DZ+40eVEJg4tlJbVkpZ7syj4+VzbNqQfUvO9cm1+j1R9eD2
 N15OOXQgaYAevF19A0SBoouZsiteDH6ewFS5d2fkQIZn9lJwBCKpRmRe3Z2NEajhdGe0
 RzpfDfRKC0gFQlyZ9nIMrjnhf8MRQTDLDOTPAJsfmIaMyL7cBfhbfwCiV8nKHKDuxS+C
 OWNXt2tqJFjlqduEijhnnkEyVYLI5UFcHGjj7eJ4fa97dumKMEnOQDcsmmLG+05+Gs6x
 B94g==
X-Gm-Message-State: AOAM532kWkV904GlnPog87X6+sav/BOxUcYxnbIBfw0UGlKHvmcAgsjc
 GU1ITFWZDqNJhKzRcyfygr3c58L/Zz6wRQ==
X-Google-Smtp-Source: ABdhPJxNx6oCGP55nS8ypdfAaYAoVJDmSgrT9U9Ww9CV+qnsugiTdCtMVcjEmXZ6cgONoLmun8+r/w==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr774988wri.180.1640090807609; 
 Tue, 21 Dec 2021 04:46:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id 11sm489906wrz.63.2021.12.21.04.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:46:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 13:46:14 +0100
Message-Id: <20211221124614.24802-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gssdp: bump to version 1.4.0.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.4.0.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 4954568420..c9bbd66083 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.3/gssdp-1.3.1.sha256sum:
-sha256  affbf145c26e02dda9d31f9da9fd5182bd2cc36565ab8ee2e877567b2fd206cd  gssdp-1.3.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.4/gssdp-1.4.0.1.sha256sum:
+sha256  8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582  gssdp-1.4.0.1.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index c7982f16c5..f1fed3713d 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GSSDP_VERSION_MAJOR = 1.3
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).1
+GSSDP_VERSION_MAJOR = 1.4
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0.1
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.1+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
