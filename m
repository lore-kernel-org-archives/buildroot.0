Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4234FC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 10:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F115B40987;
	Thu, 28 Aug 2025 10:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVbVHbqFUgW6; Thu, 28 Aug 2025 10:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A12440B60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A12440B60;
	Thu, 28 Aug 2025 10:24:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E40017D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F8DB40C39
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWTDnaCAYNDs for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 10:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BFBB40987
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BFBB40987
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BFBB40987
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:24:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -77535260; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 10:24:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1urZoA-0066Ys-29;
 Thu, 28 Aug 2025 12:24:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 12:24:40 +0200
Message-Id: <20250828102441.1455178-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=P1R101G5RaNs0NjEv4hdpMxRNXPHl6UYk+qqttAST2YiVg2UAQX9Ty8l0yjOPSmadqiVP+lpEEx7COLPErbgToLXQG5Io2UkmWVl9D5Dj1uv+/2CI34is+5QNHKolRbbZWa8irdtFuOPBSUylquC6sUfGowpMSncjJoqSkbz/Dto2tbmP34IVMmTBFclPkAcprCtvjXJ7fFWsPwZInYa1x0UwwUi7P5otxvtwYfsdl0onOuvb/GmJeM8LpKK2OdhyC3mGbUH1rEddA4TX7PnYJIYy9Fl59JbsAx/XfBEsES08z6Jc4lvMkOgpjkbnOEmaGwvMjGpa7cCrXu9R8K7Xg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=zxYmMCcwI9Ozzp8ivxQZsEaWklh3t55XC9WX51UTmLM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=P1R101G5
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/squid: bump to version 6.14
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

Bufix release fixing a number of issues:

- Bug 5352: Do not get stuck in RESPMOD after pausing peer read(2)
- Bug 5489: Fix "make check" linking on Solaris
- Fix SNMP cacheNumObjCount -- number of cached objects
- Do not duplicate received Surrogate-Capability in sent requests
- Fix Mem::Segment::open() stub to fix build without shm_open()
- ... and CI and documentation updates

https://github.com/squid-cache/squid/releases/tag/SQUID_6_14

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 2 +-
 package/squid/squid.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index df52a3be16..329d61ca93 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  232e0567946ccc0115653c3c18f01e83f2d9cc49c43d9dead8b319af0b35ad52  squid-6.13.tar.xz
+sha256  9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd  squid-6.14.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 4519a7d36e..b021170d9b 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.13
+SQUID_VERSION = 6.14
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
 SQUID_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
