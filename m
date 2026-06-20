Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF452CDB46B
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 15:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 974496086A;
	Sat, 20 Jun 2026 15:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8P5Qq-PY0AY; Sat, 20 Jun 2026 15:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA8ED6F994
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781967729;
	bh=31t7oTxGElwntrFfnuL2St9mSt1eEp80ji5wLj3E+No=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKw7tvU+RO4AxN20NX8KicqA5ROio8+WwMD9B9qBpwrUb3l/a6S6RMOAV2KEEFoA+
	 cOykIEyKxXqHdqZzgzATwaw0+tSDdLkXwzsiYFy2MUywOK08IWkLCGPw9JkgixTZRB
	 Su6PGhTBhMc70M24/sQ98vFUo0p3GQ20rwKjSZ+mNAJAmEwyi0dXnzNkpWd6HMv90a
	 zuTh0/dqx+WkyJzdqgCfjJyKAWzZuRzoo8WeA9Xl0WQQZ1hrtcoyf+T5Sx4+S1+dp5
	 ASWbyUtKjlOj/O3BtlcvpRb/GwQCGK0mlBf6c5q9+m8qn8GbuzrEv2K3lEuaTaIBeB
	 A17+0TcLDmzCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA8ED6F994;
	Sat, 20 Jun 2026 15:02:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 907532D7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76A7785651
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLC3LAqYauzw for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 15:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80F9D854B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80F9D854B0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80F9D854B0
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:02:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE2D7A4C16B2;
 Sat, 20 Jun 2026 17:02:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54672)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waxCt-000000000Fk-2Y28;
 Sat, 20 Jun 2026 15:02:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2026 17:02:03 +0200
Message-ID: <20260620150203.4036943-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260620150203.4036943-1-bernd@kuhls.net>
References: <20260620150203.4036943-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781967723;
 bh=679zQhIdKyREqjzoiqYqAdbyZzSGjnvToQ21Or5k0EQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jBjPxso7em4jUi6/9AfPHeSQsSdeD/DVbgRP9uOe0xJLzIc3GDiAWC9bW8IjTrLH3
 6y0l/A0oCSD71BVmy3jI/ZzitwchQp6WQ5ClRGiB+XoU3R8uBmH2ZKqdr1j9m3/ety
 vCO97QaLlFtTpdb/xks7W2LC5GXdgnn/7mOZan2DN2Rc3KDn4PfBnJ4qhAH0TxpuUQ
 0V36pDpVlee2raRIvH2KnQmRauKbnJVz2lyyC569mqQg1CxANbHys/msR6xX81YxnP
 9aqhY5T/gSx+kAishNfC8cLgMKxYbj78VMnRGHOO9gazQpIf0qSWYE1Zp6ucnVe4es
 3YI3jF/YSNvEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jBjPxso7
Subject: [Buildroot] [PATCH 2/2] package/cifs-utils: bump version to 7.6
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

https://lists.samba.org/archive/samba-technical/2026-June/140908.html

Version 7.5 was not announced separately:
https://wiki.samba.org/index.php/LinuxCIFS_utils
"December, 2025: Release 7.5
 - Various fixes for utilities"
https://git.samba.org/?p=cifs-utils.git;a=shortlog;h=refs/tags/cifs-utils-7.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f73f3d6fa47e362d38c258e823b6bbaaa559e616

 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index e6a5eefeaa..cfa2a84648 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  53353d05c30b4fc9dac006a8f0c5054cdd8a1834c176313c91e4694025c4b891  cifs-utils-7.4.tar.bz2
+sha256  7db875ff2868e5fa4e445ada0bd23ea70b9161b96188c7e276321e061ed51dd6  cifs-utils-7.6.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 58ac594b20..72f432326e 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 7.4
+CIFS_UTILS_VERSION = 7.6
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
