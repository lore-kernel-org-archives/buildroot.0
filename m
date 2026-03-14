Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D0E10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D156410A4;
	Sat, 14 Mar 2026 14:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kpS4n1K_Uf6; Sat, 14 Mar 2026 14:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C31410E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497657;
	bh=/Xy1yhwSkL15nWcYyDY1Ve9AQZk7jZ1HONHeOWyKn84=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jveWe/EEGBBLScOj6W6VMSorR1xQhKHB32lqsrn0ihNmz6D+Qq+mM8HyX1/0+0G61
	 3RqmQDmr9jiRC9BuhWAPrqPGMNjOxO9LFVBw7dQZnMo9iGUZDduTrmN/VclxCVQR2B
	 VIDRe50n+jFhYl3I93kJyTf92wfCs5WaTRTnKhYYbKnFD4mwzAfv24ejb41YFXhB8N
	 QptOmjJ3Gi8kQXNmJxrpcJh2g8YZMhglKQLM1nvTwYXIQwCZEqWHVE20pBTTaFjfha
	 8sY8in+MXnIzKQ6Lq/h4wkY8LQzbo7V/sZ5KrqNIt3SLtn4x1QvajcVGuqFepLhzhw
	 QO27Aj576BPZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30C31410E7;
	Sat, 14 Mar 2026 14:14:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53FAA3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45D4D400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9N6y8dA1CWQ for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:14:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3317840076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3317840076
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3317840076
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:14:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CB78A4C16B2;
 Sat, 14 Mar 2026 15:06:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdZ-000000003UM-04nd;
 Sat, 14 Mar 2026 14:06:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:25 +0100
Message-ID: <20260314140633.2967249-89-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497214;
 bh=uH08sUy8BwBZEgA1PtzXyBDvQHV3kkifOgGP+FaiNYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JAC3acX/9WN8Pj83KDIoJShtiaN0zEuHyEce9LBugv6GUWW3IEXw+D8sxm/f/3Zc0
 FEJoIdRfTUAvDjumvb3ew9ZZFjR3YLK3GKKreHsmgdwVWTktuZoA9mdXJ6wGPIRqQw
 XjEan5FCeLoeL49qr9zofuQ7IrSeCGXP6Nky+7HcfdYSciZG6SpU13DAvbX6d6KaK3
 I4rqMJx+pE84lLnSpRYT/4zV4ChykB76Gp1LYKAnubLAPpoA39Gst6b/XzeLCGR5GG
 7w7NJDgU4xhVdR9Efy7BkcOznIQ5bHxwrcPQv+7oJMt2+ONB3ygtPMKh3GUj4N0nl1
 acq8DKE3XwxDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=JAC3acX/
Subject: [Buildroot] [PATCH 89/96] package/python-werkzeug: bump version to
 3.1.6
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pallets/werkzeug/blob/3.1.6/CHANGES.rst

Please note that the fixed CVEs CVE-2026-21860 & CVE-2026-27199 only
relate to Windows.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 1a85d99558..e7900fa734 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  601c4ad4d597c665da5642550d6740a9  werkzeug-3.1.4.tar.gz
-sha256  cd3cd98b1b92dc3b7b3995038826c68097dcb16f9baa63abe35f20eafeb9fe5e  werkzeug-3.1.4.tar.gz
+md5  4ce9c948613b9b823226c98e28b9004b  werkzeug-3.1.6.tar.gz
+sha256  210c6bede5a420a913956b4791a7f4d6843a43b6fcee4dfa08a65e93007d0d25  werkzeug-3.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 2ea0006d54..c3b8a2c099 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.1.4
+PYTHON_WERKZEUG_VERSION = 3.1.6
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/45/ea/b0f8eeb287f8df9066e56e831c7824ac6bab645dd6c7a8f4b2d767944f9b
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/61/f1/ee81806690a87dab5f5653c1f146c92bc066d7f4cebc603ef88eb9e13957
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
