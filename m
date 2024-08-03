Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB927C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F5274043A;
	Sat,  3 Aug 2024 10:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AV9RWgrTS2N1; Sat,  3 Aug 2024 10:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3710440450
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3710440450;
	Sat,  3 Aug 2024 10:45:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB9831BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9930F40450
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQlshiSWc7ax for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:45:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 516D54043A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 516D54043A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 516D54043A
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:45:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 201AEA4C013B
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:45:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46246)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCGN-0000000039S-323r
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:45:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:45:27 +0200
Message-Id: <20240803104527.2574127-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722681928;
 bh=GtTb88D7ChGL704frafs3nZYr1+XAha4HE8ns3DqyBg=;
 h=From:To:Subject:Date:From;
 b=lwp+plKDqprFj7Nott5kviAwZCHilvB93jVMI8Xxf+gcpvcU94MrzkJDZJE2epw33
 UPEWNSto0moi9x+po9svkhEgKo50AbQYv5i4knjeRnL6IP23D7GIKGnPg+Gfti7PUU
 s62SSztvZypIDaMnt5Mt0nHiwf758yeAG6x6IwJG0qpEcktxRgGp1jXvZu3iFwflJ+
 FWTW+mA5l49cejeDhCRKfpWVCqEYtThDJ6exDhcVgDLGCIsIannk393v8/AgOFM1AD
 FSzTnBOacN29pRXahpgtEgr1ZFVW0TRLDLi3PYsJLUkTz7Pqyis8NBHT9Luh+1t0yN
 1EYVELN1HvkWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=lwp+plKD
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.20.3
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

Rebased patch 0001.

Release notes:
https://www.samba.org/samba/history/samba-4.20.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...d-pre-built-heimdal-build-tools-in-case-of-.patch | 12 ++++++------
 package/samba4/samba4.hash                           |  4 ++--
 package/samba4/samba4.mk                             |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
index 1c4de6a02e..eb0ea099b7 100644
--- a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
+++ b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -32,8 +32,8 @@ and hence the check, in bundled mode.
 BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
 
 Signed-off-by: Uri Simchoni <uri@samba.org>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for version 4.11.13 & 4.17.7]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for version 4.11.13, 4.17.7 & 4.20.3]
 ---
  wscript_configure_embedded_heimdal | 11 +++++++++++
  wscript_configure_system_heimdal   | 11 -----------
@@ -43,10 +43,10 @@ diff --git a/wscript_configure_embedded_heimdal b/wscript_configure_embedded_hei
 index 8c55ae2..4fdae80 100644
 --- a/wscript_configure_embedded_heimdal
 +++ b/wscript_configure_embedded_heimdal
-@@ -6,3 +6,14 @@
- 
- conf.define('USING_EMBEDDED_HEIMDAL', 1)
- conf.RECURSE('third_party/heimdal_build')
+@@ -13,3 +13,14 @@
+ # when this will be available also in
+ # system libraries...
+ conf.define('HAVE_CLIENT_GSS_C_CHANNEL_BOUND_FLAG', 1)
 +
 +def check_system_heimdal_binary(name):
 +    if conf.LIB_MAY_BE_BUNDLED(name):
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 353736f3b2..d2512f2e0a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.20.2.tar.asc
-sha256  f969ffed58ccf3e85cbbcc0e33a1726d025c2b40f42a653b1125b82b92d2e0e5  samba-4.20.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.20.3.tar.asc
+sha256  afd5a9bb03e5c921c4c1d4e4b4fa6ea16cf798d94e5e5bffb9fd61716641cf30  samba-4.20.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ec0ffd70bf..d48a02140f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.20.2
+SAMBA4_VERSION = 4.20.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
