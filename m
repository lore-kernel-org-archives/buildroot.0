Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D7BCD13DA
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 19:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 314AC82479;
	Thu, 30 Apr 2026 19:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GN3bU3v_tdpq; Thu, 30 Apr 2026 19:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C07384FB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777576049;
	bh=WxKJ9zQunOfiJr+VstLsc8BP2XUhPoF81hhnjvV1nfE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YewyVKyJfd1Z8NqjgUJrykllx6qm8MOPzSk52PbfnRUgsmRXuVCknlBYO3Rr7VvXr
	 TSvfAmFnhA8BvFAE5pGc3zdmxcmdcVzTH0M5AtqbvrNQv+69m6yBNSI0HxrijqAB8B
	 fG/WDJQncPdqPcFDmPbphoFxyOLDIIGva6aQlg11BsGvYVkZYsbG2wy+OG+D2vxshh
	 km8lWtkh+ut+gu8/52sD8LyoJprgpx+oUkm/N8qaYfxRYuql5v5sZA+MtZSd7k6Tyv
	 fzCaOHUmT3KI2ESRTX5jzkwyHd/ToB3mq7/t9+oam09UhCDhFtyhjYhEJxoQ/b6Cq1
	 0ctqOMztlOGdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C07384FB3;
	Thu, 30 Apr 2026 19:07:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C21AD192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF70A6F4F6
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbrqbyFdrmUC for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 19:07:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA8516F4ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA8516F4ED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA8516F4ED
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:07:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32507A4C2574;
 Thu, 30 Apr 2026 21:07:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60442)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWim-000000000Pg-1aeU;
 Thu, 30 Apr 2026 19:06:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 21:06:43 +0200
Message-ID: <20260430190647.3212159-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430190647.3212159-1-bernd@kuhls.net>
References: <20260430190647.3212159-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777576020;
 bh=uRVyEuXsoiJroTTC5Od+bzyC6BzvZdJHU3oYM0554qQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rgAx05revTiBPJHFdsn9oHnLsmEg8dyPZkaAVnuCLHZvqtdFh0kbbrqDoGQn9zwgA
 zj6G122KjFrX8D9xj7/RHlZ/MkRaCZ4uEE/TL4DgqlTNf+oRevvACNxadoQaxmH62n
 l3AwbuUbOOz2F0WVXWeba6xA3sYAWfnxZnar6G7/hSuPIaaelyUwkHrCkZ3/+5TKHt
 MK2dCkgOaDleNNgof5GIrhS7GmxJNYD5BsgYO5gP8QXvYuLMSz9e4CcQ/ypwrk3kkq
 xa7/fDcD9bjMz20hOIiz5E+m/m2h0i2pzCYaWqxo1elcLBoNECmDr5NDRTB7c/pkBM
 Cbzc0EXEZLLEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rgAx05re
Subject: [Buildroot] [PATCH v2 10/14]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 16 version
 selection
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch allows to use an external toolchain based on gcc 16.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../toolchain-external-custom/Config.in.options              | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9ca024f5b8..f69e09ecf0 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -46,6 +46,11 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_16
+	bool "16.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_15
 	bool "15.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
