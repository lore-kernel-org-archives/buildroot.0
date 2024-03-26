Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABF7C54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 22:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42D540139;
	Tue, 26 Mar 2024 22:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnwT8-aZ8cFM; Tue, 26 Mar 2024 22:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 790BA408A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790BA408A1;
	Tue, 26 Mar 2024 22:50:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3934C1BF2AF
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 22:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 263ED81EB5
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 22:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaQ9gCorueE7 for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 22:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56DE581E8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56DE581E8A
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56DE581E8A
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 22:50:35 +0000 (UTC)
Received: from localhost.localdomain ([79.54.175.3])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pFclr9KIiJAuQpFclrBn6b; Tue, 26 Mar 2024 23:50:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 23:50:29 +0100
Message-Id: <20240326225031.224022-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIvAxgoedLNsciNceAscyJSUuJ1QIicUGclQ7QHck6dwgr0PQAcMYoNLKGrsoEGCQ38ie30lIHF50BhUofwgWKNftf0WkmWq45LNU+q4SduIHbNMxEXg
 Me+cxUqqvhY8Bm7X1IfuwJ/22Ee58BrsPU4nlrs0CPgAobH8TBG+W8B3QhFjHZffP1dvIPQCVItbYTQCIK9BsgsB90YR383CXF41sqqjN2wvL7mO74a71Vjb
 t58SLHsDaYcWc8TN8ibxXIbADCEYqJZbVZ98bDv+1hQI6Obi+lViLsbCi70qoDWPClsHCdqECEGewNaX1+waxfI/G/b3FwaAoEjSG+ILyWueoPub7vVWhxi2
 iGKnztXp
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1711493432; bh=v0RdBEAiEUDXZ7gJFpVxSmKJ7on02XPSnwLELIb3zIw=;
 h=From:To:Subject:Date:MIME-Version;
 b=nzONQyKtRq/PIQnvvjLJZrXWwoW7vf89m8glrMgBswijh+4lVIZWw4ZnAiyz9lvtD
 eXDPKMeOinvl5GF7fIknHV+cf7TcbKuxKwI9nK+WM8xf9vyArXAbcZHbJR1GRYFH8o
 ORtfOO/2eoQz3sFZEx07OaAq+RF1F/BkahnN0WW4PGD13S0yQtI4xaL/SutQ7q5coG
 t6BcOfAOWPjsDc27esSRXGI4vjGzqShF8rip9YGOLJ+fhgW4h9/ltkPhC9ZFiLtqP8
 e6y3BBJUDsQ2iJAhzAu9OxN7MiSSh+gmLzwhnvaCrMPeM8ru20jGTdeE+J45Linqfc
 2INrAHHmX2nig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=nzONQyKt
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2024-03-25
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this version we can build with Linux 6.9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index b3d6d2c569..fba2f7a109 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3ccec54462a8668142a9c2b2ddfffe4e0434feebe6caf6a7de6812dc8713c37f  rtl8821cu-5b39398e2de146edeb76716420f3288f508bea61.tar.gz
+sha256  c04741129e815c30c51e509012d1a21e4f6d568c211921e6bc46e1adc3d4d4e1  rtl8821cu-0b505f382ea67bd8bdc9288ba5dbe7f4c9de33c0.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 8cb8ea710b..39aea1d7a4 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 5b39398e2de146edeb76716420f3288f508bea61
+RTL8821CU_VERSION = 0b505f382ea67bd8bdc9288ba5dbe7f4c9de33c0
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
