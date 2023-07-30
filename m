Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E25C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF676101B;
	Sun, 30 Jul 2023 20:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF676101B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPO2rs8kiNnL; Sun, 30 Jul 2023 20:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21BC661019;
	Sun, 30 Jul 2023 20:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21BC661019
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 350EF1BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CD62410BB
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD62410BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLae0Le1jRw5 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 858C6410BA
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 858C6410BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72F7583CDA; Sun, 30 Jul 2023 20:44:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 22:43:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb34442831eed4a301ec1ca1e1ab90acbebed28e
X-Git-Newrev: 88b188a242d1b7ac2dc08077bb6ed521030b6b0e
X-Patchwork-Hint: ignore
Message-Id: <20230730204443.72F7583CDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: Fix building with fmt >= 10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88b188a242d1b7ac2dc08077bb6ed521030b6b0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ome-use-AnnouncementFlagToString-when-log.patch | 31 ++++++++++++++++++
 ...ttonControl-use-explicit-cast-to-UTILS-CO.patch | 32 +++++++++++++++++++
 ...using-fmt-enums-format_as-for-explicit-en.patch | 33 +++++++++++++++++++
 ...rmatter-for-std-atomic-for-explicit-atomi.patch | 37 ++++++++++++++++++++++
 4 files changed, 133 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
