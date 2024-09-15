Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5759C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3756F80A78;
	Sun, 15 Sep 2024 22:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6pGhEPUom5pd; Sun, 15 Sep 2024 22:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD8D580A00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD8D580A00;
	Sun, 15 Sep 2024 22:16:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C591A1BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C122A40247
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXj30CnfPTcY for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1C07400A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1C07400A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:16:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC46F8368C; Sun, 15 Sep 2024 22:16:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 00:05:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec270a08150980e37e36eeb43f4471ed8f7d662e
X-Git-Newrev: 03e8d86f457809f5f5ac3200f0b2612d86b4c006
X-Patchwork-Hint: ignore
Message-Id: <20240915221624.AC46F8368C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add dynamic security
 plugin option
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
Content-Type: multipart/mixed; boundary="===============4780307460802638389=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4780307460802638389==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=03e8d86f457809f5f5ac3200f0b2612d86b4c006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
[Peter: drop default n]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/Config.in    | 9 +++++++++
 package/mosquitto/mosquitto.mk | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 8bedf2ad21..339df8fddb 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -29,6 +29,15 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 	help
 	  Build and install the mosquitto broker onto target.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN
+	bool "dynamic security plugin"
+	depends on BR2_PACKAGE_MOSQUITTO_BROKER
+	select BR2_PACKAGE_CJSON
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Build and install the dynamic security plugin for
+	  mosquitto broker onto target.
+
 comment "mosquitto broker needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 6b249c37fd..c031f10c6b 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -94,6 +94,10 @@ ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 MOSQUITTO_MAKE_DIRS += src apps/mosquitto_ctrl apps/mosquitto_passwd
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),y)
+MOSQUITTO_MAKE_DIRS += plugins/dynamic-security
+endif
+
 define MOSQUITTO_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS="$(MOSQUITTO_MAKE_DIRS)" \
 		$(MOSQUITTO_MAKE_OPTS)

--===============4780307460802638389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4780307460802638389==--
