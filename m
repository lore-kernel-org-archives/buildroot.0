Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA725D68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F206E40485;
	Wed, 17 Dec 2025 22:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJHzscCmcSaT; Wed, 17 Dec 2025 22:25:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DAD440475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766010354;
	bh=ge2vyG7UzqVus+rJCewH5onx9tMAZ6Z00vhHpUvebrk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PfXOtb4odDhc+0uiqkOIbuTPqJjBVAi0hiKWyezuVPRbHhNCklANoR/+BAUmlnVA+
	 gVUa9/noFxvUZA425eb+gkk4M++F3IrcXo5sAEQHBY+BVlo+mt12vF1+9gI27rLpWP
	 dg8chVMtf05UjAVqWiN3d8N1yTiWSRpjm259IVWYnCHmSQRlMmYbxj4OSQnQqGHDEc
	 wCAGwhVaw8MGS5cKu0bpmOi1eKGeuIlYw6M0DQb6k/fZHVXD8PiQrrsi50cNKZ5mBY
	 QIzkaUGqs1fIf8w0GLitbLSf87MkMkmR6RPwsyb1VbQ8eUKHMgXd5kkPvXeTodrCFX
	 p1ITDE4Fx/GYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DAD440475;
	Wed, 17 Dec 2025 22:25:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63BFB375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA4E403C8
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o35nF8HLBdx7 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62DE9403B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62DE9403B6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62DE9403B6
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8992B1A229C
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5EDB96072F
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:25:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D7A0102F0AE7; Wed, 17 Dec 2025 23:25:47 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Dec 2025 23:25:38 +0100
Message-ID: <20251217222539.1989993-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217222539.1989993-1-thomas.petazzoni@bootlin.com>
References: <20251217222539.1989993-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766010347; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=8l5H7oZIGEiHotarDS0mZyEbV8JZ6X/DXA2AR+3qFLs=;
 b=GFhc0NSIaZQZIL9Dqcc0j9uodHJtrlo8XF9P2YFC3ZX/YapQLtcc2VFeJsnGmfjkcKDU7P
 lWkmE1KZOHS1WNpjZVZNRiEOx3pN385PL0JfuqvegFbi6SSBoNW1O/1WwMifsgc2HIOltC
 sfY/MOOkBBLztmFgQRylRKS2ewupyBlFqw1cwJ6jcv8xQ58681UNC3PKql/Chos2yEAh7f
 H05RqKylGYGbL+WJ3YT+puJBXK7V2bq6syXqsZzT8JtqITde0G8LQj0F5aVbJ76NFH7ijQ
 r/wXrXCZyZKzzhSewAc6aUDRx4iImyxtSQsypEzTwR0tEvyAQPQlqQEdEdrkSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=GFhc0NSI
Subject: [Buildroot] [PATCH 3/3] package/cppcms: change upstream to Github,
 bump to 2.0.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cppcms.com now points to a Github page at
https://github.com/artyom-beilis/cppcms which has a 2.0.1 version, so
let's use that. The number of differences to 2.0.0.beta2 is very
small:

$ git log --online v2.0.0.beta2..v2.0.1
b872972 (tag: v2.0.1, origin/master, origin/HEAD, master) Version to 2.0.1
a1914f7 (tag: v2.0.0) Replaced system category with one from predating C++11 (v1.2) because std::system_category does not translate WSAGetLastError results
c4febcc Merge pull request #104 from dreaming-augustin/upstream
922cd49 Python 3.12 compatibility: wrap regex in r''.
a11e9d4 Merge branch 'cpp11'
3000bc6 (origin/1.2_updates) Merge pull request #99 from dreaming-augustin/master
44e24c7 [#89] cppcms_error fix typo + consistent  messages
a6d5575 (origin/cpp11) Added backtrace to system error
b3aef3b Fixed missing include for stripped down build
463a9a6 Removed IPV6 due to travis limitations
f8163c6 Merges from cpp11
31d4fe7 Added verbose log on failure
90bc996 Added Linux to build matrix - so I have fallback if normal build environment fails
f78ee39 Added Readme for github
a737d5d Merged python3 compatibility from master
0c67544 Support of python 2.7 and python 3
0d121a7 Python3 compatibility
2fc7e38 Python3 compatibility
d745869 python3 fix for tmp_cc

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cppcms/cppcms.hash | 5 +----
 package/cppcms/cppcms.mk   | 5 ++---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
index a8d04ff36f..8e59f66489 100644
--- a/package/cppcms/cppcms.hash
+++ b/package/cppcms/cppcms.hash
@@ -1,8 +1,5 @@
-# From http://sourceforge.net/projects/cppcms/files/cppcms/2.0.0-beta2/
-sha1  746cc5e3f58565d91d9ded6e2616399d60e9d01d  cppcms-2.0.0.beta2.tar.bz2
-md5  ef561d13ee92d2053151cab073feba10  cppcms-2.0.0.beta2.tar.bz2
 # Locally computed:
-sha256  697031c7d141fdd215c6be5090b66e2106a63bb3e52f09ee8120e8efc6c08a21  cppcms-2.0.0.beta2.tar.bz2
+sha256  4a7a2217b3fa59384650912a7000e016c308b4fa986a3d2562002691e5a9d6e7  cppcms-2.0.1.tar.gz
 sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db  COPYING.TXT
 sha256  3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f  MIT.TXT
 sha256  d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b  THIRD_PARTY_SOFTWARE.TXT
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 8a59990a8d..b39122d12f 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-CPPCMS_VERSION = 2.0.0-beta2
-CPPCMS_SOURCE = cppcms-$(subst -,.,$(CPPCMS_VERSION)).tar.bz2
+CPPCMS_VERSION = 2.0.1
+CPPCMS_SITE = $(call github,artyom-beilis,cppcms,v$(CPPCMS_VERSION))
 CPPCMS_LICENSE = MIT, BSL-1.0 (boost), Public Domain (json2.js), Zlib (md5)
 CPPCMS_LICENSE_FILES = COPYING.TXT MIT.TXT THIRD_PARTY_SOFTWARE.TXT
-CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
 CPPCMS_INSTALL_STAGING = YES
 CPPCMS_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
