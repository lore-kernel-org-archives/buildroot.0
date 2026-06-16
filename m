Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB16CD98E0
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 07:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7114961CE7;
	Tue, 16 Jun 2026 07:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyzEwKpXze3N; Tue, 16 Jun 2026 07:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33EA61CE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781594484;
	bh=ztkg10b8AXDsPc0MwKzxCOx2Tbpeq/y0Bl9MVtAN6aA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EbKmd7/pM6kWl5jesMwZwSs3P0zLoBo6lcB/HPAWdKZtwNfUo2rPcxYmvfBcJtZFU
	 COt9eVTd6G8YA17rjq6CadIkqoZMpRJIlSl1zQLBelw7EA2teCctcZpbOGANMrISai
	 Ct47xMfjeaajgwa2bkRPXApzshrYAjhyjaojpbggkbaFe+7Aw48RZqOjEHVzggofqS
	 r/vkaEOAlNOx7MwXjk9ZUJU2Q/8O8+YIvyn1uNIhLjeXzjb9ZVn/FCJ2TOj0/Vs15K
	 GYy0GteS9SNzVaCtMe7TuYkGGoadQxM6uWSuNIWjTOi5laz7pIqs02396iaDcw3sRt
	 AwnjPAhfbXg9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E33EA61CE1;
	Tue, 16 Jun 2026 07:21:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39919169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 07:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B0D142BB5
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 07:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1B2wvC6Tba8 for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 07:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B2E542BB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B2E542BB1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B2E542BB1
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 07:21:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b12b.dip0.t-ipconnect.de [84.161.177.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8EF6BA4C0183;
 Tue, 16 Jun 2026 09:21:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47452)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZO6c-000000005we-2uaR;
 Tue, 16 Jun 2026 07:21:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 09:21:06 +0200
Message-ID: <20260616072106.1202605-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616072106.1202605-1-bernd@kuhls.net>
References: <20260616072106.1202605-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781594466;
 bh=b39afv/vlVW8DE+WrCFZ3DDukDrSDo6DuVUI25eDxIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=phM8sfAQ6D1er+2to9oFS/KoJpaxUgf+0cC1EeLugSZ28Pjs2AbfklDWlh4qbcchB
 u/bicOYVWQgzgw4sIxORzJgvPFc8MfqmD14gnlLLxJ+wC8dfYQ+3PkO7hJXimV/1Ti
 yqqKTpewIptEleRDFNv6lpmCeZoqq3wuMGEV4R1BfWJwS2iY773zr9YkkjK46BPn9S
 EofTdQ+7xUrPQiwsCNHYUSOwMysrk5JSzbw0WC6ejOdVUjksespd6mlQgLsL4W1ytH
 IyE5PKS6joXZHe+HOdRHfN/sSKw5igJD8NZk+ALqg6jwJ0+YmJ52m4Cl2e7iKCWhtl
 jL0qb0ZFTnVIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=phM8sfAQ
Subject: [Buildroot] [PATCH 2/2] package/strace: bump version to 7.1
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

https://github.com/strace/strace/releases/tag/v7.1

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f76e1ae64d9004f060d6ebd7f2c4a4db75c08fc0

 package/strace/strace.hash | 7 +++----
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index ad164dfa5c..8df107c948 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,6 +1,5 @@
-# Locally calculated after checking signature with RSA key from
-# https://raw.githubusercontent.com/strace/strace/refs/tags/v7.0/GPG-KEY
-# https://strace.io/files/7.0/strace-7.0.tar.xz.asc
-sha256  6c92419be3f2ec560b31728a4652217c59864c8642ba7b1b3771b1b013ad074b  strace-7.0.tar.xz
+# From https://github.com/strace/strace/releases/tag/v7.1
+sha256  81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f  strace-7.1.tar.xz
+# Locally computed
 sha256  b897cf6bb865cdd72f49fba6ca7b66ad075b9bc51d3cf372923220ce18b5350f  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 5f39bba1bd..a0688939ca 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 7.0
+STRACE_VERSION = 7.1
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
