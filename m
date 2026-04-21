Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3C4F94CA5
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 18:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61816607AC;
	Tue, 21 Apr 2026 18:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaPLpP5QBLRW; Tue, 21 Apr 2026 18:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6090E607E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776796733;
	bh=dYBn2YJTiOgpVln/rhBzQxEyLI24x9bPmnvjM5nz/Ys=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKyay+jmO/FsT7GR9ViNUuN5bqj0THVoBCXyV7Vy5GPsuTMfKo9owBfehJiqJCJzi
	 wo7GnV+o4q0gb/bJcfSgqfO2RacErOuo3/WZ7BL/VxbX+qKtJbBsnuGFKSMlSxagGS
	 hCjkwMckTny6INPXTFtGcqXO8CrwcIWdA/AnHnDrMvT+neG3ei4Dtlm3vGskgcRWfk
	 Pf+mWXANH/57rdp50ysspp8aUzNxOs5oDDfzF+RJiV5UG0/qqe3ICPFD8BEmzFzGeN
	 8bMrY73ZzRVeUOZPAsw/VvNzPw/ajI/UDO5n8c982XFQrV2nTirtC2tmVjXsNNWwHZ
	 r8rKUtGV7d8sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6090E607E0;
	Tue, 21 Apr 2026 18:38:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35E4C257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AB1C607E0
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUimzYQMUDje for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 18:38:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E1B8607AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E1B8607AC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E1B8607AC
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:38:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C2AAA4C063B
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:38:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42168)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFFzh-000000007x8-3r09
 for buildroot@buildroot.org; Tue, 21 Apr 2026 18:38:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 20:38:44 +0200
Message-ID: <20260421183845.2456995-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260421183845.2456995-1-bernd@kuhls.net>
References: <20260421183845.2456995-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776796726;
 bh=FsdJR8Nw8jIuqEaGtl16a+ST+6cpLeL2YRaJmYhOo4Y=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=iAFpHNIlRBd7SqTrYQQ9xVIDH5rj2K3m/uacUEmcmNiBc4qwstGR70shErDM+4Hwp
 3b82b+t7CiNcfz6ZDU8m7LDL23F7T7kyHEGRqQK1ma+px/1nyYfRlZgURbQGHNKAbm
 TWnbmG9PTt4vXxcturmBzM1/lQHjmzwypFje1qUP805Ja7a+xIQaB9WnVLBKSGmGqy
 7kD8/HMlfltxeFcmg795A1ihpiIkF/L19vSt2O9VyiCN57cVTUMx7brMpPL3iQwKw1
 glyxS4j+53YvsjuBlMQO9dFsN1aznnR+SZ3Ok/Ax4f9dTkboRdnThAPfRBd6gybGiT
 JMtKb0JI/N+nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=iAFpHNIl
Subject: [Buildroot] [PATCH 2/3] package/neon: fix build with zlib
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

Building this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_NEON=y
BR2_PACKAGE_NEON_ZLIB=y

does not build libneon with zlib support, quoting configure log:

  configure: zlib not enabled

although the configure parameter

  --with-zlib=/home/bernd/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot

was used.

The reason is the addition of "=$(STAGING_DIR)" to --with-zlib which was
added to buildroot in 2008 with commit
cc6562ff839502a65a3b202ffe7fa3c67bae0856.

The upstream code, which expects only "yes", all other values lead to
the else-condition, is unchanged since 2004:
https://github.com/notroj/neon/blame/0.37.1/macros/neon.m4#L478
so a backport of this patch to LTS branches should be considered.

With this patch the configure log shows:

  checking for zlib.h... yes
  checking for inflate in -lz... yes
  configure: zlib support enabled, using -lz

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/neon/neon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index e7872df3c9..39abbaef48 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -16,7 +16,7 @@ NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NEON_CONF_ENV = ne_cv_libsfor_bindtextdomain=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
-NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
+NEON_CONF_OPTS += --with-zlib
 NEON_DEPENDENCIES += zlib
 else
 NEON_CONF_OPTS += --without-zlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
