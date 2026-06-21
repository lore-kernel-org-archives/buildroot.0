Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037F1CD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 11:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAB316FCB9;
	Sun, 21 Jun 2026 11:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-Qv46VlZdJ5; Sun, 21 Jun 2026 11:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96D986FCC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782040171;
	bh=ImGbSYGzuawddswxPgXAZmo8ezbt8e/Lq/LtuiH0yL8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HvdkRn2OE0GTXvK7h8/deCtw7r9/jUY3bW0O40n14ZJDb4XiLapWUOYBpfsOzrrql
	 kagSOFlDZ7W5mMIMt8e1czBlVYef193ndgc0JpZLLG2IMOViu/wqLyPS4hE/5l9ZA8
	 LMRZqiE7iKIWJdSDB3PrsbjC+Qp6I3hQdEye8jIFhHs5TwjDSXKWXWejFAdPV7Bi92
	 BCFxiiSWK2P+tizuqfREY2JX1bR1tQ/36hyecdLOJ6RBhgmjUTt3pxnEBq3LoCsvwO
	 7mdRoXf0Rld+O0P4QZckfavK2rSAvRGNZxcfXRTcFTPamzNk9vigT1pZxKSNcgmkrP
	 5as6TYjTIngDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96D986FCC3;
	Sun, 21 Jun 2026 11:09:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE25B118
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 11:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 979AA4019B
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 11:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Bm3Wc0RsWwE for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 11:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 411E840156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 411E840156
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 411E840156
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 11:09:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9237BA4C0E86
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 13:09:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wbG3I-0000000027J-0uGx
 for buildroot@buildroot.org; Sun, 21 Jun 2026 11:09:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Jun 2026 13:09:24 +0200
Message-ID: <20260621110924.1041212-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782040164;
 bh=MFEuyiGO1C0lvGfByC/3L1y+yxVREqgwPBvU8frRlak=;
 h=From:To:Subject:Date:From;
 b=n1KHplPAwMQbJIni+um7Fb+LDS9j+YF1NSBTJfF+h0/jkOV950cfwuuxExX/jrfnX
 l8EpAaSELqRNA5EWKd3p2wZNDzpgytVnC43i8cR9Q3j06/7MAG96O0Cxs9EVPID71P
 jgpvKDyr5sJ9IgpCcj5bW0qWzoKCg4ISE0eorHcMBvw6B04ePApDz8EiHH32Bh3CYS
 YtQSVr/QTWMtggZDrq97DVF9u+tFLRHwACwWz9QtCDr8b2h+hK/dsUZ+aE6KPRRQqi
 sCO6zjti3WMH1btO9yNd92n2H9L/7EV+8NG8xP7FFTAgSzgcEC+/uN7z6D/sJpV1Ng
 1wlcrFxrtK5tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n1KHplPA
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: don't treat ld warnings
 as errors
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

Microblaze ld emits warnings like:

/home/autobuild/autobuild/instance-32/output-1/host/lib/gcc/microblaze-buildroot-linux-gnu/15.2.0/../../../../microblaze-buildroot-linux-gnu/bin/ld:
 FDE encoding in /home/autobuild/autobuild/instance-32/output-1/host/lib/gcc/microblaze-buildroot-linux-gnu/15.2.0/libgcc.a(_udivdi3.o)(.eh_frame)
 prevents .eh_frame_hdr table being created
/home/autobuild/autobuild/instance-32/output-1/host/lib/gcc/microblaze-buildroot-linux-gnu/15.2.0/../../../../microblaze-buildroot-linux-gnu/bin/ld:
 FDE encoding in /home/autobuild/autobuild/instance-32/output-1/host/lib/gcc/microblaze-buildroot-linux-gnu/15.2.0/libgcc.a(_umoddi3.o)(.eh_frame)
 prevents .eh_frame_hdr table being created
collect2: error: ld returned 1 exit status

Since the bump of the package to 1.7.1 with buildroot commit
30e38505e4bc6f8313509bdee2418024693088fa and the switch to meson as
build system '-Wl,--fatal-warnings' is passed by default:
https://github.com/linux-pam/linux-pam/blob/v1.7.2/meson.build#L153

The build fails, so don't treat warnings as errors by appending
"-Wl,--no-fatal-warnings" to LDFLAGS.

Fixes:
https://autobuild.buildroot.net/results/ce2/ce20c52c8972e9d836d033913d2a913120df4549/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/e14a88bfc320675b21a43ccb630fc460136fccfc

 package/linux-pam/linux-pam.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index a4be4fa3b6..69bc7b1541 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -26,6 +26,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LINUX_PAM_LIBS += -latomic
 endif
 
+ifeq ($(BR2_microblaze),y)
+# Microblaze ld emits warnings, make warnings not to be treated as errors
+LINUX_PAM_LDFLAGS += -Wl,--no-fatal-warnings
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LINUX_PAM_CONF_OPTS += -Dselinux=enabled
 LINUX_PAM_DEPENDENCIES += libselinux
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
