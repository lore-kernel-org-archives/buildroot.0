Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7CCD68BDD
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 23:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7CBB60F34;
	Fri, 15 Nov 2024 23:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGCk-AIORsTy; Fri, 15 Nov 2024 23:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBBC561081
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBBC561081;
	Fri, 15 Nov 2024 23:59:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D07BF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6382C61081
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8-DHoptXMQv for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 23:59:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85BB560F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85BB560F34
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85BB560F34
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:59:21 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:c8e6:f99:ce4c:c68])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AF01AB0051B;
 Sat, 16 Nov 2024 00:59:17 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr,
	Vincent Jardin <vjardin@iliad-free.fr>
Date: Sat, 16 Nov 2024 00:57:54 +0100
Message-ID: <20241115235757.43480-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731715159;
 bh=OqnSSd5VTSoCZJvOXA41rXqYmsxZcsBG8CvpCaIYoyY=;
 h=From:To:Cc:Subject:Date:From;
 b=iCQRJLUZOsYt6KlQle6ROkvCykhXwd8uLjd1Q1v7fMZPeQoFcaespOI0dzJlMKxnf
 GE+hVGidLW3A5LgODa6kL+BoHRyxlxm5kVQHr4kuL/e3RuS6ZLr8QlUzGQpLuJ2O9n
 w0bvGD97CUJXxbJxA9yArvpqgqJGCZVvaivs2msJ3blLFfRZQfvNEAgCkh7Be+wG1w
 2rlOW1E0Wh9Ki6aPG8FIOgTNI8Jrnywj7MJR0n/I4/7ehqJTaq8/okRQM2qQKxQoSS
 WFQFzM+HW56lRPlMDbdj6qOaOzcVzyk7IrhbgULo7Vn6o0KSGpEMvFyY6zPn+qmWgC
 RWTkWPuoCcHbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iCQRJLUZ
Subject: [Buildroot] [PATCH v1 0/3] package/mstflint: add new package
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

From: Vincent Jardin <vjardin@iliad-free.fr>

v1:
  - add package/mstflint
  - import set of mstflint fixes for cross compilation
  - fix DPDK that can use mstflint if probeded by meson

Vincent Jardin (3):
  package/mstflint: add new package
  package/mstflint: fix cross compilation
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
 package/mstflint/Config.in                    |  16 ++
 package/mstflint/mstflint.mk                  |  42 +++
 13 files changed, 590 insertions(+), 1 deletion(-)
 create mode 100644 package/mstflint/0001-Makefile.am-fix-static-link-drop-LDFLAGS-static.patch
 create mode 100644 package/mstflint/0002-libxml2-do-not-enforce-isystem-path.patch
 create mode 100644 package/mstflint/0003-configure.ac-libcurl-patch.patch
 create mode 100644 package/mstflint/0004-openssl-add-missing-engine.h.patch
 create mode 100644 package/mstflint/0005-configure.ac-explicit-BUILD_DYNAMIC-for-Makefiles.patch
 create mode 100644 package/mstflint/0006-libmtcr_ul-drop-install-exec-hook.patch
 create mode 100644 package/mstflint/0007-Makefile.am-dynamic-vs-static.patch
 create mode 100644 package/mstflint/0008-libmtcr_ul.so-missing-for-DPDK.patch
 create mode 100644 package/mstflint/Config.in
 create mode 100644 package/mstflint/mstflint.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
