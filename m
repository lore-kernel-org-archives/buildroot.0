Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0C5D12D4C
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 17:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F33C605A2;
	Sun, 10 Nov 2024 17:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtIffBql1Wg9; Sun, 10 Nov 2024 17:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66254605C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66254605C7;
	Sun, 10 Nov 2024 17:34:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 609D6DAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E19D809E9
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzrjvvVaAJzV for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 17:34:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A731C808D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A731C808D8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A731C808D8
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:34:51 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:812c:23ef:fa95:555a])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7A65E5FF3F;
 Sun, 10 Nov 2024 18:34:46 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 10 Nov 2024 18:33:27 +0100
Message-ID: <20241110173328.48325-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <aedee4f5789c42dae10d18bc9f9f7c61@free.fr>
References: <aedee4f5789c42dae10d18bc9f9f7c61@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731260088;
 bh=4olAz+Y8aVoivoTWUeQomV74nz85FhXICaERJCa81xI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qGnCtxn0Str/h1alB0H48OkSczj/m5i8P90Fxctuii92Q1W68CEoiWR7SJxgi8VjB
 nO4s1eXXn44AzR5YKVbmYNRNOj45GFMKSxr7KOePi6F75ed37/efC7HspK/53M81Tv
 uVerv/1D8IC0SIhXadGiSVP0rkrkzrNP5AsDn4XdxzaJE4TonnNTB0tw3RCGLCb1yy
 swcHiu/E3oftTvqzjby8kDiDH71bZki7guQhZagCK00ULd1qDGyHq2lp/UJYvtpgZT
 K9KrtcX7O5WZH45/hPM+B8RvWDl1ZUiSmGwRJu64zqhGjVKwzsfc7IZiTPpbDovcun
 c7LoEvCzbLDnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qGnCtxn0
Subject: [Buildroot] [PATCH v1 0/1] add bfscripts
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
  - apply reviews from Julien Olivain
  - do not include bfscripts into nvidia_bf3_defconfig
  - refine the bfscripts' mk and Config.in
  - fix some warnings: shellcheck S99bfup

v0:
  - it is a Request For Comment patch
  - some of the bfscripts could be run on the host CPU and the
    PCIe ARM board, so I did not enforce a dependency on the BF3 board.

Vincent Jardin (1):
  package/bfscripts: new package

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/bfscripts/Config.in      | 12 ++++++++++++
 package/bfscripts/S99bfup        | 20 ++++++++++++++++++++
 package/bfscripts/bfscripts.hash |  3 +++
 package/bfscripts/bfscripts.mk   | 28 ++++++++++++++++++++++++++++
 6 files changed, 65 insertions(+)
 create mode 100644 package/bfscripts/Config.in
 create mode 100644 package/bfscripts/S99bfup
 create mode 100644 package/bfscripts/bfscripts.hash
 create mode 100644 package/bfscripts/bfscripts.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
