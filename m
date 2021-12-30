Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60321C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13EF3813D2;
	Thu, 30 Dec 2021 22:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-D-5clyi3NF; Thu, 30 Dec 2021 22:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 799F88136C;
	Thu, 30 Dec 2021 22:57:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 005D51BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E35D08136C
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3EVQbjYef_U for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:57:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF0E58131D
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:57:29 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 702F5C55B0;
 Thu, 30 Dec 2021 22:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1640905048; bh=9pFRjayrvuGJUiGjQLZ3GWJ+9XseX8gq+8942JYwtsI=;
 h=From:To:Cc:Subject:Date:From;
 b=FOLdl5DUI0I7lIzrAucxF78+PyFro/gZoN4OPpsR2/WtvN3WhwJNq9uZGRY1f2Udu
 Rwgi91ne5eKjFJZGlun/oxLzEX79/IG/XkxXQS8yA1jFr9el7Mh+spcizQ6idHtI9J
 ApGoaHQkmp98kixTg0LWQ4uLpmbObL8Sc4S0/4xZOog/gtVdWawO6Y0e4Kqf2t0JEG
 l6NzUY48l5HmL3OXgAe9tjiqOXlVLPmNP7WIcfnDn3tsSys0t0dw1v3M1x3/WHYHah
 kIGgvsLsPB88N3QVKcHvdydzFg+U1f8bEOJIohe5GyOabgusziKeglIip3fQGxYgfX
 h/bDqCbR4y1xA==
Received: from abrodkin-5550.internal.synopsys.com
 (abrodkin-5550.internal.synopsys.com [10.225.48.58])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 97C00A005C;
 Thu, 30 Dec 2021 22:57:26 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 01:57:19 +0300
Message-Id: <20211230225719.31728-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openjdk: Make sure for ARC only Zero is
 selectable
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of now for ARC we only have fully-interpreted mode AKA
"Project Zero" and so all the JIT'ed modes must be explicitly
disabled for ARC. Doing it now as it was not done in the initial
submission

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index b6eb2d7818..8b7fd4653e 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -126,19 +126,19 @@ config BR2_PACKAGE_OPENJDK_FULL_JDK
 
 choice
 	prompt "openjdk variant"
-	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
+	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !(BR2_powerpc || BR2_arc)
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_powerpc
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_arc
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
 	bool "client"
-	depends on !BR2_powerpc
+	depends on !(BR2_powerpc || BR2_arc)
 	help
 	  Quick loading, but slower run-time performance.
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
 	bool "server"
-	depends on !BR2_powerpc
+	depends on !(BR2_powerpc || BR2_arc)
 	help
 	  Slower loading, but faster run-time performance.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
