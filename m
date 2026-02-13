Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6DFEF99E0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 22:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71AA88127C;
	Fri, 13 Feb 2026 22:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1LuU3twbzZh; Fri, 13 Feb 2026 22:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E44C8117A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771021833;
	bh=q3IELNxZk7q2SIZ6OtBkhgnoIqUo8RqUKpa1Gavuewc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xjd3ldwGOpfVp1ScAK2B/VPQenhpJVOIPS8cNWt0ZehCdBTTFcXti+x7HMbrvYT3K
	 oxMsYYYkQw9sZTRyvMLYE4lLTgQBuXqqHfK6RsWAWYb+GyhYmnQ1KFi/azeIEQ57Oo
	 bSzX6XjKGzMUMhyiFDsusCkgzLluQ+B29SAoRvx6sKFM+qzK1mFoXbpJgmYiIw4nzL
	 1n/l0zyK00VDMLXgF+zKILgPtV5omOcgvxcaxiEoFKw5pabo50Sny0qazo49lgNJ+0
	 opkuW+NPZwJKbwobkqvpvJVEerO13RFCf7WVWzQDmu2oKzSkwACI8zsY88tsnBJn9+
	 7OHw+j144P/Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E44C8117A;
	Fri, 13 Feb 2026 22:30:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96CD869
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 22:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87B378115A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 22:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZNbXy90MyYc for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 22:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 055558114B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 055558114B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 055558114B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 22:30:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BCA00A4C03B8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 23:30:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60612)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vr1gB-000000000hw-0YCY
 for buildroot@buildroot.org; Fri, 13 Feb 2026 22:30:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 23:30:27 +0100
Message-ID: <20260213223027.1192852-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771021827;
 bh=nrhJ5ie4+V8aVuVjAtAvDB+Cad+B1kzWP5KmThwfRg4=;
 h=From:To:Subject:Date:From;
 b=oe3DZJqgk2QYjlchOuEyBmuZEnoqWAOejmJ+/tvZS4yg7RwX5MYxZQ/3wjKbSTb4W
 24271KEku0KZfa+hAFXj+oJiAPkyHx6L83Ipxs7Duq9Q+5IJfE0F6xkt/uHzum8dS8
 iH14BOQcvpUJ6qFzDhs9Zalqg/Jkl4+Y8eVq4IPF1bxvdM1DxmB4n8eIy5auEuaDgR
 RSCgbdwjKXooX3048b6SA4nsb7LR0CVXHE0mF/sU7UTlS5jwg78TJzWMNLf67lxo+m
 DI0cNcH8yqFCMTe0/82U0eN8mjSYmELj8Mkj37OMZ6sVjl/FC1Ek9feKxDzROREDP9
 WfKCVthbFAjng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=oe3DZJqg
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20260210-rev1
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

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/blob/microcode-20260210-rev1/releasenote.md

CVE-2024-24853:
https://www.intel.com/content/www/us/en/security-center/advisory/INTEL-SA-01083.html
CVE-2025-31648:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01396.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 4c6676dfb0..41041370e2 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a9a0d17240f486461bc101ef74f2b8c10675cdd02d0ba0bd6168b061c62e970  intel-microcode-20251111.tar.gz
+sha256  9232313161ce9dee5facd2870a7bd361d6000b1d409552b5c12efc6498e7f402  intel-microcode-20260210-rev1.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index e8bbf15a81..9f6592132a 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20251111
+INTEL_MICROCODE_VERSION = 20260210-rev1
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
