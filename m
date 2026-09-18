Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CD1C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA33812BF;
	Fri, 18 Sep 2026 20:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKjlZ3M4fEMG; Fri, 18 Sep 2026 20:25:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0FB13812DF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789763131;
	b=bkuePv3bIq9zm2fhmCzpwNE/C2p8n+bgojozPhOk8Mmn1tlA6CSQj5ySjnPU6JqS5805
	 q//J+mlQLZXgayk9hZN/K48i0lROD1HtgpNZhxDF0InOjA5BQz8vpf2mvPBEm5/FXcWNu
	 XoYEnux3lNzhnOLA1Fh1r+jWt6pAW7o6PxvPpRyXWGyubYYyw+YeqRHR1jxFHvZX0MgPP
	 y0CgEnOU2oLMoAmdBKxt+PXL62Tjo9wKXr3/YhJbMLz+QAFRj0dUWY77shPl8cdndC/zo
	 F1QiUNHFV9lad50Fy+UOTAeCWLzSWWInjDlUPZNtRtc4o8IWJ4K7dCrcpxdqZMYg+zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789763131;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZIIACh+atmnQZ3MAjEngg+6A7cu7luJpVZEVLWQesWs=;
	b=otqtTOU4dprNXe3VrjIHS/B9wbeqLoao8jk2PKzPJS9nyP10uo7bAK+4LR1bb2wzJDVg
	 1W+5BN90AjkprZTvASDbxzCtpMwoLXGit6SaGr/FEp+HGpSir0u3HrpRtinCNWygAL9y4
	 s5TufK//sAOI1r3i7TknYx7BLlQuzkdjZh3ob1PCGehkKkBWIpAFTSbXWO/r8viADuJ1F
	 +T/YiZLYLZlrgs/3XyOApGPFWXf61mhcgGmgoEQGiXATTGIk+Um/YSmK+rqWOzixv4CsW
	 MPRxTHydg+0TpKmiHEjZ0LOc1n4oxQe1u3IoMLCzGoJPQovmHEbWZ4mNJ/MC9qp4Ijw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789763131;
	bh=ZIIACh+atmnQZ3MAjEngg+6A7cu7luJpVZEVLWQesWs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mHdrLn86ivLW25MaNLftZKYMp/z9Gz4D6on4Yoxut9sLu0CD2w9J4w9zmhhMnzWtD
	 F62i8EPyPLY++S/n3G3iRMP5n85BC07tJIZqeySqOweaRmalSHvuqYLzwJjZ1QoImB
	 mckz8gSW5+5jmbaddBSHrWQ3fw8tHAB+ni5grqnmkEmnAyoAwj1LwN5ZxmB81JPg+J
	 2JOU26ToFsm20Q5X8pn3g/eBG2As9JXpJU8VXaG7L3lHKjG5a3A7qJganfgwzsUYTf
	 UwBQ0PHzK0gbDM/DpVaXWm4ZlLav27+hHWq/7e0GCBsCrfbKXLHoDlZT4b5FhhCAVq
	 f5NRo2lxUacuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB13812DF;
	Fri, 18 Sep 2026 20:25:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB403B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EC524006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UKfNqBcO3XM for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 20:25:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5274840022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789763128;
 b=O/Rn/iROvEddAhinW69d0uQNrKJFBQkZ6hMt5jd3UWu5Y/KUjwCkrQN9eU26HCH7NhKQ
 Z5g88y6xXBpejw2RxgiQDj8rTh9wY38UheADt3Sy/6EfEbhsQ9KWpr7efhymIgTVRu+YP
 /MJXRhFmivtQpDPpIRpKkpRq/d8WztKcSE/JxF920i4HwpXQbRJeNSsuh3VZb95v9Rhcp
 tIVWjkTesr9mkUoiH1FS24EzGuVlRAZAwqDoIpXDl07ps9dhQIywiYG1w+bxPMvpBtesg
 3QgGGJjFDkqgghAs9KSSmh4Gqo378DXw7DFxpbKO325UVf6CivCv5XJMhJ112CC/P7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789763128;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HCqlNJcHiusC5jV45AO2vzJYyuMGAi3aPPkEodtmGL4=;
 b=E3PVvn1oool5ZlnwXbFSng3u71BTVjUoc7aMohSxJq67uS7E5/1AlfQIaF0sFZXmhf1N
 VeO3ASpKfe1h302RTyudQqsX0mfrc9hshSuR1ZYhqBx8UI5/0WzaurBC6yYdDxwYv8/Sp
 Ns+Ixlvj6hoHvlyXJJigAdsrafcJu6sMskQ+AhlA042WhObWMn3cLfzXvuPSAOWarO6qv
 uvye9uhnS9ZzWpKnkQjO33ui0fT4hZakCNGKQE+X0ORcUF2GwlZWA5dXbKwix/w2BRXAh
 KjSVyuj7m0WZ0dopsJ7oeEXDUygr72ldaxz9BMlACKqfMZySVpdPAS1lyJOYrDvj1JQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5274840022
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:25:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEC7C976A4; Fri, 18 Sep 2026 20:24:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 22:25:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8a1acdb6c300b32c4b29a9b41e9cafbd1389962
X-Git-Newrev: a4346a385811e3ef2ba209ded9a604f1cd7f38fb
X-Patchwork-Hint: ignore
Message-Id: <20260918202420.AEC7C976A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mali-t76x: add missing license
 information
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4346a385811e3ef2ba209ded9a604f1cd7f38fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Added MALI_T76X_STRIP_COMPONENTS = 0 as tar archive follows nonstandard layout with license file being in the topmost directory

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mali-t76x/mali-t76x.hash | 1 +
 package/mali-t76x/mali-t76x.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mali-t76x/mali-t76x.hash b/package/mali-t76x/mali-t76x.hash
index a754b98074..61671eda29 100644
--- a/package/mali-t76x/mali-t76x.hash
+++ b/package/mali-t76x/mali-t76x.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  5a0b00438edc8066b374481d3332a43c07ec2bd3bc73265983a968970f754902  mali-t76x_r5p0-06rel0_linux_1+fbdev.tar.gz
+sha256  b0ca7cedaf4f604a1c863ea71f741d6ca1474aebac7e606ec43d725b3c74cc63  END_USER_LICENCE_AGREEMENT.txt
diff --git a/package/mali-t76x/mali-t76x.mk b/package/mali-t76x/mali-t76x.mk
index 387685c033..113c541a91 100644
--- a/package/mali-t76x/mali-t76x.mk
+++ b/package/mali-t76x/mali-t76x.mk
@@ -10,9 +10,13 @@ MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T7
 MALI_T76X_DEPENDENCIES = mesa3d-headers
 MALI_T76X_INSTALL_STAGING = YES
 MALI_T76X_PROVIDES = libegl libgles
+MALI_T76X_LICENSE = ARM Mali GPU EULA
+MALI_T76X_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
+MALI_T76X_REDISTRIBUTE = NO
+MALI_T76X_STRIP_COMPONENTS = 0
 
 define MALI_T76X_INSTALL_STAGING_CMDS
-	$(INSTALL) -m 755 $(@D)/*.so $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(STAGING_DIR)/usr/lib/
 
 	$(INSTALL) -D -m 0644 package/mali-t76x/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
@@ -21,7 +25,7 @@ define MALI_T76X_INSTALL_STAGING_CMDS
 endef
 
 define MALI_T76X_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 $(@D)/*.so $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(TARGET_DIR)/usr/lib/
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
