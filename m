Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECFEC8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 13:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9697760E0D;
	Tue,  8 Jul 2025 13:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0QU7didtDwR; Tue,  8 Jul 2025 13:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8997D60DB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8997D60DB0;
	Tue,  8 Jul 2025 13:17:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8731912E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 13:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CD1660D8D
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 13:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1Xf35xjADEE for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 13:17:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BC2B60B1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BC2B60B1D
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BC2B60B1D
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 13:17:39 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ae361e8ec32so867496566b.3
 for <buildroot@buildroot.org>; Tue, 08 Jul 2025 06:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751980657; x=1752585457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2x+QPc+XxWUBy3hZjbY9xXUgvWhYHCZ1oJZOrf+yqjM=;
 b=Fcpn1nOR59O1aPLx4f+UJEo5PH6zgV8jX4qd0UM/vRCXDWmP4/ozmz4j7nW0uuxhfL
 xAv7Paex99sED4o0lKGc3bRyJOrn1izIpLvUACjAkhClkKhN0Ee8qitJSrcSeguXPknr
 +1wEFpEO9VP1i8KFURxl3idK8NosYTH1Y0FayICyqWF0/njAIJXbSfK7DS6HzrHA7UY/
 G81s1ZRFbaXCW0QKW6vZ+4RKOjjHfcROmsqwgP/+P/+nmEx60hpqLWxi0hi0rsNGsHBG
 EG72J1pBpHhQZCEdyZnUoQq10iS+dlnpztpUW2a8U2PIUyq8/ysMk/PrfMiT7RyI2RXh
 Ga/Q==
X-Gm-Message-State: AOJu0YzvNJJqshJ81/yeCcXb/DxFpNPWyxwGjKWzFr70iDIcshIZpaRT
 fbGspj6scWnnOUvmDtUDTk90Zu/YLu4h4V60R4bPiheHw5vwb4hNASNMXLZZ1khgsBWfT7rLH+z
 GdWpd8kQ=
X-Gm-Gg: ASbGncua/q8qJJSIm6znYfw7Hgd5JSLYnNOVYv2SncpFidzezN63wjC1h/OOB5+3J/0
 5cd12o+DJVYbbndT/cG5r9udIb6ikm6Fdr6GX9ZWDfJ8uwQi4fjpcV7fVGWbtYcJU1XyQSFcRJ5
 WCaPydsdvWtFY/bCK2mz0FWtim9TDWc4CttVYSIcVUPyUHKrEWV69eUlOoD2fo+9qKfrhSgQAEI
 WGJIsx1mrexrWdTO6elTYEJjs/49SV7USf7H6UQ0g7vOGx2oLMTGPQVjxJqcXezLCPugiEMriZ9
 oaJEzDaO13JrU34Btel1aYGo3VgGRy1FWVc8oduY8ILS2N5ZQ4gl+82WGsIaQpdZ5i2Fv9LQYUH
 MUw==
X-Google-Smtp-Source: AGHT+IE9detEPmGpXbEwL/Mg1l9LkznKxtCF2C5ij2trCqxV9lh6yyky2LyDzx7fOJ2ZOqasNv6YGw==
X-Received: by 2002:a17:907:720b:b0:ade:198c:4b6f with SMTP id
 a640c23a62f3a-ae6b0b1f475mr320096466b.1.1751980657258; 
 Tue, 08 Jul 2025 06:17:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:65ae:b800:1718:12a8:2587:721f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66e7d4asm875826366b.23.2025.07.08.06.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 06:17:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 Jul 2025 15:17:27 +0200
Message-Id: <20250708131727.2450843-1-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751980657; x=1752585457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2x+QPc+XxWUBy3hZjbY9xXUgvWhYHCZ1oJZOrf+yqjM=;
 b=F/OFU4BnL4Uh61yzYKf2aTAGPYeM0nZLFeJyWsI2PcvcOG+e824r6BD6t+J+T0vtOy
 Plul+IxPvqHpp6gvn3qayBolfRkNq+y4m8ZfB6iktsbuQeni45fxNOh8zeRAQAe3501w
 Ffu6GpYpjFDgXyq9Zh51jesI1aCuaxOmrB8sU5h0wQ58aNbQ2sB6l6KEJUgL/N2dH4KP
 12Y714xxP5LtmyirFUlWM+SOmdDCoJVXqQ5Acssyxh/R8CQxyrpCnX2XZZe3WfWpuBZs
 mAgVwmm/Fvrblmq+MMsr6Rkw2i+PmBqTCsfERYz4jbx61gLL8x6so+qzKMbDAtnc005r
 XcpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F/OFU4Bn
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump version to 0.52
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
From: Tim Soubry via buildroot <buildroot@buildroot.org>
Reply-To: Tim Soubry <tim.soubry@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Applying version bump of ncmpc to version 0.52 as proposed in [1].
As from version 0.50 of ncmpc, fmt got added as a dependency [2]. This was
also added to package/ncmpc/Config.in and package/ncmpc/ncmpc.mk.

For release notes, see:
https://github.com/MusicPlayerDaemon/ncmpc/blob/master/NEWS

Comparision between version 0.49 and 0.52:
https://github.com/MusicPlayerDaemon/ncmpc/compare/v0.49..v0.52

[1] https://lore.kernel.org/buildroot/20250707112536.1644236-1-tim.soubry@mind.be/T/#rb3b968fff23bac0298e33f473d63a1ad470d38e3
[2] https://github.com/MusicPlayerDaemon/ncmpc/commit/c3b0055d06f8e8efab7f388646beb7645b90d063

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
---
 ...cro-my_gettext-do-not-define-gettext.patch | 199 ------------------
 ...uild-add-atomic-dependency-for-sparc.patch |  45 ----
 package/ncmpc/Config.in                       |   5 +-
 package/ncmpc/ncmpc.hash                      |   2 +-
 package/ncmpc/ncmpc.mk                        |   3 +-
 5 files changed, 6 insertions(+), 248 deletions(-)
 delete mode 100644 package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch
 delete mode 100644 package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch

diff --git a/package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch b/package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch
deleted file mode 100644
index 296d3d17d6..0000000000
--- a/package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch
+++ /dev/null
@@ -1,199 +0,0 @@
-From d90e80cf0b3525d780b57d016afaa879e16b0fe4 Mon Sep 17 00:00:00 2001
-From: Max Kellermann <max@musicpd.org>
-Date: Tue, 23 Jul 2024 14:15:16 +0200
-Subject: [PATCH] i18n: add macro my_gettext(), do not define "gettext"
-
-Defining the macro "gettext" can cause breakages if the C++ standard
-library happens to include libintl.h (which GCC 14 does).
-
-Signed-off-by: Tim Soubry <tim.soubry@mind.be>
-Upstream: https://github.com/MusicPlayerDaemon/ncmpc/commit/249b62fc9f5e3a653ebdd22da0d75fbe87069457
----
- src/Command.cxx    | 2 +-
- src/HelpPage.cxx   | 6 +++---
- src/KeyDefPage.cxx | 2 +-
- src/SearchPage.cxx | 6 +++---
- src/SongPage.cxx   | 8 ++++----
- src/TabBar.cxx     | 2 +-
- src/i18n.h         | 8 +++-----
- 7 files changed, 16 insertions(+), 18 deletions(-)
-
-diff --git a/src/Command.cxx b/src/Command.cxx
-index 1caac250..b12a4a35 100644
---- a/src/Command.cxx
-+++ b/src/Command.cxx
-@@ -238,7 +238,7 @@ get_cmds_max_name_width()
- const char *
- get_key_description(Command command)
- {
--	return gettext(cmds[size_t(command)].description);
-+	return my_gettext(cmds[size_t(command)].description);
- }
- 
- const char *
-diff --git a/src/HelpPage.cxx b/src/HelpPage.cxx
-index fad0f8c0..c07a20c4 100644
---- a/src/HelpPage.cxx
-+++ b/src/HelpPage.cxx
-@@ -242,7 +242,7 @@ HelpPage::GetListItemText(char *, size_t, unsigned i) const noexcept
- 	assert(i < std::size(help_text));
- 
- 	if (row->text != nullptr)
--		return gettext(row->text);
-+		return my_gettext(row->text);
- 
- 	if (row->command != Command::NONE)
- 		return get_key_description(row->command);
-@@ -272,7 +272,7 @@ HelpPage::PaintListItem(WINDOW *w, unsigned i,
- 
- 	if (row->command == Command::NONE) {
- 		if (row->text != nullptr)
--			mvwaddstr(w, y, 6, gettext(row->text));
-+			mvwaddstr(w, y, 6, my_gettext(row->text));
- 		else if (row->highlight == 2)
- 			mvwhline(w, y, 3, ACS_HLINE, width - 6);
- 	} else {
-@@ -285,7 +285,7 @@ HelpPage::PaintListItem(WINDOW *w, unsigned i,
- 		mvwaddch(w, y, 21, ':');
- 		mvwaddstr(w, y, 23,
- 			  row->text != nullptr
--			  ? gettext(row->text)
-+			  ? my_gettext(row->text)
- 			  : get_key_description(row->command));
- 	}
- }
-diff --git a/src/KeyDefPage.cxx b/src/KeyDefPage.cxx
-index be638940..dd301d39 100644
---- a/src/KeyDefPage.cxx
-+++ b/src/KeyDefPage.cxx
-@@ -434,7 +434,7 @@ CommandListPage::GetListItemText(char *buffer, size_t size,
- 
- 	snprintf(buffer + get_cmds_max_name_width(),
- 		 size - get_cmds_max_name_width(),
--		 " - %s", gettext(get_command_definitions()[idx].description));
-+		 " - %s", my_gettext(get_command_definitions()[idx].description));
- 
- 	return buffer;
- }
-diff --git a/src/SearchPage.cxx b/src/SearchPage.cxx
-index 4f2e3228..9ae8436b 100644
---- a/src/SearchPage.cxx
-+++ b/src/SearchPage.cxx
-@@ -142,7 +142,7 @@ public:
- 				 " %s : %s [%s]",
- 				 GetGlobalKeyBindings().GetKeyNames(Command::SEARCH_MODE).c_str(),
- 				 get_key_description(Command::SEARCH_MODE),
--				 gettext(mode[options.search_mode].label));
-+				 my_gettext(mode[options.search_mode].label));
- 			return buffer;
- 		}
- 
-@@ -453,7 +453,7 @@ SearchPage::GetTitle(char *str, size_t size) const noexcept
- 			 "%s '%s' [%s]",
- 			 _("Search"),
- 			 pattern.c_str(),
--			 gettext(mode[options.search_mode].label));
-+			 my_gettext(mode[options.search_mode].label));
- 	else
- 		return _("Search");
- 
-@@ -478,7 +478,7 @@ SearchPage::OnCommand(struct mpdclient &c, Command cmd)
- 		if (mode[options.search_mode].label == nullptr)
- 			options.search_mode = 0;
- 		screen_status_printf(_("Search mode: %s"),
--				     gettext(mode[options.search_mode].label));
-+				     my_gettext(mode[options.search_mode].label));
- 
- 		if (pattern.empty())
- 			/* show the new mode in the help text */
-diff --git a/src/SongPage.cxx b/src/SongPage.cxx
-index c0830a9e..6d166b13 100644
---- a/src/SongPage.cxx
-+++ b/src/SongPage.cxx
-@@ -174,14 +174,14 @@ static std::unique_ptr<Page>
- screen_song_init(ScreenManager &_screen, WINDOW *w, Size size) noexcept
- {
- 	for (unsigned i = 0; tag_labels[i].label != nullptr; ++i) {
--		unsigned width = StringWidthMB(gettext(tag_labels[i].label));
-+		unsigned width = StringWidthMB(my_gettext(tag_labels[i].label));
- 		if (width > max_tag_label_width)
- 			max_tag_label_width = width;
- 	}
- 
- 	for (unsigned i = 0; i < std::size(stats_labels); ++i) {
- 		if (stats_labels[i] != nullptr) {
--			unsigned width = StringWidthMB(gettext(stats_labels[i]));
-+			unsigned width = StringWidthMB(my_gettext(stats_labels[i]));
- 
- 			if (width > max_stats_label_width)
- 				max_stats_label_width = width;
-@@ -267,7 +267,7 @@ get_tag_label(unsigned tag) noexcept
- {
- 	for (unsigned i = 0; tag_labels[i].label != nullptr; ++i)
- 		if (tag_labels[i].tag_type == tag)
--			return gettext(tag_labels[i].label);
-+			return my_gettext(tag_labels[i].label);
- 
- 	assert(tag < MPD_TAG_COUNT);
- 	return mpd_tag_name((enum mpd_tag_type)tag);
-@@ -351,7 +351,7 @@ SongPage::AddSong(const struct mpd_song *song) noexcept
- void
- SongPage::AppendStatsLine(enum stats_label label, const char *value) noexcept
- {
--	AppendLine(gettext(stats_labels[label]), value, max_stats_label_width);
-+	AppendLine(my_gettext(stats_labels[label]), value, max_stats_label_width);
- }
- 
- bool
-diff --git a/src/TabBar.cxx b/src/TabBar.cxx
-index 426bce12..0518801f 100644
---- a/src/TabBar.cxx
-+++ b/src/TabBar.cxx
-@@ -48,7 +48,7 @@ PaintTabBar(WINDOW *w, const PageMeta &current_page_meta,
- 			title = current_page_title;
- 
- 		if (title == nullptr)
--			title = gettext(page->title);
-+			title = my_gettext(page->title);
- 
- 		PaintPageTab(w, page->command, title,
- 			     page == &current_page_meta);
-diff --git a/src/i18n.h b/src/i18n.h
-index 8bda456e..7e98c1b0 100644
---- a/src/i18n.h
-+++ b/src/i18n.h
-@@ -1,8 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- // Copyright The Music Player Daemon Project
- 
--#ifndef I18N_H
--#define I18N_H
-+#pragma once
- 
- #include "config.h"
- 
-@@ -10,6 +9,7 @@
- 
- #include <libintl.h> // IWYU pragma: export
- 
-+#define my_gettext(x) gettext(x)
- #define _(x) gettext(x)
- 
- #ifdef gettext_noop
-@@ -19,12 +19,10 @@
- #endif
- 
- #else
--#define gettext(x) (x)
-+#define my_gettext(x) (x)
- #define  _(x) x
- #define N_(x) x
- #endif
- 
- #define YES_TRANSLATION _("y")
- #define NO_TRANSLATION _("n")
--
--#endif
--- 
-2.39.5
-
diff --git a/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch b/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
deleted file mode 100644
index 2b726b7437..0000000000
--- a/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 72ef4c1c3c11fc05c057f2b40b87de92a573f2eb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 11 Feb 2019 21:42:01 +0100
-Subject: [PATCH] meson.build: add atomic dependency for sparc
-
-Linking with libatomic is needed on sparc otherwise build fails on:
-ncmpc@exe/src_Main.cxx.o: In function `std::__atomic_base<long>::operator++()':
-/home/buildroot/autobuild/instance-1/output/host/opt/ext-toolchain/sparc-buildroot-linux-uclibc/include/c++/6.4.0/bits/atomic_base.h:296: undefined reference to `__atomic_fetch_add_4'
-
-Fixes:
- - http://autobuild.buildroot.org/results/7ac1a07e4f72633d3ec92b79dc5d8c062490abdc
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/MusicPlayerDaemon/ncmpc/pull/45
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- meson.build | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index fa0eff9408b6..819674cbede4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -232,6 +232,9 @@ else
-   pcre_dep = declare_dependency()
- endif
- 
-+# Needed on sparc 
-+atomic_dep = cc.find_library('atomic', required: false)
-+
- inc = include_directories(
-   'src',
- 
-@@ -445,6 +448,7 @@ ncmpc = executable('ncmpc',
-   sources,
-   include_directories: inc,
-   dependencies: [
-+    atomic_dep,
-     thread_dep,
-     event_dep,
-     pcre_dep,
--- 
-2.43.0
-
diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index 61c186a4ae..e4bda449e3 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -5,8 +5,9 @@ config BR2_PACKAGE_NCMPC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
-	select BR2_PACKAGE_LIBMPDCLIENT
-	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_FMT
+       select BR2_PACKAGE_LIBMPDCLIENT
+       select BR2_PACKAGE_NCURSES
 	help
 	  ncmpc is a fully featured MPD client, which runs in a terminal
 	  (using ncurses). Its goal is to provide a keyboard oriented
diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index 1d288294d1..41cfd86584 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  65bbec0ede9e6bcf62ac647b0c706485beb2bdd5db70ca8d60103f32f162cf29  ncmpc-0.49.tar.xz
+sha256  3af225496fe363a8534a9780fb46ae1bd17baefd80cf4ba7430a19cddd73eb1a  ncmpc-0.52.tar.xz
 
 # Hash for license file:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index ee75c2a676..726f524bfa 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,13 +5,14 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).49
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).52
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
 	host-pkgconf \
 	libmpdclient \
 	ncurses \
+	fmt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(TARGET_NLS_DEPENDENCIES)
 NCMPC_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
