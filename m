Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DF6C25B06
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 07:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85F9D4069B;
	Sat,  6 Aug 2022 07:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F9D4069B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNULgwTsrp7O; Sat,  6 Aug 2022 07:48:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C036403D8;
	Sat,  6 Aug 2022 07:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C036403D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAD101BF4D7
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 07:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC81B40192
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 07:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC81B40192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WojomekZSFbG for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 07:48:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2F9640236
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 07:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F9640236
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5BC8685E6B; Sat,  6 Aug 2022 07:34:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 Aug 2022 09:46:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 230bbfc22068ae607f3706460c85d3a2886b9634
X-Git-Newrev: 3e7c9f152771b9e5fad83fdd4aa5bc3d88bb8645
X-Patchwork-Hint: ignore
Message-Id: <20220806073401.5BC8685E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: enable refclock support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e7c9f152771b9e5fad83fdd4aa5bc3d88bb8645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable --refclocks=all configure flag, to be able to use several
synchronization sources (hardware).

Refclocks are all disabled by default, and they can only be enabled,
either one by one by name, or globally. Except for PPS support that
needs pps-tools, the other refcloks do not have external dependencies,
so we choose to enable all or none, without fine-grained selection.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[yann.morin.1998@free.fr:
  - change comment and commit to explain refclock can't be disabled
  - don't add a menu-endmenu
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ntpsec/Config.in | 7 +++++++
 package/ntpsec/ntpsec.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
index c81673481e..3b20daecc7 100644
--- a/package/ntpsec/Config.in
+++ b/package/ntpsec/Config.in
@@ -29,6 +29,13 @@ config BR2_PACKAGE_NTPSEC_NTS
 	help
 	  Enable Network Time Security (NTS) support.
 
+config BR2_PACKAGE_NTPSEC_REFCLOCK_ALL
+	bool "refclock-all"
+	select BR2_PACKAGE_PPS_TOOLS
+	help
+	  Enable all refclocks (hardware, sync source and discplined
+	  clocks)
+
 endif
 
 comment "ntpsec needs a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index a0d0662947..ac4b90e37a 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -53,6 +53,12 @@ ifeq ($(BR2_PACKAGE_NTPSEC_NTS),)
 NTPSEC_CONF_OPTS += --disable-nts
 endif
 
+# refclocks are disabled by default, can only be enabled
+ifeq ($(BR2_PACKAGE_NTPSEC_REFCLOCK_ALL),y)
+NTPSEC_DEPENDENCIES += pps-tools
+NTPSEC_CONF_OPTS += --refclock=all
+endif
+
 define NTPSEC_INSTALL_NTPSEC_CONF
 	$(INSTALL) -m 644 package/ntpsec/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
