Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C134C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 16:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5754680E32;
	Tue, 18 Mar 2025 16:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIXC8NkDdPbQ; Tue, 18 Mar 2025 16:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 638AC80E5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 638AC80E5A;
	Tue, 18 Mar 2025 16:07:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4684F950
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3386A80849
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcHlPHe2MbGF for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 16:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03D8980E32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D8980E32
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03D8980E32
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 16:07:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8f2.dip0.t-ipconnect.de [84.161.184.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 229BEA4C2745
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 17:07:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48368)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tuZT4-0000000012I-19WY
 for buildroot@buildroot.org; Tue, 18 Mar 2025 16:07:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Mar 2025 17:06:59 +0100
Message-Id: <20250318160701.25265-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742314022;
 bh=pKYifaxlAxlS8ZAQOo9dqnJwTup8hisUIlEycc83k0U=;
 h=From:To:Subject:Date:From;
 b=G6WweSYkp9GqaBqh5yl2plnnYQ12dYblPh8kwKsooxizTVWnSbbH5s3rtG0DOJ1z6
 csgULYX+Qmdgb0hqtf2UDj9IX3I61Oo2GH1Pfi2W+nHlDspSm9/+pJm8LA4aNYnNKc
 4+U5IvufmbgJTNKFUoexw+Lh28BLFgzYdlhHOfVcu/4tR8+2zhG8BYFKLTfiGfdK23
 VvxIYxhYGgeQcDHg1CCNDpmC7hCH4vkKyaLQoafSL19zz9QixTGRLWiHilTHEoS9WE
 q5+5Rm17NgUh5OxD1o1Wkd2lMGgCeFQSlB+DJTzqWRvsVz3i3A4SQCTYzLkH6HJc0O
 xK87FFjyXgmJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=G6WweSYk
Subject: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to 22.7.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 9b421af3ed..badeccd2df 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2be3de25e45ed6b32d6ea173510b9e4ce141c22f9d6ed18dd5b574b33f34748c  intel-gmmlib-22.6.0.tar.gz
+sha256  05852b59e7e0757cc85e79842fefc5d63c75d51b26fd388732ca0b4d3af93584  intel-gmmlib-22.7.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 66b0d1629a..6668abd23e 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.6.0
+INTEL_GMMLIB_VERSION = 22.7.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
