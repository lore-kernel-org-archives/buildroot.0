Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09414C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 16:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9844840A76;
	Sat,  5 Sep 2026 16:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqKYlM6r1_cW; Sat,  5 Sep 2026 16:20:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B134040A6F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788625207;
	b=eCi0dUZcLKTP4nxqWU5INyOgyx0SnOyVlY/zpAUeVHyEmH4QmmtYjJ3sM1RlXZZ9WWBP
	 3no/BM3dQ2esgeds7jwvVzxGUWbArDeqwthOvCu7HjIRoxSMIcJ2oEApqmaUEa2IUev+X
	 LHlPrZqgRIuyOUJb+bgTnsx1jEpq173mDq9ccCZIY4WJgyiz9XNG3Rn14iSKrobqZH2rs
	 QPnxI7ZtmeBr7WCMDDX+2vg6ptzzvRVrwkQkRBM3WFVWRdezDpjO9dbdXb6Cwp+TmkB6q
	 448miLnuVSYcGVEotFG53oXt7GAZAVMj3CByTY5W9+RtjHtsrHD+NzSLlbw2Y9cCpDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788625207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GRQY64l1DZSpfYBS+5fM8NmEoz9fkBUVZJZA+daXAJE=;
	b=T+r+A2+Kki5EEbVdFB4c/2wtKZQNzytOuntm2lbtUx0lhgFPrJPKFum7X9+l1JM2FczG
	 yumUrKNZ/m/0rY4vWlXizo31/ciEehf8YAG2WK2/tY5cKNxH9GlK9GV0Yh+aA2uX2qFvk
	 j8Ub2W8rJRWtNXE/zQVOiQK0zw9VIKZunNOB5LoAI64GFCVBa+PXc0YHX0JxbZD0Hdq9o
	 yRTi5QL3YsXEIizDrhmNLcOdsYZXB82ib2uZMDpteWZS9IwMV6RLDrGc0XV7LUPtxBixV
	 4ZUe4hTBuNkf8ObBo/hD9j05x8jHS3a2JCvSXJ4p9yopCa1qunS68NIHowfrtUdo8oA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788625207;
	bh=GRQY64l1DZSpfYBS+5fM8NmEoz9fkBUVZJZA+daXAJE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IVE1mJf1TlhgE+SYNhZ4QPT3BFcsrzqszvupwn/zvkfxgz8j48ueG8/U25FEZF+Q9
	 xQzqWWvmSIr/t7BS+x5Rg5OJRDUZNjMSvddsG/Lrg+BFhtwwFiCd/uVcuaTAtXHY1W
	 AT6+4mm+xosLuunCFSPuoIgEvW9g8VH2FWWbQ2/8pPhWq90EBVeQg8eOZClVVgPH/Z
	 CzuAV32C8DcxUFnx864jzZ52ZYxw0UiY76iLNgMxcm0Sgrud0FgQTkCNmidOJnafKe
	 HkiLdwAF9e5H9rX4M9dTM7m13Z5eAiYLz1SnYRP1QVpaGe1irVbAZrcI10oKrBSvZ3
	 XRfU4C+fu91Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B134040A6F;
	Sat,  5 Sep 2026 16:20:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B089118
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DA0E40067
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rw8oyeEILJU0 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 16:20:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9F3424004C
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788625204;
 b=PdUg7xx7pz+vxycexiaEYWgpSdCay14bSRSVklHoVz4rUgaqZtwccHIIM7fmS2/ezx8D
 mkQT/giWiUtGw47bvBQ5QRK0BnWHaKQVswbY9qD3o0KNxt/r7FjDS2Lu5Zvq8Jfdihg92
 LbztElkalUSyG+RdDKwNOlLxgKdK/AQu3mQubn6w7r5/D9Sft/sHlfOiTN7BsWeeJIGsD
 zZw3ONruO/zRXry6TANZZnFM/rZ1z1VMxuq9xoGmP8NtM66nr4TXdNA25LYv64OU2X9kV
 PdU3V8M/yojlZPa4bUTxnHQpW9hCtGZC30lkMnOU2aHeA5yxGp/RPQVGLcbbXE9kpGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788625204;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=xUhIYv8ViGvwuRKuDk3bA8cSBoEHE4F6A+ddsjg0NOY=;
 b=FLYSmWux30XWtDqc75LUbjp8hupLUGDrCr3eSc3eYJQogkwovtLsvauBD3pNDdI9GyD1
 e67WipWRPxPpPT4wdBQoKr5y2QO9iyZN7kxdFC4Xiv+itEJ9qNEBjw+83dZJBwYbi5nul
 ONcDMmLj2jGDLnbCPub25q3wwPRWYM5s5Olv0KtYBGM3M32/FE8nm55guWjT16JuVAgAH
 LTWOxoG3WrVVyLVhlFG8p4soHEOoq3ZOqKqj9qe+LTpueg66JBuobLm/4XUjbRN4phD2F
 +uAEjGqeOAIqjchN3HtYTef5KNYXDaPBh2TcsEWOZqNXdyMm7vNtFdtfYwc7VxeQ0hw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SUH7kIpU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SUH7kIpU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F3424004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788625177;
 bh=xUhIYv8ViGvwuRKuDk3bA8cSBoEHE4F6A+ddsjg0NOY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SUH7kIpU2/HffzLs/GeUTKXs0IgrYeghAk5zRuz+8uVJhsoWEecR9EqomebkKWW6u
 cdkXj0dph52D1dbRMwrHkaQQUxBH6aogK3aGzkKcnSjfoCn5Smd8q/h77ouV+iN02A
 uDXPMIF8lMPzI6omeSeBczqjc0Wcu6rh6dMKU6qcYT/grw8qjXrHHi82sPl4iG8wNc
 1m4qq/DAbhMmN6YRJWuS+jv2uIaVHHJV6iWgV4rvIcEqt7mIPBsKaSRwjVp8mi6LPB
 cE9xGmMvrk07nLCKaXqRXrtXSIDTiZ8nN9zcelA2aN+N3aHbDdcYIkhMMbSsYyZzc2
 H1+avyDhHoHiw==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E1C7A4C3436;
 Sat,  5 Sep 2026 18:19:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42882)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2t7A-000000006l8-3VWb;
 Sat, 05 Sep 2026 16:19:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 18:19:35 +0200
Message-ID: <20260905161936.549476-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905161936.549476-1-bernd@kuhls.net>
References: <20260905161936.549476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 3/4] linux: bump latest version to 7.2
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For an overview of changes in 7.2, see:
https://kernelnewbies.org/Linux_7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d511acd26b..21a8819e5e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,8 +30,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (7.1)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.2)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
