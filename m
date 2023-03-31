Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17178C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 31 Mar 2023 03:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 690EA843D1;
	Fri, 31 Mar 2023 03:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 690EA843D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuUbZm8XOQkP; Fri, 31 Mar 2023 03:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF4E484049;
	Fri, 31 Mar 2023 03:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF4E484049
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 250881BF955
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 03:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3548416B9
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 03:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3548416B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XT5LVZkelTvV for <buildroot@lists.busybox.net>;
 Fri, 31 Mar 2023 03:11:31 +0000 (UTC)
X-Greylist: delayed 00:06:22 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E641416B4
Received: from flatmax.com (41.68.233.220.static.exetel.com.au [220.233.68.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E641416B4
 for <buildroot@buildroot.org>; Fri, 31 Mar 2023 03:11:31 +0000 (UTC)
Received: by flatmax.com (Postfix, from userid 1000)
 id 55CEE3846106; Fri, 31 Mar 2023 14:05:04 +1100 (AEDT)
From: Matt Flax <flatmax@flatmax.com>
To: buildroot@buildroot.org
Date: Fri, 31 Mar 2023 14:04:55 +1100
Message-Id: <20230331030455.1356986-1-flatmax@flatmax.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jack2: Add example tools build
 option
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Matt Flax <flatmax@flatmax.com>
---
 package/jack2/Config.in | 7 +++++++
 package/jack2/jack2.mk  | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index f5ac0399eb..d8717de426 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -23,6 +23,13 @@ config BR2_PACKAGE_JACK2

 if BR2_PACKAGE_JACK2

+config BR2_PACKAGE_JACK2_TOOLS
+	bool "example tools"
+	help
+	  Build jack's example tools like jack_connect, jack_lsp, etc.
+
+	  https://github.com/jackaudio/jack-example-tools/tree/main/tools
+
 config BR2_PACKAGE_JACK2_LEGACY
 	bool "classic jack2"
 	help
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index f7683304a6..5d6d9f6bc7 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -12,7 +12,13 @@ JACK2_CPE_ID_VENDOR = jackaudio
 JACK2_DEPENDENCIES = host-pkgconf alsa-lib
 JACK2_INSTALL_STAGING = YES

-JACK2_CONF_OPTS = --alsa --example-tools=no
+JACK2_CONF_OPTS = --alsa
+
+ifeq ($(BR2_PACKAGE_JACK2_TOOLS),y)
+JACK2_CONF_OPTS += --example-tools=yes
+else
+JACK2_CONF_OPTS += --example-tools=no
+endif

 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 JACK2_DEPENDENCIES += libexecinfo
--
2.37.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
