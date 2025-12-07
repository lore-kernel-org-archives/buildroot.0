Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFA0D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 12:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C0A540826;
	Sun,  7 Dec 2025 12:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TWBgibYQEdf; Sun,  7 Dec 2025 12:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C673F407A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765110209;
	bh=paFFRkbhJN6YZQ6Qc2zKYB3XcdtPRBSXO2oWNV7Muwg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SnEwcm6j0vWkTFRHRCgg9+60aV40yH+VHV20vk9QxXu3g4g9HZXdL4c+vcKH9U/dJ
	 f3QDRvbNylrRTDsoJcGWff+RwDZaNMYi91K55WUrwap0KgRXe3M0YYF+o6Y4T2M2Zd
	 jISZlZD4jes3fNIKoLRlCmy84CBLBdFh8rxlVPJA/O6czhs7/0wgcpYGXQaTJnyc79
	 2b8XN5/3ylJZPpmudMBu5QP1FvFwHa9cGVChaPHSQA1yFx/qBhqTjkW+7tSJZ8xFP6
	 sQoCnKTocwQ/XGbbRtwVzICtxwKohZbWx4t7Uu3q6E0l+f4V7khD5T+BbmcRBdAiFw
	 1cUqpyhGeJGxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C673F407A4;
	Sun,  7 Dec 2025 12:23:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB565E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CF1460872
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGcY1XPn-Fze for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 12:23:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AA63607AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AA63607AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AA63607AA
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:23:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DDC3A4C0629
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 13:23:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54698)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSDnQ-000000004wO-2bHT
 for buildroot@buildroot.org; Sun, 07 Dec 2025 12:23:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 13:23:24 +0100
Message-ID: <20251207122324.3523992-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765110205;
 bh=ufVK3q9bjEmLq6tkAwEzjRMpCZqs/M9+BZ67giv1Wfg=;
 h=From:To:Subject:Date:From;
 b=Xjcltl6dTHYrzKwqvppPLlwTBh3wPQ/wKrGG9vo61+iuytBobSgGi+0KzoizRps2O
 VY+2Ck/ahjgdrrwCZmSQ/ALIYCf0tk7JUzIIR1aUZV155CnyOftWWZW/KO24kD8QfI
 E6Nc1hWnjsir1encc7Ma3I2g0rrcsuDXGnqU7n8naS++l+dF1Q7NXl5disp9PGGkFN
 LkmqZmZ4irZgutn6ZZXueKkZDkwuNfH/MKjyI8FGQjLpsBt6I3hzzmThmbzobWNnG8
 6vSy9j7xMhAQUUhfW8Fjzt8fY8qPQs9mBKTMPOt5X3qsqr1amaAVTIGi+kDlAwHLe2
 /fuO4TVbn7QGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Xjcltl6d
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel:
 update SITE
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

Updated URL of git server, tarball hash is unchanged.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 879abdd74d..ddd66598a6 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 XDRIVER_XF86_VIDEO_INTEL_VERSION = 31486f40f8e8f8923ca0799aea84b58799754564
-XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
+XDRIVER_XF86_VIDEO_INTEL_SITE = https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git
+XDRIVER_XF86_VIDEO_INTEL_SITE_METHOD = git
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
