Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5171090221
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 12:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1390B841E8;
	Thu, 19 Mar 2026 12:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTloPHuFkAjb; Thu, 19 Mar 2026 12:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CF6841CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773924194;
	bh=R9YuzmWXhV7taBk1f3NxwvZZbvSuUNDR6RFqyJ6ahag=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Y5yLoiAZd2i6/gTYE4pYxOV/PcrXQ3T2HLtS2ygdopT8hNLgS0yZwqUQoV3+ci5tv
	 4SxuJvsDvDfWSt3StJmneEwxNimiH8TkbPqqCny2ZJS/V88GwfTZF2DVk3Zaw6h/9L
	 0YsJRUTMr5EwkZIhCcz4zFLQWDzeqdHWkg+ffgeUM1/LFPtGrmFY2/5p+m8JLhfabq
	 KXrUb/qGU1Y0FFZFuDLkZexc3FzaL8tPwGNpwPneYzW+ICHmhQJJ17MZIIXL33/Rd1
	 JslEc4gwDtu2PK5Q2WSj3AM+JBeAytuRGTtLS020kv4hLRGxzIDEF5VkIMkpB6MI7y
	 0I9WCYTpqIc5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7CF6841CB;
	Thu, 19 Mar 2026 12:43:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EF0F1B6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5458640C72
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kh_H0DOOlRlA for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 12:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.171;
 helo=esa4.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6814840C25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6814840C25
Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com
 [207.54.77.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6814840C25
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:09 +0000 (UTC)
X-CSE-ConnectionGUID: IiDb46GYSsubBHJh32nhZA==
X-CSE-MsgGUID: N4oAHUfbSNmJ0/AdWQJINg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
 by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:43:06 +0200
X-CSE-ConnectionGUID: AVPIHF39TqemXMHiuj0Ynw==
X-CSE-MsgGUID: ynrDYXCtTFCx+8mC5oaZrw==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces04_data.me-crop.lan with SMTP; 19 Mar 2026 14:46:13 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Thu, 19 Mar 2026 14:43:05 +0200
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 14:42:39 +0200
Message-ID: <20260319124247.2973165-2-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
 <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773924189; x=1805460189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S0J6Ampuf0zKmAMi4aeIOy3rMvKDu9vxel8e/eFrOKk=;
 b=lMY0Rl6hgrbqT1QNYiGQjBE6Ghox45tfQxMxZmepT6sXGIWPy8TIt4sA
 JwcLHzHPofRoHR4Elfvrn9BmdE3fKdiyKUOikrWOt9fIiVzKpVcagVNwc
 KIZClRIElMfZ1Bp6fOauFdRX62mW4akNaYyRd8eOm0oxqXQbLON9FV0Zn
 aINLzwhXQ84hbl7jKGgiLLXJ01OVzlYuhAUpb3u7MOejaS+OkuEgy0Cq4
 j5I+7xWeuZ6eSmfFfJ43L1H1ASqPoqRJ3/5C0bG9YMA1BESCuS+b8NxoX
 HO1YkbNsLUVvL6oLt+OJioBMSrS9BCGnluV9Okhfzz5UPQo7/G1q0+if7
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 2025.02.x v2] package/libopenssl: bump version
 to 3.5.0
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
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Kadambini Nema <kadambini.nema@gmail.com>, guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kadambini Nema <kadambini.nema@gmail.com>

Release notes:
https://github.com/openssl/openssl/releases/tag/openssl-3.5.0

Changelog:
https://github.com/openssl/openssl/blob/master/CHANGES.md#openssl-35

Rebased patches for the new version.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9868ca6ec98afa28a94aea50cc940db7df860396)
Conflicts on
  package/libopenssl/libopenssl.hash
  package/libopenssl/libopenssl.mk
due to intermediate security bumps from 4.1 to 4.4 with commits
  0ec6cf7f69da "package/libopenssl: bump to v3.4.2"
  cd6d8b9b251d "package/libopenssl: security bump to version 3.4.3"
  dbf192e1764e "Package/libopenssl: security bump to v3.4.4"
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
Changes v1 -> v2:
  - cover letter added
  - patch prefix corrected from [PATCH] to [PATCH 2025.02.x]

 ...nfigure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
 package/libopenssl/0003-Revert-Fix-static-builds.patch      | 6 +++---
 package/libopenssl/libopenssl.hash                          | 4 ++--
 package/libopenssl/libopenssl.mk                            | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index 629d9c26ce..2634d69f35 100644
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -18,10 +18,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 4 insertions(+)
 
 diff --git a/Configure b/Configure
-index 5a699836f3..f9152b1702 100755
+index 15054f9..ac3206e 100755
 --- a/Configure
 +++ b/Configure
-@@ -1549,6 +1549,10 @@ unless ($disabled{asm}) {
+@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
      }
  }
  
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index b4b78c97fc..e800b782ad 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -15,10 +15,10 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Configure b/Configure
-index 2a5e58805c3b..0e8c1ce5cc74 100755
+index ac3206e..764ef89 100755
 --- a/Configure
 +++ b/Configure
-@@ -1466,10 +1466,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
          unless file_name_is_absolute($config{prefix});
  }
  
@@ -29,7 +29,7 @@ index 2a5e58805c3b..0e8c1ce5cc74 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1764,6 +1760,10 @@ if ($strict_warnings)
+@@ -1807,6 +1803,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index ea288054e9..9f8b23005a 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.4.4/openssl-3.4.4.tar.gz.sha256
-sha256  7bdf55ac20f2779e99e5eca306f824fad2b37dee5a06cc35ed5a8b85a6060010  openssl-3.4.4.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
+sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 8e3ae4cc21..5e785e1bf0 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.4.4
+LIBOPENSSL_VERSION = 3.5.0
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
