Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B07CF58E6
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 20:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA0084011;
	Wed, 19 Nov 2025 20:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2v2E_7WTldcX; Wed, 19 Nov 2025 20:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD98183E4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD98183E4B;
	Wed, 19 Nov 2025 20:21:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 153412A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0726F408AB
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SH02Ot1KpBgP for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 20:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B572740834
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B572740834
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B572740834
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:21:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CFF0FA4C72B4
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:21:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42240)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vLog4-000000005Th-1lzJ
 for buildroot@buildroot.org; Wed, 19 Nov 2025 20:21:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 21:21:20 +0100
Message-ID: <20251119202120.752806-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763583680;
 bh=rqxXS+KeQNQbhfNK0HGFk1Bmec5OZSutXOUEhpDOCE8=;
 h=From:To:Subject:Date:From;
 b=P6h2IDQOBiN+Sfntick+G6WO5itqVbebb+PINfHAVWX5tBCyHgOBvRzOpOgbzvqnW
 R/RzAszmKcz8yOfgJaVlc8es56iUDF+zVcQ0mJK7kaqYQ8cOU4LAvtkgAyJS5oeujc
 fH+qOFJaVd6iAE/hDCpJKfqxHM3Q02fUZTAIESPN/MnTbFcKGOpGAozBiy/bzaf8N6
 CXdAS18/TnZPRgPSoegi3UwWHpbINPwHuwELdxHGZpL6MfQj4EimIlZCb/InZJmUnA
 hgMWhQAOMUmTSSxiA5x+Eg9KEDZMu8jsAGWCDYaRxxqL11HA61WU96+Qm3hS2b0pfA
 P2pY8PoI/vBUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=P6h2IDQO
Subject: [Buildroot] [PATCH 1/1] package/pcre2: bump version to 10.47
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

Release notes:
https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.47

Updated license hash due to upstream commits:
https://github.com/PCRE2Project/pcre2/commit/4f5a2ada2ec070896f96a2652ae05df41c4be14c
https://github.com/PCRE2Project/pcre2/commit/1fffb0d44e7a62ad290cf24586c78bc04b689144
https://github.com/PCRE2Project/pcre2/commit/d8a9f2fe55b47934cc6095df6e113e7986805064

Added license file for sljit:
https://github.com/PCRE2Project/pcre2/commit/d8a9f2fe55b47934cc6095df6e113e7986805064

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pcre2/pcre2.hash | 7 ++++---
 package/pcre2/pcre2.mk   | 4 +++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index bd2422d991..17f15c0fdc 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.46/pcre2-10.46.tar.bz2.sig
-sha256  15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39b7cabf7db883299f  pcre2-10.46.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.47/pcre2-10.47.tar.bz2.sig
+sha256  47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7  pcre2-10.47.tar.bz2
 # Locally computed
-sha256  9cf7ac6976099a1d856826d3ef1b093bd6b84489dc6100628ac79e740cf9885a  LICENCE.md
+sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
+sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 1d0a3b845f..f2b5608150 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.46
+PCRE2_VERSION = 10.47
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
@@ -22,6 +22,8 @@ PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_32),--enable-pcre2-32,--disable-pcre
 
 ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
 PCRE2_CONF_OPTS += --enable-jit
+PCRE2_LICENSE += BSD-2-Clause
+PCRE2_LICENSE_FILES += deps/sljit/LICENSE
 else
 PCRE2_CONF_OPTS += --disable-jit
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
