Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895AFCD3445
	for <buildroot@archiver.kernel.org>; Sat,  9 May 2026 18:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C916F554;
	Sat,  9 May 2026 18:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5l9_TEG7dgv; Sat,  9 May 2026 18:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1077161B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778350772;
	bh=xX1oy/7nDBKWGB4I8HL40wqYTlcj0HPVpT7sKvrSOlU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IdYyT28189b6BpCly3VtNDc4IblT92zm1kUbp8qgvoMm9fkfaCUAX/DS7RpfCahVm
	 yP4XFuTHk2hc+IyjjI6Hshd1140rtQ0OQCSzi31ef1A1wmpkq48r+ZEF2WXiFs1UxO
	 yjXliq6Hqpkqlt2MjL547GbmqLC9W6ByxSaYkaO1Ol3Kn/oVwRJaFswmubQK1mElrj
	 O3C2QFA+u5GjquMydHKXJPQghOCji70orn5Iz1uTlKiisSHOGGgBWWHJZWf0wfkRzh
	 5sqHwC/a4CRYg8KgjPFFY20uNgkopcQJzbpkIqYvo13XL6YzupmjbEoIv0hl0jxINq
	 Y76xQ+Ex3fmnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1077161B93;
	Sat,  9 May 2026 18:19:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAD75272
 for <buildroot@buildroot.org>; Sat,  9 May 2026 18:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE73061B93
 for <buildroot@buildroot.org>; Sat,  9 May 2026 18:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5dUesirOxGf for <buildroot@buildroot.org>;
 Sat,  9 May 2026 18:19:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFDAF61B8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFDAF61B8F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFDAF61B8F
 for <buildroot@buildroot.org>; Sat,  9 May 2026 18:19:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cd35.dip0.t-ipconnect.de [79.214.205.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D9EBA4C1071;
 Sat,  9 May 2026 20:19:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37434)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wLmGq-000000000az-1egZ;
 Sat, 09 May 2026 18:19:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  9 May 2026 20:19:24 +0200
Message-ID: <20260509181924.1370490-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778350764;
 bh=zxxkpUr+M4zFHooJwC4rXt2ECnQnhVzmSvg87vfsbq0=;
 h=From:To:Cc:Subject:Date:From;
 b=mqCYM/lI7/RXN/rx8FR82usGAtKInr5WWP9Tfxbqz02N9ZXQTkzheIzuAAtTXZcpB
 94cWBLyZHZLtmVlpVMlBWycG6yxY24K9tvIRouUEYKVk4jN3Ot78rexVI8XO7BmO/n
 ggbPg03KavWHZvaxR47vZWiS5nuZkWyyht4KHOtAW/3E3DIRtDu3VW1NacLF8aAngg
 yvCmrsB15Mlt6BzRCKsj5iPUxcjUfzZ5/QmOklHTc+VXzt8dYcNynbQZhpovEJXX48
 ysR13KzmKKZ9a1i+J1CC1cD70+GlzlTXuKaaszS5Gz/crHoxZOMbztSji/KAlYGv65
 KLSSWHxjOBbXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mqCYM/lI
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump to version 2.43-27-g4070d808b
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

Fixes the following security issues:

CVE-2026-5450: scanf %mc off-by-one heap buffer overflow
https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0009;h=3c297fdc8018d26dfa3b1b269b8fdc2d4ab07e81;hb=HEAD

CVE-2026-5928: Potential buffer under-read in ungetwc
https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0010;h=ae9953fb717886b93ea55fdede14450a0d4835f4;hb=HEAD

git shortlog 2.43-22-g8362e8ce1..2.43-27-g4070d808b

DJ Delorie (1):
      include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h

Florian Weimer (1):
      Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)

H.J. Lu (1):
      abilist.awk: Handle weak unversioned defined symbols

Rocket Ma (2):
      libio: Fix ungetwc operating on byte stream [BZ #33998]
      stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index c9215dac6f..a6e6874e1f 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  c5d012c0417d1a8d72e72ea2cd917422fa04f9ab525f418c537cad5cd9042803  glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9-git4.tar.gz
+sha256  668f890b45fd8d32bb73783ad3b75fe1f396c5c3aa3c3832e616b4c3f0c6066b  glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0a44015818..09ac89f336 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
+GLIBC_VERSION = 2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -40,6 +40,9 @@ GLIBC_IGNORE_CVES += CVE-2026-4438
 # Fixed by glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 GLIBC_IGNORE_CVES += CVE-2026-4046
 
+# Fixed by glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
+GLIBC_IGNORE_CVES += CVE-2026-5450 CVE-2026-5928
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index ec906fad22..4890e095e3 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
+LOCALEDEF_VERSION = 2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
