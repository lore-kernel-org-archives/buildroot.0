Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13CAE6FE28
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 18:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F1D560E03;
	Tue, 23 Dec 2025 18:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwjvZBQaxmli; Tue, 23 Dec 2025 18:10:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F7A260D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766513428;
	bh=o7sn4YBAtc9vJE4L+1nBTwNFLY152aegjgNe/Q0H25E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZHEnpZ0FhZ4EaPHkp5IM4KTtrTuMrShSsG0ZDdIM3IgM9efM+uBs38htYutxc+/zB
	 rdBXJE+0sqaAiH1NMeEeb4xVcn0e1MSfuXAD3Xy7QuuOmrx44GUrE0kBQlo76b/niC
	 DOc48cz010khC4lqh8eAXbpDTzb47Up70TjbQnlnVI1SxcHhV1Q2H/W6b8s5V4enlM
	 i07iU052fmCYd3/mN2VAj39VrpDU+e/7nA5UZRGHZYcliH1ek2bSShRWLKQ+zPaVUs
	 XMz+Mh7ifhVorkzBGa/mdfQRD3Wnq44fhxCiz1XYKopWhpdzYcq6UFGYPhkM6LAJNz
	 lXLwCZun6unHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F7A260D5E;
	Tue, 23 Dec 2025 18:10:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEDD4470
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4D9A60C2A
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2-oEM4YE8Y7 for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 18:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8325960BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8325960BFC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8325960BFC
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0D92E4E41D71
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D8FC760716
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 43D8110AB0CB1; Tue, 23 Dec 2025 19:10:21 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Dec 2025 19:10:08 +0100
Message-ID: <20251223181013.383914-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
References: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766513421; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=cxGgWMJr+QaLgPkZAnxKr0PEj+M14i+ktU0Amqa7HYY=;
 b=H/A6x61ow2CrlDNA2vOL9h/Yzx4FVu2hP7Azuio9GOMReHJFrUqlGCsiOv0eP4O9AMj4iq
 c5KmkbN/DxiVby3iVgN1icNu7/9PmX+iuIFBVbsCgvR+iE4wgZP9mjTl13ntC5MOsxot3+
 3GwzcA0x320HD5CCKXpAvtFoKjiktOrK5LAcZFtS6l8fPZEHM4aHxEp00MpWBI+l+4sr/8
 VLROGByKrXwZTjOlY6mXcSkKsU4WS8qeIx76IQfUqiYOGUTwZAZ6SOA0DfGkRD0PdJyK8W
 X+0UO0X63LX5fbyThRpUZQ2mHhhQvwa/UT+IxqPL/5eb+SLkLxlQTXBFVDVwyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=H/A6x61o
Subject: [Buildroot] [PATCH 1/4] package/vim: fix reinstallation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While not very common, it is nice when package re-installation
works. Unfortunately the "installlinks" target of vim installs links
with "ln -s", causing a package reinstallation to fail with:

cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim ex
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim view
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rvim
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rview
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim vimdiff
ln: failed to create symbolic link 'ex': File exists
ln: failed to create symbolic link 'view': File exists
make[2]: *** [Makefile:2749: /home/thomas/buildroot/br/output-all/target/usr/bin/ex] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile:2752: /home/thomas/buildroot/br/output-all/target/usr/bin/view] Error 1
ln: failed to create symbolic link 'rvim': File exists
ln: failed to create symbolic link 'rview': File exists

To fix this, we remove the target links before proceeding with the
installation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vim/vim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 2ecab0652f..43c9bfc0f1 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -47,6 +47,7 @@ VIM_CONF_OPTS += --disable-selinux
 endif
 
 define VIM_INSTALL_TARGET_CMDS
+	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
 	cd $(@D)/src; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
