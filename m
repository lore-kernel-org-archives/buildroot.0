Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF48CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EED260AB0;
	Fri, 16 Oct 2026 13:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BIk6sMjR1OT; Fri, 16 Oct 2026 13:09:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4961B60BE7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156158;
	b=U/ARg+v5zL8reYglib1Fln22JqmNhUcX2kMOnVnsYER5O7cidBAFBZfUm+sZGTt+4WCu
	 B0sMGplHhQm/N9zp1CtZoX1TqOKEpZWzwy2lIlfrdM1iv2fskteBoaTxq6JOl8nXA/kiZ
	 YquPlVcELU1pGX3oJlRMAiaBeLz00GlDyGUSo6sM98jvq9EKXBIAUxRIUMjVHBbod5t9a
	 ptY13DUhHMiU7P1zhHw1dDNKJ5ms871141hb1lDaiCu/IZ1RU/C/2bGwwj2JuifjwwIge
	 KoCUXz2dsBF9ARge8RnUTC6nI8lLeFBt976r25Uztr/6GTV6Sbdc6v/r5CyLJxyezTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156158;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=NIwXnLqbrAHZFPbHnBAI+lTn51+hbGmDiEnIl4aUuK4=;
	b=PSrecPeOEAeqjY6+Jbl7NHXGYyG/c/7nZs/exNQSXOUDL2VZS1ylyIV8ONDesxJv+e2S
	 1bq5MRg8opmMNQSI3DjCj1MoFB8xxx53x2K6e/1NxpR1WLaFaaQLYNfXkJ1PxSO7RIViO
	 dY0gKXt4CHunDC5vcyicdQS6eHRoHI5wj8ULVSgFalQ8Nvsg/3QV8HWWrVVW7TeOhJRBQ
	 S2GCIj4xYMjZj0HRfj0Hu5WOcjTnSkFBdnAgO9CJTBVsWk8CVAXOsg+rR/QdfiaEUbwI1
	 pEsIdZLhRhsQfVaicbLDcWlrZ0Yb3I015bFwnkYvq1E7IBdAdHwb4QZt6U+c1RAgKCg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156158;
	bh=NIwXnLqbrAHZFPbHnBAI+lTn51+hbGmDiEnIl4aUuK4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ga5rIbGVhjJhUL2RvfrNIaVvfL0r1DEM7ilbLC7f+OOx07USzphympQLOfH1ZrHIq
	 YSJR/aySyF50FSu/TfmTX5pMU4FIzH1ZmBGyuvXuTZfL7ZEonoijx5yuw4dH9DXrre
	 OVNgysT8tHPaytFF+27Zo/Px8q6OWXDlwfCYQJLj6p5XjwIWMc3AH3f7MdnpxulFId
	 gy61B/ugb9YpGBVI4qFAM8iL8AFZppBnq4OXGbJewHSCDOGuilUv4DoSmKcue90f9w
	 YpL3//zI+TvFFj58OhOovYiB0FD4Sgzax7/BjGF5wjWgmaKJ1OVpeBBMo+7/HhW1/O
	 UC5ve0iEEvXrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4961B60BE7;
	Fri, 16 Oct 2026 13:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E73331F6C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFB2C81510
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqRSJGwbikRM for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 342BF814C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=sAoZqGH3wC3TcR81Rx9vHk2u0hOHIiLHQcbMRy6fKHLKB1nOOdOmy6xrC9H+/w/77rzB
 iM6QrRFJLt0X0fnPDw9IWVv7wNUEbg8R2e/Cwh/PSQ7LJj5qKpZj2eXh1OBjSZ6p00Rzm
 MpCGlUe/k1j1MPE4cb5sdm5t3FiLP+KVfIfPAFOYYwyZylIHqKYoB6guYTt/xs2VhgXbW
 AkUBBMXlj/uuKYsRwkLhZG4y9YGOdck1JxLedNbNLDYgsd3NiRJgIDR+TpVd3eB7Rmc+1
 SLdMZ4F0bL3LYMiNc6lfpgG+YTqtTRz6hNrAKZbOrrnk446p27nRX5cWdRq5x7koyUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F2GyhDJemTavovFCIvejDei2SnTCDRpz6XZeCJ42rvc=;
 b=NesKmvPucUhrF048zLc/s1fFKBDzBY8R6RHw1e9lNM7xzW6ut/EvD/L1JV3rSNdSPqGu
 iXBEfBOpzGarImZYy+cmfTH5QbkVoltR40tRbJVnpndb3A1yskzcEjtb9z25SMn28KvNN
 TaFSx4jk5HwQPWe/EM2YLbbr21jwFUZqRmbTZ4pKM4PPhVXhZiryiDS2LYCc0NpQ86IpG
 p04izT1nYjbcP/KmunnrrTj2o9jM0w6a4w4g1hrAie4jtbF+QuKBmKws9nqxwHSIqWLSN
 Wet6N5hTt0HG2xfTXc1rl7Ev7fV4CMeMNALz2goxryLe5YoTSuGh6KC0QfuTfsO/ydA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 342BF814C0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25331960D5; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e7291dc26bc8986bb00e5e96555aa3681d7e9f82
X-Git-Newrev: d3075ae5818be8ca5caf0ac2fb66f2f9acba7297
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.25331960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/go: security bump
 version to 1.27.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6781923867160663706=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6781923867160663706==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3075ae5818be8ca5caf0ac2fb66f2f9acba7297
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://go.dev/doc/devel/release#go1.27.2
https://groups.google.com/g/golang-announce/c/U2fTuyDJznI/m/bAPU-QKAAQAJ

Fixes CVE-2026-56857, CVE-2026-56866, CVE-2026-78659, CVE-2026-78660,
CVE-2026-78663, CVE-2026-78667, CVE-2026-78669, CVE-2026-94439,
CVE-2026-94440, CVE-2026-94444, CVE-2026-94447, CVE-2026-94448,
CVE-2026-97030, CVE-2026-97031 & CVE-2026-97032.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6a9ea2a8bfecf9fc1bb4c8e14106ca11410af72e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bc6d026a6c..6a4b03ad35 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  7002403d7cc44529ef6d26f69a44818263395ead7c16c05a5808ae047ebeb0e5  go1.27.0.src.tar.gz
-sha256  eac4abaca4113170a1cf261b8bf1d38480e61e99deecbc6a14767deb8b19e8ad  go1.27.0.linux-386.tar.gz
-sha256  675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685  go1.27.0.linux-amd64.tar.gz
-sha256  51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda  go1.27.0.linux-arm64.tar.gz
-sha256  e337ecd9c321377c0d8832690c2cb10463447c0bd0e65e2e3413dfff63a3435b  go1.27.0.linux-armv6l.tar.gz
-sha256  068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255  go1.27.0.linux-ppc64le.tar.gz
-sha256  cb5c89fa48cba4123c68aee62b217ca030f281546df0898a0c32889c340b928c  go1.27.0.linux-s390x.tar.gz
+sha256  03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62  go1.27.2.src.tar.gz
+sha256  93dae4b7f463ed1e9c65e05561ce9fc5f7cd5c4ffca5e336248d48f3a2eab5fc  go1.27.2.linux-386.tar.gz
+sha256  ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5  go1.27.2.linux-amd64.tar.gz
+sha256  94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8  go1.27.2.linux-arm64.tar.gz
+sha256  e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95  go1.27.2.linux-armv6l.tar.gz
+sha256  059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa  go1.27.2.linux-ppc64le.tar.gz
+sha256  dfd01d1e08e4dbece2cd91e259953f87b858752037fd151da2f674c4fa09aeef  go1.27.2.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a49dc206cc..df6f0049bf 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.27.0
+GO_VERSION = 1.27.2
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache

--===============6781923867160663706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6781923867160663706==--
