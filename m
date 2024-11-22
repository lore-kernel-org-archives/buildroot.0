Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D30BE6ADCD
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 23:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F279813EC;
	Fri, 22 Nov 2024 23:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRB-Hm20gTJC; Fri, 22 Nov 2024 23:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A4AC813ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A4AC813ED;
	Fri, 22 Nov 2024 23:02:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A9DF1D93
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18B5B40022
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyZTtUKyY8S3 for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 23:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C88354013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C88354013C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C88354013C
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:02:42 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:c192:5f44:1fb7:e350])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9C7FEB00539;
 Sat, 23 Nov 2024 00:02:37 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Vincent Jardin <vjardin@free.fr>
Date: Sat, 23 Nov 2024 00:01:18 +0100
Message-ID: <20241122230120.96898-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <3dfed5b9a6cf85883a65e432ff53c3b5@free.fr>
References: <3dfed5b9a6cf85883a65e432ff53c3b5@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732316559;
 bh=v+PMhTkzvkgcD4SlTyYrD0/+Xj9YYoKNSbwY1ZJ4gGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AE6M+8/K4YPnxngZUBJcyC48ZTv7Y8TExYsdFmDY+e3rNABjCs2tsXZtzrB+5B9Uc
 Fty3XqOoTopkXXmKfBhhRPvySi/8jdN0aXFeZ0dw5/rrA1mC+4HbV1KJyysBpVgRLm
 bpTZ1cggaEQS7UVW2CVaSOcop7Uw3TtJm4tJjAsnPRWAaLP4f4JxtE7gGgVuWxvypz
 SAiydm5pgC6yNuF2qN/8u6TCh35zoM+waiW/scyj9ixxbGsN+3IzGn/GQUV0EE6m8L
 QxGXyU83LeJEFcxtNI062QtuK28J2LZGoCQFJ2Iht06hKjUZjwent89N6vvYtVr/pc
 f73y+lF24i/NA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AE6M+8/K
Subject: [Buildroot] [PATCH v3 0/3] package/mstflint: add new package
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

v3:
  - apply comments from Julien Olivain
  - reffine Config.in for package dependencies

v2:
  - squash mstflint cross compilation and new package
  - keep 2nd commit since it just "helps" DPDK's meson
    to detect mstflint
  - currently, there is no short term activity on the merge
    of https://github.com/Mellanox/mstflint/pull/1026

v1:
  - add package/mstflint
  - import set of mstflint fixes for cross compilation
  - fix DPDK that can use mstflint if probeded by meson

Vincent Jardin (2):
  package/mstflint: add new package
  package/dpdk: add dependency on mstflint

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/dpdk/dpdk.mk                          |   3 +-
 ...-fix-static-link-drop-LDFLAGS-static.patch | 250 ++++++++++++++++++
 ...-libxml2-do-not-enforce-isystem-path.patch |  51 ++++
 .../0003-configure.ac-libcurl-patch.patch     |  43 +++
 .../0004-openssl-add-missing-engine.h.patch   |  29 ++
 ...explicit-BUILD_DYNAMIC-for-Makefiles.patch |  43 +++
 ...06-libmtcr_ul-drop-install-exec-hook.patch |  29 ++
 .../0007-Makefile.am-dynamic-vs-static.patch  |  54 ++++
 .../0008-libmtcr_ul.so-missing-for-DPDK.patch |  29 ++
 package/mstflint/Config.in                    |  24 ++
 package/mstflint/mstflint.hash                |   4 +
 package/mstflint/mstflint.mk                  |  45 ++++
 14 files changed, 605 insertions(+), 1 deletion(-)
 create mode 100644 package/mstflint/0001-Makefile.am-fix-static-link-drop-LDFLAGS-static.patch
 create mode 100644 package/mstflint/0002-libxml2-do-not-enforce-isystem-path.patch
 create mode 100644 package/mstflint/0003-configure.ac-libcurl-patch.patch
 create mode 100644 package/mstflint/0004-openssl-add-missing-engine.h.patch
 create mode 100644 package/mstflint/0005-configure.ac-explicit-BUILD_DYNAMIC-for-Makefiles.patch
 create mode 100644 package/mstflint/0006-libmtcr_ul-drop-install-exec-hook.patch
 create mode 100644 package/mstflint/0007-Makefile.am-dynamic-vs-static.patch
 create mode 100644 package/mstflint/0008-libmtcr_ul.so-missing-for-DPDK.patch
 create mode 100644 package/mstflint/Config.in
 create mode 100644 package/mstflint/mstflint.hash
 create mode 100644 package/mstflint/mstflint.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
