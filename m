Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FEFD10F20
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 16:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 724B06077F;
	Sun, 17 Nov 2024 16:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9qYpVud_jOn; Sun, 17 Nov 2024 16:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1C59607AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1C59607AD;
	Sun, 17 Nov 2024 16:20:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DA62DB2
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C28784B77
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NY8RDxeqOTAT for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 16:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0609D84460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0609D84460
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0609D84460
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:20:49 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:4a2:8c06:3742:179a])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A17882003A4;
 Sun, 17 Nov 2024 17:20:44 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 17 Nov 2024 17:19:25 +0100
Message-ID: <20241117161927.27620-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <3313806598076f4509530136ba913320@free.fr>
References: <3313806598076f4509530136ba913320@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731860446;
 bh=4ceEnhprPWoGu266Q8RuIKoJ2eBvgNy//baGM48cnxo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V4PvXY0VWxWWmssAYY3X1SuMnZagJzGa6rFxbE6tXonq8BQOLJDrdF+wqi/iMGjaJ
 y9BJHjyLKRyVygTHrMMeX+QLm5aeAy/zNQfU7IPf0H9JfHTS/kSqsAcci06H+DnZ6R
 PDFpo2WwAs7ojcweiDhwiUIxGZ/vnIlf7BcLuhOR2l2disNDkQqKNSATWDkG2yej49
 JDD0sYinV3avPdAJCnsY4Rf0l/o6XPWeVj8QxgoeX/h+OvFoShZ3yX8/25NuppODCt
 w8H1gP96YRyuUwdrYmkoveEmFToffB7q4SqsvIopLgCT0zxV0pjh5pNlW/lvNG/MVZ
 8X94BXX8o28Vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V4PvXY0V
Subject: [Buildroot] [PATCH v2 0/2] package/mstflint: add new package
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
 package/mstflint/Config.in                    |  16 ++
 package/mstflint/mstflint.hash                |   4 +
 package/mstflint/mstflint.mk                  |  42 +++
 14 files changed, 594 insertions(+), 1 deletion(-)
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
