Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C43D5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EC1A40AD9;
	Mon, 15 Dec 2025 19:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BKkqzBG-G9P; Mon, 15 Dec 2025 19:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D24D540AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826323;
	bh=PnyxHTp82clvlnvhbd5JOeWCKeLQKaEM6R2oO0pGBmY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=od19PuRF/MibK8lFocdUA46H+/onVytUXyaPvsMcELs6Q8bcRhBf7pcPAg+Nm+j36
	 xB9nPH1EO9Iz0MbS/c2ut/230G/+03113+MTboCdTJDYnFyrhSbZBl2zSu48h9WoFa
	 D4IzVXbjrXU/Ir3maqfdIQMIsXR+PO9SOcjF2PseC/NioeCkkq4WEC/dCExfRwAqh4
	 A4/srq6ZF0Jg1/Rl64VSFDPeY8rexRfF2v0hmKGU8snjSxbIklRZcpKxhtQrMJ9gPF
	 AO9yfBS5C6Q0iPVSDyFjFGHmzUE4qUUqPOlgmCDWp8aQQqnNJFi70OBG4fAKWenYuJ
	 CpT3uvRXCR92g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24D540AC6;
	Mon, 15 Dec 2025 19:18:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A89C255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C5818082A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pv4AxdGrse8 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06103807DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06103807DE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06103807DE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8676EA4C4366;
 Mon, 15 Dec 2025 20:14:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-48JU;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:11 +0100
Message-ID: <20251215191416.421755-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826070;
 bh=yF/bmeKDQMf4fEvzgi83wx+pJM71LpkOJc4bTOyJHAE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IH+DGeu0Mr/8NTw2/8pjvkx5Dr+efmRBHqXzfvl3jRBy45oJ5h/Y3u0uviLCUJL5t
 LlOAcWEFFPcptVivw6B1r8LKt6G3hpZKDyFudnRxt4shMucI0Dvv9zXfDNmroAdxqM
 p+iHmW+F8dtdS0MvHluTpXRv9xczXZ07l8+UlITkzLDn2WVX/bL92iIpENgB4Mnt5E
 Jmx62r+NnVJD6BShkFg/7YxpC/DtzKF9niiLK08Tl1auj6zuwJtp2hl6g2iQ5XVnk2
 MHGhICKUPXpEYd51tsr+loFKIyNSkLZIUy4TscVsSLf1OcpMt8xle3dB9+bYwW1BuL
 fRSCU2oDAl5mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IH+DGeu0
Subject: [Buildroot] [PATCH 22/27] package/python-regex: bump version to
 2025.11.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/mrabarnett/mrab-regex/blob/2025.11.3/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 1eb8936d5f..0b1bf1a350 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  02b86394591ba39d34bc35d11e9e7d96  regex-2024.11.6.tar.gz
-sha256  7ab159b063c52a0333c884e4679f8d7a85112ee3078fe3d9004b2dd875585519  regex-2024.11.6.tar.gz
+md5  23b45104a418985aa934ce00b094ec5a  regex-2025.11.3.tar.gz
+sha256  1fedc720f9bb2494ce31a58a1631f9c82df6a09b49c19517ea5cc280b4541e01  regex-2025.11.3.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index ef8c1f198c..a6a8d6e3fc 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2024.11.6
+PYTHON_REGEX_VERSION = 2025.11.3
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/8e/5f/bd69653fbfb76cf8604468d3b4ec4c403197144c7bfe0e6a5fc9e02a07cb
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/cc/a9/546676f25e573a4cf00fe8e119b78a37b6a8fe2dc95cda877b30889c9c45
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
