Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC67D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D1E8221C;
	Sun,  7 Dec 2025 14:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZqkGbJ7DEGX; Sun,  7 Dec 2025 14:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0D73821E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118726;
	bh=7OpxHnjklPYGyn/7YQGTSA07G8tqmStpoXsuVApAfvI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Lfe2mSbGbpbT8OzL7fC8Wn+UwUVYfu2qfI/b3NXcRPKykeiRa7EQUiA5FhiKHhn5k
	 7TeGlmbcmOwZbE8HOl2omSAazVPIEZUPI0XJFLVORNwGkLuw42RBrCFfsEuLJc8xcJ
	 QVmGlxN0ej1wtlJGSHQv2Apw+8fElt5+IBBH1hqnbdGOBD9WHQ74rtH8vszRoroSbB
	 k9XlGrL6/ZgASLJ0mkb71YQ2N/JIKt1hnkekXSr00ZJC9NQiOufx9/ZbUZZQlJixIT
	 y+vf7Q4WkVEPitSOjKm5No12tnVsTVu+2TsMaG6OIOhgHQ/EefxvErfmZkKRYK1UMU
	 nGEckBe9UL6lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0D73821E6;
	Sun,  7 Dec 2025 14:45:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B3C4151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D88F821D4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zLM0PJjMRLB for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:45:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B02780D53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B02780D53
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B02780D53
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE1BFA4C09B0;
 Sun,  7 Dec 2025 15:42:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-2uHA;
 Sun, 07 Dec 2025 14:42:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:23 +0100
Message-ID: <20251207144243.3696572-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118575;
 bh=+mL983DefgNpSGWonl23JifmQyVTZmUfC6phrGDOEQg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HWoiL+YH3arMYnh/ySZL/KR935Ngd+8F53we5CfiG4Wm39CmzWixm31/b90KNtSHq
 j1Q5PJluVNTple4eoGEuwKi/Ok0+lRm6OwBjVo0FMZfz19HCuxNjAt7Ku0JxesXHRm
 U3PNWW+PIMo5qkaKsdWZFtg/CVyzMwXIROHL51wKJEcQl9FAr2ltzSpfDbYgGgIVZB
 EhJEn6PurxT8dzrGFg8xZXpefLJSIhEw3C1m7JMk6P+N9Z9Olhy0cAACP9q9byBu1T
 zB1r67EjSn0rM5ihAKYOGLElkrSnQyE0ht5m+/bsrTGcyewNKEQKVcUPsjRe9jwLcl
 JZwS8db27iOfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HWoiL+YH
Subject: [Buildroot] [PATCH/next 14/33] package/qpid-proton: bump version to
 0.40.0
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://qpid.apache.org/releases/qpid-proton-0.40.0/release-notes.html
https://qpid.apache.org/releases/qpid-proton-0.39.0/release-notes.html
https://qpid.apache.org/releases/qpid-proton-0.38.0/release-notes.html
https://qpid.apache.org/releases/qpid-proton-0.37.0/release-notes.html
https://qpid.apache.org/releases/qpid-proton-0.36.0/release-notes.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qpid-proton/qpid-proton.hash | 4 ++--
 package/qpid-proton/qpid-proton.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qpid-proton/qpid-proton.hash b/package/qpid-proton/qpid-proton.hash
index bead3c1807..3a736f428f 100644
--- a/package/qpid-proton/qpid-proton.hash
+++ b/package/qpid-proton/qpid-proton.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.apache.org/dist/qpid/proton/0.35.0/qpid-proton-0.35.0.tar.gz.sha512
-sha512  1031e3d45854107a516699e1d18269c6acb22549b2709c1fc1cd25eb870096de109077445f1b400edf231bb21a476a268e2d6674e986fc50e92a281549085543  qpid-proton-0.35.0.tar.gz
+# Hash from: https://archive.apache.org/dist/qpid/proton/0.40.0/qpid-proton-0.40.0.tar.gz.sha512
+sha512  3e7fe56ca1423f45f71d81f5e1d6ec5f21c073cc580628e12a8dbd545a86805b7312834e0d1234dde43797633d575ed639f21a96239b217500cc0a824482aae3  qpid-proton-0.40.0.tar.gz
 
 # Locally computed
 sha256  52310e65489d30afeefc8589479fc02862a875349c19edd165658a915009da82  LICENSE.txt
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index 1f92068f18..c0b6be459b 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPID_PROTON_VERSION = 0.35.0
+QPID_PROTON_VERSION = 0.40.0
 QPID_PROTON_SITE = \
 	https://archive.apache.org/dist/qpid/proton/$(QPID_PROTON_VERSION)
 QPID_PROTON_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
