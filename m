Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D879C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 19:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5B6B40616;
	Mon,  5 Aug 2024 19:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mqHOIEVmwOL; Mon,  5 Aug 2024 19:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACD8B40600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD8B40600;
	Mon,  5 Aug 2024 19:07:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04B591BF34A
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F364940220
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNOYwl9rNSy6 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 19:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9472340202
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9472340202
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9472340202
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 19:07:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bad7.dip0.t-ipconnect.de [84.161.186.215])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8B3EA4C0161
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 21:07:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51138)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sb33O-0000000005e-02YR
 for buildroot@buildroot.org; Mon, 05 Aug 2024 19:07:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 21:07:34 +0200
Message-Id: <20240805190734.3410938-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722884854;
 bh=OaBcwsIvQZ8NDUWyrbvmJ3JXjxc1lJeRvnVqp7XbQnk=;
 h=From:To:Subject:Date:From;
 b=riapnq8Yn0rPkBCjtCsNAcqysQ1HBNTW55LLRZhvuYzEPKASFFTcOpM5DXAxfypTA
 VYHm1ldadUDppktNREqec21lwNDMq+AIpo3Eyz8woXjnrjzdd3QXNuq7GUi8W+c+Pq
 IgOGdUceLAMz5/JyozIBzSQTjGukVPWx7g4GErhmGT2mhNKOJ8rrC7LoHpLTVXjz+/
 SM6hkLLbu855ku1af/ppvE1LbQO/+vdKyi703ct3SC6o7uvuRYugw/Q8EjIagjQXMj
 FhSBtNkqLNbOVPZvngdUZsFbTESShmD2zBzjNDlVe/cwywSHwkhmKGWZib2zHOs4Dx
 EhvUwsb0UEffw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=riapnq8Y
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.10.12
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

Release notes:
https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Release-Notes/FreeSWITCH-1.10.x-Release-notes_25460878#11012-release-date-02-aug-2024
https://github.com/signalwire/freeswitch/releases/tag/v1.10.12

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 3f16467e22..bcfa440750 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.11.-release.tar.xz.sha256
-sha256  7f9603a691220d9f47da42f3b19290b629b69dceb2eee56448f0a7cefcf9d1a1  freeswitch-1.10.11.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.12.-release.tar.xz.sha256
+sha256  e324e4ae063e692c42b93031157329bae339ea007e611d3535333deaed85aa47 freeswitch-1.10.12.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 6160fe5fcb..bef25236f0 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.11
+FREESWITCH_VERSION = 1.10.12
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
