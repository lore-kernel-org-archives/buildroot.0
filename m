Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1678EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FC4981A39;
	Mon, 10 Jul 2023 17:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FC4981A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3FHFqnJ4VQ4; Mon, 10 Jul 2023 17:31:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CFD817AD;
	Mon, 10 Jul 2023 17:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1CFD817AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 968E21BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 707C0817AD
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 707C0817AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1tx5Hgr0b2qO for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:31:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B21B8813FE
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B21B8813FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A26BE86BDA; Mon, 10 Jul 2023 17:31:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:30:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f12f54998a70cf30323b9eda9ea9cc95453d11d6
X-Git-Newrev: ff2c69a9009341f9bd9e3a99cc984d36cfa395a6
X-Patchwork-Hint: ignore
Message-Id: <20230710173103.A26BE86BDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: add optional dependency
 on libbpf
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6506506666574855718=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6506506666574855718==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ff2c69a9009341f9bd9e3a99cc984d36cfa395a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iproute2/iproute2.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 15af076db9..49a65516d6 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -38,8 +38,16 @@ ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185),y)
 IPROUTE2_DEPENDENCIES += berkeleydb
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBPF),y)
+IPROUTE2_DEPENDENCIES += libbpf
+IPROUTE2_CONFIGURE_OPTS += --libbpf_force on
+else
+IPROUTE2_CONFIGURE_OPTS += --libbpf_force off
+endif
+
 define IPROUTE2_CONFIGURE_CMDS
-	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
+	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure \
+		$(IPROUTE2_CONFIGURE_OPTS)
 	$(IPROUTE2_DISABLE_IPTABLES)
 endef
 

--===============6506506666574855718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6506506666574855718==--
