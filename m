Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50218CCF9F8
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 08:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C32760821;
	Sun,  9 Nov 2025 08:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdbfQwxnZmla; Sun,  9 Nov 2025 08:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3143160823
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3143160823;
	Sun,  9 Nov 2025 08:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4260FFA
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 08:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AFE960839
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 08:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oa2kgRKTkUCA for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 08:00:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E53466085C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E53466085C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E53466085C
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 08:00:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C288A4C3B89;
 Sun,  9 Nov 2025 09:00:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40984)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vI0LL-000000006jI-3wir;
 Sun, 09 Nov 2025 08:00:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Date: Sun,  9 Nov 2025 09:00:11 +0100
Message-ID: <20251109080011.481333-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762675212;
 bh=OGan5FbwXAeIUYV8BgpZCVlACTNQJEm69hyNP6Mare8=;
 h=From:To:Cc:Subject:Date:From;
 b=hNgyo683Q+ya1J0GW89a0kpnEB8Iap2Q1jfPe548PEpmsIgPocS9ckR100NeKj2fX
 tk1UeU05XN74u8m50qTMMMFcdm7sNha14+UkSMY07ZvVg0UKMlDxvV/YiYY55I2IgT
 HnBGMilHgN/QgsSTy+v7PipYALVE3M38BT8lZYaUlBmC3hpwYLLTxG4FQ/uS99vPl9
 gl0J5Xm8IvIR+doSSQUMaYhstRu8IkGFIxg3jGocQU3GFYxhoQCtAguwscAVQlZ3yk
 OByRhyCJbKtKiwCqY0MKD9oZnd2zRYOxN4DXNjqLdbPsUD7V69mXd+LVWk5gnlzexi
 JkRVTVwMSuQyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=hNgyo683
Subject: [Buildroot] [PATCH RFC 1/1] package/libcap: Fix fedora build
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

Fixes:
https://autobuild.buildroot.net/results/f6d/f6dc61a9d57e282691b87a3a8fadcb5d5ea8fd8b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
On my Debian system I cannot reproduce the build error.

The autobuilder log only shows Fedora machines failing:
https://autobuild.buildroot.net/?reason=libcap-2.77
so I added a Fedora patch hoping it fixes the problem.
CC'ing the autobuild submitters as well.

The Debian build still succeeds.

 package/libcap/0001-fedora-fix.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/libcap/0001-fedora-fix.patch

diff --git a/package/libcap/0001-fedora-fix.patch b/package/libcap/0001-fedora-fix.patch
new file mode 100644
index 0000000000..26f5a5b4d8
--- /dev/null
+++ b/package/libcap/0001-fedora-fix.patch
@@ -0,0 +1,22 @@
+Fix fedora build
+
+Patch downloaded from:
+https://src.fedoraproject.org/rpms/libcap/c/d3979ba09dfa5020ce71a12147eec800295dc5ae?branch=rawhide
+
+Upstream: https://bugzilla.kernel.org/show_bug.cgi?id=220691#c4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff --git a/libcap/Makefile b/libcap/Makefile
+index f0eb87e..e90a950 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -80,7 +80,7 @@ $(PSXTITLE).pc: $(PSXTITLE).pc.in
+ 		$< >$@
+ 
+ _makenames: _makenames.c cap_names.list.h
+-	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@ $(BUILD_LDFLAGS)
++	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@
+ 
+ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
