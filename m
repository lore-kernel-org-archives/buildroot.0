Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4142DCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A6F76F7B3;
	Fri,  1 May 2026 12:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76qwPZOhAUbj; Fri,  1 May 2026 12:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FB4C6F790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639455;
	bh=ePmEUnhenhU7M2jkxE0gkrclnuLlSWbGIjMSUgoP+OA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XZk+JTTaTY7zPQvEyWmk1bP+KZ5osg7zIg9ocAPQn/4dYhNJWhVbOR5uP36b1pabD
	 eLdiWqmtO1rMUmnWSL7aSISTnTZPALP3CNn1E+tPZ4F+EMCMPPdBiRYhFjmOMl8KG+
	 CgtqYv+IHgVNArFF9LCtrxqAnisMtKwJsaEnFseKx22m7PnbLeA2mgVOMNzKnThDCG
	 yMEHQjeEHtn/BDz18XJLuFZunzgyDN+dldG9wgy5XMubWge7FVATlzbuAK4XXlReVC
	 FBD6cci3c3elB53Z1tyOA2BU2bd5bid6NiGiCgtJFGP7hdNQUoo9RjRg5yv2KohwxC
	 nOQhFJDIOtrHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FB4C6F790;
	Fri,  1 May 2026 12:44:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21A78127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13CD285546
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqKY4gk4AXvo for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 045C1855D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045C1855D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 045C1855D8
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0B7C0A4C3066;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1O-000000008NC-2PoH;
 Fri, 01 May 2026 12:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:52 +0200
Message-ID: <20260501123100.1918951-67-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=ST42OTPjnK5FJ6sFreqTQgDbVbHhkLG+z4YlPpYmN2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WHdWnQMeryCkO6NolYQMYimgeURKe816MfkaQKzleWxv6wPI5yIxPwslsaHh+TF6e
 01BtOR2LaeptUhr6RfYUl46pYBkuJ7Pr9KXcBDiXOkaYOW2IP6Ccia26mQoSeL6qOy
 du+mI6PTH5O9o/L0tK0APg2xp/EB51i9t1XC+ZwTec1VjpSgd/i3Jod+HmyZ2WX029
 zUboin7/52FeNrFqzqKp8RMIRn2NBjBKMbwMorzsw9xW7eHBT9M7EdcbmQ7UjpxI/a
 By4ZsDdWtulue+MkIMCtfWMP6kDV2l08KedS5DKaUVYUyccHOR+v3f/adjawSj19+M
 66zoXc9wYzDJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WHdWnQMe
Subject: [Buildroot] [PATCH 67/75] package/python-urwid: bump version to
 4.0.0
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

https://github.com/urwid/urwid/releases/tag/4.0.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index 56ea763deb..ec81bb59e3 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  ee84dfeeac19cb4b09a9d90b64029c20  urwid-3.0.5.tar.gz
-sha256  24be27ffafdb68c09cd95dc21b60ccfd02843320b25ce5feee1708b34fad5a23  urwid-3.0.5.tar.gz
+md5  d9dca1925cd4f8324cbb4817c22ef85f  urwid-4.0.0.tar.gz
+sha256  58ddc5c65eb3109b69e2e95469553f9f86070645cc1b553d6ee3fe8dbac2e0ba  urwid-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 0c29c9ab75..b6622864a6 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 3.0.5
+PYTHON_URWID_VERSION = 4.0.0
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/b1/59/67cd42db7c549c0c106d2b56d2d2ec1915c459e0a92722029efc5359e871
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/1c/09/afbd44c7c57b1124d94ffe6321154798b816bd09c00e0aaabb701583a1c8
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
