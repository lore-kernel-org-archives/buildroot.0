Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A95C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397E280EE7;
	Tue, 21 Jul 2026 18:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwwnFoAnJQ0R; Tue, 21 Jul 2026 18:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A4B680F10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784659401;
	bh=21q+WshOJ6JDl3gGdLi94Zi8sz3Hb3ib/mlug5Yj/S8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hqadXQcCqgChiUc0Ise7C4YtxxL8Uaif6rE5spYTtvx9Fe+l8GTFavUU05NpuzK2Z
	 gSO07dJq8zeWYKFl3U5WP8cLCp2/WM3ezFKrjmH9VkFBHYBkCgH7ehhLiN60sc4Z8d
	 buoq0vJM5rQqc6wWjzIHq6AjVrZ7+WiYr/ix7lH3yQ5FhgaHNrviMfECH2YSeyuHc+
	 JlJf+DDbT2RN/VQzic2KwbPutqSuCzb4OZxrL5jIsIC+OwrjRWBVMxvubtcbfZ75ZY
	 ye0ufusPLyM6oJ4V/TcUh939N6X0qm4IKtairr6jovsXvgbUVT2AZ4KFzd+VN5zS5R
	 jkdj7GxflbgoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4B680F10;
	Tue, 21 Jul 2026 18:43:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C023EB
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82A6740960
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQoqm6mEr_ce for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 18:43:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F233406BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F233406BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F233406BC
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf2b.dip0.t-ipconnect.de [84.161.191.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4B722A4C21AF
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:43:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55446)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wmFQy-000000000oO-3wDl
 for buildroot@buildroot.org; Tue, 21 Jul 2026 18:43:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 20:43:16 +0200
Message-ID: <20260721184316.3523325-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784659397;
 bh=0qvoUUEuZ3vB2BCfZInrCvkIHX1SdQ2SpOJbafeu2SM=;
 h=From:To:Subject:Date:From;
 b=dZAr/YyjRqU+1YBz/d3Uoct7CIbmKex5Utp3QhsYg5SkkxvckC1PhMug9Y9NZ+Egy
 v+Hc10kiYYi0siCMPtb+UYnh+RPgJ5RmBUUpkjTmaTFMev3GiM6BiuJlKfgbKtQ44t
 QeQ11/7GrZgBbNZmTpDD2VQKJ7ABGNZv0hLcZ6KD4p37OeRlicl3YV685dzyv96fvD
 XOfP/JyDNw6sQ0lSuX+/dpNudUdnT/7O4pzLBjpoU56ukuH3oBxDPuheX9BKACyF00
 m+zikmKBn2pTi8+9MQN1ikuL+s8WDWpb42v22NVZt1cUCO007WEyEA/8gb6niNAJdP
 UPB8TAEp4oMIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dZAr/Yyj
Subject: [Buildroot] [PATCH 1/1] package/libssh: security bump version to
 0.12.1
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

https://gitlab.com/libssh/libssh-mirror/-/tags/libssh-0.12.1
https://www.libssh.org/2026/07/21/libssh-0-12-1-and-0-11-5-security-releases/

Fixes the following security problems:

CVE-2026-15370: Stack buffer overflow in SFTP server longname construction
CVE-2026-59842: Information disclosure via short GSSAPI Curve25519 public key
CVE-2026-59843: Denial of service via zero advertised channel packet size
CVE-2026-59844: Denial of service via oversized SFTP read length
CVE-2026-59845: Denial of service via unchecked ProxyCommand fork() failure
CVE-2026-59846: Information disclosure via ProxyCommand %r username expansion
CVE-2026-59847: Integrity downgrade via OpenSSL AES-GCM tag verification
CVE-2026-59848: Denial of service via SFTP responses with unknown request IDs
CVE-2026-59849: Denial of service via automatic certificate authentication loop
CVE-2026-59850: Use-after-free via data callbacks on closed channels
CVE-2026-59851: Authentication bypass via missing GSSAPI principal check
Zero-initialize every ssh_string

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/73ee002c4b0394edd42a0c33674a8360f6b0f704

 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 8c40dea2e5..a1f59fe810 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.12/libssh-0.12.0.tar.xz.asc
+# https://www.libssh.org/files/0.12/libssh-0.12.1.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  1a6af424d8327e5eedef4e5fe7f5b924226dd617ac9f3de80f217d82a36a7121  libssh-0.12.0.tar.xz
+sha256  d3941af0a2d78d5d82ed7a36988e9133994312f035b9659a6e43f8db3968784c  libssh-0.12.1.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 017ff2c197..5fd34b47b0 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.12
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).1
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
