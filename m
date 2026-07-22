Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD51C44539
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 15:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678464078E;
	Wed, 22 Jul 2026 15:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duYKEHOK-uPq; Wed, 22 Jul 2026 15:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4848A407B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784734374;
	bh=CMcU+CmqY99s6fVXWlwjmZOjQtEGqtNEEkXJ4Pte+QY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=B2r4clIiP7IT3POG+3Fpuwyvgn4LnFBn/kp/kgfKWANWnQmoS99Zq2010bHV7QtvQ
	 hCGooX0n7SYrdQcKUutqbMs1Z36kjt2kVSr2pLYZkfRmfkbhh9DPaCDq0R5EAxm/sB
	 lfiiJgVPhcPi/oK3cp+Mog7tC00gSzmVJgqu5dOJh2FuiEkmmlUSWJcx1G/0ahATOj
	 Y4yPEI9XFBHup9fc+Q57MUXDKtrqGUSskawlquNrCMb4sAx6XoQSyU2li7c1sNW84Q
	 XTD1NT9MEORu9YxnN7hL8Z2velkP5J79/0TP0XsEn8NtcP95FWXAINdcwwgEq1qEf0
	 EOfpSzLqL1bgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4848A407B8;
	Wed, 22 Jul 2026 15:32:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7E33224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9DA1407B8
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kv4OiKsfo6zK for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 15:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73BC74078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73BC74078E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73BC74078E
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO2E-1xJPiZ0FEO-00cxBt; Wed, 22
 Jul 2026 17:32:47 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Romain Naour <romain.naour@gmail.com>,
 "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 22 Jul 2026 17:32:18 +0200
Message-ID: <20260722153224.624762-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:O1nvLvNhp2SuLp0CAGTrHtenFt+Wp33/FAfVqGTWC0qgwRKgI3O
 BILXScUwa+4emUMq023lWM5WDuQmcWDTS8F71+biknN7nVJhxL8Zv6iNyNQTJdANNn+MGhB
 ASv6pv1FbXwSRD//DCysUJMcPc4ASvpIuR20DaHtxqlCVtl2ZeV1iOz4VRzTU6TaJn1JTUV
 MFqh8s14XQWXUauDwNPaA==
UI-OutboundReport: notjunk:1;M01:P0:XAPagJaltRU=;wdhz2USZtIzNx8waYNAaDJyf7wg
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784734367; x=1785339167; i=fiona.klute@gmx.de;
 bh=8WCtBOaUukl8tBEJHDAeCidHkBNf5c7lPtC+T5LYjoY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BVovQv4n4s0i0CenZZ6+ED4ep7rBERZMjdW7ryWCQE219SQoEWM8M8B/fMoRB/JX
 uZ5INZk6f3hY9nLTpiqzianrBfgWEWBbyFi47B/5Hs658Py0zUKirsicAhObo6COL
 dgLn2o9Iow+oOh99LjlzeCtloyMjQ45MDhe2XRfHwI3jgUUzqIqJzJ8vpibEdGT3o
 OMzoLym14XAfQDgIKL6RDwNitjONM6n+h6mxqdBVHoglBbsjtE2nD1A/ccw2+KchM
 r0D4d4a9OeqsmXT8AgM2Z8eNrx1Y2zjapLrCJzaXDUgosFCaikL0dALEXuq6XucM0
 ISpLjCJI55RwYg9nSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=BVovQv4n
Subject: [Buildroot] [PATCH 1/7] package/skeleton{,
 -init-*}: add license information
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

All these packages are part of Buildroot and thus under
GPL-2.0-or-later unless stated otherwise, as described in COPYING.

package/skeleton-custom is excluded because it provides a way to copy
skeleton data from any location chosen by the user, the license of
which is unknown to Buildroot.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/skeleton-init-common/skeleton-init-common.mk   | 2 ++
 package/skeleton-init-none/skeleton-init-none.mk       | 2 ++
 package/skeleton-init-openrc/skeleton-init-openrc.mk   | 2 ++
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
 package/skeleton-init-sysv/skeleton-init-sysv.mk       | 2 ++
 package/skeleton/skeleton.mk                           | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index 4a67f51c19..299f2643b4 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_COMMON_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton-init-none/skeleton-init-none.mk b/package/skeleton-init-none/skeleton-init-none.mk
index 8181aa0354..d96af89e19 100644
--- a/package/skeleton-init-none/skeleton-init-none.mk
+++ b/package/skeleton-init-none/skeleton-init-none.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_NONE_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton-init-openrc/skeleton-init-openrc.mk b/package/skeleton-init-openrc/skeleton-init-openrc.mk
index b0538ad03f..b6b97a4e3e 100644
--- a/package/skeleton-init-openrc/skeleton-init-openrc.mk
+++ b/package/skeleton-init-openrc/skeleton-init-openrc.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_OPENRC_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index b312fe33e4..601285de28 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_SYSTEMD_LICENSE = GPL-2.0-or-later, LGPL-2.1-or-later (factory/var.mount)
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton-init-sysv/skeleton-init-sysv.mk b/package/skeleton-init-sysv/skeleton-init-sysv.mk
index 009dc100ea..dc9793d44f 100644
--- a/package/skeleton-init-sysv/skeleton-init-sysv.mk
+++ b/package/skeleton-init-sysv/skeleton-init-sysv.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_SYSV_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index dc754f1244..fd606c8085 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
