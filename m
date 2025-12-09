Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D2ED3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C647409F5;
	Tue,  9 Dec 2025 19:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIbJROds2-1U; Tue,  9 Dec 2025 19:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A63FA409F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309256;
	bh=U43cKJ8wfaQhAOpKfJg2tvCh7blCejSfSq4uvAqpPho=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p/0unevtYjR8fdOgb0BIU3eaCuuPz9NRFcsEqcXSG8P4adMaRSp6mGBFHhNS6i5VI
	 DV9kUAI9832ywI4ayoL68ZwBWqyrKLv+rE/dzcRmXZWsuuqZgQe2a8x2C4XyJPEgiO
	 8w6X1carqMtFYYo/yCP/BzWymZHHENkRmWE4Xh/3KsJOTqgdlSf2ojUYW4251ZRuWB
	 Uj6uLlpf/I18Ul7sPvkgAG2lNlnK/lUUiIJgfARm/ob/AVldYeCyYAQejJcgXegqtd
	 2B8To4X4LMsDDjugHoggDZPmjip0rKHcMBBdNttxHLHgMYALU/Uc65/xkFP1BEdczH
	 3d2g9ilGp+rfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A63FA409F6;
	Tue,  9 Dec 2025 19:40:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B4452C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D6AA843DD
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RR_Et0XPkGMz for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:40:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EAF1843AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EAF1843AD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EAF1843AD
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A2165A4C2C14;
 Tue,  9 Dec 2025 20:40:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-2Mx8;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:28 +0100
Message-ID: <20251209193951.1000100-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309213;
 bh=2vZPOjhkJgeq04YqvqUz9jaYQ6PPs0xMpHwLWFoC3Bg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Fjm9EkegPBf8gKX+heAYWziYg0313oragK3Tbv/qcIGoPLPsS/aOEVOpwPliN9bbT
 +nuaDJ6kNgtj3W07nAAfS28oimGf5rXZfzTgYwrCf0sQ1ED9RyAFvWb/mJnRpCihar
 uN9OtdjEwwelh/ZgIQUoMz56+aeJ+QhmvZ31PS4CMVrs/UK6vpp3/MoFwvzlmb+vz5
 LMOVkKDVZflqVIXwybBhN1zDq1wXJyjwPKNkJ6JCV+srFnSPgrd9QO9T9wRB/91Qhf
 19LoxWoHP/Oy6GjEtjJxIhxidnTqSRgpJOqwqnYZqG/emeB5mmPkykW7JGwHv64GnV
 Gk2OJOrXqRhcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Fjm9Ekeg
Subject: [Buildroot] [PATCH/next 08/31] package/python-argcomplete: bump
 version to 3.6.3
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/kislyuk/argcomplete/blob/v3.6.3/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-argcomplete/python-argcomplete.hash | 4 ++--
 package/python-argcomplete/python-argcomplete.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
index 2ff7631eba..81e556363a 100644
--- a/package/python-argcomplete/python-argcomplete.hash
+++ b/package/python-argcomplete/python-argcomplete.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argcomplete/json
-md5  28fb9dace31a5d6ff98c686d9914d3b7  argcomplete-3.5.3.tar.gz
-sha256  c12bf50eded8aebb298c7b7da7a5ff3ee24dffd9f5281867dfe1424b58c55392  argcomplete-3.5.3.tar.gz
+md5  0c612498a4b7b421aa870d47361e2322  argcomplete-3.6.3.tar.gz
+sha256  62e8ed4fd6a45864acc8235409461b72c9a28ee785a2011cc5eb78318786c89c  argcomplete-3.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
index 1c78d880c8..520c2e5390 100644
--- a/package/python-argcomplete/python-argcomplete.mk
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGCOMPLETE_VERSION = 3.5.3
+PYTHON_ARGCOMPLETE_VERSION = 3.6.3
 PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
-PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/0c/be/6c23d80cb966fb8f83fb1ebfb988351ae6b0554d0c3a613ee4531c026597
+PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/38/61/0b9ae6399dd4a58d8c1b1dc5a27d6f2808023d0b5dd3104bb99f45a33ff6
 PYTHON_ARGCOMPLETE_SETUP_TYPE = hatch
 PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
 PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
