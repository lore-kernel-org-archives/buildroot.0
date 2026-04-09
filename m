Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB53DEA3C48
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 10:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C5A8299D;
	Thu,  9 Apr 2026 10:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkWsm-Is-6xG; Thu,  9 Apr 2026 10:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55D4C829A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775731009;
	bh=lIqvHj2/GmCUVkpY/+6KCTfNUy9GbMChPxk0ndDFhQs=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AAmut33T+0rL7hFAO4y3Hp4SnzASgqC5OjSY85QlZsyc66XcU2Oz0Onks0GkIlw+v
	 MG7552qo13ns5uXvckoGP3evWra1N+nyd8fmf0GQ5U+/1HkQhiayZrNAv9zHqcS8wv
	 zwps4JI+dYBeTRmfUO9KzrONVzYac/WdNCnq90hjSvpi0qcJNOs9h6ws43Ujfx4As+
	 CWnEDrI3gX5r6NftU/Jncz4r1+ijMq4f6jNW0IetM/lLL5lINam5hGMpK13cVbLBeL
	 QT/gn2dscwRuw/nfumW0N5ZYGltjRdoUVURRd+V0j2DeBIwqEQ+QN7N5KuxTukr+QT
	 2rx7DOIM2H8tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55D4C829A9;
	Thu,  9 Apr 2026 10:36:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B781F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 10:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAAD660891
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 10:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLCApscHGVWi for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 10:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:7:10::bc0b;
 helo=smtp-bc0b.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDB26607E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB26607E0
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch
 [IPv6:2001:1600:7:10::bc0b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDB26607E0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 10:36:45 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4frxF55fjCz676;
 Thu,  9 Apr 2026 12:36:41 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4frxF51nQsz8Fs; Thu,  9 Apr 2026 12:36:41 +0200 (CEST)
Date: Thu, 09 Apr 2026 12:36:27 +0200
MIME-Version: 1.0
Message-Id: <20260409-openssl-3-5-6-v1-1-3ced4c3e7b73@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ77som1TT0K+Khmm27pUTJqgji3
 xvrcRhmNlBOwgr3YoPEi6gMMYO5FNC/H/HFKCEzWLKOKvI4jBxVv3jFGh0Gb01HJtwce8jNmPg
 p6//XHE1dki1XaE+lc/fhfjp+sO8/HYe6Q3wAAAA=
X-Change-ID: 20260408-openssl-3-5-6-d821b01d76e8
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1775731001;
 bh=bvXdZxc2fRoZycQhqJ+qdprZnsKKknxImoaQqaDhdhc=;
 h=From:Date:Subject:To:Cc:From;
 b=aRbGZlAyjmFOzU0geNh5gqHsjLjqwghfASqU2Y5xxHaC/LMyl5/1E3IeXITOSSqNp
 FhTKtroz7APjs6/tEryagGvTdxYF+qKCupX2Ucr6iLnFzSAjMuxcQIkQUTgOmcFzRl
 s1bwX5bFwO+3ySi6WG7D7SdpVtHpQ4fii+l5ohqxG0CPQaDrGsg3WQCWqK2CRp0NC5
 tW8uKGvKeEYAeRomHzRvDWSEb3JzkVs4oJ6EbXUNrmWLwen+cRt1sGLv6e8JNL2jhg
 vi0PBaXrAL75hJdm0zX0q1eST6UkdYt7FCXCoM3D7rhd4TY/JTNDKNyv5yf5p5nAvU
 VtI5D47TjCycQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=aRbGZlAy
Subject: [Buildroot] [PATCH 2025.02.x] package/libopenssl: security bump to
 version 3.5.6
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

fixes CVE-2025-11187, CVE-2025-15467, CVE-2025-15468, CVE-2025-15469,
CVE-2025-66199, CVE-2025-68160, CVE-2025-69418, CVE-2025-69419,
CVE-2025-69420, CVE-2025-69421, CVE-2026-22795 and CVE-2026-22796, see
https://github.com/openssl/openssl/releases/tag/openssl-3.5.5

fixes CVE-2026-31790, CVE-2026-2673, CVE-2026-28387, CVE-2026-28388,
CVE-2026-28389, CVE-2026-28390, CVE-2026-31789, see
https://github.com/openssl/openssl/releases/tag/openssl-3.5.6

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This depends on all 4 patches from
https://lore.kernel.org/buildroot/20260319124247.2973165-1-jimmy.wesolowski@mobileye.com/

This is 2025.02.x specific because the only other maintained releases
have updated to 3.6.x already.
---
 .../0001-Reproducible-build-do-not-leak-compiler-path.patch           | 4 ++--
 .../0004-Serialize-install-process-to-avoid-multiple-make-dep.patch   | 4 ++--
 package/libopenssl/libopenssl.hash                                    | 4 ++--
 package/libopenssl/libopenssl.mk                                      | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
index 9353c1ae90..d283d8b329 100644
--- a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
@@ -12,10 +12,10 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/crypto/build.info b/crypto/build.info
-index 2c619c6..49ca6ab 100644
+index aee5c46766..84d94aa623 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -115,7 +115,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
+@@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
  DEPEND[cversion.o]=buildinf.h
diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
index 344b8d07b7..176375c000 100644
--- a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
+++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
@@ -23,10 +23,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index e85763ccf8..b671723813 100644
+index 5bf397eba0..806084ac0c 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -661,7 +661,11 @@ depend: Makefile
+@@ -662,7 +662,11 @@ depend: Makefile
  # Install helper targets #############################################
  ##@ Installation
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index e78b664aa5..781701532d 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
-sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.6/openssl-3.5.6.tar.gz.sha256
+sha256  deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736  openssl-3.5.6.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 2f844fd44a..837c3f0346 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.4
+LIBOPENSSL_VERSION = 3.5.6
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0

---
base-commit: 6b12d67f57b358fb3e37fd5fb5bf80d99963bd35
change-id: 20260408-openssl-3-5-6-d821b01d76e8

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
