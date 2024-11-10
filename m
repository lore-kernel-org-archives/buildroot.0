Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A207FD12D4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 18:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D20E605A0;
	Sun, 10 Nov 2024 18:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-vdZzPeQAT7; Sun, 10 Nov 2024 18:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8780560630
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8780560630;
	Sun, 10 Nov 2024 18:44:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51A76D8F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F47E402A8
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoI-ZExCc9Rb for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 18:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3019A40294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3019A40294
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3019A40294
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:44:46 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:812c:23ef:fa95:555a])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F2A886012D;
 Sun, 10 Nov 2024 19:44:41 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Sun, 10 Nov 2024 19:43:23 +0100
Message-ID: <20241110184324.50580-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731264283;
 bh=Jt8lZMxfcwR3sMqEUz4EY4nkz6w03P3x8inynHiV9EY=;
 h=From:To:Cc:Subject:Date:From;
 b=DuDLHYovUQHzA61+qaMuVRQvETUlSvx8LxeWFRCNnenxbbrJvLhGReHe4mFDsJAwP
 eyP82rN6smVbP/27Xtp+L0WUGUm+f/yNtaITy89c0gK3kBFWsCpmQU3mqlEInF0unv
 HxHR/lt6J7peDIk4QwrZdGSJcFe5D+AhJbLLYzL3JqYUsf7N7dSKKEh2N64HX7uCrZ
 1M/RkgWbEY1XD17dGO/jtMoPjQkGynonujBLYtpu99v43xVhBcwMsaYqb+PdkXugQB
 /PO8Rp3fnLHDw5iTuADQYtlNZacHz/3seTwoyZ2u0R2BtPiXdKk865Wu4Cvk4W9xC1
 sAiHz39zAxYEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DuDLHYov
Subject: [Buildroot] [PATCH v1 0/1] nvidia/bf3 - fix eth names
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

v1:
  - set the eth names
  - include iproute2 needed to support property settings

Vincent Jardin (1):
  board/nvidia/bf3: set eth names according to doc

 .../bf3/rootfs_overlay/etc/init.d/S04ifnames  | 61 +++++++++++++++++++
 configs/nvidia_bf3_defconfig                  |  3 +
 2 files changed, 64 insertions(+)
 create mode 100755 board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
