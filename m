Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2EBE9D3F7
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCBE60D5C;
	Wed,  4 Feb 2026 15:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IGO67WGMZkN; Wed,  4 Feb 2026 15:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F76D60D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770217259;
	bh=fkFXqlCsa9a1n3Y9Vx5NbVAL9hYBBCzPrLpECBKVez4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=U1/3LCk1fId1ZF0VJ8i8RMVjPK2dnzNCJU7hv/Ws2Tngv9wN5BrVLafNZ7gJEXHVi
	 94mxe6rAa79uXHC12EXfN5MzqplzGI0UuevTWvpJar6j4nTRPijKSqpV9Zmk37I+hw
	 aCYFYW8kDkiu2TTn/KNIlgtGZMbpsrjdh0FPUXDJye4csk/Ua5K1ZQfAzIslFOzsEQ
	 lrLpjNJPHDyYq+h2sT/4M+cXktS5XxZZGHibKOiZn/UFP2UJXRn0ZCLAzbO6JVkqt0
	 LKIsrAxz0EegaEY6DZycWhggj/R0VM3LZHfVKoagp+KvBTG7KybW7GRnTM8KsGGux2
	 iqoEFzdbkaffQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F76D60D5E;
	Wed,  4 Feb 2026 15:00:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D837173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5926F40315
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fc0r5C9Ec5ZF for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:00:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89A35401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89A35401DD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89A35401DD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:00:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2039454534; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Feb 2026 15:00:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vneN9-0000000CpS1-04fw;
 Wed, 04 Feb 2026 16:00:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 16:00:48 +0100
Message-ID: <20260204150049.3057699-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=wUo8nuEBAsK6TsVLAdNwULLMBpFjNIXgpJcNQtuLIJxXZM2rJ09AtUmE9aNEhWFPxMlU2s2X4wmMhmLTX3p94nfIJCgg0Eb/9+f0iQS5S/gRUT3ezhdmW3IcWfalaAQbcKc2ERBD4h/7KyB0rfW33C4JuU2TfoyvO511vEKsiTdZZTTWFkOaJSqhZTJGhqkOmXh977WQf9ikimK3NJ+JoldptHHaGU8X5s8P1oXhzu4dFDdWOQSy7qvHcv7ZENexBCDOMkfuFDY0MVBrWY1MkB3N866LbPIumWpC+3ZhHSKsG1rEDu15Xka9zgBQMJ1gdgaKDpKjrw92ai65G3dzDw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=erB8Z+zLX5H25c1XSqspSIySQa4yOZ0DVGgQ+9Fphsw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=wUo8nuEB
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/{glibc,
 localedef}: move to sourceware.org git repo
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As described in https://gitlab.com/buildroot.org/buildroot/-/issues/160, the
github mirror is getting shut down - So move to the sourceware.org git repo.

The github mirror was originally used because of performance and reliability
issues with sourceware, but that seems be resolved now after server/RAM
upgrades - E.G. from the sourceware news:

April 22, 2024
    server2.sourceware.org now has 512GB RAM, thanks Red Hat.

https://sourceware.org/

So change back to fetch glibc (and localedef) from sourceware.org over git.

Notice: The git archiving leads to slightly different paths and permissions
in the tarball, but the file content is identical:

mkdir a && tar -C a -x --strip-components -f \
	path/to/glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125.tar.gz
mkdir b && tar -C b -x --strip-components -f \
	path/to/glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz
diff -urpN {a,b}; echo $?
0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       |  4 ++--
 package/glibc/glibc.mk         | 10 ++--------
 package/localedef/localedef.mk |  5 +++--
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index a58bb7b9a7..0a11cfdb5e 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
-# Locally calculated (fetched from Github)
-sha256  f63ffa06cd17ee8ff891f6de41de6e189b96edc6b2be2807ae597291f4464388  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125.tar.gz
+# Locally calculated (fetched from git)
+sha256  737e3b2bfee2e3e209e514133f4ff7d2bef0d0dc903fd46b4e2244f6c998f7b2  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 44bf9c4b06..80d21b86ed 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -8,14 +8,8 @@
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
 GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
-
-# Upstream doesn't officially provide an https download link.
-# There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
-# sometimes the connection times out. So use an unofficial github mirror.
-# When updating the version, check it on the official repository;
-# *NEVER* decide on a version string by looking at the mirror.
-# Then check that the mirror has been synced already (happens once a day.)
-GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
+GLIBC_SITE = https://sourceware.org/git/glibc.git
+GLIBC_SITE_METHOD = git
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 254a79026a..4da110417a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -8,8 +8,9 @@
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
-LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
-LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
+LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
+LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
+LOCALEDEF_SITE_METHOD = git
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
 HOST_LOCALEDEF_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
