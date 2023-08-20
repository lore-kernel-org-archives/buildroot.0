Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA81EE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 15:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 507C98203E;
	Sun, 20 Aug 2023 15:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 507C98203E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0AjIhe5F-pU; Sun, 20 Aug 2023 15:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E7798203B;
	Sun, 20 Aug 2023 15:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E7798203B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 711601BF2CC
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 15:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48EB2416CD
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 15:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48EB2416CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5gfNa_1SwOk for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 15:40:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20305416CC
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 15:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20305416CC
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 49E98A4C00BA
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 17:40:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58474)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qXkXh-0008D2-08
 for buildroot@buildroot.org; Sun, 20 Aug 2023 17:40:41 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 17:40:41 +0200
Message-Id: <20230820154041.3984862-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692546041;
 bh=ZAFjiZeVUFnyhFmuE91TM9fdgWJWgxWy9IqcSJR/WRs=;
 h=From:To:Subject:Date:From;
 b=gUTqmVeM63cStZWmE0P9vPL9MXdvkUTGRPVATDwelJ1XUXPdzwZsRbdOFyI95Uk6e
 m1rMIoYPDCtXypmt3nK50zZ3FXmNlcaywlq8Wm6rSmPqfFBXk2Y1Y5r9hGJ6Bxb/I6
 iUmDyivQ6WWGAs81uxyHqYJ8WCPPixacyYZ3T/sV4Eg686cgCNiFQPmpuuqWX975y4
 Drjh2HFtAJPW1tJlEsaVgKXS3gIKTOTbLLcFl76L0BFpwKXeIHdKimSFKP4Unl+fsi
 9H5rFgQTC/95MukmXpmyq4J3a5ZaJOt9MiEM8ocAB2AcYH07rfE5ml2xpN5fUXxwbs
 VNh0aPcpW/uIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=gUTqmVeM
Subject: [Buildroot] [PATCH 1/1] package/shared-mime-info: link with
 -latomic if needed
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

Buildroot commit 3f9622fe3d85b4d9f734b879abc1d485afea19b2 added an
optional dependency to libatomic for libglib2 which caused the build
error fixed with this patch since glib-2.0.pc does not contain any
information about libatomic.

Fixes:
http://autobuild.buildroot.net/results/d25/d2563ce649188cec2025e4fc6e58c4bbd98ff939/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/shared-mime-info/shared-mime-info.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 9932bd2db0..a9713ee639 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -25,6 +25,11 @@ SHARED_MIME_INFO_LICENSE_FILES = COPYING
 HOST_SHARED_MIME_INFO_DEPENDENCIES = \
 	host-pkgconf host-intltool host-libxml2 host-libglib2
 
+# Uses __atomic_compare_exchange_4 from libglib2
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SHARED_MIME_INFO_CONF_ENV += LIBS=-latomic
+endif
+
 define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
 	$(HOST_MAKE_ENV) $(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
 	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
