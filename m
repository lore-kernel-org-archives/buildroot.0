Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CF8E9D812
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 16:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3678340851;
	Sun,  5 Apr 2026 16:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB-xPPMvt_Zv; Sun,  5 Apr 2026 16:27:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 540D440852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775406436;
	bh=fWBrJhislfhD7IBrxAK76LS4p382hNB1xIhW3RtR9rA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lWOzMvPTrKUBGO+q8V/qkMKdQbvh/CRuouKY3J6qCj267C5WgWH7J6ZuezAyvH9ZU
	 wkdC6FsznwqSrou7t+CpNg2CgrSOx7aP7zHG2Y92MpsgJDB8+puVMvti/KxygZ0i13
	 /NxYsX5swEAPh/HVibPa7n3bu49QNMAg4vxeFWdZoz6ftVv+hGNsSwaJNy7c+CzSuZ
	 8nrxITChQGLuPOiaLhJN/hvVfVbqHqVGMWenk+smVBor0vdTgofu+HM2E4Oyw0PM+Q
	 YgfTdhMrj103XYjwIwOu+b2AuSi7P8XUVbUEYyl8z3K0J6u1OSiNbuX69K2+TkRXVu
	 fX3JVDjlsNMlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540D440852;
	Sun,  5 Apr 2026 16:27:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31ADC1EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 16:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1754B40851
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 16:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqJfcemOySyI for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 16:27:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 050E74084B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 050E74084B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 050E74084B
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 16:27:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2DE05A4C3447
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 18:27:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46712)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9QJb-000000002Zc-3WT4
 for buildroot@buildroot.org; Sun, 05 Apr 2026 16:27:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Apr 2026 18:27:10 +0200
Message-ID: <20260405162711.620128-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775406432;
 bh=h0FpbOiXbbplP2//AVQBVbNwVwmHHDcNrggXYgt6Ti4=;
 h=From:To:Subject:Date:From;
 b=Cgb2wTqNxbQn7ondzqDLOR9NaV9K60JZkHiYZKFPdVlMS0TJ5E+HExLWKpDh0Ekia
 h/WY5wrSiWHGBYrRZDAhc9rFv8LPHcpeHviSNauDFzaUFuiqqlNIWPBTb+Rpvd7ae6
 ecssfhhOMDbQFXknmIqxC0ZzAIn1nX8HUWf+cf44cMR+MdiKOpqLMf4K9f8D0U7vYm
 ygkzVWcAkcQ+12ajyQgZNfHLPOEBrv5lGdUKWvsWxP9W2KhzB+/WuzgRFrofrrv8U7
 yQB1ACUiIbicF3a+DA8DiqOhmUlNMOxBDoQ1T+FM/GWOdte9cJRYvPfcUl2/JaUBBr
 Db5VMWmPVrXhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Cgb2wTqN
Subject: [Buildroot] [PATCH v2 1/2] package/leafnode2: fix build without
 pod2man
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

Fixes a build error when pod2man is missing on the host:

  pod2man ./tools/lsmac.pl >lsmac.1 || { rm -f lsmac.1 ; false ; }
  /bin/sh: line 1: pod2man: command not found

Fixes:
https://autobuild.buildroot.net/results/999/9996e81429f90f4615755827ac182094d416c467/

Although the build error only occurs since 2026-03-05 it should be
backported to LTS branches because the last change to the buildroot
package dates back to 2024.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/leafnode2/leafnode2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 566aaf3d55..8c44071209 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -11,6 +11,12 @@ LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
 LEAFNODE2_DEPENDENCIES = host-pcre pcre
 LEAFNODE2_AUTORECONF = YES
 
+# pod2man doesn't work when cross compiling
+define LEAFNODE2_DISABLE_POD2MAN
+	$(SED) 's/GENERATED_MANS=lsmac.1/GENERATED_MANS=/' $(@D)/Makefile.am
+endef
+LEAFNODE2_POST_PATCH_HOOKS += LEAFNODE2_DISABLE_POD2MAN
+
 LEAFNODE2_CONF_ENV = \
 	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
