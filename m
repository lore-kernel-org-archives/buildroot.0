Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3997DCD3423
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 15:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CCC985407;
	Fri,  1 May 2026 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtA6FM5QAaUY; Fri,  1 May 2026 15:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35D1385409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777649519;
	bh=WxKJ9zQunOfiJr+VstLsc8BP2XUhPoF81hhnjvV1nfE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ryfzMk8alhMT3S2suu1NNSjf9RlEzPyHQZzoKviqQ2KRwUyrOvLWy7X1cFW3buiZB
	 BY71ifuDPBwL+uoAn87/KpP6JLOcaDbpWYAKurdEIVdc4+6I26rMTDT0hUcs0xljHa
	 cQUMuQSbxvZHHATRAFk0ybSfRXC+o69qiUO7GwKCyIgPRX7wDBJrvgs4sqhx1o1fvg
	 pP8UfKaKgBdF0VHASBHet+4Xu9EgQVweFifxprq5yM0dTrewzO08yeHqMU/vY4OYeH
	 LURdF29Vit8aAt4AeosOv6TClCcmeShVl3MA4IbmRVRDsEZHJFEcJA1bJFjrNnvwIh
	 4ibCSOrhCUusA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D1385409;
	Fri,  1 May 2026 15:31:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F1A7127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D660240ECF
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PolKm1HB83V7 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 15:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D48C542756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48C542756
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D48C542756
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:31:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD6A0A4C0256;
 Fri,  1 May 2026 17:28:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIpmc-00000000172-0QQl;
 Fri, 01 May 2026 15:28:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 17:27:53 +0200
Message-ID: <20260501152758.2610763-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501152758.2610763-1-bernd@kuhls.net>
References: <20260501152758.2610763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777649283;
 bh=uRVyEuXsoiJroTTC5Od+bzyC6BzvZdJHU3oYM0554qQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uTtze/R95UYASYybNNlYTH+Md4V3EonmXjHp6R+rapXQl+FMeQ9UxbJTumwOAwp88
 IDXCdPZM53I8QFvEZIpICx+XS1C1IIuXjAXIWc0Ca+33w8Y/FKDzE9IEbqfJSwb41d
 fqb0eW9ly95yUzdsAyZtUBLzIW1SE468F4HrxKd7V3ehqZE8B82xdw7BFkZa24N09Q
 /hBY3jevzXWNeKxezHI7p7aIZIreapTHBAypBtaYOaBkIJNd7xb1rMgN9AVbb+KHOm
 M5XP01FsubtR/8SrlN5yr/u2+Vlc6e3qaX2RKXtO0l1OLZ1yiL2hzuKVdnFiR/ptu7
 rLIc2MemlzKsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=uTtze/R9
Subject: [Buildroot] [PATCH v4 17/21]
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
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
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
