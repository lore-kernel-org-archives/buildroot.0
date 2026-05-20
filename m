Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87421CD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 18:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F2583DB3;
	Wed, 20 May 2026 18:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMcU670Ke-no; Wed, 20 May 2026 18:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F10F83DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779300054;
	bh=NBvAwi2fbcw3soVXwb9wlwyaZheP/LGoitEkQzRJ4eY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EI8hpRZz9ttj2QGKa0aOIChovUxK8VfXlV9dSCF40ldmvtWttjrSTwGmY/stn8AJQ
	 2uzez36nPlDMCe7LmT8RdwJAg1zUo6yNPlzbAtgWEJ7b9E22iDkEA5GrdeDRslTb2O
	 FFVXyWi+ihaLcY1dECM6gKCwog/Pmf8Jsu744ueifwTetxhpzmFy9McXxL/JPdyHqK
	 LPCUzSFmyJoq1pqnDNzFBIltDeoN6jeMU+1v5szLWce3ueOyuavA1tQ3/HnM1vkKyp
	 /q00yEKrz12Ri1xaxxKSbXKYMF00GramEpYat81AEW5ZdGQAZdPImV5rfU/OFff7W5
	 LCQyw8eQslMZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F10F83DA6;
	Wed, 20 May 2026 18:00:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73C05282
 for <buildroot@buildroot.org>; Wed, 20 May 2026 18:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65BCA408B6
 for <buildroot@buildroot.org>; Wed, 20 May 2026 18:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olZW0lX_qjwc for <buildroot@buildroot.org>;
 Wed, 20 May 2026 18:00:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3080040492
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3080040492
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3080040492
 for <buildroot@buildroot.org>; Wed, 20 May 2026 18:00:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ef6.dip0.t-ipconnect.de [91.58.14.246])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1A90DA4C3595
 for <buildroot@buildroot.org>; Wed, 20 May 2026 20:00:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPlDT-000000006fL-3nNv
 for buildroot@buildroot.org; Wed, 20 May 2026 18:00:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 20:00:23 +0200
Message-ID: <20260520180023.338276-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520180023.338276-1-bernd@kuhls.net>
References: <20260520180023.338276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779300024;
 bh=TYyN/7hKajcZEoJKx8F+vRRa3b2fAm5A0NkBysQy5/0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=qUVC5R542ViI/ZlNDb/6nRD5wB7R9b+GFbNrAuQo3+Bljg+kK63fN1pFTdJirQE4V
 7J7kiz+IfcUms8LsizNR/7qd4IHvUyF6E2ZV81f5hir8xZ+pThk711H9U1b8YpzNfy
 lg+NegpsQrxOv9VLo8Kmt1mMdRMnoR0sXRg33sC59qP+OaZcZ3I3z+9p1s/nYq6q/x
 dlj2UW4C4GhFZXak2vN6VAUdSxZT4gNkH+JJLYTwA1PFzYUAuNgiuKsWxx31KrllRh
 g0SK3sJ+Wrp3R96Py2CtBXNd1pd0GdM09GjL3enIGWgMIu9BPonFvHpl+BnYTCzjhg
 7DMm3Z4LRseZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qUVC5R54
Subject: [Buildroot] [PATCH 3/3] package/imagemagick: security bump version
 to 7.1.2-23
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

https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-23---2026-05-17

Fixes the following CVEs:
CVE-2026-42326, CVE-2026-45031, CVE-2026-45358, CVE-2026-45359,
CVE-2026-45624, CVE-2026-45664, CVE-2026-46520, CVE-2026-46521,
CVE-2026-46522, CVE-2026-46523, CVE-2026-46557 & CVE-2026-46559.
[copied list of CVEs from
 https://www.news.de/technik/859626214/imagemagick-gefaehrdet-it-sicherheitshinweis-vom-bsi-und-bug-report-bekannte-schwachstellen-und-sicherheitsluecken/1/]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index a308cd1f06..fa46fc7cde 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  91ffe35706ef01d0fc9630e3a81b168b9bdb10b5e1e0b0983c287063cce21210  imagemagick-7.1.2-19.tar.gz
+sha256  f129f7d87fc21da453d032dd291b80ea13faf2497f13ef8279d97759ed7d5c46  imagemagick-7.1.2-23.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index d88323ca2d..e08f0a803c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-19
+IMAGEMAGICK_VERSION = 7.1.2-23
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
