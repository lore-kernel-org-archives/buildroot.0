Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8189CCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 15:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43AA940868;
	Wed,  3 Apr 2024 15:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDwVohansJiR; Wed,  3 Apr 2024 15:37:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4CA1410D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4CA1410D1;
	Wed,  3 Apr 2024 15:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5613B1BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 432B2821FB
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cN2VW-7L31wP for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 15:37:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3005D821FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3005D821FA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3005D821FA
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 15:37:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf33.dip0.t-ipconnect.de [79.214.207.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 698FBA4C2AB6
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:36:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35774)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rs2fJ-000000000Rn-3L6G
 for buildroot@buildroot.org; Wed, 03 Apr 2024 15:36:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 17:36:35 +0200
Message-Id: <20240403153641.4122789-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403153641.4122789-1-bernd@kuhls.net>
References: <20240403153641.4122789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712158602;
 bh=RbzZ8WcmgaIzzK6/BrxJJcUELWxbgjC9A07E+/FtWWQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lqDwI5h11JdWWATKsmrkG1RpTsAohQLbZITxza9Y8OxjHH3I0dTEDgu4PgfhKMrnL
 8+mvO9ToXY1YJN1dHhKeU0oj58P2LMxU8dsboTQEDXkwpKtY0H+4wjqBhOuBA7ey40
 kdTNd6PxYxpQ0C0t/3NsE4pDaHswl5nQL5XZfx1U+WHmdv87ftxciEujdRHoG1t57A
 mrSyiZ/fKTUOO9bqoeXWWzBDckEJSmtiIbNuAnYTcv2GLc68GPrqXz+hYU5KZoMMlv
 vQsG8jwpFs7uVjXnlMtidE2x+luC8IGtJjizvbIhH/ZO7xepmsBWhuoIvO54KlpyAi
 LsAsQ0wYqGVdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=lqDwI5h1
Subject: [Buildroot] [PATCH 3/9] package/dovecot: add optional dependency to
 libxcrypt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing dovecot's libcrypt dependency this
broke the dovecot build using glibc version 2.39.

To fix this select the libxcrypt dependency to dovecot when using a
glibc toolchain and add the dependency if selected.

Fixes:
http://autobuild.buildroot.net/results/99d816fb7a033ec73a958200041f0dcd728e0e87/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dovecot/Config.in  | 1 +
 package/dovecot/dovecot.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 20b08b62be..c94421526f 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index f90996fdd7..b8652900d0 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -73,6 +73,10 @@ else
 DOVECOT_CONF_OPTS += --without-sodium
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+DOVECOT_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 DOVECOT_CONF_OPTS += --with-pam
 DOVECOT_DEPENDENCIES += linux-pam
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
