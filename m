Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977D2D6B6DD
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 22:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3946E81190;
	Wed, 30 Oct 2024 22:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxHGq2gs62Ub; Wed, 30 Oct 2024 22:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC12F81183
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC12F81183;
	Wed, 30 Oct 2024 22:25:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4BB15E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 22:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B465F40690
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 22:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSMRltVqIz_f for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 22:25:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E37904068C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E37904068C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E37904068C
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 22:25:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8CBA4A4C129F;
 Wed, 30 Oct 2024 23:25:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36280)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t6H88-000000005BB-3dIz;
 Wed, 30 Oct 2024 22:25:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 30 Oct 2024 23:25:33 +0100
Message-Id: <20241030222533.1826144-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730327133;
 bh=QR3FAeei0ZQaoKkrJmFsQvDVAvQx3J6BVLAqLcg/QVI=;
 h=From:To:Cc:Subject:Date:From;
 b=mKmbKKe3U7JGkN4bhTM55FOj7L3buFO9cqNaKcTxLcpyuI3CQb6mTG4/+PQiJ818q
 i1yk0gLeaWSpEZS6bGvGoEdQ88nysLWbhHHc+4WszHORjxsydGUtBlue/pig2vlsVQ
 GRvqmTa9L3/Q9zAT+lB2KaRsQhsq6KG8fe5XXOGylCnz3QGdUFDuvNN8B2PvzZxuID
 2+Z18+ci7dM73ACqdTYeZL6ljPMYafK3OZDPCh/00ezdcTgAVOPVLmb7e0AXJpccAP
 5EB1BJQdWEorFot5XzFlQcxYMbMY+h+KrQVgCNZBuZqCtJ0EvTwsB4xTPmGJbZ0AZU
 V7xrgdfCY8FfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=mKmbKKe3
Subject: [Buildroot] [PATCH 1/1] package/libv4l: fix TARGET_NLS_LIBS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When switching the build system to meson in buildroot commit
41ce1cc690b0837a1822079317bf317ddaeac17b the way TARGET_NLS_LIBS was
passed to the build system was not updated causing build errors.

Fixes:
http://autobuild.buildroot.net/results/96b/96b08078ea412b97a4719321ad0fdad4003e42c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Please note that this build error first occured on Sep 12, long before
meson was bumped to 1.6.0:
http://autobuild.buildroot.net/results/6cf/6cf2bddef3f31eef21465ee98e13440dca65ca0f/

 package/libv4l/libv4l.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 072d7efcf3..e8bcc2bdfc 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -10,6 +10,7 @@ LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = -Ddoxygen-doc=disabled -Dqvidcap=disabled -Dv4l2-tracer=disabled
+LIBV4L_LDFLAGS = $(TARGET_LDFLAGS)
 
 # v4l-utils components have different licences, see v4l-utils.spec for details
 LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
@@ -21,7 +22,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBV4L_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
-LIBV4L_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
+LIBV4L_LDFLAGS += $(TARGET_NLS_LIBS)
 endif
 
 LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
