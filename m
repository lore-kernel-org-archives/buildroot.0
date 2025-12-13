Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F045AD5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6FFF40C6B;
	Sat, 13 Dec 2025 14:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuXiJDoJGEPZ; Sat, 13 Dec 2025 14:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F2840CC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634843;
	bh=l6emK7+14IwR0AIkKl5MMK+qf8855UG8Wfrz9PxTlkM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=j1ijmuF8klSZ20UvhaO9LB3dLUGjBjBLxgmiD4lnhH2JSI84NrdYbq8/NKpONO9Ze
	 X/JOktSHBbY2bDSfwWLMuJDNBRh0fGZ2UVPlHT6v4LSokMPr8OjmmWhdXw1CFtHhRa
	 HTFBI8PLgKtPfhvC644gyRHD3pd6jQAsejm6vnh4TmY2h0MzShljgx1qZElZc4p6AR
	 gTUoFzTuZW1/qBZwpXbffmEYJAqOgq2XkgspBQg0Gk5P/p+ajafstAD8Z3zNc0jwEt
	 TN50cFpkTPaEg0K1wLms/668PcjrRoVVpWle3Vn19OtbvFTHntR6JPotq2XAEnLlfJ
	 Oii82bhoPSj9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2F2840CC0;
	Sat, 13 Dec 2025 14:07:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7BF513D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B960583299
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fx7ozoqV-P4s for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE8EA831FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE8EA831FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE8EA831FB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7CADEA4C407F;
 Sat, 13 Dec 2025 15:05:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFP-000000004dt-0m2V;
 Sat, 13 Dec 2025 14:05:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:21 +0100
Message-ID: <20251213140522.1322763-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634729;
 bh=HBOIZRJpAL7IIjszUhX0cAB49dhopTcM9zfT0STqJBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=asNKKk+qP6n0IOiOcKLwM+cxFcnfcHmqx2TiaJ5HwIrSgtt4vZgWALl3mp/mzg7xB
 3Kgp91jTB/9cqZ98jD3cYA0s8Xyy+VxlD8juHAi1BwWi0RjmiOgl8iN0K60+p1IG64
 5J3uSDIDnB8DeW7wuSIroJMsx706QhS67fWQW3KMamkvMTxcc92CWjVI54WM0iKSF1
 lcdGnuLogudCm0OM2ETd2v5ATLrgzq4ul0SRvMSpI2NqtGAWvxmRx/WaFWVGGk6TzW
 sKTHCI+iNNTzNnK+BmZCoMAKCclw7CH1cIX/3+w0ocxNQWsckQKAbFAjljq5UuYowa
 BFI8jDUggRmYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=asNKKk+q
Subject: [Buildroot] [PATCH 13/14] package/python-pdm-backend: bump version
 to 2.4.6
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pdm-project/pdm-backend/releases/tag/2.4.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index 3c7a23b79a..83e275c032 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  6e05613e331b4cb95a973ff99f642bc9  pdm_backend-2.4.5.tar.gz
-sha256  56c019c440308adad5d057c08cbb777e65f43b991a3b0920749781258972fe5b  pdm_backend-2.4.5.tar.gz
+md5  63dd231ba6206cc834b205694208df40  pdm_backend-2.4.6.tar.gz
+sha256  5dd9cd581a4f18d57ff506a5b3aad7c8df31e5949b6fd854bbc34c38107e4532  pdm_backend-2.4.6.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index 60299df9a9..4f30f8a909 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.4.5
+PYTHON_PDM_BACKEND_VERSION = 2.4.6
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/4d/f2/59135ddc68636a33179a37c002abcb162a9811c9ce14469258e486bec012
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/71/fc/15b83c93a8e7929b62debaad63a3e89b8ce7f8a86075bda0d81e42c3cad5
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
