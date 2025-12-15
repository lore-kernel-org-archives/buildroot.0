Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F6CD5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0187D80B1F;
	Mon, 15 Dec 2025 19:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUk0oi3WD5Jn; Mon, 15 Dec 2025 19:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABB2E8084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826165;
	bh=ODNkNiSvPVGCSbSwcqLPD3hFroQEAyiR3Xb4lfIIGBg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o9StQ1G3gVxlVq+iMk/ryC0mqjUFivJhleMDi0ubFwCKVlptU1yEKJ/jIksRabvnC
	 5hH7JgE7PZJh1xdqxHnkwyR0O2iuEptAid2xJ4hpGRfyzVlp2BCEoHdYRE3j+Y/hGL
	 UKA40+vBH5gJLQOwY7T0c5qnIM+W7Zz4CiFO1Om5pEB16W1Vpp7VKeq631uqJcJr1W
	 3z4tRAN7L8qJR1aKhgPmuG1CIq+4yKKk0T8GL0QwJYjZStYCMQBX3Btp9sj2W6TpEf
	 kSyIAP+T3tp2sSTRXF7CTSDPVBmtSyPxXSXiKWOD2D7xQDw8+XUc636EQa5ZXs0KqF
	 KQXebcv/KQJ+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABB2E8084D;
	Mon, 15 Dec 2025 19:16:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1D17151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93C8A4081B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJQTtMI6YlYJ for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:16:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 824F9407FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 824F9407FE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 824F9407FE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D0E2A4C4287;
 Mon, 15 Dec 2025 20:14:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1Q-000000005ED-3uQz;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:58 +0100
Message-ID: <20251215191416.421755-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826067;
 bh=BgZ8crV5LBb+9h0SAhKi0gykNiJOqCJZP2N5iE/v1do=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FATQ4y2wIIeHq30umb+niO61q6gWlRaJPn71hc0nMsAKIOrcBMvRtAHqaabF7GYUC
 r1IKDGfgUFJqG7f8RAgvy3++ibG+se7JslRlU8ERYYm6H/qVUj4+qbDrkfXOIaaUJD
 UKrBvkSK66P2IKj+uOYFmIeozG2yL+FYcWoVakMaSrkXbEL4+mDP77OC7P3imosda4
 xAqaNm5bCei/Erv0Eh2JXhMCQQujIp66iQ76CX2VUzsv+6dS5nsUPzW0eAZlu79nUg
 SqutBnhneFIFGhBeudMbQuOi1o2ULBjeS5g6yhLEwOjsxld4VhfBts6NfEtHz6S9kB
 CrruxDiPS+Xag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FATQ4y2w
Subject: [Buildroot] [PATCH 09/27] package/python-pygments: bump version to
 2.19.2
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

https://github.com/pygments/pygments/blob/2.19.2/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 894b6c39d3..7071ad9aa8 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  5e6e00a0f63b9f3b63edfa260f71b1b5  pygments-2.19.1.tar.gz
-sha256  61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f  pygments-2.19.1.tar.gz
+md5  79260d1c566a507953a81d24b1c51c72  pygments-2.19.2.tar.gz
+sha256  636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887  pygments-2.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index e94c9dc908..413a0b4467 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.19.1
+PYTHON_PYGMENTS_VERSION = 2.19.2
 PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/7c/2d/c3338d48ea6cc0feb8446d8e6937e1408088a72a39937982cc6111d17f84
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
