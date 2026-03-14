Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491410706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C739414D1;
	Sat, 14 Mar 2026 14:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7uvLWCrrGU6; Sat, 14 Mar 2026 14:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60EE8414CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497920;
	bh=bAZML5JaL9EEHSXr6Iq6NVt7fuuC1CX9vyhu5y1kcGE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Sq39zkQvnDWSSXtRRyUhQ2lxnIjRIy+jn7JEgU2SaDWqS/9l7Ha3DZqJE7JcV4yZF
	 B6wAFV0h/hQ0t9jA4OY749ffkV0Vd4pQVFgGnX6rSw94m/oy4hp7QSEvSgdu+PHFKJ
	 5zuhSEFKPP9APrszHLwY+nSU5Opp8ORgUvDe8fMhRZ4TkRwGBHRGz+ver5q6OHYVSE
	 jE+4BUX1g2Gi4zVuCmzjdxEnMqJErlupXIftxs0lDWzbl0N5z0ovYD2dPHnxz/elcO
	 amJzzxVs5rGLnuu9DjRyc78LB7DlduHPY1LQzdkZvBu6/tOFwAZ9NuHVkF6hLzMhTp
	 /na1UTem3MTXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60EE8414CA;
	Sat, 14 Mar 2026 14:18:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DE591B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03EA681959
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twqAUGBYr9fY for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED98E8169F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED98E8169F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED98E8169F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88016A4C17CB;
 Sat, 14 Mar 2026 15:07:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdS-000000003UM-2ThA;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:14 +0100
Message-ID: <20260314140633.2967249-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497221;
 bh=H5TVV4E+M6lypQfpx9Pu3U2WXRWjFJkXTB9Cwrm74Ag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Xpv19R1gCXApXJhuKQCw2MuttyncJqF+HQK97v1WWYRRlTHXRMvV+9VlDQ3ro2bW7
 hQd+Y+5CF1Pef83mZ+nR2eyV1NOB8n3D7Nsxzepv4EYrLH5hUkwUJ3G0UBzllrwArK
 dG11GXxN4fHQPqQA11tqqg5woHsR0A9IkVX7p+0hMI9d3sDFvgQh1qB9M2y3ONuPis
 73ZP6sa4n0XrwaI+LZzHsV+txj6qhWxmmC5Yi47ufCSKteb+Fbg+BW1Gu1lUU4H1CE
 iM37VtDsOpDEG0qnqRobFyyeWCQzpy5iVgPcmIoo9vCbyUynhQGhaLHKTSz/nZGiPE
 yYQoh16QszmMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Xpv19R1g
Subject: [Buildroot] [PATCH 18/96] package/python-flask: security bump
 version to 3.1.3
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

https://github.com/pallets/flask/blob/3.1.3/CHANGES.rst

Fixes CVE-2026-27205: https://nvd.nist.gov/vuln/detail/CVE-2026-27205

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-flask/python-flask.hash | 4 ++--
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index ec2e5d39f9..a670bf2e58 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  62ae81cf2e91a376af909a2bc8939e15  flask-3.1.2.tar.gz
-sha256  bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87  flask-3.1.2.tar.gz
+md5  4dd9abd8b17b66338a02ac45fafa710b  flask-3.1.3.tar.gz
+sha256  0ef0e52b8a9cd932855379197dd8f94047b359ca0a78695144304cb45f87c9eb  flask-3.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
 sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 8000489366..70994189c5 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 3.1.2
+PYTHON_FLASK_VERSION = 3.1.3
 PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/dc/6d/cfe3c0fcc5e477df242b98bfe186a4c34357b4847e87ecaef04507332dab
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/26/00/35d85dcce6c57fdc871f3867d465d780f302a175ea360f62533f12b27e2b
 PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
