Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4282BCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1436585065;
	Fri,  1 May 2026 12:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amcJ1RsQ-cwZ; Fri,  1 May 2026 12:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369768561D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638803;
	bh=gt0YLmgWzBsR6DRVPgTjR1z1f99k+JadCzv9+su+iWE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UHf7dHJvvkdOhB9LGJE/SVL/5J9sXo05kUQS6wqsNbnfmATQX/7olqL54UusosVw7
	 AP7wliKzxiz/zXtKiabRFwIuRUGdrV0OBMtTXI70TrwoZFqhLnaLTwl16P+QxqJg11
	 7l9uDj5K6s9dN8ZzhiyvEybZjETe/pOMolH9nkse7RwnQ1I0qak9jooSfqJvApUL4B
	 9qgo5iBkVvuEdNvM0M2NB7g6Xyl2IG90xoU08CptFFCKxwxJsZetYoFPBHNtZtk7Se
	 fkZCpG0tl3fRi+oqPJf1PBAHiPPM5y8gVO+vjanJapaNgX7BOcXfTKf5HrSuxxtz98
	 4g/US7QoletLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 369768561D;
	Fri,  1 May 2026 12:33:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5F21127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB4826F4D4
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItOmxj8Cbmph for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F9356F4C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F9356F4C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F9356F4C4
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:33:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F622A4C2E8F;
 Fri,  1 May 2026 14:31:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1J-000000008NC-0A30;
 Fri, 01 May 2026 12:31:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:29:49 +0200
Message-ID: <20260501123100.1918951-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638663;
 bh=KlXzL3ynF7wm7dZMrEG0S2sadHG1y1e4oqphujgyPK4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rdx17NXI3OY0AzZgW+qsDys8I4zoQTW+R0SEJoe2qaaO6MX8pt7kU39p+jVIFEAa1
 LWexZ1QOeQrnrKKE7pVdOwCwEqJ0ix7TVX7IWqxM6hNBEXqNZpkHcKg1+dAr21iH1G
 3V56PQfiPI/HaNJ98Iq7IwSR84jU4RhJCaoaxL/UGnwuX5cDxX9WhX29ZAhO79PViI
 Vf7/R6IwFkAgobVEC1KYVX9MCnPNg1YueMIfKTsuUtH/7zr1IsvDOZ2+0Cq9dujaVB
 yq2GgeRpzs8gEHopZ83gu+ITUTcF3ehAnn/y6vAXMJ+L65sLFPlh5uPdsrDDkX5pJO
 NDZFpnVWq9tlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rdx17NXI
Subject: [Buildroot] [PATCH 04/75] package/python-attrs: bump version to
 26.1.0
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.attrs.org/en/stable/changelog.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index bf2aae1ed8..06cb8d6dfa 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  6197561dfec99660529830edcfeee0ba  attrs-25.4.0.tar.gz
-sha256  16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11  attrs-25.4.0.tar.gz
+md5  633953d1aa39cfa76c733a20fdd9c196  attrs-26.1.0.tar.gz
+sha256  d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32  attrs-26.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index fd900c5046..7456002536 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 25.4.0
+PYTHON_ATTRS_VERSION = 26.1.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/6b/5c/685e6633917e101e5dcb62b9dd76946cbb57c26e133bae9e0cd36033c0a9
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/9a/8e/82a0fe20a541c03148528be8cac2408564a6c9a0cc7e9171802bc1d26985
 PYTHON_ATTRS_SETUP_TYPE = hatch
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
