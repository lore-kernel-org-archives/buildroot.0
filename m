Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A39C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07D8E40B07;
	Fri,  3 Jul 2026 19:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjRix6eU1L_f; Fri,  3 Jul 2026 19:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21BD540CF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783108256;
	bh=5S5KTg1DBkdFK6ttH/kWYB9uSw/HIFn5Fep1zE9dPfk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bI5gpqJbzbAZ7tKA3qK4xTb+HFS0NpiJtJfUMMXu1GKxQ0iyvJXv5mEocqRtwICT0
	 xOBCSTcay5vJmsPQ+a9Wb/xcw20GveJnXsDLpNF87JBGTupTwaVXPcvxhyf9RO1r9z
	 SA1BGwyqu14ksRgv3JWNMkrQ3/RdVmkQMLb/AX3BpFwwKeGvAr3tQbVCQKH/9Wunwd
	 IvBQbUOw0BQctgdP/xGAEHjb0waTZWPF7h4PZaXVqKIuAbgqoZiZ5hLBCop2GgK9hN
	 k2HhvofTkZOCe90+Vv5GhUppeEundn5tJMkaNhncHni245CqwWBAC6Wq/x5odaUIZP
	 5R/DVaIFT/jCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21BD540CF5;
	Fri,  3 Jul 2026 19:50:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0232B14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E869340D06
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0Q3WOUWC5bV for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E06BD40B07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E06BD40B07
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E06BD40B07
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:50:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15D9DA4C0A0E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 21:50:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjuU-000000001Mq-39Mr
 for buildroot@buildroot.org; Fri, 03 Jul 2026 19:50:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 21:50:50 +0200
Message-ID: <20260703195050.3703334-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783108251;
 bh=uZfCMvGznGut+RvZkeOo3w537qcxDnzNfCpqE8w1Uc4=;
 h=From:To:Subject:Date:From;
 b=jOV+It34Xs4hd7WkZAJYc+lKMHmOwu8eNpLDKv6pyrLAvTrn59Z5puPlpycP3gxmk
 4gZS5nH/XdThLz3hrz75Lq4q2NywTz+hAYIO9bxawhDbQw6HiAEjDV0ozmcZ9qfnFN
 DMa2gqx2Qh8x0LktOEv9ITJ9SZL4khCOAHjorjbzvfD8Gpv71h7TIZpzxsgKODCg3G
 ErOkFmnAJza2rVaht8rY9KvHo1TQKoF+irAXrylRUqFsx+lp9wyaFiYJBn6CuiduCM
 S//eP+e2bHn2RBMOpZxZ7GR3PW2OEMjQluTlbL224sSY1cSw66cqtZNksLb9heTn2l
 voRXavoYCl5DA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jOV+It34
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.5.3
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

https://blog.clamav.net/2026/07/clamav-153-and-145-security-patch.html

Fixes CVE-2026-20213, CVE-2026-20214, CVE-2026-20215, CVE-2026-20216,
CVE-2026-20217, CVE-2026-20243 & CVE-2026-20244.

"Upgraded the Rust tar dependency to resolve the RUSTSEC-2026-0067 and
 RUSTSEC-2026-0068 advisories, and upgraded the Rust openssl dependency
 to resolve CVE-2026-41676."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d020186f5fe23e27e9b1d59374c2f31b4f550616

 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index db50d77194..be5a2ec5c7 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f34018cf22f05bdd9d1a1574ca07193e3e030ca52050c3e5c220e23a32314965  clamav-1.5.2.tar.gz
+sha256  89af57a45bbf13de4dc91ed7f20b435388c88428eb7dc30639a02b2f0fc2dad1  clamav-1.5.3.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 7f8008ab5f..9467174e93 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.5.2
+CLAMAV_VERSION = 1.5.3
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
