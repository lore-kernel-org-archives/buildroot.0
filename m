Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB700C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 10:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637D340542;
	Sun,  9 Aug 2026 10:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bqkwn-iiOphn; Sun,  9 Aug 2026 10:36:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F7CB403B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786271772;
	bh=xdcdZe7fgCDaeeWg67scB5Bd0yPv+KX9D7fHJthq/yI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D18mOauuFYT/Jet/XGoK/K/7asdkCWgaz+bMacC00RmQwesCN0KJyA+PuwiXrIokg
	 bqnWcK+MbZCslpLawB+hmr+cm7qw+NPqpoJcz1MyltlcawLNrN3hqNxKa+FueF36ej
	 vhAUYYbl621z3LUWswWo3qy0mB0BwB8sLM79oAlSF4NSHg5+McLdaMzXlOfU3YntIJ
	 Az8TKOnhnwH82fT4C0FIryQF8vOGqeXgxPYDryMZqgq/CtvzyYJs7Fj4WmKREaA6iR
	 4vGJ0diAWzJMY9iJxUBH9JEdHNYxuqkHX9MKoE2YgwF8t1rJ0aiAq+zRo1XEh3hHn9
	 ZATHoH1FZIi1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F7CB403B1;
	Sun,  9 Aug 2026 10:36:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ED8B198
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DA7A60655
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OB1MT1RItvbp for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 10:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D99960602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D99960602
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D99960602
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:36:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bda.dip0.t-ipconnect.de [91.58.11.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 37156A4C499F;
 Sun,  9 Aug 2026 12:36:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40046)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wt0sw-000000005Yy-0JvB;
 Sun, 09 Aug 2026 10:36:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>
Date: Sun,  9 Aug 2026 12:36:05 +0200
Message-ID: <20260809103605.907605-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809103605.907605-1-bernd@kuhls.net>
References: <20260809103605.907605-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786271766;
 bh=d16i7RhdtiurOo12//o3ap0qgzZdru/x22GhH0mkDEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hmEX7zFK5Pyo1YXSs89m/rw4ZvOIZag0dURjHBdViymkiEQldT25LOClCnx1le/wu
 +nT5g9wwD0/MbTqomj1w0Sp62DTgWq2xp+9sMuAB2RAGe82RWQvKAcuCAbG4Tn0gwN
 n1pZ5G/rlIk8bPw6odljmYDNX/azNU+b6BMdUSnCUa3campaHJijCIWCS3ksWpKI52
 noiWezN3B83rtdVsvBeTXuZCLyuK+tkYEDkI8aRPEKE3wCL/O1kZLe+nRH1JU078hU
 Ztgl3qJWKDnqa3EyhZFkjpXdL+yIkbXq1UwmpwoihnrrhvjBmRUAVcXJiPYNfXeJwe
 R8SRmFGT8aZ5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hmEX7zFK
Subject: [Buildroot] [PATCH 2/2] package/syslog-ng: security bump version to
 4.12.0
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

https://github.com/syslog-ng/syslog-ng/blob/syslog-ng-4.12.0/NEWS.md

Fixes CVE-2026-39879.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/243681251be3b0fb45a332cd2d27bff7769bf73e

 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 4 ++--
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index c4b0cbe54a..ae6f190c92 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.11
+@version: 4.12
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index a276e85385..95621bde26 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
-# From https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.11.0
-sha256  37ea0d4588533316de122df4e1b249867b0a0575f646c7478d0cc4d747462943  syslog-ng-4.11.0.tar.gz
+# From https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.12.0
+sha256  03a03d19ac203dca53c7ec79a7005c8a850665a95ff4cd0f1e7bb4c497c64d46  syslog-ng-4.12.0.tar.gz
 # Locally computed
 sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 2faf2cebe5..12c305b9cd 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.11.0
+SYSLOG_NG_VERSION = 4.12.0
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
