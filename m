Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945ECC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 18:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49EFD41612;
	Wed, 27 Dec 2023 18:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49EFD41612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEycokQEq58l; Wed, 27 Dec 2023 18:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B77340268;
	Wed, 27 Dec 2023 18:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B77340268
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E04A1BF3E1
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 025E440498
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 025E440498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3VjKIQRdIfTa for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 18:18:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D15B24025D
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 18:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D15B24025D
Received: from fli4l.lan.fli4l (p5b3a01e6.dip0.t-ipconnect.de [91.58.1.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12D03A4C0B8F;
 Wed, 27 Dec 2023 19:17:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37490)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rIYTc-0004WE-2M;
 Wed, 27 Dec 2023 19:17:56 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 19:17:56 +0100
Message-Id: <20231227181756.156827-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231227181756.156827-1-bernd@kuhls.net>
References: <20231227181756.156827-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703701077;
 bh=RfqPQV+bNFofxvDwY6b4r0KS0JVJwD9F5BXRVa93i2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pt8+Af4v20Lm5aA8PaQX3iAi6Fgebf8+6LU0RyVvFw10tSRaqTBFioKPwKnoaD5Vo
 lIw1R9nd79+LsPBLZL84tAeHca0G+BPG18BD2qsfR1rSKLc8OLpvDhYqNMTvB+/0R9
 iB+Lb88T+gGRYKv0yV/KgsHGUQnD1KcyDsdWx6n5ACx/BEV0n9wyW1JGy9OTinvEHK
 MsRRCiNUdgAAnNmvPUdqGcTAyyCc3i5AK4TpufMx2ENL0N0PlPfNXIwqeEjK74fbDh
 v1MwAvSBRf2BvrLxOFlPlu3jKOhXKHr2PAlhWD3ocXQLBH4y3eUqTb5+B3x3Z5QULZ
 ClXDRQxWmVa8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=pt8+Af4v
Subject: [Buildroot] [PATCH 2/2] package/exim: do not build perl-based
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
host-perl/perl so we build only the exim binary.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 30b0d78c94..1b3295697e 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -146,16 +146,15 @@ define EXIM_BUILD_CMDS
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_C_FLAGS)"
+		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_C_FLAGS)" exim
 endef
 
 # Need to replicate the LFLAGS in install, as exim still wants to build
 # something when installing...
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
