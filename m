Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05410EB48F8
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 10:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D784C60B3F;
	Thu, 12 Feb 2026 10:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NENB0yU8c-Pi; Thu, 12 Feb 2026 10:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD1C6071F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770892948;
	bh=e1EOoGhiyBcPquRHbXeLXu0oJ6KW/H0Fj23OPRL6XVw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=V7fAc+4SilMMFKUWbEt262ELqDM7o9D0gi1F+T4AvF0EVHa8GGawrPjR2Uo1Z5Yi9
	 rBsA0yfMlAio4dqGqMvJVjEcv0G50hRYzt2hETh7yLVcB5/htRGwbnTAIfo5JZlydE
	 dIJGQENSCj3nRsUEx8BF8cWPE9Hawu04lCTk2QJp+MHIeiJxb4hQOP6daJU8vv1iLm
	 gH4beByzS/JCiVR08WyrZMJnnAkwx+hH+JFUnnPtNrX44iFGEUIE9mWYGl5uKG2Duj
	 EK6Caubr9WnqdoCdeVolZ8uGlRO634QM582ojl9oYfgrhD+KYfUPQ7yYz3HDOc15D4
	 751+TTYAz3Nmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD1C6071F;
	Thu, 12 Feb 2026 10:42:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FE7BBE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24D76407DE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dObij0x8mDaM for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 10:42:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40FEC40769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40FEC40769
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40FEC40769
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:42:22 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A9A492C831BE;
 Thu, 12 Feb 2026 11:42:19 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 11:42:32 +0100
Message-ID: <20260212104233.3226085-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770892939; bh=bI3qo9vq7JfmfSAgKAJ6pxJqg1eZMPpidZKCI9xXqoM=;
 h=From:To:Cc:Subject:Date;
 b=UOank0wZP/vnHLeiE6ex8s74uDmAtLmoVjo2r9KrOyjb0Ado7Mu+C0A49507FOOmz
 EnoM9y6i7xGE7y0ChIHc8I/9nGk4c55aqHhjyLU3ypsrupM8kVQdNCUabckc79rrN9
 86kK/FvZVMJeXXizSKPlCiSvp911BZ7pQOq+j3k0HLxXqjKC2AP5hFd7n+AV65dOgE
 FbmB/ECs1sKw2V3XrtGWSR68ItSLhkVDQ0i5CgdmjDXVZGPjsJO+MVORubkgCySyyn
 SGD3i//oND657QWCPnJEqr9KXeM2zKsNJp3OoQZ8kRWbOX+qWvO4UZQi8pdUwy+tsf
 0412MeRhA9mDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=UOank0wZ
Subject: [Buildroot] [PATCH] package/python-asgiref: security bump to 3.11.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2025-14550:
  There was a potential DoS vector for users of the
  ``asgiref.wsgi.WsgiToAsgi`` adapter. Malicious requests, including an
  unreasonably large number of values for the same header, could lead to
  resource exhaustion when building the WSGI environment.

Changelog: https://github.com/django/asgiref/blob/3.11.1/CHANGELOG.txt

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 89495e0257..aecbdf8000 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  554794453502d266a90d2254fcb1f7c3  asgiref-3.11.0.tar.gz
-sha256  13acff32519542a1736223fb79a715acdebe24286d98e8b164a73085f40da2c4  asgiref-3.11.0.tar.gz
+md5  85bc32494d842f4941e2b1fc2c7b61cb  asgiref-3.11.1.tar.gz
+sha256  5f184dc43b7e763efe848065441eac62229c9f7b0475f41f80e207a114eda4ce  asgiref-3.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index e5885a66c6..392f0a1c1e 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.11.0
+PYTHON_ASGIREF_VERSION = 3.11.1
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/76/b9/4db2509eabd14b4a8c71d1b24c8d5734c52b8560a7b1e1a8b56c8d25568b
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/63/40/f03da1264ae8f7cfdbf9146542e5e7e8100a4c66ab48e791df9a03d3f6c0
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
