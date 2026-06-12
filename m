Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F8BCD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 08:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2873983264;
	Fri, 12 Jun 2026 08:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geYyICcJTkS7; Fri, 12 Jun 2026 08:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C92683280
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781253805;
	bh=T3qgLRigFcAdQP78sxLkgjyaWixcXXolbzz8W4f3kOw=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ksI13uD/ANYR1X3DF/sMGizgfP2ySnOoq/OZ83SgxbmT/yxeenkQqewsoU1WKZ+81
	 pYolTZ82WtGaoS77yYjwYlBXgeBk3BURCHjwKJ1d25QIeR1zz2hmar722E4BoQyIqf
	 G8j+JGLTXRe+Z7+T8vN46VBZbm5J79Kqcz39z+R/fO60y9PA7JGMX212awznUuuJBr
	 Fs22EEDagmIrIdXzQ8tuFX6XRMVLaWbxAvg3kESaINpqP3StiwWewVvU94QV7NJejn
	 sxOJ7W0IY2OYtuGfttDpQVVWhklEE+umP27BFDTkgIqbCtbMs8v4x6YFM+s4GbbndK
	 gNFfhhfU/zkGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C92683280;
	Fri, 12 Jun 2026 08:43:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 560EFF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47DD5607A0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2D6CB7jFV_g for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 08:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.10;
 helo=smtp-190a.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 939876078D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 939876078D
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch
 [185.125.25.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 939876078D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:43:20 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gcChh73w0zq4n
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 10:43:16 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4gcChh3GMtz1RQ; Fri, 12 Jun 2026 10:43:16 +0200 (CEST)
Date: Fri, 12 Jun 2026 10:39:25 +0200
MIME-Version: 1.0
Message-Id: <20260612-openssl-3-5-7-v1-1-093c128bb691@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywqDMBAAf0X23JVkU1PsrxQPPlbdIlGytQjiv
 zfW4zDM7KAchRWe2Q6Rv6IyhwT2lkE71mFglC4xkCFvvCWcFw6qEzos8IF3dt7WXVN6R5CaJXI
 v2//3OpsiN5RvUF1K1+bN7ef8wXH8ABoUyEB8AAAA
X-Change-ID: 20260612-openssl-3-5-7-4e361adb9632
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1781253796;
 bh=3NqLFNkKc31ZFgR+Qhqn4YspEDeRz5sfbnpBepk3wEY=;
 h=From:Date:Subject:To:Cc:From;
 b=I7pB9KtHAIGwedZwXlC7SufKUVtko2gNjEZpNuSYqPdN3HNu3izmdnqYnUCcdzhw2
 CxF3T56T6qp4tL4HzpW+bqxXXT53ovNKRNCihrTu1h+mbTYaasD8sr7mw/fyIHBMDi
 Ezm+BuRVGQEA4C7X+U26Dtrc8hWsL6o+vOeuVhWnm1wcllHQbaYiR7iJ5ytPTfL2XC
 z7ErBNLO2Wnvd8qftsxPThVVSWvQKJEIQ4Fx4aToeCDZvyjoF73VTT7fhpPRj/1jd1
 9ZqQCzeHYOYJYwdtvk0aQ0p9mpC/Jb5txphJXsyx6U/Id5G6MJQn9oG6kxzRTTkQv+
 Sk0vpeRiqAuwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=I7pB9KtH
Subject: [Buildroot] [PATCH 2025.02.x] package/libopenssl: security bump to
 version 3.5.7
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

fixed CVE-2026-45447, CVE-2026-34182, CVE-2026-34183, CVE-2026-42764,
CVE-2026-45445, CVE-2026-7383, CVE-2026-9076, CVE-2026-34180,
CVE-2026-34181, CVE-2026-42766, CVE-2026-42767, CVE-2026-42768,
CVE-2026-42769, CVE-2026-42770, CVE-2026-45446.
https://github.com/openssl/openssl/releases/tag/openssl-3.5.7

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
 package/libopenssl/0003-Revert-Fix-static-builds.patch              | 6 +++---
 package/libopenssl/libopenssl.hash                                  | 4 ++--
 package/libopenssl/libopenssl.mk                                    | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index f74576beae..8adf7e51b0 100644
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -18,10 +18,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 4 insertions(+)
 
 diff --git a/Configure b/Configure
-index 15054f9..ac3206e 100755
+index 1b020faadb..4614b5becf 100755
 --- a/Configure
 +++ b/Configure
-@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
+@@ -1691,6 +1691,10 @@ unless ($disabled{asm}) {
      }
  }
  
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index 10ca97a240..970626a725 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -15,10 +15,10 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Configure b/Configure
-index ac3206e..764ef89 100755
+index 4614b5becf..cac670405e 100755
 --- a/Configure
 +++ b/Configure
-@@ -1510,10 +1510,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+@@ -1515,10 +1515,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
          unless file_name_is_absolute($config{prefix});
  }
  
@@ -29,7 +29,7 @@ index ac3206e..764ef89 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1808,6 +1804,10 @@ if ($strict_warnings)
+@@ -1813,6 +1809,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 781701532d..8a7186d669 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.6/openssl-3.5.6.tar.gz.sha256
-sha256  deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736  openssl-3.5.6.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.7/openssl-3.5.7.tar.gz.sha256
+sha256  a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8  openssl-3.5.7.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 837c3f0346..a9e18f96ac 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.6
+LIBOPENSSL_VERSION = 3.5.7
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0

---
base-commit: a20dafe5c190a7d083de3c1a219f27aff7450ebb
change-id: 20260612-openssl-3-5-7-4e361adb9632

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
