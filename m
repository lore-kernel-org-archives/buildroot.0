Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8FDC88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ACD940719;
	Sat, 12 Sep 2026 13:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDRywVH6zP3w; Sat, 12 Sep 2026 13:59:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0A9E340726
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789221543;
	b=Nq4bWMJhDSfVHso+wR6HYrnvvjE8gorHJRs+83n1r+xXRkt6GSozjJbzPa9coLVI8ctM
	 IW3aS6K44BXbTleKN3CNNzardmLDNZbl/dIWfwB7NGijPmTBfm+0adIL4E4Ysxz0NHSnP
	 0VT+k0RX03QGjw29rmZarQ+ThedbkcQVQ8hBn+oYeBJzBOCF4zzW337NAqkpzGyql9chj
	 tqcUcxe9CTnF6YYmbzZcbMLZr3gGIzygVCupgAtBEmf8wkbKugCcC6AK1kSMJhDrAvBQz
	 58+yHLvQRUlKxTRDuxV6Ot/FOkb61/RL7Jdf5CL8nKw0yrJR1+GxJIyCkrTj/ZseXlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789221543;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DpMkezxzSNadBrOa/qCD//lEB2spamqupZMcf+e2bEs=;
	b=eCiqDENUqcgruROMBgaubcH3c8FOwZnHMHUoGIL+/w5wyhSOrJojVNeqRgwk0XcAiFWI
	 KjaCvYXsd/82KJpSeGg2dfz6MZ9t/oJxg4X8He93cAL+h4xKgosvT1h6VLOKoxNAmjQNu
	 C6njIqtUmEvc3YH/aAf5tY15szKoQkXV4tioIaQYIXgFm0Fph7aRhMtwxjPXpW1h+rBEG
	 Z56rXjAQA8UnQE6SkwGEYoLPwB8agtcFSpfy45ANtNshuFGXKQ4j98Jolulv2U70wSb1D
	 nenDTptjArm/ZODb+wSBMh7WfFIvEP1T1Yg2C3soLy/CnE7YuyQzu/Evo9AcOau4Xgw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789221543;
	bh=DpMkezxzSNadBrOa/qCD//lEB2spamqupZMcf+e2bEs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EKxq/KvjltaJDZR5/uCZ9nNqjsxEW7gy+/WtczHHZF9B9YqbhjbfzCt6aFSTQpic/
	 n6A8DCToawPGfJi1QdTCx83ygQ5YLHL+JVEJB7VYNMyKQkEWrRydtx0YOq3v5xdLtJ
	 eaNvByOF0zpWK7Y/CkQIqTX5gYp30eO99pxO1dntvcLvdzdcc/BgaVOSL5LwlyDFdI
	 zox337EU0Q3DGtrBsw0d8RFSuraiMqTCi/WI3tHYhx8ZkLGmh4b3hC7tBQMeUoiJsr
	 jqtiFug4Dn/Piqh/qNGv2xDHSgsyJTjIPGaSz03o1/m+ZVKNbUWaZPi4CFKt0ClZ/G
	 ZcUciPKaJjKgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A9E340726;
	Sat, 12 Sep 2026 13:59:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57D99701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D4EE60617
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7Quyrya4FHa for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:59:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2E1706060A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789221540;
 b=UoYkemVk+TaK/jCPY3EcYrlr/qCnfWKu/X9JwHvlN4YYWt79hC0MGeM8MLy4LcnoWNKK
 ArU80l8g2JBXqSOgc625yaD6yVQ1awLoK4ehroBZ4tK0MlDFB26GZacK7eNJdErwn4Nrq
 VT9hkxYXCZ7gRkuTRPKNv7sLgFYWkPpOP8RI8ccs2nKQpNUo6HOqKYOqnLgBDo7ATvAd7
 HQsuNQStv0qSGCrAp/DP0JAntqwXO2ic9WNCqUccboBHs7dWZmdvpc+vkN1p2kJlGcCW3
 w/BFZHioF8DtVU5sEiPv3Wy2DMKHYhxDg6DIZ+dOgAWGMcTfBRZ2QfJorNrZVkOQlsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789221540;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xCS4tE1ZPJHrbnrD+Ads03gRQGYs2G+o1Q+Yo4IuYqo=;
 b=AgC4YRHZslDzceS9/I+LIbgXg6nn4IAdTkoKjI14nGzx8rPIlAQBWAVCTaG4kFNxF5s/
 UcVyPJgEEEu0QTysc5TkAYJQgFEeJPruEpuZPo1jLBQY/lc9IbPpFgHhfFVc8xpq2kOnS
 SU29DWi6QZAydoC8IjPf39wxi/UFEff3i8zVghn6miNT4D/sjf66ZetgKNu1VlZ65UViG
 cHzSEw1EIRbzoVMouZq7SwOOy6tsi75IoNdQaYf27vuixqRDTTIoQGUjLxh9V6rayuWz/
 P1+6Q7bspVB/N9rEWqUpH7fblW0BgWCNplNXoCPeN7M3OGJVwumACZR0tIjFIvaOebQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E1706060A
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C130D955B2; Sat, 12 Sep 2026 13:57:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 15:50:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e5019c2e470e1502f1420879f644365c7ea8842
X-Git-Newrev: d540a10df9dbe8d7fd1c19f64d6594c36ad94177
X-Patchwork-Hint: ignore
Message-Id: <20260912135755.C130D955B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softhsm2: bump version to 2.7.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d540a10df9dbe8d7fd1c19f64d6594c36ad94177
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/softhsm/SoftHSMv2/releases/tag/2.7.0

Switched repo to new standalone repo:
https://github.com/softhsm/SoftHSMv2/commit/2355064ce4df21cda919d1600a7299e762918338
Also update the package home page in Config.in.

We need to use the github helper to download the code which also needs
autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: update the package home page in Config.in]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/softhsm2/Config.in     | 2 +-
 package/softhsm2/softhsm2.hash | 3 +--
 package/softhsm2/softhsm2.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
index ab409a2c96..c790e7a2b0 100644
--- a/package/softhsm2/Config.in
+++ b/package/softhsm2/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SOFTHSM2
 	  to explore PKCS#11 without having a Hardware Security
 	  Module.
 
-	  https://www.opendnssec.org/softhsm
+	  https://www.softhsm.org/
 
 comment "softhsm2 needs a toolchain w/ C++, threads, gcc >= 4.8 and dynamic library support"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
diff --git a/package/softhsm2/softhsm2.hash b/package/softhsm2/softhsm2.hash
index f59f0bf028..78ae2e7c2d 100644
--- a/package/softhsm2/softhsm2.hash
+++ b/package/softhsm2/softhsm2.hash
@@ -1,4 +1,3 @@
-# From https://www.opendnssec.org/2020/04/1602/
-sha256  61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2  softhsm-2.6.1.tar.gz
 # Locally computed
+sha256  be14a5820ec457eac5154462ffae51ba5d8a643f6760514d4b4b83a77be91573  softhsm2-2.7.0.tar.gz
 sha256  230cab7102816e99f7ce03ef476352fcad09d742fcbc6580d44393db6280b64c  LICENSE
diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
index ae44b93bc4..5e10c1ef46 100644
--- a/package/softhsm2/softhsm2.mk
+++ b/package/softhsm2/softhsm2.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SOFTHSM2_VERSION = 2.6.1
-SOFTHSM2_SOURCE = softhsm-$(SOFTHSM2_VERSION).tar.gz
-SOFTHSM2_SITE = https://github.com/opendnssec/opendnssec/releases/download/2.1.14
+SOFTHSM2_VERSION = 2.7.0
+SOFTHSM2_SITE = $(call github,softhsm,SoftHSMv2,$(SOFTHSM2_VERSION))
 SOFTHSM2_LICENSE = BSD-2-Clause
 SOFTHSM2_LICENSE_FILES = LICENSE
 SOFTHSM2_DEPENDENCIES = openssl
 SOFTHSM2_INSTALL_STAGING = YES
+SOFTHSM2_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 SOFTHSM2_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
