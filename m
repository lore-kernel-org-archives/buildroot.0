Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC008CF45CF
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 21:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79490610FA;
	Mon, 12 Jan 2026 21:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhq1gtVnY1dk; Mon, 12 Jan 2026 21:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D0D161116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768253099;
	bh=v4Ts1NvOMCR7PLR0sF9CMAsNrRTPTg4fU9CR2xiKcX4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sSSGq7VjNcaA9hIV3aUa3V5vNw0lHGsbgfmGkirYOVed+fRpV1h1mOfjv6Q7SJEvw
	 D/7X5WNGc/TcaUZhJmxbWuiVE7LxVE+Wq2HK5N5JxaFwinTW79ChcMAsv2dLyxxAL0
	 LJ+QZrGJk84jQW5YW/UJ+1LU76ucDQya1XGPSk1kKiurr+ELitPnqOD89d1e/G/YCv
	 tvcgDYV+/bN20kU8MEAbJzpj9Ls6rYaGVnkBkiQmRQwPjSsQ+2Bvi5KVUSjOxMoINP
	 FJ8Aj2T7i5B2MhT72nruKzMh6kmSAjeovPxcgc7AsD/uVCzpq8kOtwRQs6ILEMDio+
	 VBSk0uXsN5roA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D0D161116;
	Mon, 12 Jan 2026 21:24:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2843231
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A365E80F08
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vb8u5ne3uBZQ for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 21:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB99380F09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB99380F09
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB99380F09
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:24:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf07.dip0.t-ipconnect.de [84.161.191.7])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64B26A4C36C2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:24:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51918)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfPPB-000000004vi-0IcA
 for buildroot@buildroot.org; Mon, 12 Jan 2026 21:24:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 22:24:53 +0100
Message-ID: <20260112212453.4102684-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768253093;
 bh=LQgWtlEESvoZMsbI6WpTPA1Ur8d0MUmNj7RUlhNZxP8=;
 h=From:To:Subject:Date:From;
 b=K+TGA7G32/cG2Tsi9As/LuBm5zULeGhBPn6D4uUhEznHJUDP0OMkbiDHtCbCHwnMs
 +4bAxB7YkTt2u3n9DX2Y43p6ipKj+kkII0u9lFgETWmyOVlYk6HcZLbzkVRUs+A9yH
 /6M+6DHRsxC6IpuR625ehSyIenhf4x7h47S0hf+rP+/tvJVUDxl//W4zr+u3aG7seD
 SM78HPFQmI4vwgatpzSoNYGxiiUZ+M0CDjBLls7r/CU7WYZjQPABZwBK5QpzO1qP3R
 oAokBTTAcEeLSyP517ilLK3iwTGwaHJbzSfAKnIYAlTfsIhUCmYqYD5MpIOuOCCLl5
 oMKzqiInC8bnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=K+TGA7G3
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 25.4
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

https://stellarium.org/release/2025/12/29/stellarium-25.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 6c8e2a850d..67e053eff7 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  1cdebfa04220656a956270425e06c6c522579c07d61c3440f6b11ac3f09f6db5  stellarium-25.3.tar.xz
+sha256  e376e0dc28eae0f7c4b3686fed9c2129c69a87a371b33e24bd79559a5142d613  stellarium-25.4.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index ec792bf20a..660d518860 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 25.3
+STELLARIUM_VERSION = 25.4
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
