Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36647EEA845
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED18A40B29;
	Thu, 12 Feb 2026 19:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iES2UVS5NVZd; Thu, 12 Feb 2026 19:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1348040B2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770923090;
	bh=BE8+a9P9ZymDFybQPN2WnKFwVbh3NyeVRcqC1oUVd2s=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=m6btfDMniB7jtkgR8x4ussMHEpF6s6dYe0FNwSjYhyo4iEKJ+cO8/ezMAgKwkbXBj
	 uUVRC77yjgIf5knyR9N4uDHhr1ZBL+Hkv1YPUSdbdsBqhRzetttTkmFEJ3maNJ4YIb
	 LDGgSZz/DTNBplZ0oEi3oy24vrQkAf0ZAhR3i7qxyvVn/0qXSgupNVXankMcyzHNGn
	 HedJsSQnSgyYVkmQ0Sx9gBOa9oHmT4TncmHcg/G3FmDYxhFBb1foF+cu0M714AT5yG
	 0agWaySLbnJzzCIeo5KDZpCCCj6mWwWGbWhrq6BRBRUIf3yX0IbjWtzYDrJ82eM4Ps
	 yDvibf4b/bdYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1348040B2F;
	Thu, 12 Feb 2026 19:04:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06DABEC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC71C6072A
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dY6Hx4KEFNSr for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:04:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.94;
 helo=sender4-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C103360737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C103360737
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C103360737
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770923066; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DKm6eLkJKCLcOaLKLplOWLas5U4ySXowJqO5940eB8JtVSuZy0kNKfV/jhmCwQBrpqlQmsYWIsy4cvHh3m4AcvVsFTAdloaZTDvqIxk+I/vFBHlMAm/7082W0F+mT1E9Klv5VM4oxEF/kbbbHN94pivifIK7dCz+QzeLRo288Wo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770923066;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IKPiYhMvMvZ1f3J/LqqvwZ28PLJZlWO3DnBHMAqhjyI=; 
 b=XcaeepTC09TkZE+4fzWYrju2pHxjysFfzAEPL6ed/2huEC6ZsxvZFzaTeCR9Ctagvud04xNSq3WUpZUbx822dD2pjssbpC1wOde6aUBAB/oZBWj0/F4+MM7AI2/UGbUqi2qY08UXgM31D3V/egwmatlpxYpNn+EEcsX1wqkoI6A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770923059851771.6963123196025;
 Thu, 12 Feb 2026 11:04:19 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 03:03:45 +0800
Message-Id: <20260212190349.537465-3-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212190349.537465-1-kingxukai@zohomail.com>
References: <20260212190349.537465-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr08011227de8571b0b6218ed70f2a317c00007806767a069330e63c75baaf4da37d75aea19b594dea9ec6c0:zu0801122717075b5fe87b4ccdbd24d89a0000638221fd01139fb87f1ff69abb8c08f70c33ffc01a4a070a1d:rf0801122dd49362440837c9634f008b4b00009c15ddb9caea6455831c2eb727d2ff452f3e09951c2af3f9a0ac12d8fd7945:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770923065; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=IKPiYhMvMvZ1f3J/LqqvwZ28PLJZlWO3DnBHMAqhjyI=;
 b=eS5uiIc7y4TCS9kf7/eXXqUnak+Ki5O8dqIbP4KIHwVFAdllGMBnYimtg36DQRQX
 ob+F4xZFEyk3AhvnXMVvPRuUV9ZOGe3F8+SaMtfwDMg5a9GPUKo06gWHrn+AA9FoDjd
 MF4IHQ/2XjdODJ536/SEsJNynVrNQeHGHQVOVapc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=eS5uiIc7
Subject: [Buildroot] [RESEND: v1 2/6] package/python-farama-notifications:
 new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the python-farama-notifications package,
which provides a unified notification mechanism for all
libraries maintained by the FaramaFoundation.

This package is used by Farama projects such as gymnasium
to deliver runtime and deprecation notifications in a
consistent way.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-farama-notifications/Config.in      |  7 +++++++
 .../python-farama-notifications.hash               |  5 +++++
 .../python-farama-notifications.mk                 | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-farama-notifications/Config.in
 create mode 100644 package/python-farama-notifications/python-farama-notifications.hash
 create mode 100644 package/python-farama-notifications/python-farama-notifications.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f26f3230bc..fb0a084665 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3476,6 +3476,7 @@ F:	configs/ti_am64x_sk_defconfig
 
 N:	Xukai Wang <kingxukai@zohomail.com>
 F:	package/python-cloudpickle/
+F:	package/python-farama-notifications/
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/package/Config.in b/package/Config.in
index 57f573d34d..a1b06227e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1108,6 +1108,7 @@ menu "External python modules"
 	source "package/python-evdev/Config.in"
 	source "package/python-executing/Config.in"
 	source "package/python-falcon/Config.in"
+	source "package/python-farama-notifications/Config.in"
 	source "package/python-fastapi/Config.in"
 	source "package/python-fastapi-sessions/Config.in"
 	source "package/python-fastui/Config.in"
diff --git a/package/python-farama-notifications/Config.in b/package/python-farama-notifications/Config.in
new file mode 100644
index 0000000000..06be45d996
--- /dev/null
+++ b/package/python-farama-notifications/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS
+	bool "python-farama-notifications"
+	help
+	  Notifications for all Farama Foundation maintained
+	  libraries.
+
+	  https://github.com/Farama-Foundation/Farama-Notifications
diff --git a/package/python-farama-notifications/python-farama-notifications.hash b/package/python-farama-notifications/python-farama-notifications.hash
new file mode 100644
index 0000000000..b8ef65f8a8
--- /dev/null
+++ b/package/python-farama-notifications/python-farama-notifications.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/farama-notifications/json
+md5  5caeb9a1f37a2e4ccdeff13858f41444  Farama-Notifications-0.0.4.tar.gz
+sha256  13fceff2d14314cf80703c8266462ebf3733c7d165336eee998fc58e545efd18  Farama-Notifications-0.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  7ff6336b33ae4c168086e899a11b7c91d369b6758cee20f9469d563f004f89eb  LICENSE
diff --git a/package/python-farama-notifications/python-farama-notifications.mk b/package/python-farama-notifications/python-farama-notifications.mk
new file mode 100644
index 0000000000..2ed06ad150
--- /dev/null
+++ b/package/python-farama-notifications/python-farama-notifications.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-farama-notifications
+#
+################################################################################
+
+PYTHON_FARAMA_NOTIFICATIONS_VERSION = 0.0.4
+PYTHON_FARAMA_NOTIFICATIONS_SOURCE = Farama-Notifications-$(PYTHON_FARAMA_NOTIFICATIONS_VERSION).tar.gz
+PYTHON_FARAMA_NOTIFICATIONS_SITE = https://files.pythonhosted.org/packages/2e/2c/8384832b7a6b1fd6ba95bbdcae26e7137bb3eedc955c42fd5cdcc086cfbf
+PYTHON_FARAMA_NOTIFICATIONS_SETUP_TYPE = setuptools
+PYTHON_FARAMA_NOTIFICATIONS_LICENSE = MIT
+PYTHON_FARAMA_NOTIFICATIONS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
