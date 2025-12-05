Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E694D3748E
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 19:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F03A6848BB;
	Fri,  5 Dec 2025 19:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHoRuFOocewT; Fri,  5 Dec 2025 19:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A6EA84948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764963068;
	bh=Pw6OxPw//FKvp6Di0FrgajGDqloB0idTraQesxsgjbA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K3LxulLhOC0qoNkLwbEbm9z07/bQJ2NiXqTqwOgFs9oRcqktOBkwWj54UzgvCvY72
	 7JuNKiOiOz3rBVdGJPsUcsRdGt6BRhKM3gtAWvyJf7fFCiDGg89EI8yvsIZ5zRaqpo
	 BHtOCqeOz7u0YZ38spVk+45XAgOH+Wbmce0Xi2yKLho1VxQNwGx46exVVhzSjUKwlM
	 Hz7x3YUpLuBaC7t6o5uhN3YYFU3kMg2pXFk2VRSdhgBKmoB7soD37stAICkmxysoqN
	 g4Blaavk4iwqTkidK8v5xHKCZ0A2Rhcho74DmCHE3rl0EzGO9Wx75r74FUle9hB1Ev
	 5vveYKI1Tj7uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A6EA84948;
	Fri,  5 Dec 2025 19:31:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F4DE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E81AB84948
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsrHZoQZ2OaA for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 19:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 386BE84549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 386BE84549
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 386BE84549
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:31:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17A97A4C00A8;
 Fri,  5 Dec 2025 20:30:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40158)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRbW5-000000006qq-1GRh;
 Fri, 05 Dec 2025 19:30:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  5 Dec 2025 20:30:56 +0100
Message-ID: <20251205193057.1884663-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764963058;
 bh=3MdxqX6TwSQ3CtMWCBQnQqCWPwhjZjb0g0zJlenRPw4=;
 h=From:To:Cc:Subject:Date:From;
 b=XzgjO/REbJd5q0BhnEu1g2TkT87WC7hc7XJXwVxkEmsGt9ROAzLITKg4a80RK6wRL
 gkuh3UWOKRQ2/lA/PLYgSGtrI4KLTAObJVSqWq687PfdiybQN61xvVYs+s6JaCDiZF
 7eYmoULoR4oxLwFFVOnZqmKdGEA8Ihk8+aREZV416CRJfj2Tba72OYcpxH8c7MBoqC
 H2l4Lr35YegpTGoSBmj+6aRqoiUl+inWlmCeZR1zi3AP3fqVghdtnCm/KxKqcVJvBw
 OzCd2Y4G9KXgo5KXfN8uY/gc2rjL1kq/DxWJgTWnEMuXIfFQ6Mo3J4E6YUsmDjoKN5
 3qutVD2X50HLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XzgjO/RE
Subject: [Buildroot] [PATCH/next 1/2] package/libsidplayfp: new package
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

Replaces libsidplay2 as dependency in mpd 0.24.0:
https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.6/NEWS#L125
https://github.com/MusicPlayerDaemon/MPD/commit/7e2538e07a80bd12baf2e7c328e7d1a64eb434f9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/Config.in                      |  1 +
 package/libsidplayfp/Config.in         | 13 +++++++++++++
 package/libsidplayfp/libsidplayfp.hash |  3 +++
 package/libsidplayfp/libsidplayfp.mk   | 20 ++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/libsidplayfp/Config.in
 create mode 100644 package/libsidplayfp/libsidplayfp.hash
 create mode 100644 package/libsidplayfp/libsidplayfp.mk

diff --git a/package/Config.in b/package/Config.in
index 92b72194e3..1c80b779fc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1559,6 +1559,7 @@ menu "Audio/Sound"
 	source "package/libreplaygain/Config.in"
 	source "package/libsamplerate/Config.in"
 	source "package/libsidplay2/Config.in"
+	source "package/libsidplayfp/Config.in"
 	source "package/libsilk/Config.in"
 	source "package/libsndfile/Config.in"
 	source "package/libsoundtouch/Config.in"
diff --git a/package/libsidplayfp/Config.in b/package/libsidplayfp/Config.in
new file mode 100644
index 0000000000..43841173b1
--- /dev/null
+++ b/package/libsidplayfp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBSIDPLAYFP
+	bool "libsidplayfp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libsidplayfp is a C64 music player library which integrates
+	  the reSID SID chip emulation into a cycle-based emulator
+	  environment, constantly aiming to improve emulation of the
+	  C64 system and the SID chips.
+
+	  https://github.com/libsidplayfp/libsidplayfp
+
+comment "libsidplayfp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsidplayfp/libsidplayfp.hash b/package/libsidplayfp/libsidplayfp.hash
new file mode 100644
index 0000000000..880c31ee28
--- /dev/null
+++ b/package/libsidplayfp/libsidplayfp.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  7c6ab283fda53d34973fa266fc3809e16964dd8ccb7edcc11516ef5e3f66b3cd  libsidplayfp-2.15.2.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libsidplayfp/libsidplayfp.mk b/package/libsidplayfp/libsidplayfp.mk
new file mode 100644
index 0000000000..3aeeb19013
--- /dev/null
+++ b/package/libsidplayfp/libsidplayfp.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libsidplayfp
+#
+################################################################################
+
+LIBSIDPLAYFP_VERSION = 2.15.2
+LIBSIDPLAYFP_SITE = https://github.com/libsidplayfp/libsidplayfp/releases/download/v$(LIBSIDPLAYFP_VERSION)
+LIBSIDPLAYFP_LICENSE = GPL-2.0+
+LIBSIDPLAYFP_LICENSE_FILES = COPYING
+LIBSIDPLAYFP_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+LIBSIDPLAYFP_CONF_OPTS += --with-gcrypt
+LIBSIDPLAYFP_DEPENDENCIES += libgcrypt
+else
+LIBSIDPLAYFP_CONF_OPTS += --without-gcrypt
+endif
+
+$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
