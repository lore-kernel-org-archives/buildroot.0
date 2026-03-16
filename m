Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01C6F53D69
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 16:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8690040F1F;
	Mon, 16 Mar 2026 16:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uogCOSnLonvC; Mon, 16 Mar 2026 16:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC4540F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773677678;
	bh=F4UplxW+4BsBBZYqcRt51UgXk8MF14qDTJwGI3bxxfc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AtWcTbv0LiooBPO4fK7pyqfZftKMx7iyQ9yM8q8vcyjaUJuMBPhPSoPD1e2C/Miju
	 eP9WDi7UKDH8xtrrY7KhlK3QCWmfTWGrLjBij3zA+M21J2TwX32LWFMc+rbK0b7zJ7
	 asCOBvYu0B/ejU4P3nPbMkTOiyO/7KCjNNfBGtFv+thVWvBNflgouDnJZsuWRjkYhn
	 ZZH7kiWbr1EF6D1pKS/TaFTt31L0Kfu5iIuDRRUZvqj8nJkVnJ/qH4e1411HijQ8WA
	 b6z/duz+V2NU8DM6er5WcTdTdb481jHGVcNVB95/pIxC9J928cKAd2uDsdNOaS3CAE
	 9fg+UOIjKvSpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC4540F1B;
	Mon, 16 Mar 2026 16:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1CFED3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A372D60FDB
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6rt5a9nrSaw for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 16:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.50;
 helo=esa3.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C567160FB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C567160FB6
Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com
 [207.54.77.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C567160FB6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:31 +0000 (UTC)
X-CSE-ConnectionGUID: WRDaMpffSL2CL4SOP5zEnQ==
X-CSE-MsgGUID: 2MlZ0w4aQ0S4DTjEMZ1HPg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
 by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 18:14:29 +0200
X-CSE-ConnectionGUID: iEh7bSfcQ+KlmUqG7yYXUg==
X-CSE-MsgGUID: wTvwH7LQT1eXkYpt/vdcUw==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.3])
 by ces01_data.me-corp.lan with SMTP; 16 Mar 2026 18:17:37 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 16 Mar 2026 18:14:29 +0200
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 18:13:59 +0200
Message-ID: <20260316161402.1994225-5-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773677670; x=1805213670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vPzSC8CxGaKc5rYdqQpE6fAOEjVOANCendV9RgKZEQ8=;
 b=YoQvw/cljaAZHyMHu4Cv7t2a0RakO5+LsblRAlUqvD4fQW+NeRphaBJs
 wq92arTee4S1N+QOeCShI7voDiR0a/eVRE60uY8cERL2ho+saw65bJo3h
 bTYY5fTHdjs4O7Q0C/vpN1YKytfR0YcijsZUBB2g7Ib6nZZMSeC8zhvk3
 jlfsdcqYDpy+zKcUtIzowmFZNLbqmScpTKEG+j8+MHE33/FH1M2ert1Ht
 rbpgEhth+o8Z//lgXAqW4WmCdZEEqSUUV0WZ0iTl6JIn6EMwRXGE00ZO0
 /l7IBBjP/JxxhrNPxow2nsuJ/Wn0jGY6B68QNmhEwZRCP9UqjJrxkabr6
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 5/5] package/libopenssl: security bump to
 version 3.5.4
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: Julien Olivain <ju.o@free.fr>, guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Francois Perrad <francois.perrad@gadz.org>

fixes CVE-2025-9230, CVE-2025-9231, CVE-2025-9232
see https://github.com/openssl/openssl/releases/tag/openssl-3.5.4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c983f967bdffdcf784174fd3ea7b08e39ac83d24)
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 ...Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 2 +-
 package/libopenssl/0003-Revert-Fix-static-builds.patch        | 4 ++--
 ...Serialize-install-process-to-avoid-multiple-make-dep.patch | 2 +-
 package/libopenssl/libopenssl.hash                            | 4 ++--
 package/libopenssl/libopenssl.mk                              | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index 2634d69f35..f74576beae 100644
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -21,7 +21,7 @@ diff --git a/Configure b/Configure
 index 15054f9..ac3206e 100755
 --- a/Configure
 +++ b/Configure
-@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
+@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
      }
  }
  
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index e800b782ad..10ca97a240 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -18,7 +18,7 @@ diff --git a/Configure b/Configure
 index ac3206e..764ef89 100755
 --- a/Configure
 +++ b/Configure
-@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+@@ -1510,10 +1510,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
          unless file_name_is_absolute($config{prefix});
  }
  
@@ -29,7 +29,7 @@ index ac3206e..764ef89 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1807,6 +1803,10 @@ if ($strict_warnings)
+@@ -1808,6 +1804,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
index feb0e21ef7..344b8d07b7 100644
--- a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
+++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
@@ -26,7 +26,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index e85763ccf8..b671723813 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -650,7 +650,11 @@ depend: Makefile
+@@ -661,7 +661,11 @@ depend: Makefile
  # Install helper targets #############################################
  ##@ Installation
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index d0ca45d303..e78b664aa5 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz.sha256
-sha256  c9489d2abcf943cdc8329a57092331c598a402938054dc3a22218aea8a8ec3bf  openssl-3.5.3.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
+sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index b892d4e236..2f844fd44a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.3
+LIBOPENSSL_VERSION = 3.5.4
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
