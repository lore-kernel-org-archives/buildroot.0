Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5EBFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 18:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0160883412;
	Mon,  4 May 2026 18:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoCzjVHEQmZ8; Mon,  4 May 2026 18:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D153843A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777920328;
	bh=QaWbVvWdOyuzPiLTxtTD+WrtQdlfiFwDAFTxc1jlGHM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=V/K10ii8Rca4dmu/c+nY4D8A+4PLC6y2YDmuyFTQFc2gCMXqBmNTooQLf9XH0kFnD
	 vl7VpugO4p75jaVHTu2SePnxTgtqz2gUIQmTE3yC4Fqvzg/fLijSnOMGixV+rFrBtW
	 MKA+AXGs6uWozbvhdOLMAY8OL/AQuHYUJZSkd3rABS5xVxrsdeHlzunshtlz6ayD5T
	 vuHK5/IuhBu/DaUxETovrM1RWa+/sV0hJukale36DuQwCz8d4cbi+ApeNJ0ncBblOX
	 xQBCZ6fSTv9NxGza3TsdgwimfYlTIfUMtNZ+idU6yCllG9bQO7jqynpn5SnSZAj9D/
	 gyRFXA2PNxkIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D153843A2;
	Mon,  4 May 2026 18:45:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B767190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 18:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D5FA4051C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 18:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJLBTAmG8Rzs for <buildroot@buildroot.org>;
 Mon,  4 May 2026 18:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AD474047A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AD474047A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AD474047A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 18:45:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1114533911; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 May 2026 18:45:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wJyIA-00000001Uco-0koy;
 Mon, 04 May 2026 20:45:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  4 May 2026 20:45:14 +0200
Message-ID: <20260504184516.356034-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Hr30qkE3qMaQJ6n2y2KOWoSJy1cbjgC3zqwXl/z99is/hc+DnGY4bXgPXgxNtl+cVHIQEVa2P42oBHBZ+vgkqlH9uU3GohmHl5Nlse1YNIw3PC+mnHyM752TjpW0HccrDxa6v3yaA2tNdHo5txvr9keyrHUcvdBru7tGqUEwPfm9L/IkHblAFYfChLpTYkYvxir1/b2OnR7c9iCuxeMmu//WQ39W3rkvv80zWyATQc4UlL+62PC40cy+lXZ9BdBWpZVfPUnHmkE5ntJUb02rWxP7IYCgnhZCOr3mU1XdspZHe+P0O9Aj58GLOzLXu8aGrR78PTShjlM+iN79iAWj5g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=p7ZLGuDcfH4E72iq+AE4XHWZ97sUaEKPdikeq5KaTEY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Hr30qkE3
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/{glibc,
 localedef}: security bump to version 2.43-22-g8362e8ce1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

CVE-2026-4046: iconv crash due to assertion failure with untrusted input

https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0007;h=b880fb55449693b879beae443e5d9bc1070b938b;hb=HEAD

git shortlog  2.43-17-gdd9945c0b..2.43-22-g8362e8ce1
Adhemerval Zanella (1):
      elf: Use dl-symbol-redir-ifunc.h instead _dl_strlen

Adhemerval Zanella Netto (1):
      riscv: Resolve calls to memcpy using memcpy-generic in early startup

Florian Weimer (1):
      Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)

Michael Jeanson (1):
      tests: fix tst-rseq with Linux 7.0

Xi Ruoyao (1):
      elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index d7731eb280..c9215dac6f 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  742023f6c13500a56ae834f51c4453998b2dcd1ccb576fec457d49cdec3f22b3  glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718-git4.tar.gz
+sha256  c5d012c0417d1a8d72e72ea2cd917422fa04f9ab525f418c537cad5cd9042803  glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 1d9cd34cef..0a44015818 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
+GLIBC_VERSION = 2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -37,6 +37,9 @@ GLIBC_IGNORE_CVES += CVE-2026-4437
 # Fixed by glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
 GLIBC_IGNORE_CVES += CVE-2026-4438
 
+# Fixed by glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
+GLIBC_IGNORE_CVES += CVE-2026-4046
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 28494364f4..ec906fad22 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
+LOCALEDEF_VERSION = 2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
