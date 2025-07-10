Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72804C83F1D
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 09:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2978C40FAB;
	Thu, 10 Jul 2025 09:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRsVY2x86Kzt; Thu, 10 Jul 2025 09:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6B8940F69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B8940F69;
	Thu, 10 Jul 2025 09:24:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72B4212E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 09:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5920183B18
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 09:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYJwVoTb7rb1 for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 09:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 111D483AEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 111D483AEA
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 111D483AEA
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 09:24:26 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so5221735e9.0
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 02:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752139464; x=1752744264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rHa2pLAK1OkoHXl/13RXYVmjYqDC9ytdleXoA1McSpE=;
 b=NacM6DSQu0vWBe7VNZRNn6SAp0RnL58KJgI/PX53C1VUeLUIOJVN+VeF9uOQyfFp2H
 9ht3dPMej35V3qMzMcZnXKZvD7jg3vqVm6dnbvKYF7hbn24VFsn6Xt2Cipy/H4NyoUn/
 iAi08M3EaTqKfnIRJ+7Tbr06qZ+NDZtAJEdOlYcbOWnJmtR0l1+54OhJ8Mgz0VpvJQQY
 IpKxayDjb78nX1uiHwSaWdg8fAHfLVm5cPV8QIqEZHfDk4WqdHAzK0xr4Bi9Q03+CryG
 0Rl4cGY/Al47jmBxYqd4ZdICZ7ivB7inwtfP1b5ZQB4cRtg7BscwzH5pvVcptJm8hkcy
 EgVQ==
X-Gm-Message-State: AOJu0Ywxyevfn8AKRlNqlIt8IJc1sAUjgrBASo6fV2Od9THj1kgwnfje
 BIHC2kFtlBmPYrZQ6WmNc205ON/qZ1B+hl0SE7r9PXXZuPlvcxB3DN1iZWvmJwTaOIXmywP63cn
 QbKah+YI=
X-Gm-Gg: ASbGncsVR1NUyt5Xr8o60P7SP1TtNAPiQuxO6oeA7nMBVYg7zRIbieMLOOLbUedi0/k
 NLijkdIUYDlmgA61/jNQjtMhtaLsudWZKiOjyq3CBMkOlY5oPY+7vTJhczKC8voV3iZRRexFn36
 ZNv5waoa6kaWkDwds/dCjwzkGlb826CY+kKxH4Gzc8jqEb3cOyBulhjRXGzIIAV7RnPSjU4oB2r
 i1MQ7wHla+PaXCKacft4GX06R9mx/Gh0nJUXRLbfCCJyIzw1nK2OkhBh4RUC0XcsS/gMrRUqDJG
 35JAWcQJytNHw7j2dROtQ4dHyg0fJ7j+aEI+nq1wzUQ9yCIxb+RTxihfIgk9sHDB7p+f2GSmLFf
 BXA4UwpGBkPrbTg7UPFIZB34DjcbhfjL1jjmuqJopbXwb4somrHfNwcxJcMzpSQlAe7iC
X-Google-Smtp-Source: AGHT+IHJv5fvtRW4/TWXZoO/913YAJCYmnpFE5wVBnMsFr7QTD122xVHBPSsaEatLcd6EAJbW/a9wg==
X-Received: by 2002:a05:6000:3c9:b0:3a4:f787:9b58 with SMTP id
 ffacd0b85a97d-3b5e454249emr4608070f8f.58.1752139464030; 
 Thu, 10 Jul 2025 02:24:24 -0700 (PDT)
Received: from TimMind.telenet.be
 (ptr-377wgeyf4tq7vco44vbx.18120a2.ip6.access.telenet.be.
 [2a02:181f:0:4023:f979:8572:d806:db9d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc2464sm1372872f8f.38.2025.07.10.02.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 02:24:23 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Jul 2025 11:24:21 +0200
Message-Id: <20250710092421.10227-1-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752139464; x=1752744264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rHa2pLAK1OkoHXl/13RXYVmjYqDC9ytdleXoA1McSpE=;
 b=f5cbMdNoLuva8AflwGZnLt5kJaFr4HIpjIbPYkUqwmtemgQJNSlFkIs66ypF297Mw0
 DKycbWeVGPkmLeZDuWIkr+rpFoU3zaaW+6b2MEjvOG4rz5KeK3dSF4NctpHspsTh6UiJ
 BMQxk0kQrepJaofd0kEOK7yqEJb5hgPT3+hF0ivOAUeJ8KFqhIL9su3O8c8JKGp5DP75
 sx0uoph9UFRtWyGRtlhv14WnnqFedPLKaxP4PfZ5ve0T7rfoTdtZjwo6Du869ZSkOkR+
 cp5gPPVJCNckCYvmiY5BBDh66GjcEZB2zA466JvmnoFiOkKcZJrZN9WgcQkROSP7GYtX
 Tunw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f5cbMdNo
Subject: [Buildroot] [PATCH 1/1 v2] package/ncmpc: bump version to 0.52
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
v1->v2: Fixed indentation & readded the libatomic dependency for spark
patch which was previously removed by mistake
 ...cro-my_gettext-do-not-define-gettext.patch | 199 ------------------
 package/ncmpc/Config.in                       |   1 +
 package/ncmpc/ncmpc.hash                      |   2 +-
 package/ncmpc/ncmpc.mk                        |   3 +-
 4 files changed, 4 insertions(+), 201 deletions(-)
 delete mode 100644 package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch

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
diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index 61c186a4ae..2eb5d23967 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_NCMPC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
 	help
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
