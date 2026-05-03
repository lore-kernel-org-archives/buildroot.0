Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69425CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 21:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE4398224A;
	Sun,  3 May 2026 21:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtfE5YfebvNh; Sun,  3 May 2026 21:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F90B821FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777843804;
	bh=7+vP9dEL5MW7QMt+W26MEhBRZ4xi7b2OCYK0nUVzVR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MCo7T03BwjVIAl8r8B2+GpLqyFn2mpxqtDVx8FPIG9/UR6mR0PbLweU0yLm6W2V0o
	 Ie0FxT/W9XLFRg69FuCj2TyUCyc39X3A9sPIoZZ4scEd4AgeL4GdkwgI056D0Hw1YZ
	 fR2ynnmQviWk3XmgXud1Bj5HX6Hfg+sIOJd7J0TygC8jIycQi9Gl8hjaCL/6HEzZho
	 Fdz4suu9UrjHflKIj0UDGcebdDOmkUIUZOhf47W6D9Yli7yYOZxd1y6zXAipC4ynHd
	 1ZlrNltOqDuCWop3+/stn/XEcTfnUDSj0V3bOU+CvDjnKJMqqe2ZHVv2A3uKjir5iV
	 T7hUpwWQeTn1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F90B821FB;
	Sun,  3 May 2026 21:30:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B833204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4092160F42
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id me__LauUIACs for <buildroot@buildroot.org>;
 Sun,  3 May 2026 21:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DDBD60DA1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DDBD60DA1
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:30:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16D2E8415D; Sun,  3 May 2026 21:30:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 23:28:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1e6b201aaa815d54d8a8d00a02f8ec4168aed87
X-Git-Newrev: 7bea44e9f1abd25e41e0987e04377a8520d24282
X-Patchwork-Hint: ignore
Message-Id: <20260503213001.16D2E8415D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ugetty: make install step more
 robust
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7bea44e9f1abd25e41e0987e04377a8520d24282
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use install -D so it also works if $(TARGET_DIR)/sbin does not exist yet.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ugetty/ugetty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
index 1dc628540d..d3424bee42 100644
--- a/package/ugetty/ugetty.mk
+++ b/package/ugetty/ugetty.mk
@@ -15,7 +15,7 @@ endef
 
 # Install ugetty->getty symlink to ensure ugetty is used
 define UGETTY_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/bin/ugetty \
+	$(INSTALL) -m 0755 -D $(@D)/bin/ugetty \
 		$(TARGET_DIR)/sbin/ugetty
 	ln -snf ugetty $(TARGET_DIR)/sbin/getty
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
