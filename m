Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11E1C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7118541C20;
	Mon,  4 Dec 2023 20:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7118541C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGTGrKkCPTCC; Mon,  4 Dec 2023 20:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF3C41C0A;
	Mon,  4 Dec 2023 20:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF3C41C0A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05FE11BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3F7D41751
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3F7D41751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uz7uXtz7y4pL for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 368834173B
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 368834173B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 345C4879B7; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Dec 2023 09:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03e66a35eabaed9f258b8670eba2e8fc13dd3eb5
X-Git-Newrev: 6358bb3a9bcf8d4c66893e8df513d18bf0022c35
X-Patchwork-Hint: ignore
Message-Id: <20231204201330.345C4879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: add libdbi-drivers
 optional dependency
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
Content-Type: multipart/mixed; boundary="===============1150587186672518712=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1150587186672518712==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6358bb3a9bcf8d4c66893e8df513d18bf0022c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed in order to use omlibdbi module

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index cf9f2c0e79..8ea92ea785 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -151,6 +151,13 @@ RSYSLOG_CONF_OPTS += \
 	--disable-omjournal
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDBI_DRIVERS),y)
+RSYSLOG_CONF_OPTS += --enable-libdbi
+RSYSLOG_DEPENDENCIES += libdbi-drivers
+else
+RSYSLOG_CONF_OPTS += --disable-libdbi
+endif
+
 define RSYSLOG_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -m 0644 -D package/rsyslog/rsyslog.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/rsyslog.service

--===============1150587186672518712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1150587186672518712==--
