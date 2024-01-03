Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21276C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 19:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E843417A6;
	Wed,  3 Jan 2024 19:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E843417A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzjsQFqWvdfO; Wed,  3 Jan 2024 19:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951DE4190C;
	Wed,  3 Jan 2024 19:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951DE4190C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4161BF286
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 614FC820D7
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 614FC820D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eyQvFSNkEABJ for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 19:12:07 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FB4482244
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 19:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FB4482244
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DD35A4C0D1A;
 Wed,  3 Jan 2024 20:11:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39414)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rL6ed-000000008FW-1UQs;
 Wed, 03 Jan 2024 20:11:51 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 20:11:51 +0100
Message-Id: <20240103191151.2777684-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103191151.2777684-1-bernd@kuhls.net>
References: <20240103191151.2777684-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704309111;
 bh=cGKCI9MFiozOu+bbnbiP3yJC/NGbEcNgw49mdlZVXfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=py0o8Kb3ji5F9htThiN6ZEiPMKLQyUd9gX6eF6bSFlCvS9wJyvmwj+upiWdk3k0KT
 dMVtLF9LDM6yMqKQDEhPMIjTiAT3pst1qyHfg4S/nRp/6H8PgJa+ShFIvOs1CAXurP
 UD2IbSTsJJ4cyrXCI8wFbhP14dsfVrRoEc0vW0zZ8Ih7GNRsUq4JkKCuA9IpTTrDfY
 V1ksqYgzOuG1yQQ5f2JBBzxUVYaOLMyfM0qiCJ2iyTYyCTdgqGF2tOMtsDkvXTo+P6
 AMqKKkDqcOJTKbmbm/0ynlyRpIhJ+XdOWazCX7tu333YQ2wqkr+kIrDHHJ7Hk2K0qt
 6ZSOuVdGAfrTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=py0o8Kb3
Subject: [Buildroot] [PATCH v2 2/2] package/exim: do not build perl-based
 utilities
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream added various utilities, for example exim_id_update
with commit https://github.com/Exim/exim/commit/46a36afae41f63de654269c8a0b7cf5852a85a14
which is a "Utility for one-time upgrage/downgrade between exim message-
id formats, around the 4.97 transition" which would add a dependency to
host-perl/perl so we build and install only the needed exim binary.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: removed comment before EXIM_INSTALL_TARGET_CMDS, reworded commit log
    text (Luca)

 package/exim/exim.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 25d171875d..fa4afbba01 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -146,16 +146,13 @@ define EXIM_BUILD_CMDS
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_C_FLAGS)"
+		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_C_FLAGS)" exim
 endef
 
-# Need to replicate the LFLAGS in install, as exim still wants to build
-# something when installing...
 define EXIM_INSTALL_TARGET_CMDS
-	DESTDIR=$(TARGET_DIR) INSTALL_ARG="-no_chown -no_symlink" build=br \
-	  $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-		CFLAGS="-std=c99 $(TARGET_CFLAGS)" \
-		install
+	cd $(@D)/build-br; \
+	DESTDIR=$(TARGET_DIR) build=br \
+	../scripts/exim_install -no_chown -no_symlink exim
 	chmod u+s $(TARGET_DIR)/usr/sbin/exim
 endef
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
