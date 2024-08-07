Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3289DC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 04:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D28B8605DB;
	Wed,  7 Aug 2024 04:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GG_uTeAABrzB; Wed,  7 Aug 2024 04:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0487C6065C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0487C6065C;
	Wed,  7 Aug 2024 04:46:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CBBB1BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1854480E0A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNWW3rcrN7qR for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 04:46:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 309F980DFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 309F980DFE
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 309F980DFE
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 04:46:06 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0C8BE3520FD9; Wed,  7 Aug 2024 06:46:03 +0200 (CEST)
Date: Wed, 7 Aug 2024 06:46:03 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrL8C1qwlKLMafsT@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723005964; bh=NFY7pFR+Cs6Nnf5+2rPy9fNXjE8uE9G9OWYrDMbCnvo=;
 h=Date:From:To:Subject:From;
 b=SOma2K4lMhZpy6ImmXfVXWV4oJQTTuwkyXe0WKE+9PvyXdz3kRsDr9YK5oaymkKQE
 84N7F9Z26hA3QAFD2wVqlkEBg+naAzXVed8vB2CgePg/wSXrnkz85zyh24YwDG1xJv
 31YsfTrxPqQwvm+A6Y5OmGQeuUgfYUpazqkbuGKaNLhX9fKVVNdbxmfz83nIy7ENzk
 15Fb8NPg1McjwHzO2tvClpzcDowSPcueYGaokBGggw8SD8K3aVeJ1M1fZmibUsz8ae
 TQFr3BSi3wQcgZtqUGKDAXeOQJRX+glLWYvg//spQQF+mY1cIhZ2AbMFJjFwvKFvmW
 /J8h4xqJ3p7YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=SOma2K4l
Subject: [Buildroot] [PATCH 0/3] Upgrade to Binutils 2.43
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hello,                                                                                                                                                                                                              
                                                                                                                                                                                                                    
This series of patches update binutils to version 2.43, doing the
usual dance:

 1. Add 2.43
 2. Make 2.42 the default
 3. Drop 2.40

Waldemar Brodkorb (3):
  package/binutils: add support for 2.43
  package/binutils: make 2.42 the default version
  package/binutils: drop support for binutils 2.40

 Config.in.legacy                              |   6 +
 ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ------------------
 .../{2.40 => 2.43}/0001-sh-conf.patch         |  12 +-
 .../0002-poison-system-directories.patch      |  68 +++++-----
 package/binutils/Config.in.host               |  10 +-
 package/binutils/binutils.hash                |   2 +-
 package/binutils/binutils.mk                  |   2 +-
 package/elf2flt/elf2flt.mk                    |  12 +-
 8 files changed, 53 insertions(+), 184 deletions(-)
 delete mode 100644 package/binutils/2.40/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 rename package/binutils/{2.40 => 2.43}/0001-sh-conf.patch (84%)
 rename package/binutils/{2.40 => 2.43}/0002-poison-system-directories.patch (87%)

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
