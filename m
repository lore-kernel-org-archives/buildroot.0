Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7319DC47258
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 02:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B699F42FC9;
	Fri, 26 Jan 2024 02:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B699F42FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z1sN78a11XPW; Fri, 26 Jan 2024 02:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D884D42FCA;
	Fri, 26 Jan 2024 02:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D884D42FCA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B81C61BF4D5
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 02:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FE2F40180
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 02:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FE2F40180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HgcDqNu1nBL for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 02:49:38 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 007EA40151
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 02:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 007EA40151
ARC-Seal: i=1; a=rsa-sha256; t=1706237368; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UwX3PBjcCjbpyFAQd0cKJfTz+NqwwhA7FXJCO4R/pMeyEBK5xtLtPGQDK6gyo4Z76jDa3O1HgGVELXKjuXc31C4TQdCps+u9qIu/QvZI8URUNEN3URswpBYSM82CmTjU8VHHFXb6yiNqqw/coZmFg55L3LvhZwPlLmL2yL0pT0Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1706237368;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=seb2Ytgt/xksqjCd6MCgh7FFtXVn3bTtVquS6zS1peg=; 
 b=Xti+aRnSSihwM77Lih9qhkLlvzr0noUopa0G4+fgXkX/lODMPBfk12BSgtBhY9ste6vwurRVIjgLzQGXptnrZTAoQ+uxkqTeYuGeUwAdgn1ywJ7LC6g2+UO3Ne7RTeEHNl+GRa3P3D935H4iD7cE+9xyWByazFhHAKt8k9Txldw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=matt-silva.com;
 spf=pass  smtp.mailfrom=dev@matt-silva.com;
 dmarc=pass header.from=<dev@matt-silva.com>
Received: from localhost.localdomain (70.51.135.81 [70.51.135.81]) by
 mx.zohomail.com with SMTPS id 1706237366327694.4177680075451;
 Thu, 25 Jan 2024 18:49:26 -0800 (PST)
From: Matt Silva <dev@matt-silva.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jan 2024 21:49:14 -0500
Message-ID: <20240126024914.13825-1-dev@matt-silva.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1706237368; 
 s=zoho; d=matt-silva.com; i=dev@matt-silva.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=seb2Ytgt/xksqjCd6MCgh7FFtXVn3bTtVquS6zS1peg=;
 b=Ddzx62hUOk1bBKtnAsxf9mFQr4a/iSD7TQsKATQyVAivhhHEUqxM9FuXk87e0ljt
 pAQOmBHUgVu+qAHlU/Q1D+gFuCac8UeAbhD/wFIC4wJxfmPglhyaJYrWNEIkjRkxv00
 bWk2K/Zwg8AeTG7MmvMg/lQbq/o+lu9eOO3/pzUc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=matt-silva.com header.i=dev@matt-silva.com
 header.a=rsa-sha256 header.s=zoho header.b=Ddzx62hU
Subject: [Buildroot] [PATCH 1/1] package/rlwrap: new package
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
Cc: Matt Silva <dev@matt-silva.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Matt Silva <dev@matt-silva.com>
---
 package/Config.in          |  1 +
 package/rlwrap/Config.in   | 58 ++++++++++++++++++++++++++++++++++++++
 package/rlwrap/rlwrap.hash |  6 ++++
 package/rlwrap/rlwrap.mk   | 48 +++++++++++++++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 package/rlwrap/Config.in
 create mode 100644 package/rlwrap/rlwrap.hash
 create mode 100644 package/rlwrap/rlwrap.mk

diff --git a/package/Config.in b/package/Config.in
index 5b8b15fa54..0df3f49781 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2688,6 +2688,7 @@ comment "Utilities"
 	source "package/pinentry/Config.in"
 	source "package/qprint/Config.in"
 	source "package/ranger/Config.in"
+	source "package/rlwrap/Config.in"
 	source "package/rtty/Config.in"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
diff --git a/package/rlwrap/Config.in b/package/rlwrap/Config.in
new file mode 100644
index 0000000000..b4a7f7fe3e
--- /dev/null
+++ b/package/rlwrap/Config.in
@@ -0,0 +1,58 @@
+config BR2_PACKAGE_RLWRAP
+	bool "rlwrap"
+	select BR2_PACKAGE_READLINE
+	help
+	  rlwrap is a 'readline wrapper', a small utility that uses the
+	  GNU Readline library to allow the editing of keyboard input
+	  for any command.
+
+	  https://github.com/hanslub42/rlwrap
+
+if BR2_PACKAGE_RLWRAP
+
+config BR2_PACKAGE_RLWRAP_SPY_ON_READLINE
+	bool "spy on readline"
+	default y
+	help
+	  If we want to keep the display tidy when re-sizing the
+	  terminal window or printing multi-line prompts, we have to
+	  know whether or not readline is in horizontal-scroll-mode
+	  (i.e. wheter long lines are scrolled or wrapped). At present,
+	  this involves a look at a private readline variable - if you
+	  feel guilty about that, disable this option
+
+config BR2_PACKAGE_RLWRAP_HOMEGROWN_REDISPLAY
+	bool "homegrown redisplay"
+	default n
+	help
+	  Some people report double echoing of user input. Enabling this
+	  option will cure the problem - though the display will then
+	  flicker over slow connections (cf. BUGS)
+
+config BR2_PACKAGE_RLWRAP_DEBUG
+	bool "enable debug"
+	default n
+	help
+	  Adds a --debug option to rlwrap's repertoire. This will make
+	  rlwrap write debug information to a file /tmp/rlwrap.debug
+	  (cf. the output of rlwrap --help for more info)
+
+config BR2_PACKAGE_RLWRAP_PROC_MOUNTPOINT
+	string "proc mountpoint"
+	default "/proc"
+	help
+	  Mountpoint for Linux-style procfs, used for determination of
+	  slave command's working directory
+
+config BR2_PACKAGE_RLWRAP_MULTIBYTE_AWARE
+	bool "multibyte awareness"
+	default y
+	depends on BR2_USE_WCHAR
+	help
+	  Prevent rlwrap from seeing multibyte characters as multiple
+	  characters
+
+comment "rlwrap multibyte awareness needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+endif
diff --git a/package/rlwrap/rlwrap.hash b/package/rlwrap/rlwrap.hash
new file mode 100644
index 0000000000..b7005e860e
--- /dev/null
+++ b/package/rlwrap/rlwrap.hash
@@ -0,0 +1,6 @@
+# from https://github.com/hanslub42/rlwrap/releases/tag/0.46.1
+sha256  2711986a1248f6ac59e2aecf5586205835970040d300a42b4bf8014397e73e37  rlwrap-0.46.1.tar.gz
+
+# license files, locally calculated
+sha256  656d25fab58016ac6ac11bb126709e4f860ea063d11795232eb55987172f78ff  AUTHORS
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/rlwrap/rlwrap.mk b/package/rlwrap/rlwrap.mk
new file mode 100644
index 0000000000..6f9de8281c
--- /dev/null
+++ b/package/rlwrap/rlwrap.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# rlwrap
+#
+################################################################################
+
+# https://github.com/hanslub42/rlwrap/releases/download/0.46.1/rlwrap-0.46.1.tar.gz
+
+RLWRAP_VERSION = 0.46.1
+RLWRAP_SOURCE = rlwrap-$(RLWRAP_VERSION).tar.gz
+RLWRAP_SITE = https://github.com/hanslub42/rlwrap/releases/download/$(RLWRAP_VERSION)
+RLWRAP_LICENSE = GPL-2.0
+RLWRAP_LICENSE_FILES = AUTHORS COPYING
+
+RLWRAP_DEPENDENCIES = readline
+
+# --enable-spy-on-readline
+ifeq ($(BR2_PACKAGE_RLWRAP_SPY_ON_READLINE),y)
+RLWRAP_CONF_OPTS += --enable-spy-on-readline
+else
+RLWRAP_CONF_OPTS += --disable-spy-on-readline
+endif
+
+# --enable-homegrown-redisplay
+ifeq ($(BR2_PACKAGE_RLWRAP_HOMEGROWN_REDISPLAY),y)
+RLWRAP_CONF_OPTS += --enable-homegrown-redisplay
+else
+RLWRAP_CONF_OPTS += --disable-homegrown-redisplay
+endif
+
+# --enable-debug
+ifeq ($(BR2_PACKAGE_RLWRAP_DEBUG),y)
+RLWRAP_CONF_OPTS += --enable-debug
+else
+RLWRAP_CONF_OPTS += --disable-debug
+endif
+
+# --enable-proc-mountpoint
+RLWRAP_CONF_OPTS += --enable-proc-mountpoint=$(BR2_PACKAGE_RLWRAP_PROC_MOUNTPOINT)
+
+# --enable-multibyte-aware
+ifeq ($(BR2_PACKAGE_RLWRAP_MULTIBYTE_AWARE),y)
+RLWRAP_CONF_OPTS += --enable-multibyte-aware
+else
+RLWRAP_CONF_OPTS += --disable-multibyte-aware
+endif
+
+$(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
