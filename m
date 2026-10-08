Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7C8CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 649FB40AF1;
	Sat, 10 Oct 2026 09:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGv02Frp3fus; Sat, 10 Oct 2026 09:28:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7DDA940AE0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624494;
	b=AlZa5JxtNVlvFQsGvsqzCasKskeluVZyCTGN93u6cPv8dsi+3txbScdVwuab6JAXk1N7
	 vn+5sywdrH9mT2nXeSeJZO1rPi7qAdumHS/0KBwE32R9fwEXc4/3XelWLhweTzZZaCY7N
	 6WnpnMPPs5Aa/924un5mwMr79MCZGhyXuu1iEYXs2POHm31WFjOksRi34eaOmZLJC7U4G
	 Zi0h4lE3u/sNLhCVxm0h0FYZj6YkrtA+LjeANNoIbOjBHdCxLWT+60Y2RT9y+lJeKQapf
	 7FqkCzflAEROmZ24LMBC1Avs1NoQgk7tPzw8sjLgyrkOQeoCcSVbRvjD8Tq5UspCbtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624494;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=iJspGpAR9q7mRU98vcdUEtS0Y5pwQlrweTMDmwqb6nc=;
	b=petyv0vojyCi/qZtF1GCoesQdOkARyYi2MfFpb0j7BTSjiTznvTxDiO2dXK6Ya/8xBnb
	 xN+MAbOFGlMD9f/ltY8uVGyLYBhLk8kY7I4g8ikDFUHkxq8bx2OnD6jkKsHVgzp7XRtXc
	 L5478yrRrE7GeyYXAfLFVJ0tXEvYREycClw7eCKT/CUNBQlYNUtqE/Y6988eqNeIhPLBa
	 sRO7U+zHSTbXElhtXLPx58WibBQpGpQ7INqineQptUiFl1OismmGm3JviCV3fwKFyjXuL
	 Tpzy948Y3oNMEYmJ/WeG6Q8/DDRUGCTlCgmI0w8m4RsPGuP5+7g/+TpVDubIQ33HpBw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624494;
	bh=iJspGpAR9q7mRU98vcdUEtS0Y5pwQlrweTMDmwqb6nc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KVV+uzFmZo+yCUjvP3PndW5SF3BPj5xQtWutZ+GBpKMk7eMOVCnpQ8zGMfJquPhS7
	 WzdHPpVj0Pjkl1bxOR/h+vLSn2DD1YF3KoPzXqjUnrl/5603qjUKegiIJtotMGXpae
	 WQ629DaGQBRTe/GZuv1mHSzqcR5+cKY5OiKn72glh2CUN2HnYzvA/HP49niYaBTbLH
	 cGQyQdya937gQGQKdxJAetrVVwf78aNE6wCLoJ8lfc4/rOxje4RMKGlWIPFjdh9Q3T
	 Mwg/c/RHXae3h3uCW+tf/x4WvlV6hbaIwc38qNXRkZUdnTd8cl2wcw2cILws63+BIF
	 zi2IdsKXLrKzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DDA940AE0;
	Sat, 10 Oct 2026 09:28:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8D7CDE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CABB2400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nc_eSu_8zamr for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0F25840004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624443;
 b=F5bkcnygq3d7H2kpN+MaX44/x/GFWIRtMDeoifdh6aEEhlOMtA7pLJbGwRI3swYtTcW9
 YnCkdxswmTG33s0RF3l1avZ7BTbIjGBSc+i9ss7O6aOoGK3/fByiseylmyiGu611FQQ+D
 lzhirKGO6F+6Cd65P8yhIjYbPzjyC/P1NY5q5ZEVI0rSVkmkHJ/AawFX/fSOb5Pq9FCIG
 XKRp7/gVozRUaj28ZMQ48WeNGIRgrOVcmMXZILmKW/CFFaH27y4cQkCP3WgxDxNcGed6U
 B/vvUGiexPRrtKkACJchOs+Sc2knfs+bkT5n9P9SwmJQde8q/zhLvvj0T9d8MuZ8g8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624443;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fsMd9NT6vgv28MPCWqW5AG26B7Dx2DRmulepKg/fRPU=;
 b=Rf+qMLCuXiwTdD1PmdAdWTZwR9SB+8orMtGhqHlFBLrw8fxHwdrxk5+9nD8xcAmEQMqK
 1SWmlfIBhE+pzGbZ0ieT2qZiaN0yeN/2H7+1lVORhHsxJm0TcS1JjEYOvTodj6GxtbhlJ
 GqkQHSjKFHoaGW+/b/E76k3yrAPT28ptNPnekHYwQ9m9nf19FU23T4ERiNJDy6MEpV2IT
 91PEQxzlmqxliaxgXOncIOBja6Qge5Kd0YI3Ayh1osn4oTb2qsqhbXvpEpCPll22Xr2Sd
 ln4usbeOayYqKWZiLEHiSA8CD7WcdrxK5me8hCi+YN9KLgVt8m1NfA/sqsymuyPdnbQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F25840004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC8A08F0B1; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ccc8e19434a94a20f0c86690638f05f9cb8d5c26
X-Git-Newrev: 2bf0a34e85b3ce6e8b6603fdb150c5c22b0698bc
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.EC8A08F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libheif: security
 bump version to 1.23.5
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7718030755346149220=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7718030755346149220==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2bf0a34e85b3ce6e8b6603fdb150c5c22b0698bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/strukturag/libheif/releases/tag/v1.23.5

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-v8qw-hwjv-44hw)
CVE-2026-XXXXX (GHSA-qwpf-5wf7-r996)
CVE-2026-XXXXX (GHSA-9c75-9g8r-4728)
CVE-2026-XXXXX (GHSA-r7gr-2xm2-23wf)
CVE-2026-XXXXX (GHSA-q492-cfcm-895h)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5feefc6be00f40e6333feb9b2a9710c0c463fee6)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 78f59f6b67..30265f4aab 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
-sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
+sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 3428646016..cd171b9637 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.4
+LIBHEIF_VERSION = 1.23.5
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING

--===============7718030755346149220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7718030755346149220==--
