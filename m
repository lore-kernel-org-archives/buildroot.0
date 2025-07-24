Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ACEC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 14:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 625F1613D3;
	Thu, 24 Jul 2025 14:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUI3RIQuTNMJ; Thu, 24 Jul 2025 14:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 735A9613E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 735A9613E6;
	Thu, 24 Jul 2025 14:44:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 696FD115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 14:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50034613C0
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 14:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abI7cYzFrFe2 for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 14:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:19f0:5800:8dea:5400:ff:fe25:676e; helo=arcturus.nroach44.id.au;
 envelope-from=nroach44@nroach44.id.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EE8E613D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EE8E613D3
Received: from arcturus.nroach44.id.au (arcturus.nroach44.id.au
 [IPv6:2001:19f0:5800:8dea:5400:ff:fe25:676e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EE8E613D3
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 14:44:01 +0000 (UTC)
Received: from arcturus.nroach44.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by arcturus.nroach44.id.au (Postfix) with ESMTPS id 7540A2A98B
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 22:43:58 +0800 (AWST)
Received: by arcturus.nroach44.id.au (Postfix, from userid 5555)
 id 4D3502A98E; Thu, 24 Jul 2025 22:43:58 +0800 (AWST)
Received: from luna.haven (e1000e.luna.haven [10.1.10.41])
 by arcturus.nroach44.id.au (Postfix) with ESMTPA id 2D0F425527;
 Thu, 24 Jul 2025 22:43:54 +0800 (AWST)
To: buildroot@buildroot.org
Cc: Nathaniel Roach <nroach44@nroach44.id.au>,
 Laurent Vivier <laurent@vivier.eu>
Date: Thu, 24 Jul 2025 22:43:42 +0800
Message-Id: <20250724144342.2090731-1-nroach44@nroach44.id.au>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1753368238;
 bh=pD6cAFDls6EsNuXr9lvgjXek/HLaLq4Vz8GAH8pnYNs=;
 h=From:To:Cc:Subject:Date:From;
 b=bQMF4LnxmeUhiHcBYDB91leVoJz6bZYu4NizMqk9tSSw/zH6UjFv6D/KrRKe6jyYf
 UT5tiOR5KGJF86vL3+kPtAqj7VH+KfjWplFEVSqPZfYWRx0ugOrKGuM50fHsYEaRm3
 Zn6CH0UgO3/bukHhn82goRJVsh6HSbLl/YLsMmVdNiYyDfOD9pXu8ffk8KQgIobyDt
 0/BdFxw96Dh6uQLoUKBnkGEI2k6Ou81m/NeH2RyBnINnIh0L9VaF6RzkADsg9I+BHX
 RhZR/pum+S3CvbE+ml4qwiZRfoy8nKhYflgmYJeZii/pRarydt2/5FMLYaXYdkTdCM
 GPDNdEl5sEN3Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1753368238;
 bh=pD6cAFDls6EsNuXr9lvgjXek/HLaLq4Vz8GAH8pnYNs=;
 h=From:To:Cc:Subject:Date:From;
 b=bQMF4LnxmeUhiHcBYDB91leVoJz6bZYu4NizMqk9tSSw/zH6UjFv6D/KrRKe6jyYf
 UT5tiOR5KGJF86vL3+kPtAqj7VH+KfjWplFEVSqPZfYWRx0ugOrKGuM50fHsYEaRm3
 Zn6CH0UgO3/bukHhn82goRJVsh6HSbLl/YLsMmVdNiYyDfOD9pXu8ffk8KQgIobyDt
 0/BdFxw96Dh6uQLoUKBnkGEI2k6Ou81m/NeH2RyBnINnIh0L9VaF6RzkADsg9I+BHX
 RhZR/pum+S3CvbE+ml4qwiZRfoy8nKhYflgmYJeZii/pRarydt2/5FMLYaXYdkTdCM
 GPDNdEl5sEN3Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1753368234;
 bh=pD6cAFDls6EsNuXr9lvgjXek/HLaLq4Vz8GAH8pnYNs=;
 h=From:To:Cc:Subject:Date:From;
 b=IzD+83Er2An/uVSUnMy89rWxwOwZucoIwsDmBPgTbL2VCp6dvhyMrZr4Q9JwNv9vK
 rqllQHG1LENKf8ZoiCo+FI2mp43I1jdqUPrubEyaTxZZnVueP2COA5bagaYcU8HsrI
 IXCeHJ/agSYnQDxTZT7ygdFgMxqu72CIXVMO0RaWII6YJhuUGMLdUVAxszVjfu2iDO
 gDybCIH+P/9MtgPGnKrhnmx3IdQUsNWlRWBPFdi9HbUL4pSN1zzNepbl+plqn4FEtp
 Fj51RzatP2vT8vpLRDRN83Ul8F2fOZkp4CyN9CQQztT43JNeMuPhhFx4Ji7n33Hb+b
 KzIayGBEtHCNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=nroach44.id.au
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=nroach44.id.au
 header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL
 header.b=bQMF4Lnx; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=bQMF4Lnx; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=IzD+83Er
Subject: [Buildroot] [PATCH 1/1] package/petitboot: add patches to fix build
 errors with "opaque" ncurses
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
From: Nathaniel Roach via buildroot <buildroot@buildroot.org>
Reply-To: Nathaniel Roach <nroach44@nroach44.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ncurses from 6.4.20231021 enables "NCUSES_OPAQUE_MENU", which hides
some parts of the code away from the application. This causes
petitboot to fail building in a few spots where it tries to directly
access the name of the menu item.

These two patches were submitted to the petitboot mailing list by
Nicholas Piggin [1] resolve this issue using accessors, or by making a new item.

This has been raised upstream but not yet applied [2].

[1]: https://lists.ozlabs.org/pipermail/petitboot/2024-February/thread.html#1545
[2]: https://github.com/open-power/petitboot/issues/106

Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
Fixes: https://autobuild.buildroot.org/results/bf1/bf173e1e0f8ad3f40534aaa358dc40993cd14ac4/build-end.log

---
Backport to 2025.05.x

Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
---
 ...pile-with-curses-opaque-menu-headers.patch | 66 +++++++++++++++++++
 ...2-ui-Fix-curses-menu-item-label-leak.patch | 53 +++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 package/petitboot/0001-ui-Fix-compile-with-curses-opaque-menu-headers.patch
 create mode 100644 package/petitboot/0002-ui-Fix-curses-menu-item-label-leak.patch

diff --git a/package/petitboot/0001-ui-Fix-compile-with-curses-opaque-menu-headers.patch b/package/petitboot/0001-ui-Fix-compile-with-curses-opaque-menu-headers.patch
new file mode 100644
index 0000000000..d68e904b8b
--- /dev/null
+++ b/package/petitboot/0001-ui-Fix-compile-with-curses-opaque-menu-headers.patch
@@ -0,0 +1,66 @@
+Recent Debian ncurses is built with NCURSES_OPAQUE_MENU, which means
+the menu item type can't be poked directly. Fix with accessors.
+
+One wrinkle is the item name can't be modified, new_item has to be used.
+
+Signed-off-by: Nicholas Piggin <npiggin at gmail.com>
+Upstream: https://github.com/open-power/petitboot/issues/106
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
index 0000000000..9302b34cfe
--- /dev/null
+++ b/package/petitboot/0002-ui-Fix-curses-menu-item-label-leak.patch
@@ -0,0 +1,53 @@
+When a menu item name is updated, the old label is not freed.
+
+Signed-off-by: Nicholas Piggin <npiggin at gmail.com>
+Upstream: https://github.com/open-power/petitboot/issues/106
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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
