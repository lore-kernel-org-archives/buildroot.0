Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D83FFD5F98
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 08:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C10F80E5F;
	Wed,  8 Apr 2026 08:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DI1Cqhs3yyjF; Wed,  8 Apr 2026 08:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4545080A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775638512;
	bh=ytEMivH6/Uf/zU9JekeuO9mC3lJQMuwCRvpANQTWDKA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P1UNK0nRas+lmUFc7Su6AoqgUsuqZtSe96q5jyeoCHPkVF0Yi4yxMLv0DZJMUhkDc
	 idULkx5IxYwnhrOXc7LuXCNLqvoJk1EB+ue3ZUqsSbDLERV1niJpziz5mzmHLBj2ej
	 Q6VXUdzHO4i39UXBDwhl/ESsvlAhapzAWIHhCgibISbHL+/eKenb7nYvYfaT5Y5K6w
	 HBn+/CcwPRkb8U/TuajwLBnz1VEahiVJ4LvfQ4XcTjArO7oeQY3d44dmhm/5vYsxs+
	 jFGIsgdDOFO5k1Yvb+/T3F2U4BeXhQHKdTeq9ZHa7ri1Sxxfb3WwlxwsUIgWqcjKij
	 j2IkvEgSJkbJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4545080A6A;
	Wed,  8 Apr 2026 08:55:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E6B0237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 404C080A6A
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8U5RJnLpdwm for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 08:55:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B9F880835
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B9F880835
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B9F880835
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E635CA4C10EC
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:55:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34486)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAOgk-0000000056i-2bAk
 for buildroot@buildroot.org; Wed, 08 Apr 2026 08:55:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 10:55:06 +0200
Message-ID: <20260408085506.1641767-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775638506;
 bh=pDVkdAuWEFfRm2sYnQ+YZbuof5jH8b7S4qq4uAVrdBs=;
 h=From:To:Subject:Date:From;
 b=areHKL9KWuPqmYdJViLotgulcRrhn6hrtKLvdi6uMloWmK1VZloZelWZqG+veLU/1
 wBTOC4jw+v+N9Y3ZxGdG42RQbvhET8ikvTHJBOnvJEI4z1/uI5wYKJtuOggZcwad/x
 rvrBKy+edawUQqmxl65vGLUC1qMLH22g7UGZrd4GLWJCo7VJ2OhdnGFkU25UHsRs1K
 IRiTvbAvqKEjxAwDppQlnRx0F9Bp2C3/rDIhSWv+nVpahwCWJkQV1ClHTc0ahSIOvB
 G+e9l7BKXj8ehKweVEjnTzXdp0VfkGt87GjJ6Uzr4LbkK4rXZSXpCPGRa88OzA/9HC
 j/V/sxK5EZcCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=areHKL9K
Subject: [Buildroot] [PATCH 1/1] package/libde265: security bump version to
 1.0.18
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

https://github.com/strukturag/libde265/releases/tag/v1.0.18

https://github.com/strukturag/libde265/releases/tag/v1.0.17
Fixes CVE-2026-33164 & CVE-2026-33165.

Used sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libde265/libde265.hash | 3 ++-
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index efd48d13aa..d977af5521 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,3 +1,4 @@
+# From https://github.com/strukturag/libde265/releases/tag/v1.0.18
+sha256  800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8  libde265-1.0.18.tar.gz
 # Locally computed
-sha256  b92beb6b53c346db9a8fae968d686ab706240099cdd5aff87777362d668b0de7  libde265-1.0.16.tar.gz
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 3d9b96134f..aab86ab3d7 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.16
+LIBDE265_VERSION = 1.0.18
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
