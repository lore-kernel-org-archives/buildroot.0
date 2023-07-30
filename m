Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09512C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 17:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9EC5402B2;
	Sun, 30 Jul 2023 17:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9EC5402B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPThNYIpKTd2; Sun, 30 Jul 2023 17:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 593374026D;
	Sun, 30 Jul 2023 17:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 593374026D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBA981BF3BC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9546381A95
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9546381A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnFagOgtBMxy for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 17:13:00 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62284813BC
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 17:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62284813BC
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D971FA4C1075;
 Sun, 30 Jul 2023 19:12:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60884)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ9y4-00088q-1g;
 Sun, 30 Jul 2023 19:12:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 19:12:30 +0200
Message-Id: <20230730171232.3381097-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730171232.3381097-1-bernd@kuhls.net>
References: <20230730171232.3381097-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690737152;
 bh=4pXUCRA1BBzCsPYsoJPfOGp1qaDvYsaImvhHPqTi81Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qmz+5B8Cz/gZNBYKCGDhj4bKr+hbrWqUQkAO+4tW4w3ccLxmZPcyDvNvyzzju4ov6
 LmHdnueP2syQJ4Jf0o40+rWxgCmKqzAbDTfAlgwXQDyjykCPzsS98p5kPs0MDCYGR6
 keA2jJf4DK7XKlxWV5f4DY3klZ0ZFN5LIIgUpTpfnNRwtbLGH/piF7NyFcpP+gSx0Z
 VxZCSnuxIBsZ2PS0DXmkF7cUCXCCb9tAiHkFUHKcdr2jxhlrlXWTpS+uxP4fNwWMR/
 o8IeIRG1RhKVidrC8C1wlwhS68fhlCW2CHYZBuO3tOYQLNIkGpqEXcqJFgoCui3Adf
 FVTurz0jqWP4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Qmz+5B8C
Subject: [Buildroot] [PATCH 3/5] package/kodi: Fix building with fmt >= 10
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
Cc: Semyon Kolganov <semenak94@mail.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...se-AnnouncementFlagToString-when-log.patch | 31 ++++++++++++++++
 ...ontrol-use-explicit-cast-to-UTILS-CO.patch | 32 ++++++++++++++++
 ...-fmt-enums-format_as-for-explicit-en.patch | 33 +++++++++++++++++
 ...er-for-std-atomic-for-explicit-atomi.patch | 37 +++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 package/kodi/0002-CGUIWindowHome-use-AnnouncementFlagToString-when-log.patch
 create mode 100644 package/kodi/0003-CGUIColorButtonControl-use-explicit-cast-to-UTILS-CO.patch
 create mode 100644 package/kodi/0004-CLog-allow-using-fmt-enums-format_as-for-explicit-en.patch
 create mode 100644 package/kodi/0005-CLog-add-formatter-for-std-atomic-for-explicit-atomi.patch

diff --git a/package/kodi/0002-CGUIWindowHome-use-AnnouncementFlagToString-when-log.patch b/package/kodi/0002-CGUIWindowHome-use-AnnouncementFlagToString-when-log.patch
new file mode 100644
index 0000000000..3aa41adc86
--- /dev/null
+++ b/package/kodi/0002-CGUIWindowHome-use-AnnouncementFlagToString-when-log.patch
@@ -0,0 +1,31 @@
+From cfbc0ec1b2cf2952fa4a279cf5fc71c15bf56f23 Mon Sep 17 00:00:00 2001
+From: Lukas Rusak <lorusak@gmail.com>
+Date: Tue, 27 Jun 2023 11:21:50 -0700
+Subject: [PATCH] CGUIWindowHome: use AnnouncementFlagToString when logging
+
+Upstream: https://github.com/xbmc/xbmc/commit/3a20f5b67ff32cc3663e0ccd72941e666e8756a4
+Upstream: https://github.com/xbmc/xbmc/pull/23571
+
+Signed-off-by: Lukas Rusak <lorusak@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/windows/GUIWindowHome.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xbmc/windows/GUIWindowHome.cpp b/xbmc/windows/GUIWindowHome.cpp
+index c42e073c48..abc6cfc94d 100644
+--- a/xbmc/windows/GUIWindowHome.cpp
++++ b/xbmc/windows/GUIWindowHome.cpp
+@@ -78,7 +78,8 @@ void CGUIWindowHome::Announce(ANNOUNCEMENT::AnnouncementFlag flag,
+ {
+   int ra_flag = 0;
+ 
+-  CLog::Log(LOGDEBUG, LOGANNOUNCE, "GOT ANNOUNCEMENT, type: {}, from {}, message {}", flag, sender, message);
++  CLog::Log(LOGDEBUG, LOGANNOUNCE, "GOT ANNOUNCEMENT, type: {}, from {}, message {}",
++            AnnouncementFlagToString(flag), sender, message);
+ 
+   // we are only interested in library changes
+   if ((flag & (ANNOUNCEMENT::VideoLibrary | ANNOUNCEMENT::AudioLibrary)) == 0)
+-- 
+2.39.2
+
diff --git a/package/kodi/0003-CGUIColorButtonControl-use-explicit-cast-to-UTILS-CO.patch b/package/kodi/0003-CGUIColorButtonControl-use-explicit-cast-to-UTILS-CO.patch
new file mode 100644
index 0000000000..8ac29dcd20
--- /dev/null
+++ b/package/kodi/0003-CGUIColorButtonControl-use-explicit-cast-to-UTILS-CO.patch
@@ -0,0 +1,32 @@
+From 8b1673044971cae84de7d34015230b9503f292f4 Mon Sep 17 00:00:00 2001
+From: Lukas Rusak <lorusak@gmail.com>
+Date: Tue, 27 Jun 2023 11:22:32 -0700
+Subject: [PATCH] CGUIColorButtonControl: use explicit cast to
+ UTILS::COLOR::Color when formatting
+
+Upstream: https://github.com/xbmc/xbmc/commit/c82006b575b78efbb3f5aff40a159b90f245ea9d
+Upstream: https://github.com/xbmc/xbmc/pull/23571
+
+Signed-off-by: Lukas Rusak <lorusak@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/guilib/GUIColorButtonControl.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xbmc/guilib/GUIColorButtonControl.cpp b/xbmc/guilib/GUIColorButtonControl.cpp
+index 940834cb68..67597d7ab5 100644
+--- a/xbmc/guilib/GUIColorButtonControl.cpp
++++ b/xbmc/guilib/GUIColorButtonControl.cpp
+@@ -188,7 +188,8 @@ void CGUIColorButtonControl::RenderInfoText()
+ void CGUIColorButtonControl::ProcessInfoText(unsigned int currentTime)
+ {
+   CRect labelRenderRect = m_labelInfo.GetRenderRect();
+-  bool changed = m_labelInfo.SetText(StringUtils::Format("#{:08X}", m_imgBoxColor));
++  bool changed = m_labelInfo.SetText(
++      StringUtils::Format("#{:08X}", static_cast<UTILS::COLOR::Color>(m_imgBoxColor)));
+   // Set Label X position based on image mask control position
+   float textWidth = m_labelInfo.GetTextWidth() + 2 * m_labelInfo.GetLabelInfo().offsetX;
+   float textPosX = m_imgColorMask->GetXPosition() - textWidth;
+-- 
+2.39.2
+
diff --git a/package/kodi/0004-CLog-allow-using-fmt-enums-format_as-for-explicit-en.patch b/package/kodi/0004-CLog-allow-using-fmt-enums-format_as-for-explicit-en.patch
new file mode 100644
index 0000000000..4e09218361
--- /dev/null
+++ b/package/kodi/0004-CLog-allow-using-fmt-enums-format_as-for-explicit-en.patch
@@ -0,0 +1,33 @@
+From ec1fd134e31b8c667ff06e02e21a75c4c3e87dfd Mon Sep 17 00:00:00 2001
+From: Lukas Rusak <lorusak@gmail.com>
+Date: Tue, 27 Jun 2023 11:24:02 -0700
+Subject: [PATCH] CLog: allow using fmt::enums::format_as for explicit enum
+ conversion when using libfmt>=10
+
+Upstream: https://github.com/xbmc/xbmc/commit/e4b1aa8450fabfb41379953c8ccec0a512421531
+Upstream: https://github.com/xbmc/xbmc/pull/23571
+
+Signed-off-by: Lukas Rusak <lorusak@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/utils/log.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/xbmc/utils/log.h b/xbmc/utils/log.h
+index 9fc4aae368..adf46905a8 100644
+--- a/xbmc/utils/log.h
++++ b/xbmc/utils/log.h
+@@ -46,6 +46,10 @@ class dist_sink;
+ } // namespace sinks
+ } // namespace spdlog
+ 
++#if FMT_VERSION >= 100000
++using fmt::enums::format_as;
++#endif
++
+ class CLog : public ISettingsHandler, public ISettingCallback
+ {
+ public:
+-- 
+2.39.2
+
diff --git a/package/kodi/0005-CLog-add-formatter-for-std-atomic-for-explicit-atomi.patch b/package/kodi/0005-CLog-add-formatter-for-std-atomic-for-explicit-atomi.patch
new file mode 100644
index 0000000000..b87a60f809
--- /dev/null
+++ b/package/kodi/0005-CLog-add-formatter-for-std-atomic-for-explicit-atomi.patch
@@ -0,0 +1,37 @@
+From 46f6d97f46254600bd34f77f335a475178d7aaa5 Mon Sep 17 00:00:00 2001
+From: Lukas Rusak <lorusak@gmail.com>
+Date: Tue, 27 Jun 2023 11:24:34 -0700
+Subject: [PATCH] CLog: add formatter for std::atomic for explicit atomic
+ conversion when using libfmt>=10
+
+Upstream: https://github.com/xbmc/xbmc/commit/26c164a28cfd18ceef7a1f2bbba5bf8a4a5a750c
+Upstream: https://github.com/xbmc/xbmc/pull/23571
+
+Signed-off-by: Lukas Rusak <lorusak@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/utils/log.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/xbmc/utils/log.h b/xbmc/utils/log.h
+index adf46905a8..1c42c888cb 100644
+--- a/xbmc/utils/log.h
++++ b/xbmc/utils/log.h
+@@ -48,6 +48,14 @@ class dist_sink;
+ 
+ #if FMT_VERSION >= 100000
+ using fmt::enums::format_as;
++
++namespace fmt
++{
++template<typename T, typename Char>
++struct formatter<std::atomic<T>, Char> : formatter<T, Char>
++{
++};
++} // namespace fmt
+ #endif
+ 
+ class CLog : public ISettingsHandler, public ISettingCallback
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
