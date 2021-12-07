Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3246C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 22:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59B2E60EE0;
	Tue,  7 Dec 2021 22:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBvE_aIuT-kJ; Tue,  7 Dec 2021 22:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F6A60EC9;
	Tue,  7 Dec 2021 22:04:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D03651BF470
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 22:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF2CE41CC5
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 22:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6x9M0U1n8u2 for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 22:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC54841CAD
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 22:04:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d24so697100wra.0
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 14:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4oded0HFIcotNIH4LvlH21g0py7LCAgK+iJhZZRugyQ=;
 b=C4+G+k3l31zQ916RSDdjL694FHgVzWzTWjyatwC92gJ0bOIHWwiHBe6MJVvAQlJUzB
 GctXkAl0ZmQRfnJZ+2dafhuCDPLxeoYZpVo3+wwgP6BfJcZXJudSFREvnWKIxwdZQh36
 XDSIvJeZ0kTI0VnNf9MmV7Z+DaAyss1wfZuKJshWBtQocSwRxftONJRggCHK4h49Tv8v
 4VATApa4ojk362sqjb0MsWQBkWIfRkejQA5SCTp8KdrMWhFOCB335XnrwAXP+FEvKOQD
 SRC7Gh6eHy7JpR/uHEVd358xyb9mqYo+VBc6jVHPCeiBWPY70/kV2pHVasQQbVtv1DmF
 szoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4oded0HFIcotNIH4LvlH21g0py7LCAgK+iJhZZRugyQ=;
 b=I/1VK06o5vrl37bEhVFlVPUk55nF57MLUVZ2w8aRyVL5Sgu8bQOfkmVfL1n2++SqAg
 WVGXI5knh4XRnjVgTijuC7JHzxlubCe6RZkOERq2G7LiyJ3TjTDNU0uuH0u8sRRRLzq0
 YbqtMbUktpcETic6rHjsmH5kRzTF0ZY98HUx4CJ6BsV9H+HAyZg2estNvGqi2Dh3YQS3
 N3lbtPQG8DM7MJZWtrij8SNjWsohIIt0cZh0HNfAnzwb56zSYMwtvgEkJEfmkOWtvPqb
 gh5P4lukkzmeJdLGIhjAGAiLsxoDRh+73JlppXNU6MB0dKAlqIkQyqx9F1FCM+pfNCv4
 Hj2A==
X-Gm-Message-State: AOAM533qqbgMkY/TOoXRmNWTCvPNdwHaf0lsapWsCNuRU2bO244JKlJQ
 87V9Vbdlp4Qmkz5thbnLhy6GL1IJ93cXLQ==
X-Google-Smtp-Source: ABdhPJxhNbeBkDsxBXnt/MlBaUwP5oU1SUo5pGwuLiHsAi5Kzoe/H4WQZiyc7fBCOaZYa3O+8Ok2yQ==
X-Received: by 2002:a5d:62c5:: with SMTP id o5mr54228809wrv.408.1638914648589; 
 Tue, 07 Dec 2021 14:04:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id r15sm3709806wmh.13.2021.12.07.14.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 14:04:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 23:04:07 +0100
Message-Id: <20211207220407.3320031-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/keepalived: fix CVE-2021-44225
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
Cc: Ilias Apalodimas <apalos@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In Keepalived through 2.2.4, the D-Bus policy does not sufficiently
restrict the message destination, allowing any user to inspect and
manipulate any property. This leads to access-control bypass in some
situations in which an unrelated D-Bus system service has a settable
(writable) property

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...us-fix-policy-to-not-be-overly-broad.patch | 42 +++++++++++++++++++
 package/keepalived/keepalived.mk              |  3 ++
 2 files changed, 45 insertions(+)
 create mode 100644 package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch

diff --git a/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch b/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
new file mode 100644
index 0000000000..6287d6117d
--- /dev/null
+++ b/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
@@ -0,0 +1,42 @@
+From 7977fec0be89ae6fe87405b3f8da2f0b5e415e3d Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Tue, 23 Nov 2021 06:50:59 +0100
+Subject: [PATCH] dbus: fix policy to not be overly broad
+
+The DBus policy did not restrict the message destination, allowing any
+user to inspect and manipulate any property.
+
+Signed-off-by: Vincent Bernat <vincent@bernat.ch>
+
+[Retrieved from:
+https://github.com/acassen/keepalived/commit/7977fec0be89ae6fe87405b3f8da2f0b5e415e3d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ keepalived/dbus/org.keepalived.Vrrp1.conf | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/keepalived/dbus/org.keepalived.Vrrp1.conf b/keepalived/dbus/org.keepalived.Vrrp1.conf
+index 2b78a575c..b5ced6085 100644
+--- a/keepalived/dbus/org.keepalived.Vrrp1.conf
++++ b/keepalived/dbus/org.keepalived.Vrrp1.conf
+@@ -3,12 +3,15 @@
+  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+ <busconfig>
+ 	<policy user="root">
+-		<allow own="org.keepalived.Vrrp1"/>
+-		<allow send_destination="org.keepalived.Vrrp1"/>
++		<allow own="org.keepalived.Vrrp1" />
++		<allow send_destination="org.keepalived.Vrrp1" />
+ 	</policy>
+ 	<policy context="default">
+-		<allow send_interface="org.freedesktop.DBus.Introspectable" />
+-		<allow send_interface="org.freedesktop.DBus.Peer" />
+-		<allow send_interface="org.freedesktop.DBus.Properties" />
++		<allow send_destination="org.keepalived.Vrrp1"
++		       send_interface="org.freedesktop.DBus.Introspectable" />
++		<allow send_destination="org.keepalived.Vrrp1"
++		       send_interface="org.freedesktop.DBus.Peer" />
++		<allow send_destination="org.keepalived.Vrrp1"
++		       send_interface="org.freedesktop.DBus.Properties" />
+ 	</policy>
+ </busconfig>
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 5d42cab741..e31c02dec5 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -12,6 +12,9 @@ KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CPE_ID_VENDOR = keepalived
 KEEPALIVED_CONF_OPTS = --disable-hardening
 
+# 0002-dbus-fix-policy-to-not-be-overly-broad.patch
+KEEPALIVED_IGNORE_CVES += CVE-2021-44225
+
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
 KEEPALIVED_CONF_OPTS += --enable-json
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
