Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7CBF94CA7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 19:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9135841FE3;
	Tue, 21 Apr 2026 19:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BatDfchcW-3B; Tue, 21 Apr 2026 19:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1240641FBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776798174;
	bh=c9m9syRNNqhdkv3KgTqtk91BqgUZe5greqCYg8MlyWw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eCXXJ2pnaKmiwoWIDjXTbb3c20/hjQdWXpZk+fwWDlagANPJcdpV2pwjCQ92yIjFC
	 w2hcTuVgkxtQH2wVpYjMYRzK1GlhFjTVqOU8sY1647Gz0QZBHUPWmbxSFFfSUgYJK3
	 6iS3aTvr+k0QRgRkn9zsDqVab6USAy8F4LYNplKVMPqrF+GBGxtOM0JiIRhbQ+QjXf
	 kNf26ss9Qdiqs/SVycBGCEzrp8OXRYs5tVm3e3xV1Fgkt3YOJHab1zlajLyPqWqTBu
	 SGgpwm6uMRA5KxO8F3tRvwhF2QWV+mnGNl5pf+pSbpXqIWMDA/nFfgOr6z3jH8dZj7
	 qhixqKpPxzI7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1240641FBD;
	Tue, 21 Apr 2026 19:02:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 879FD257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D9054039B
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFjs4cE19AYE for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 19:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6547A40364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6547A40364
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6547A40364
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:02:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89568A4C0185;
 Tue, 21 Apr 2026 21:02:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50852)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGMz-000000003jB-11QD;
 Tue, 21 Apr 2026 19:02:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Date: Tue, 21 Apr 2026 21:02:49 +0200
Message-ID: <20260421190249.2722418-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776798169;
 bh=3ws8ou1qL8Yhp4fVjkzlDiOGEm4BsCX/nYfBtdaMraM=;
 h=From:To:Cc:Subject:Date:From;
 b=IsUfH8BSlUhw79r1r69ueTvNJbKPXSFEtVkeRW/KvzLQpvaKCB+rte+Uh2FL1zA2q
 gkJCD5xGLXc7cP6da4HsLjUYE4vbCiSd3HUwtmLtGTh8BjW5BZsq2CmZs4x4NzJV6a
 7hSfHt3LMZh0mG8x9BJwnyLSuCNBpRpL9S1eDk5ilxQMnfKqEym91VsWjMr/UNG4Dk
 yqDZYC+lCYrix+VUWkqe8mHzmjgaBcNHG7yPCpCck+1XXzjUDpByhxnR8g1LXyJ9Wc
 6YRkasEsea3KCxxNak9kwgISz2J16CfVQ2yh9AZOYOIM+FJ3poZz9PjGiPtO4Y1+kg
 I2SJPl1kJTqcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IsUfH8BS
Subject: [Buildroot] [PATCH 1/1] package/git: bump version to 2.54.0
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

https://gitlab.com/git-scm/git/-/blob/HEAD/Documentation/RelNotes/2.54.0.adoc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index c22ee800cb..0b927e5989 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  5818bd7d80b061bbbdfec8a433d609dc8818a05991f731ffc4a561e2ca18c653  git-2.53.0.tar.xz
+sha256  f689162364c10de79ef89aa8dbf48731eb057e34edbbd20aca510ce0154681a3  git-2.54.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index d3625ddf08..10ef081223 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.53.0
+GIT_VERSION = 2.54.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
