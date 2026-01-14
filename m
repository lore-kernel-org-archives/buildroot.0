Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ECED39000
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 17:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E835608A4;
	Wed, 14 Jan 2026 17:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GoiuMjb_LiwX; Wed, 14 Jan 2026 17:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C903560895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768412372;
	bh=IXV9OMsv/WtGwjhllmCr8VpfuAz1/Y8t9bfoob9MYaU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VtZcVR/61R+HD3Pya9MFxtLBSF1zUGubKZjk5HeRKsp3AwcNu5P5to/fl1K+NSCDb
	 XH+v+CwDwZZ4TARXeJTpAolRE7OxubLKV7GXOCIKDIbqZlbSLn+qOuy6eMFrKu5E3B
	 cDdXIefBvfsbTZOGRjFsRHVd71B3SQ+ILCq77TZoN+UlibMdBJl7UVfWmH6A97MM9Q
	 ZLs+JY38vT1UZNVYe0M/WeArFy3KDYlmCYPZJBBIGx0W5+XC6IyhqrBmx/uRBk5c5g
	 /x42f/PwkMpHvlPsg3yeeeHoEd/akqxTeSUjHNRQRxbgYcLROt+UNhOTGpLValdKiF
	 RHm+9M+CqqFow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C903560895;
	Wed, 14 Jan 2026 17:39:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 503201CC
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 17:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40A5D60895
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 17:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjnDb5pzNdTY for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 17:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8440F60893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8440F60893
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8440F60893
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 17:39:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd81.dip0.t-ipconnect.de [84.161.189.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F81BA4C3E15
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 18:39:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34142)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vg4q5-000000007hj-3E4D
 for buildroot@buildroot.org; Wed, 14 Jan 2026 17:39:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 18:39:25 +0100
Message-ID: <20260114173925.1877799-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768412366;
 bh=J6gCKShUnuzTqc9rfi6VkrEK2SVLD4uijr/PEid18Q8=;
 h=From:To:Subject:Date:From;
 b=nLhIJLMNLoXqfDCo8ZqUbOUU5RVoTrYOFB+IeVtvBuKizurumFt0madrZPTd0011u
 jSWN7+k4ntCWYL9MUfV8xq17l3h6zKGFCp6ZJrd4/r4EA1qSDQ55oVgQ8p1yUsskqW
 AoTT97jzA8s3wn7s3Ptbq40atSgAu61gVHy6tidWPBDI6bJ66Wjpfdc2ms5L5EJwMy
 /OZFNz+x7GJHZE6oHavEYZI9eWGZn63ezqdM+qKV2EA9zM9mGf/+94VrnAu90Rd/++
 NXdyKjh9+EORsF8KcmMu3wH3Tspl+vL5+bNJnESNDVwkycpVp5GefUKDxZxoEwzmZY
 Iq4vKJvX1qhDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nLhIJLMN
Subject: [Buildroot] [PATCH 1/1] package/rp-pppoe: update tarball URL
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

The project moved its repo to codeberg.org:
https://dianne.skoll.ca/pipermail/rp-pppoe/2025q3/000663.html

Updated tarball hash after verifying that no files changed, only the
directory name changed from rp-pppoe-4.0/ to rp-pppoe/

Fixes:
https://autobuild.buildroot.net/results/5ff/5fff21a4150a5f668d43830591e21b660299ed9d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rp-pppoe/rp-pppoe.hash | 2 +-
 package/rp-pppoe/rp-pppoe.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
index 97bb61eaf8..89f9f5c33f 100644
--- a/package/rp-pppoe/rp-pppoe.hash
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  17d45712778f2bf6b0859ff610a3dacd24bc4462e9f53bb1466d47af391701d3  rp-pppoe-4.0.tar.gz
+sha256  459904065fd4a70c927757d84cc7b4ef70946a707fa1b83f16246f925158b13e  4.0.tar.gz
 sha256  d2767e7ffc6dc9477812f6238551fe4b29a889df6f23c3922e7b9cec92bc278d  doc/LICENSE
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 98325e7d49..562e0311f0 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 RP_PPPOE_VERSION = 4.0
-RP_PPPOE_SITE = $(call github,dfskoll,rp-pppoe,$(RP_PPPOE_VERSION))
+RP_PPPOE_SITE = https://codeberg.org/dskoll/rp-pppoe/archive
+RP_PPPOE_SOURCE = $(RP_PPPOE_VERSION).tar.gz
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_CPE_ID_VALID = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
