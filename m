Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A063D12671
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 09:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 100ED606F6;
	Tue,  5 Nov 2024 09:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3UrSzKDgjH5; Tue,  5 Nov 2024 09:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC7E607A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EC7E607A4;
	Tue,  5 Nov 2024 09:59:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 135CC3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 09:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01DC9607C1
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 09:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUktmOlk1Qu9 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 09:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26410606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26410606F6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26410606F6
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 09:59:06 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:a4ad:3140:e0ab:8c71])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E39FA13F88D;
 Tue,  5 Nov 2024 10:59:01 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Tue,  5 Nov 2024 10:57:43 +0100
Message-ID: <20241105095744.60477-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730800743;
 bh=dUCysAB5AcGf7feWyiSHnDcXQHRdhuiennHVNwFMJvo=;
 h=From:To:Cc:Subject:Date:From;
 b=MQ1ChLmr4CAEf8mvW/U/rb4VZUCYAsjnDqo/fVZew3j86nbfAi02vzelO/iOW2FP+
 +TCvq/Hf9QAEywMrw82lTuquLVqz0mz8hC4L7N2zhfnDtXfGU+kdcM9Le0ejQr0AUj
 C70c71SrvjQJdIZ8twG3xQvDgdeD6jsWVZzx/rdOHIYD02uNvPD1fnFqtdsNIt8VBD
 xySwyfpaZBcs/iyWGe1GgB8KK8T3nsanJJxXaHHAB6Rbbb24FWe7ntvQq00/lcS+V0
 ruUDIBvWtIFKptvDTyHhCe7sc7GPayGyzGbnn1M66gC4UehD/exYKbDDxShD/b1WvT
 06gK7B+Tt3PrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MQ1ChLmr
Subject: [Buildroot] [PATCH v0 0/1] add bfscripts
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

v0:
  - it is a Request For Comment patch
  - some of the bfscripts could be run on the host CPU and the
    PCIe ARM board, so I did not enforce a dependency on the BF3 board.

Vincent Jardin (1):
  package/bfscripts: add 3.9.7-1

 DEVELOPERS                       |  1 +
 configs/nvidia_bf3_defconfig     |  3 +++
 package/Config.in                |  1 +
 package/bfscripts/Config.in      |  7 +++++++
 package/bfscripts/S99bfup        | 17 +++++++++++++++++
 package/bfscripts/bfscripts.hash |  3 +++
 package/bfscripts/bfscripts.mk   | 29 +++++++++++++++++++++++++++++
 7 files changed, 61 insertions(+)
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
