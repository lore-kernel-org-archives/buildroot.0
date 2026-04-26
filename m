Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEF7FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 14:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2B6084C35;
	Sun, 26 Apr 2026 14:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vQx9TwA6oPh; Sun, 26 Apr 2026 14:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93EEF84C30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777212276;
	bh=e5MAhOU4u/DDgzhKeWWgK+dhZvV82k/CkCPFG4xWeNU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SZXol4Ctdq4IZ32vgQPekza3ziAwb7G7F00WG/9G89YcKz75GjuKv7ph4d4gpTfKN
	 NAWbXyvUB6zgUq5mOiAxCfAePlOtopGLMk46lojhavCjS1DFeQ9txNUf58MbBf9F7L
	 LmLAaFqfySlQgZJIyUmdf/X5sBlB0yDDz/yQ1WsbAIE41AGiyMnDYSWV/CGSyHBMjq
	 yJStpgnogRGa9aMcIv3zHvSMQmYjJRh6K4OuNaSSB8cQZM3apsCmpjvGQDbomJjE7H
	 Q5md2f/GAkGzZGJNs2V21KAqIQMhT5JIVzH0/Q963i5PfpLmibIrQHHGtRXkeica5c
	 Xis+fS+wyKjVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93EEF84C30;
	Sun, 26 Apr 2026 14:04:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 261342DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1158C61BE4
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkmpXzKV4QVs for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 14:04:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97A4E61BE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A4E61BE3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97A4E61BE3
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:04:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EEEACA4C0883;
 Sun, 26 Apr 2026 16:04:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54738)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wH062-000000001bz-0pUf;
 Sun, 26 Apr 2026 14:04:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>
Date: Sun, 26 Apr 2026 16:04:30 +0200
Message-ID: <20260426140430.1467435-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777212271;
 bh=CxW+Cy7uOccR6BHEpSPw7U62Nlhdnh3QRnzAbGoZtbk=;
 h=From:To:Cc:Subject:Date:From;
 b=P6IDaQdyL8Z/FsmxzozQX9j1Bn/terqEsu4AG9uNa2O8dYkuCLJHSI5RRxOtdyeEs
 nCwmNgOjQbZoeEXCNZxXpKh1aNmD5ByeGcJM9khXc4/8LOC5h5L/kUPfNI1DnmL9yx
 pQ7m6sQJSdRRa6aRZsLFFJNdA6vwEfJRsXykAgTrTJUZ5wM/BgqXbeEDVE+MZojPfx
 xRGYCfY6XPOdo1rGNoCxAMxcxOj47bp0o2AeC/c5giymLHi+AUBJ1RYMvJyyRyDw+L
 PJTwwYRtwIrK1Ig+sGsP7ilgVlxajn5pQF+ICPPbyi3TlKlk4DITKzUCvsulh6+qxe
 hGb/fOMv9Tufw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=P6IDaQdy
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: bump version to 4.11.0
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

https://github.com/syslog-ng/syslog-ng/blob/syslog-ng-4.11.0/NEWS.md

Added sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 3 ++-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index f6d0e83433..c4b0cbe54a 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.8
+@version: 4.11
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 04f33926d5..a276e85385 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,6 @@
+# From https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.11.0
+sha256  37ea0d4588533316de122df4e1b249867b0a0575f646c7478d0cc4d747462943  syslog-ng-4.11.0.tar.gz
 # Locally computed
-sha256  f82732a8e639373037d2b69c0e6d5d6594290f0350350f7a146af4cd8ab9e2c7  syslog-ng-4.8.3.tar.gz
 sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 7bf77da205..2faf2cebe5 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.8.3
+SYSLOG_NG_VERSION = 4.11.0
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
