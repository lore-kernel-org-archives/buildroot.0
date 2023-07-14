Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FD5EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 20:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A6C141299;
	Fri, 14 Jul 2023 20:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A6C141299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJLuQeD-X0UJ; Fri, 14 Jul 2023 20:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 848B64136C;
	Fri, 14 Jul 2023 20:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 848B64136C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5811BF3EF
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 20:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72D6D812A9
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 20:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D6D812A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egH21_sHd5Sb for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 20:18:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE89C8126A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE89C8126A
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 20:18:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 097FFA4C029A
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 22:18:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57190)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKPFG-0004VB-2Z
 for buildroot@buildroot.org; Fri, 14 Jul 2023 22:18:30 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 22:18:30 +0200
Message-Id: <20230714201830.504801-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689365911;
 bh=odyXV7PS6b7McaCUYOvYHVpJiCFW/HMR3U7376f6BZU=;
 h=From:To:Subject:Date:From;
 b=uCTFPD4yO+a8AcASNg7xd1ye7Y++jkNBqX0Qaec4Cfd35ew6AOBp03sq6o5Y8MEdE
 o9Vw9MnnZr+Mk/GWGuedRAKUk1efG1et1XnaUVn2SJomrFqtTz9lsijRWAQtssYOWi
 R8oEkdFsMg5ijz7pEc6BVdVl6h72yVs8LN5cSO/1s7Gxq2cmw9M2PXcADSu6vmzpKH
 JJsv1VIRqJ+XxYpMZ3hlWMu5GpJ51/uroJRwZPQumezaQ21Ip2dy1HMPhHbiTgbQ0t
 W0eyee/NiO0c0n2qRvm+rFj1tzJPQL8UXD+4s2IP0nCjvFXN7k5UlEVme0WvW++yDv
 BHL7eTfD5HpWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=uCTFPD4y
Subject: [Buildroot] [PATCH 1/1] package/elfutils: fix build without c++
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

The version bump to 0.189 with commit
258c27f6335aa66ce634c93b82ab146bf65f7f2 introduced an error when
libstdc++ support is not available and --disable-demangler was not used:
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=73e212b0a778c6dbe84f79b7eb2647dea50ea16f

Fixes:
http://autobuild.buildroot.net/results/cd4/cd4ca1a2b2eabe6937cb920cda5d8e566216546e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/elfutils/elfutils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 336544e125..0757851b72 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -66,6 +66,12 @@ ELFUTILS_DEPENDENCIES += argp-standalone
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ELFUTILS_CONF_OPTS += --enable-demangler
+else
+ELFUTILS_CONF_OPTS += --disable-demangler
+endif
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ELFUTILS_DEPENDENCIES += bzip2
 ELFUTILS_CONF_OPTS += --with-bzlib
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
