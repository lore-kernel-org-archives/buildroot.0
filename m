Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10177C87FCA
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 16:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5466617A9;
	Fri, 25 Jul 2025 16:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OETRNCnY5jKI; Fri, 25 Jul 2025 16:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A46660A68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A46660A68;
	Fri, 25 Jul 2025 16:40:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 707DD909
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 16:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6273841F03
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 16:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uErD5cZqcIAB for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 16:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B1C940899
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B1C940899
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 16:40:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3950286B1E; Fri, 25 Jul 2025 16:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Jul 2025 18:39:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 065c1b84b56c144c1cb8f2af1069de96d83b03c7
X-Git-Newrev: 1575584f507d2197fb324216ff41c4a768786075
X-Patchwork-Hint: ignore
Message-Id: <20250725164035.3950286B1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: add patches to fix
 build errors with "opaque" ncurses
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2339969099249163205=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2339969099249163205==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1575584f507d2197fb324216ff41c4a768786075
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ncurses from 6.4.20231021 enables "NCUSES_OPAQUE_MENU", which hides
some parts of the code away from the application. This causes
petitboot to fail building in a few spots where it tries to directly
access the name of the menu item.

Since the ncurses package was bumped to version 6.5.20250517 in
commit [0], petitboot is failing to build with error:

    ui/ncurses/nc-menu.h: In function ‘pmenu_dump_item’:
    ui/ncurses/nc-menu.h:129:47: error: invalid use of incomplete typedef ‘ITEM’ {aka ‘const struct tagITEM’}
      129 |         pb_debug("%p %s\n", item, (item ? item->name.str : "(null)"));

This commit fixes the issue by adding package patches.
These two patches were submitted to the petitboot mailing list by
Nicholas Piggin [1] resolve this issue using accessors, or by making a new item.

This has been raised upstream but not yet applied [2].

[0]: https://gitlab.com/buildroot.org/buildroot/-/commit/e7c091f11398bdb6498adaa344d0934d97b4ef39
[1]: https://lists.ozlabs.org/pipermail/petitboot/2024-February/thread.html#1545
[2]: https://github.com/open-power/petitboot/issues/106

Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
Fixes: https://autobuild.buildroot.org/results/bf1/bf173e1e0f8ad3f40534aaa358dc40993cd14ac4/build-end.log
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
[Julien:
 - add Signed-off-by in patches
 - add info in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...x-compile-with-curses-opaque-menu-headers.patch | 67 ++++++++++++++++++++++
 .../0002-ui-Fix-curses-menu-item-label-leak.patch  | 54 +++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/package/petitboot/0001-ui-Fix-compile-with-curses-opaque-menu-headers.patch b/package/petitboot/0001-ui-Fix-compile-with-curses-opaque-menu-headers.patch
new file mode 100644
index 0000000000..b6b6350034
--- /dev/null
+++ b/package/petitboot/0001-ui-Fix-compile-with-curses-opaque-menu-headers.patch
@@ -0,0 +1,67 @@
+Recent Debian ncurses is built with NCURSES_OPAQUE_MENU, which means
+the menu item type can't be poked directly. Fix with accessors.
+
+One wrinkle is the item name can't be modified, new_item has to be used.
+
+Signed-off-by: Nicholas Piggin <npiggin at gmail.com>
+Upstream: https://github.com/open-power/petitboot/issues/106
+Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
+---
+ ui/ncurses/nc-menu.c | 12 ++++++++----
+ ui/ncurses/nc-menu.h |  4 ++--
+ 2 files changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/ui/ncurses/nc-menu.c b/ui/ncurses/nc-menu.c
+index a90a02e..a1524b5 100644
+--- a/ui/ncurses/nc-menu.c
++++ b/ui/ncurses/nc-menu.c
+@@ -141,9 +141,13 @@ int pmenu_item_update(struct pmenu_item *item, const char *name)
+ 	if (!label)
+ 		return -1;
+ 
+-	i = item->nci;
+-	i->name.str = label;
+-	i->name.length = strncols(label);
++	i = new_item(label, NULL);
++	if (!i) {
++		talloc_free((char *)label);
++		return -1;
++	}
++	free_item(item->nci);
++	item->nci = i;
+ 
+ 	return 0;
+ }
+@@ -358,7 +362,7 @@ static int pmenu_item_get_index(const struct pmenu_item *item)
+ 				return i;
+ 
+ 	pb_log_fn("not found: %p %s\n", item,
+-		(item ? item->nci->name.str : "(null)"));
++		(item ? item_name(item->nci) : "(null)"));
+ 	return -1;
+ }
+ 
+diff --git a/ui/ncurses/nc-menu.h b/ui/ncurses/nc-menu.h
+index eb568c8..550c7e1 100644
+--- a/ui/ncurses/nc-menu.h
++++ b/ui/ncurses/nc-menu.h
+@@ -126,7 +126,7 @@ static inline struct pmenu *pmenu_from_scr(struct nc_scr *scr)
+ 
+ static inline void pmenu_dump_item(const ITEM *item)
+ {
+-	pb_debug("%p %s\n", item, (item ? item->name.str : "(null)"));
++	pb_debug("%p %s\n", item, (item ? item_name(item) : "(null)"));
+ }
+ 
+ static inline void pmenu_dump_items(ITEM *const *items, unsigned int count)
+@@ -135,7 +135,7 @@ static inline void pmenu_dump_items(ITEM *const *items, unsigned int count)
+ 
+ 	for (i = 0; i < count; i++)
+ 		pb_debug("%u: %p %s\n", i, items[i],
+-			(items[i] ? items[i]->name.str : "(null)"));
++			(items[i] ? item_name(items[i]) : "(null)"));
+ }
+ 
+ #endif
+-- 
+2.42.0
diff --git a/package/petitboot/0002-ui-Fix-curses-menu-item-label-leak.patch b/package/petitboot/0002-ui-Fix-curses-menu-item-label-leak.patch
new file mode 100644
index 0000000000..f14f7ae24e
--- /dev/null
+++ b/package/petitboot/0002-ui-Fix-curses-menu-item-label-leak.patch
@@ -0,0 +1,54 @@
+When a menu item name is updated, the old label is not freed.
+
+Signed-off-by: Nicholas Piggin <npiggin at gmail.com>
+Upstream: https://github.com/open-power/petitboot/issues/106
+Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
+---
+ ui/ncurses/nc-menu.c | 4 ++++
+ ui/ncurses/nc-menu.h | 1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/ui/ncurses/nc-menu.c b/ui/ncurses/nc-menu.c
+index a1524b5..70f2210 100644
+--- a/ui/ncurses/nc-menu.c
++++ b/ui/ncurses/nc-menu.c
+@@ -82,6 +82,7 @@ static void pmenu_resize(struct nc_scr *scr)
+ static int pmenu_item_destructor(void *arg)
+ {
+ 	struct pmenu_item *item = arg;
++	talloc_free((char *)item->label);
+ 	free_item(item->nci);
+ 	return 0;
+ }
+@@ -146,7 +147,9 @@ int pmenu_item_update(struct pmenu_item *item, const char *name)
+ 		talloc_free((char *)label);
+ 		return -1;
+ 	}
++	talloc_free((char *)item->label);
+ 	free_item(item->nci);
++	item->label = label;
+ 	item->nci = i;
+ 
+ 	return 0;
+@@ -168,6 +171,7 @@ struct pmenu_item *pmenu_item_create(struct pmenu *menu, const char *name)
+ 
+ 	item->i_sig = pb_item_sig;
+ 	item->pmenu = menu;
++	item->label = label;
+ 	item->nci = new_item(label, NULL);
+ 
+ 	if (!item->nci) {
+diff --git a/ui/ncurses/nc-menu.h b/ui/ncurses/nc-menu.h
+index 550c7e1..7ba45bf 100644
+--- a/ui/ncurses/nc-menu.h
++++ b/ui/ncurses/nc-menu.h
+@@ -46,6 +46,7 @@ struct pmenu;
+ 
+ struct pmenu_item {
+ 	enum pb_nc_sig i_sig;
++	const char *label;
+ 	ITEM *nci;
+ 	struct pmenu *pmenu;
+ 	void *data;
+-- 
+2.42.0

--===============2339969099249163205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2339969099249163205==--
