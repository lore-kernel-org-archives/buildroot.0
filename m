Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E98CCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3269580F7E;
	Mon, 19 Jan 2026 10:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmHnIE6MTZ_z; Mon, 19 Jan 2026 10:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52A5681344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768819097;
	bh=9Oc0e/FSa3I8ABdM3D/d8gQf1wkTjZOmTQ4KhoVKlwE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=j5/gmpEx0feASgLt//3A1Em8NN9Lo0HcfpOWcJIeKqnkJvQvPR+0Lu9u3i1i0QpPd
	 bJ85nrnF5QVoI6rw7G/VD6U7NbAA5sZSPSA+P0mOe7tyWx9809ToX/PAjigHjdVRcR
	 /8BzMaT3GQnLyM+hsXsbJlTQndvGqS2ZMiLw94LWYlBQDnZlauUumPjZue3h/2FgPD
	 lFQ1fK3tzE0I1IFVBS+b8SY3fY7mlOw3uIUByMV9TqtC37QxuRUbEzAmgZIdBjg7xo
	 CLVUDxV1Fok9KNawG86WFxMEM5TbJuoSDvKUGPe9Kfg3SgEHBazSQfHigLjm+eqSVh
	 6+i5JOKtJ9JjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A5681344;
	Mon, 19 Jan 2026 10:38:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD392CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAD5440D9D
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gHIZN6GBUru for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:38:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 277EF40D94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 277EF40D94
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 277EF40D94
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:38:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1441994200; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 19 Jan 2026 10:38:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vhmeA-0000000C5LJ-1qKS;
 Mon, 19 Jan 2026 11:38:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:38:08 +0100
Message-ID: <20260119103809.2880459-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rhSLv7ez736iu1c4bKbu0LH7ssqBq5uM90F+T5VTeAr6+wG1wXhJFrbVkyRER7H/WaAB5ybUu+SN2V7dsLW6cOaVzR3nkmQUurLK8dAn66O3s5RBVlzF+QfASqrsLbcFiuwkpxoUthA3bfd10MSWrRKy34zSOoNDPsGqLeHGMobpvCDS8a5Yf7M7aJYd5VLa6Qqc+Wsb+BxAhMJQNshUcgvztm/mW5YA6/tfS2wx37o7GEBN9f/xlYeitRFlIaOMilT1+UBp0xWtkBDqbztJfhVKhPC3CTM82aqbnf5g6yZ2T6FPo6gkGtXlrWwJv3D+cnWV5exZf0lvo8se+s14ug==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=kKZg/GYY8YZ7BMEBsz3nbKZuE9GAS+smAmsMXAcMpEo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=rhSLv7ez
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/python-urllib3: security bump to
 version 2.6.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

CVE-2026-21441: Decompression-bomb safeguards bypassed when following HTTP
redirects (streaming API)

https://github.com/urllib3/urllib3/security/advisories/GHSA-38jv-5279-wg99

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 76fe4e5fc9..858b8ca3a3 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  838e0ffee00ec870a3ba6727a7832ab8  urllib3-2.6.2.tar.gz
-sha256  016f9c98bb7e98085cb2b4b17b87d2c702975664e4f060c6532e64d1c1a5e797  urllib3-2.6.2.tar.gz
+md5  2c381874816fe551f50a2551abae62b3  urllib3-2.6.3.tar.gz
+sha256  1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed  urllib3-2.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index d57473566b..7f7f0b03d2 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.6.2
+PYTHON_URLLIB3_VERSION = 2.6.3
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/1e/24/a2a2ed9addd907787d7aa0355ba36a6cadf1768b934c652ea78acbd59dcd
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
