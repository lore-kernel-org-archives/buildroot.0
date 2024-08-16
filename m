Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB709C531DC
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 09:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5626067E;
	Fri, 16 Aug 2024 09:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjwHy6a2WjcE; Fri, 16 Aug 2024 09:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09AAF60698
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09AAF60698;
	Fri, 16 Aug 2024 09:11:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A4EB1BF292
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 09:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC9E660698
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 09:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Z70Avw-aRSt for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 09:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.14;
 helo=sender4-op-o14.zoho.com; envelope-from=george.kiagiadakis@collabora.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1589C6067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1589C6067E
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1589C6067E
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 09:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1723799491; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l3C1UyjdjrPIZxkwyCtHbKNtg8kX3H+NRImhQHQMSkt40r+Xm/V1YXKjED0SeQ1vLGfsRiBb/hoOOIqmG5OxxSGt5LuyUQoUekDhmnYq105lq+TTGJWlou6llPgON21YB+vPfgDKSzn1Xi7yqln2xi07itP6TwOwj6kvEDimA9Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723799491;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rp5aHGkxNQ7J9e2usjnooHFiCTZLju4Lyle8BUbv9TQ=; 
 b=kjXYAg1OkNxZBeIJHeso+KopIcBP0v97veSVHYDsTmqsmDyU1rIS/9VALFeKzEw0OZ0eyOev3ydRyTbo3E7hsTkz7AYeYKvJ2oOu64NtiHzSP6L3HD2EQ8YZYW1xQI1xQ9K4QXyIB8kIdhLP6d3HhB3tsxIcbCJSH71/2bAwePs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=george.kiagiadakis@collabora.com;
 dmarc=pass header.from=<george.kiagiadakis@collabora.com>
Received: by mx.zohomail.com with SMTPS id 1723799490118950.3205293237243;
 Fri, 16 Aug 2024 02:11:30 -0700 (PDT)
From: George Kiagiadakis <george.kiagiadakis@collabora.com>
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 12:06:57 +0300
Message-ID: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1723799491; 
 s=zohomail; d=collabora.com; i=george.kiagiadakis@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rp5aHGkxNQ7J9e2usjnooHFiCTZLju4Lyle8BUbv9TQ=;
 b=CCs5s/vcaLMP20OlqI9Uv46Amcj7hXEHtZfYYhCoS7/PAAGOycKvjNTKb3VR8YZr
 L9IOXdg4ufDgtmYlQ4jln95Ue99EEOk8DtFSUMNSJmlZPpnjMwwGZEFqx/uO0Fl3uoi
 7GqKPxYolwV2jhMNP8lKk2aEX1Uo/Pk16zgjEnds=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=collabora.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=collabora.com header.i=george.kiagiadakis@collabora.com
 header.a=rsa-sha256 header.s=zohomail header.b=CCs5s/vc
Subject: [Buildroot] [PATCH v2 1/4] package/pipewire: bump version to 1.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 George Kiagiadakis <george.kiagiadakis@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disabled roc & snap dependencies, which don't exist in buildroot.
Added libselinux dependency option.
Added missing libglib2 dependency pulled by the bluez plugin.

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
---
Changes since v1:
  - None

 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 3370d86641..8ea3890675 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2b6e0c4d2e544f5030fa7f4ecf1edd9e5eed15dda1c97135e8a1fded9f3425fe  pipewire-0.3.81.tar.bz2
+sha256  b3817f7b9abf14a6dbcb6ea18b186ba8771f703cb395e4a38366b4e051c40054  pipewire-1.2.2.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index f0f3cd847c..8df2d03758 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.81
+PIPEWIRE_VERSION = 1.2.2
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -34,10 +34,12 @@ PIPEWIRE_CONF_OPTS += \
 	-Dsession-managers=[] \
 	-Dlegacy-rtkit=false \
 	-Davb=disabled \
+	-Droc=disabled \
 	-Dlibcanberra=disabled \
 	-Dlibmysofa=disabled \
 	-Dlibffado=disabled \
-	-Dflatpak=disabled
+	-Dflatpak=disabled \
+	-Dsnap=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 PIPEWIRE_CONF_OPTS += -Ddbus=enabled
@@ -105,9 +107,9 @@ else
 PIPEWIRE_CONF_OPTS += -Dpipewire-jack=disabled -Djack=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC)$(BR2_PACKAGE_LIBGLIB2),yyy)
 PIPEWIRE_CONF_OPTS += -Dbluez5=enabled
-PIPEWIRE_DEPENDENCIES += bluez5_utils sbc
+PIPEWIRE_DEPENDENCIES += bluez5_utils sbc libglib2
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
 PIPEWIRE_CONF_OPTS += -Dbluez5-backend-native-mm=enabled
 PIPEWIRE_DEPENDENCIES += modem-manager
@@ -239,6 +241,13 @@ else
 PIPEWIRE_CONF_OPTS += -Draop=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+PIPEWIRE_CONF_OPTS += -Dselinux=enabled
+PIPEWIRE_DEPENDENCIES += libselinux
+else
+PIPEWIRE_CONF_OPTS += -Dselinux=disabled
+endif
+
 define PIPEWIRE_USERS
 	pipewire -1 pipewire -1 * - - audio,video PipeWire System Daemon
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
