Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01652C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE16F4170F;
	Thu, 17 Jul 2025 20:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrFGeIgYUWy0; Thu, 17 Jul 2025 20:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26A9641752
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A9641752;
	Thu, 17 Jul 2025 20:23:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF4AA59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61D0B60825
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4RdGHOeGGzL for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0177A60AC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0177A60AC9
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2950865B2; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 11:30:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7bfec7e74dd415afcf4a3c9bdc894b88846018cd
X-Git-Newrev: 17673e1997ca4cda36fead341aa14c931ebd38a4
X-Patchwork-Hint: ignore
Message-Id: <20250717202236.F2950865B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ncmpc: Fix build
 error with gcc-14
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=17673e1997ca4cda36fead341aa14c931ebd38a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The error appears on autobuilder with the build using GCC14:
FAILED: ncmpc.p/src_Styles.cxx.o
In file included from ../src/Styles.cxx:7:
/home/buildroot/instance-0/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: error: expected unqualified-id before 'const'
   39 | extern char *gettext (const char *__msgid)
      |              ^~~~~~~
/home/buildroot/instance-0/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: error: expected ')' before 'const'
../src/i18n.h:22:20: note: to match this '('
   22 | #define gettext(x) (x)
      |                    ^
[80/102] Compiling C++ object ncmpc.p/src_xterm_title.cxx.o
[81/102] Compiling C++ object ncmpc.p/src_db_completion.cxx.o
[82/102] Compiling C++ object ncmpc.p/src_signals.cxx.o
ninja: build stopped: subcommand failed.
make: *** [package/pkg-generic.mk:273: /home/buildroot/instance-0/output-1/build/ncmpc-0.49/.stamp_built] Error 1
make: Leaving directory '/home/buildroot/instance-0/buildroot'

Starting GCC14 the C++ standard library includes libintl.h that contains
a definition of gettext which caused a clash with the definition present
in ncmpc. This patch resolved this build error seen in [1] by
backporting an upstream commit [2] that renamed the internal gettext
implementation.

Applying the commits of [2], fixes the build error [1].

[1] https://autobuild.buildroot.org/results/cb2/cb292f2c99cdca742a8f52dbfc25f193fe513c6e/build-end.log
[2] https://github.com/MusicPlayerDaemon/ncmpc/commit/249b62fc9f5e3a653ebdd22da0d75fbe87069457

Fixes: https://autobuild.buildroot.org/results/cb2/cb292f2c99cdca742a8f52dbfc25f193fe513c6e/build-end.log
Signed-off-by: Tim Soubry <tim.soubry@mind.be>
[Julien:
 - mention gcc-14 in commit title
 - remove patch numbering to fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a52269e221bf73ea4b2521e2297ab13bf3c687d0)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...dd-macro-my_gettext-do-not-define-gettext.patch | 199 +++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch b/package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch
new file mode 100644
index 0000000000..296d3d17d6
--- /dev/null
+++ b/package/ncmpc/0001-i18n-add-macro-my_gettext-do-not-define-gettext.patch
@@ -0,0 +1,199 @@
+From d90e80cf0b3525d780b57d016afaa879e16b0fe4 Mon Sep 17 00:00:00 2001
+From: Max Kellermann <max@musicpd.org>
+Date: Tue, 23 Jul 2024 14:15:16 +0200
+Subject: [PATCH] i18n: add macro my_gettext(), do not define "gettext"
+
+Defining the macro "gettext" can cause breakages if the C++ standard
+library happens to include libintl.h (which GCC 14 does).
+
+Signed-off-by: Tim Soubry <tim.soubry@mind.be>
+Upstream: https://github.com/MusicPlayerDaemon/ncmpc/commit/249b62fc9f5e3a653ebdd22da0d75fbe87069457
+---
+ src/Command.cxx    | 2 +-
+ src/HelpPage.cxx   | 6 +++---
+ src/KeyDefPage.cxx | 2 +-
+ src/SearchPage.cxx | 6 +++---
+ src/SongPage.cxx   | 8 ++++----
+ src/TabBar.cxx     | 2 +-
+ src/i18n.h         | 8 +++-----
+ 7 files changed, 16 insertions(+), 18 deletions(-)
+
+diff --git a/src/Command.cxx b/src/Command.cxx
+index 1caac250..b12a4a35 100644
+--- a/src/Command.cxx
++++ b/src/Command.cxx
+@@ -238,7 +238,7 @@ get_cmds_max_name_width()
+ const char *
+ get_key_description(Command command)
+ {
+-	return gettext(cmds[size_t(command)].description);
++	return my_gettext(cmds[size_t(command)].description);
+ }
+ 
+ const char *
+diff --git a/src/HelpPage.cxx b/src/HelpPage.cxx
+index fad0f8c0..c07a20c4 100644
+--- a/src/HelpPage.cxx
++++ b/src/HelpPage.cxx
+@@ -242,7 +242,7 @@ HelpPage::GetListItemText(char *, size_t, unsigned i) const noexcept
+ 	assert(i < std::size(help_text));
+ 
+ 	if (row->text != nullptr)
+-		return gettext(row->text);
++		return my_gettext(row->text);
+ 
+ 	if (row->command != Command::NONE)
+ 		return get_key_description(row->command);
+@@ -272,7 +272,7 @@ HelpPage::PaintListItem(WINDOW *w, unsigned i,
+ 
+ 	if (row->command == Command::NONE) {
+ 		if (row->text != nullptr)
+-			mvwaddstr(w, y, 6, gettext(row->text));
++			mvwaddstr(w, y, 6, my_gettext(row->text));
+ 		else if (row->highlight == 2)
+ 			mvwhline(w, y, 3, ACS_HLINE, width - 6);
+ 	} else {
+@@ -285,7 +285,7 @@ HelpPage::PaintListItem(WINDOW *w, unsigned i,
+ 		mvwaddch(w, y, 21, ':');
+ 		mvwaddstr(w, y, 23,
+ 			  row->text != nullptr
+-			  ? gettext(row->text)
++			  ? my_gettext(row->text)
+ 			  : get_key_description(row->command));
+ 	}
+ }
+diff --git a/src/KeyDefPage.cxx b/src/KeyDefPage.cxx
+index be638940..dd301d39 100644
+--- a/src/KeyDefPage.cxx
++++ b/src/KeyDefPage.cxx
+@@ -434,7 +434,7 @@ CommandListPage::GetListItemText(char *buffer, size_t size,
+ 
+ 	snprintf(buffer + get_cmds_max_name_width(),
+ 		 size - get_cmds_max_name_width(),
+-		 " - %s", gettext(get_command_definitions()[idx].description));
++		 " - %s", my_gettext(get_command_definitions()[idx].description));
+ 
+ 	return buffer;
+ }
+diff --git a/src/SearchPage.cxx b/src/SearchPage.cxx
+index 4f2e3228..9ae8436b 100644
+--- a/src/SearchPage.cxx
++++ b/src/SearchPage.cxx
+@@ -142,7 +142,7 @@ public:
+ 				 " %s : %s [%s]",
+ 				 GetGlobalKeyBindings().GetKeyNames(Command::SEARCH_MODE).c_str(),
+ 				 get_key_description(Command::SEARCH_MODE),
+-				 gettext(mode[options.search_mode].label));
++				 my_gettext(mode[options.search_mode].label));
+ 			return buffer;
+ 		}
+ 
+@@ -453,7 +453,7 @@ SearchPage::GetTitle(char *str, size_t size) const noexcept
+ 			 "%s '%s' [%s]",
+ 			 _("Search"),
+ 			 pattern.c_str(),
+-			 gettext(mode[options.search_mode].label));
++			 my_gettext(mode[options.search_mode].label));
+ 	else
+ 		return _("Search");
+ 
+@@ -478,7 +478,7 @@ SearchPage::OnCommand(struct mpdclient &c, Command cmd)
+ 		if (mode[options.search_mode].label == nullptr)
+ 			options.search_mode = 0;
+ 		screen_status_printf(_("Search mode: %s"),
+-				     gettext(mode[options.search_mode].label));
++				     my_gettext(mode[options.search_mode].label));
+ 
+ 		if (pattern.empty())
+ 			/* show the new mode in the help text */
+diff --git a/src/SongPage.cxx b/src/SongPage.cxx
+index c0830a9e..6d166b13 100644
+--- a/src/SongPage.cxx
++++ b/src/SongPage.cxx
+@@ -174,14 +174,14 @@ static std::unique_ptr<Page>
+ screen_song_init(ScreenManager &_screen, WINDOW *w, Size size) noexcept
+ {
+ 	for (unsigned i = 0; tag_labels[i].label != nullptr; ++i) {
+-		unsigned width = StringWidthMB(gettext(tag_labels[i].label));
++		unsigned width = StringWidthMB(my_gettext(tag_labels[i].label));
+ 		if (width > max_tag_label_width)
+ 			max_tag_label_width = width;
+ 	}
+ 
+ 	for (unsigned i = 0; i < std::size(stats_labels); ++i) {
+ 		if (stats_labels[i] != nullptr) {
+-			unsigned width = StringWidthMB(gettext(stats_labels[i]));
++			unsigned width = StringWidthMB(my_gettext(stats_labels[i]));
+ 
+ 			if (width > max_stats_label_width)
+ 				max_stats_label_width = width;
+@@ -267,7 +267,7 @@ get_tag_label(unsigned tag) noexcept
+ {
+ 	for (unsigned i = 0; tag_labels[i].label != nullptr; ++i)
+ 		if (tag_labels[i].tag_type == tag)
+-			return gettext(tag_labels[i].label);
++			return my_gettext(tag_labels[i].label);
+ 
+ 	assert(tag < MPD_TAG_COUNT);
+ 	return mpd_tag_name((enum mpd_tag_type)tag);
+@@ -351,7 +351,7 @@ SongPage::AddSong(const struct mpd_song *song) noexcept
+ void
+ SongPage::AppendStatsLine(enum stats_label label, const char *value) noexcept
+ {
+-	AppendLine(gettext(stats_labels[label]), value, max_stats_label_width);
++	AppendLine(my_gettext(stats_labels[label]), value, max_stats_label_width);
+ }
+ 
+ bool
+diff --git a/src/TabBar.cxx b/src/TabBar.cxx
+index 426bce12..0518801f 100644
+--- a/src/TabBar.cxx
++++ b/src/TabBar.cxx
+@@ -48,7 +48,7 @@ PaintTabBar(WINDOW *w, const PageMeta &current_page_meta,
+ 			title = current_page_title;
+ 
+ 		if (title == nullptr)
+-			title = gettext(page->title);
++			title = my_gettext(page->title);
+ 
+ 		PaintPageTab(w, page->command, title,
+ 			     page == &current_page_meta);
+diff --git a/src/i18n.h b/src/i18n.h
+index 8bda456e..7e98c1b0 100644
+--- a/src/i18n.h
++++ b/src/i18n.h
+@@ -1,8 +1,7 @@
+ // SPDX-License-Identifier: GPL-2.0-or-later
+ // Copyright The Music Player Daemon Project
+ 
+-#ifndef I18N_H
+-#define I18N_H
++#pragma once
+ 
+ #include "config.h"
+ 
+@@ -10,6 +9,7 @@
+ 
+ #include <libintl.h> // IWYU pragma: export
+ 
++#define my_gettext(x) gettext(x)
+ #define _(x) gettext(x)
+ 
+ #ifdef gettext_noop
+@@ -19,12 +19,10 @@
+ #endif
+ 
+ #else
+-#define gettext(x) (x)
++#define my_gettext(x) (x)
+ #define  _(x) x
+ #define N_(x) x
+ #endif
+ 
+ #define YES_TRANSLATION _("y")
+ #define NO_TRANSLATION _("n")
+-
+-#endif
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
