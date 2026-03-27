Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA6010F285E
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 17:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 656AB41008;
	Fri, 27 Mar 2026 17:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wahUYxxlkrg3; Fri, 27 Mar 2026 17:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 698AB40FD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774633469;
	bh=eFAOsPhKR6jcRjCpitGaMWAyjbkFL6eprjIxyta42/U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lHyvRAZEesqaWqR6Sx1mDt8V/fxCglj/zqTdrBTnai9ItuhRQthjyJ/AabCFpZ52T
	 mgfr6Ty8X4EJz69AK3ot2Vnc/lNlNp5ii/7y6b6KhFccoXt4H43Nac8WfWgPzly0d+
	 C+rr3B/syPB9p9MAGTREj2R2ApQAC2h5LPZSR8COvX9hl5DPYQ4SGYz3E7rinYf3lc
	 IAtxsrZHgU1ggqCNEum12Q91QIiP1QglrfSsO+uyDB480HQ5GVuaNW3Tl7QbAyi/H2
	 TTgNHWrQ+mqcOsCEaHMqVcSvGYOSCH7a5xxCYmeh4nFCjtnpbb8iMZkz/LpyFwsQoZ
	 gL254ieEecUfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 698AB40FD2;
	Fri, 27 Mar 2026 17:44:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B45091D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 17:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A45E83E11
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 17:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khpU3xuOR7rB for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 17:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 386CA83E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 386CA83E00
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 386CA83E00
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 17:44:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ba3.dip0.t-ipconnect.de [91.58.11.163])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 43E42A4C12E0;
 Fri, 27 Mar 2026 18:44:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52812)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w6BEI-000000007ai-3inn;
 Fri, 27 Mar 2026 17:44:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2026 18:44:18 +0100
Message-ID: <20260327174418.1880770-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774633459;
 bh=WB6Z57yARnBOz/kaFfx52NulEXVUsU9mauOvGJOQ+9I=;
 h=From:To:Cc:Subject:Date:From;
 b=nHdiFry53Estt0Ni400qqMGRrPfpuRkPTFVhdpFUrE0omhbaASRb/dNU6q51XGjkS
 ICZEfUFLh3ad16anE3OopVYcO9DmhqcZFCwAK38szC31X9OzbJwEpoVACUevwXSLwG
 ciRBiA0ZiPvAeE9syVFtah9lohsr+h4LkApiUUBmE3ZM8hQwpo6fxtMHGa2Cykqlzg
 tGDcP+jDPawHrpG8sxuz/ibKoQQl68uOKnbNQjg77l2Ftc3N5g0lU/+Ft1nMzQw3/x
 GtF1VZsqyxJ3qYwX9VHMMWEQ6zFqFNBTPZlWuvPt0YMxjKP9ALW7OwbQd8VjF4/pSn
 2UuNvfmoqflVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nHdiFry5
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump to version 2.43-17-gdd9945c0b
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

Fixes CVE-2026-4437:
https://sourceware.org/git/?p=glibc.git;a=commit;h=5c6fca0c62ce5bd6e68e259f138097756cbafd4d

Fixes CVE-2026-4438:
https://sourceware.org/git/?p=glibc.git;a=commit;h=dd9945c0ba40d2dbc9eb7c99291ba6b69bd66718

For a full list of changes, see:
https://sourceware.org/git/?p=glibc.git;a=shortlog;h=dd9945c0ba40d2dbc9eb7c99291ba6b69bd66718

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index ed6d69acc2..d7731eb280 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  5e21722755f466d15770574788394a4abb4fb1e02603a707beeb199706a26a46  glibc-2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160-git4.tar.gz
+sha256  742023f6c13500a56ae834f51c4453998b2dcd1ccb576fec457d49cdec3f22b3  glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 64a2c58377..bc14b833f9 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
+GLIBC_VERSION = 2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index aa746a9d70..28494364f4 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
+LOCALEDEF_VERSION = 2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
