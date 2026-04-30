Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A284FF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 04:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2017B61B48;
	Thu, 30 Apr 2026 04:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5ZRvkgUTU_5; Thu, 30 Apr 2026 04:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C1161B41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777524471;
	bh=OeKbZ4fjtFE5CaeyAD+LcP4nLbWlE8hV+fCwftxjrfw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NMw044ncvjgOOUfztcFtNWkOBShA9Nfalk/pPLtppwTlWOLx9XV5XepSaWFweNZVK
	 LY+jgtE7r328/YhLD1IBXJgK9Rl3IoHihs3mBYlNZ+TrwMgNJ/trldgU3r+xdnMCPI
	 YPl848G8TD0wx1XYoLtMsyguwE9XW/M7zti2QZA2LQMdaYen0XfhSASzlXW/sp0DRt
	 UbRsYhrOkLojo47tRE/6SRyy8abaNw7bCvtXqqijPGNh4/qBRfHMJpQ0n4OMyKCWBz
	 EYhVbAKS5lnI8nRFuKORTScaTEwhpymJezSAb/I0yWS1VoGsA+3b43X4z8N2K19meL
	 bdYbTt4i82V+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59C1161B41;
	Thu, 30 Apr 2026 04:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4D918E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60C0C849F6
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJv_apBmT0z3 for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 04:47:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DBFC849F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DBFC849F5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DBFC849F5
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:47:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb47.dip0.t-ipconnect.de [84.161.187.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64F60A4C1429;
 Thu, 30 Apr 2026 06:47:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57304)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIJJS-00000000884-2ilN;
 Thu, 30 Apr 2026 04:47:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 06:47:46 +0200
Message-ID: <20260430044747.27619-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777524467;
 bh=gFEr7KQlDNasOHxT+UOQOhA4nChq7ZDtrkN0SiaDcYU=;
 h=From:To:Cc:Subject:Date:From;
 b=ODJxqxb3zr9L9xOZ57caqi+097nrapD7GA0QQ6hZ9tAUPPraTj+3ph17wNvBsTAQe
 tzgAtNDmJLVouwh8Wp4dshKnrWPoLSUJ0Iwv2tpUsV+45z+IjcKD5osDOEPnGEs4KK
 M/DfIrTRHN9UWadAOQQen6ztH3TgwDm7fxhZ79K4NwSUDigc3ej+4EoDuisdCVbdgN
 ru28yZ+f2VFpdUdarNmoe3Cvo1+ExgrsLM1qG8MD8M7U6EFwSQ2y1hCJAfX0JG0NRQ
 lgQDtg2mKhU7BtBaWJfs3yxCvX+NI5N5zh17367YNjQdL2/fq9ZiAYJ9JQ4YRoi1bl
 Cn4f39IOf/+6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ODJxqxb3
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump to version
 8.20.0
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

https://curl.se/ch/8.20.0.html
https://curl.se/docs/security.html

Fixes the following CVEs:
https://curl.se/docs/CVE-2026-7168.html
https://curl.se/docs/CVE-2026-7009.html
https://curl.se/docs/CVE-2026-6429.html
https://curl.se/docs/CVE-2026-6276.html
https://curl.se/docs/CVE-2026-6253.html
https://curl.se/docs/CVE-2026-5773.html
https://curl.se/docs/CVE-2026-5545.html
https://curl.se/docs/CVE-2026-4873.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index ad34083745..549527b1af 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_19_0
+# From https://github.com/curl/curl/releases/tag/curl-8_20_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.19.0.tar.xz.asc
+# https://curl.se/download/curl-8.20.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df  curl-8.19.0.tar.xz
+sha256  63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896  curl-8.20.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3d00a4a33a..94d7ec677c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.19.0
+LIBCURL_VERSION = 8.20.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
