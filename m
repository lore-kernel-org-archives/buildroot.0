Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A00CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6495560B17;
	Fri, 16 Oct 2026 13:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkjQIJPTewue; Fri, 16 Oct 2026 13:08:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A1DA60B1B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156120;
	b=ef/vAQZTnDY3c+Py7ZylKVG9SaPGOJY2xitoHAYif/hKMNMvlCd8Vx3hlzqFJ2Fo2CM0
	 NBdGu/MGIIdPJNOv5D5/gm5IaCoespvTCHrAB/1VFOfs1/9kjulKhKBsNN88imhmzzVS2
	 jNyUfLg5b6NSclJB4GPqmZfN2b3zM8vmph5rQ7YSSaiOJo9Q1JF8VScDREFRuqIBGkI/D
	 Wv5u/4ajdWy38PG0gwwBrMHIFLEgA+7ypZICG7Gg/1JWIMr1kmv5p7DsynVC84QRzkcAG
	 nW0T2F5zmVxBRrDmeuU990yqzDemdEB0342iIwiSznoV3A6rK6Xt/psDu6pSMljYwbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PY3Q8XYTXnBr3P9MdjU3fYbI9z78S9/2+B4PLyKrRHs=;
	b=bvIt51O2OxWzwVnVGksFdtDdUjeUjIoev4Yr0/ZO99qlPEuz8bmhrFIiVuL/B71SoXIg
	 s2MHqbeus/9MM1MP2cPX/S7uO21xmPJ4FhVl45VX/jxBEwXB5E7zLAboE89k2tFY1qrgo
	 8ECZYGyFGRtMj1300kqiNgJX/vyjtEmJQY+aKAvr5mZKmdgRWty/C+z+v9WBovfnPjFp8
	 3z6fB2Y992eBY7TuGHR0LQh66i8RF4qKKFc93xeA7pXoY097bDI0mUBMZcv5P9rfuSIAg
	 Yl9Jhis63qXzF/N5X3HKcfOPHh9Xs5PUvu7cqz+6lRL5KKMX2Y4CBZiXSS87RHrJggA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156120;
	bh=PY3Q8XYTXnBr3P9MdjU3fYbI9z78S9/2+B4PLyKrRHs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dkrxB4IdmpQviTJ58bid/Tuqij961mdBVZjjg4eUQBuwyJNgBJqrbcBqxOALt3MCB
	 UDzWiZWYe6DmLdqyVLU9c0dJe8o26ENKlnIbkJQzLxvU3lZuJyfYbUBm4zLkM+PyO5
	 MBGMcaujuHpEmCg3rn4aNVQkpYCuuQ2ucAhKxeEl/CkjCxNsj8++JpGDHdQo6U4j8O
	 Fe4ZwcoIjMSP9dvcTiFEf1LKS0qXkiUL+sjQRJCUUUHh3LF6abJAqcYOx+RLDR2DbF
	 f7i1z52FtnGzS28XPGt9Kk8SlflWflKlUo3sdKgQlBe3iPDMv23etOsdeJbyWFNUr6
	 lE+MhavRshggQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A1DA60B1B;
	Fri, 16 Oct 2026 13:08:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B19F769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07488409F2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dugXHblLI8D7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 21A98409F6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=N+0h48cIjJ55+UX4raE6SJqWlPCOBTukBy3bXf2jaMpGq6lrClvtCT5Gy72lFKqMpskf
 qv3q55GfVuPicBE7LY2loqr/S0Pxi9CzLK6IF0xeYB2ptZvpjTzBU2+Hy+bLDcX2VUt3b
 IblQFW/n/t/yEJ2BL1WlC8bNpKRh0IOFnYqVClGOTs+eA6AokpqZZRtjp8zzeMAC3K3ie
 bWjwZP2mIMT6uPYcH41awqAr02/DGU4aNF1l9g+cxXOc+maWpsEj9dOu8WC8s/RSqLQj/
 80+VYpMQEWjTMDKorqyJlxBIaASpuqTgSY6kG7H0Q5SLVo157yl/05f4kcPERFQ9GaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7GcaqS/aCcfba8mTTFbhKlbyV+sSU6qhzknpbk4Xy1U=;
 b=r+TXmbcKav5/Hhax/knkLRDfX8Qfg8aZNsI3qBEeSFj91HU9MiASNc6+j2VQTpYBtSbN
 uUiKAnUoezIrt5Xokhls6ejdYGRx9VdGdTh13WA0cNElC7B7RQ8PVin/ob+QiIs/XC8C3
 q5Cxq9r0Iim0CIPpu0KnmpdWOY9M7VodEYWl5Lgc9NqrRZ+LkPVJWu8kOK62pFdtCxnjq
 S6Rmi3MhtsAT+EQosryyErwaXUCp55bDd/LOeN7rYsj3NEm63KzhovonI1HQNU8WE/6h6
 i9y2FqNXq3WweZFXKL5FyVDeYjWBjJmzEMjzDWnYEYWhKZ5NvDRC2yhV34zaI1b+z2w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21A98409F6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12C98960D8; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4e603a6ddc212b2c50810871ff97a7206e287f3f
X-Git-Newrev: 00f561ee1004f6610fcdcee15e548a248a0c3c48
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.12C98960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tor: security
 bump version to 0.4.9.14
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
Content-Type: multipart/mixed; boundary="===============3655310837530458778=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3655310837530458778==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00f561ee1004f6610fcdcee15e548a248a0c3c48
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.14/ReleaseNotes?ref_type=tags

Fixes TROVE-2026-062, TROVE-2026-064 & TROVE-2026-067.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dbf47e3028dcfeb3a52419e5ed6ea3a49cf09cbd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 92e5fd4782..37dd1e6000 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
-sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
+sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 8de7ba50f9..49b9524c26 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.13
+TOR_VERSION = 0.4.9.14
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

--===============3655310837530458778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3655310837530458778==--
