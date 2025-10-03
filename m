Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D527CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8414127E;
	Fri,  3 Oct 2025 20:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uHKTtNu7fq8; Fri,  3 Oct 2025 20:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F256341262
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F256341262;
	Fri,  3 Oct 2025 20:13:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC8C118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0321F61510
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5xE-oUdo4cO for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF7E661506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF7E661506
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF7E661506
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:13:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 24ADDA4C5BC6
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 22:13:50 +0200 (CEST)
Received: from [192.168.1.144] (port=52188 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4mA1-000000007bk-2xsf
 for buildroot@buildroot.org; Fri, 03 Oct 2025 20:13:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 22:13:49 +0200
Message-ID: <20251003201349.2430422-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522430;
 bh=0o3iw/b9lpa7RRZpBrv+8fcfk71tiNIUSwCrPU07hNs=;
 h=From:To:Subject:Date:From;
 b=0vQso8H3GczKq7aV1VhDsJKyZxSDVPO1GE3yN6Hb/QwIah0JpEvYbBdJdNeC5hzK6
 Ny8rxJirFr/5p+3US2zKM+lLOD2oXCpKF7TUKpxe5jOt7dclVZMIDBlO3a207S4yPR
 rURhkdZ+OHviHx4FEcQ9cpPmQw8SgcdJEuzuTKsPHWNaStqDTJf2bCbYTplgAeLF+J
 l8CWtDWiJS64mMDHVfQdVBBxUkjW3mo6ytVbb46lB7Ww9n3vjHOsroL93VWjoqfFlX
 eEAa9ruKvicvXx1ARUd8GOVRVDMR+2SuVWolLLikAV+CQRD3Nj53mftxOHz3P7oA6n
 G7p15HCVs6o5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=0vQso8H3
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.12.1
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

Release notes:
https://ccache.dev/releasenotes.html#_ccache_4_12_1

Updated license hash due to upstream commits:
https://github.com/ccache/ccache/commit/df37867663000135eb0e80a7baad1fcf5b96b571
https://github.com/ccache/ccache/commit/bd2147f30307ab62dbdb8252e9c6f2ef2b1ec44f
https://github.com/ccache/ccache/commit/9ee66d6f93e2aaba974eb1871b71411fee92990a
https://github.com/ccache/ccache/commit/fbdcabc521aa2fba8ea600e8e45ab26d161b79f3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index ad617a3501..88377109db 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  d5a340e199977b7b1e89c0add794132c977fdc2ecc7ca5451e03d43627a1b1be  ccache-4.11.3.tar.xz
+sha256  42e6c4b260cffd92dfa755e26390f45f5842e8c1a5f64f2b2e68adfbe82d1542  ccache-4.12.1.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  115fd61246934e8581b1ef9263017cae89e61b5f11599d7f7d6b98f69a700e66  LICENSE.adoc
+sha256  fc33d985529cdb5ea484ee46d6df4de6a6bca25ebdd3f3211c9d15f1c59dc75a  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 963ecd835e..75ef404d27 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.11.3
+CCACHE_VERSION = 4.12.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
