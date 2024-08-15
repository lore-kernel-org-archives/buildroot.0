Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900FEC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 09:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 509CE80DBA;
	Thu, 15 Aug 2024 09:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCS0-bewdoBo; Thu, 15 Aug 2024 09:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53C63812B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53C63812B4;
	Thu, 15 Aug 2024 09:30:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E67A1BF5E0
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C1E2812B4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSdQgqstM4Dw for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 09:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18BB880DBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18BB880DBA
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18BB880DBA
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 09:30:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id AE9313535C1A; Thu, 15 Aug 2024 11:30:30 +0200 (CEST)
Date: Thu, 15 Aug 2024 11:30:30 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zr3Ktom4gvrx17Qf@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723714230; bh=fOJJMfbgQlVgeJLAd47gXeW02GORP3QczhRVyN1xV3Q=;
 h=Date:From:To:Subject:From;
 b=bjLFFqS0OIV6qmMRcWvHK1P84BncA5q2+1VhioMdjTdXQos8kuM3h7pnGV7ueWxyW
 bK6qZy3uzHm96KpIS8buUb1e+e3pT4zuJokmTFWqfMv/iK7vaS5QZBANlNB2JXDsNa
 1GPncDN9O/KgpBinMjMu1c/mWkfkFGM92CVc9dPqRWP3yD7OUP7w8DChX7Xh3snony
 eXhOUFXBZxoEnrONykgMoy7AbIiz0s5QJvjylHJM7P3JOz8EdLd5FNiHqtiAOCB/iJ
 qP4HvOPNJtqRso+F/MbrAJd1bgNAkFecyfC9egleupUuzcEi9lIoZCPm6BMvbdAbzO
 tgOn/F1QT/y5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=bjLFFqS0
Subject: [Buildroot] [PATCH] package/nginx: security update to 1.26.2
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

Changes with nginx 1.26.2                              14 Aug 2024

    *) Security: processing of a specially crafted mp4 file by the
       ngx_http_mp4_module might cause a worker process crash
       (CVE-2024-7347).
       Thanks to Nils Bars.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 0b45f96a45..4cf859dadc 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  f9187468ff2eb159260bfd53867c25ff8e334726237acf227b9e870e53d3e36b  nginx-1.26.1.tar.gz
+sha256  627fe086209bba80a2853a0add9d958d7ebbdffa1a8467a5784c9a6b4f03d738  nginx-1.26.2.tar.gz
 # License files, locally calculated
 sha256  f19c4caea60247490199c5a6d0134281e3fb20b3d7577e6873c628597f5381d9  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index e63acc7b16..d3b042c59b 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.26.1
+NGINX_VERSION = 1.26.2
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
