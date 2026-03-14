Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D6D10706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D77F41440;
	Sat, 14 Mar 2026 14:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sRUQQh8SNto; Sat, 14 Mar 2026 14:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C13441456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497872;
	bh=+B17kt7rZGofDal+hrmq0qwIuQDosP7Si8W9w5lUDso=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yx5EwqlXHbsMczvfSiCICPUzJBGGwW4v8ceBIP1Quj191L/U6hWgHhtEOogrxgHqx
	 GU0v8u94Ak5Zjw3VL3Md8NxWz1j3DdcV0pMdrO+rZtvaAvvhchiESh2JCDys4GfkER
	 Xhp5f59UYmXccXe74x/EjdzRhc16hdkHudeuT0ETxBqs9BHlv9IfnwDkhmcN0uj8le
	 zH6v7pR5Vli2FZRtFyXnbJshnQw3VnztcB4hW3vrqINqoIbXPPcBfcutbo7LTvjt9p
	 9VzYWYJBwgr0cdcKOzFBwLtVVLYYQ7+4F3TGCroeuywHTzmrohbG+cA8ZAnd8+9XyB
	 kiIhqw3QO/iYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C13441456;
	Sat, 14 Mar 2026 14:17:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4C5C201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D23BB400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3qGvyB0HaHd for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:17:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8F8F40076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8F8F40076
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8F8F40076
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4493CA4C17A5;
 Sat, 14 Mar 2026 15:07:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdS-000000003UM-10DH;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:10 +0100
Message-ID: <20260314140633.2967249-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497220;
 bh=rW+0i85ABCBDaS1/ZtVh2HfGWjZtUNw9wHh9Nh8uUcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=X+BNwsx0x3xxdRRu3zHgebC6Gaps/6qrjx1Lo51dlpzIQd99WJX70iS0IXzH2VQE9
 l3Nt7pFuTWjl37YmZadfWyEZuzKP1ZTte2+gFQ0dOPf++07Ob/PidjwKn7YVuPEfWP
 e0DgYPevlJjJHQk0MwYgcJDynQIkfkjKg4QmWWdKLey2Kdi1Noad7OMdl7Z3QvUwM9
 EDPgAPCdaxO0Em2KmhxJ3GFNcn8DKezXWeByu6p8aBEu0bqavhXges5YAWeqfRYrA4
 zZKyp5wk7rSKsYRIupjBpdnqg1GfVroyfIRDz5kDM+yy7uzX+o5fFrbdANo9m2Sngk
 QNsAAobm/iFwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=X+BNwsx0
Subject: [Buildroot] [PATCH 14/96] package/python-dbus-fast: bump version to
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

https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 1fac0c0396..deaaf4bd79 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  605c7ca53ec797a9513c742d705f8494  dbus_fast-3.1.2.tar.gz
-sha256  6c9e1b45e4b5e7df0c021bf1bf3f27649374e47c3de1afdba6d00a7d7bba4b3a  dbus_fast-3.1.2.tar.gz
+md5  02f1448d52a71999626135269f3763f2  dbus_fast-4.0.0.tar.gz
+sha256  e1d3ee49a4a81524d7caaa2d5a31fc71075a1c977b661df958cee24bef86b8fe  dbus_fast-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 7d98581eeb..5addc1031f 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 3.1.2
+PYTHON_DBUS_FAST_VERSION = 4.0.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/16/a4/e54607cf8b0a696beba591f1a543cff5b6a9e4b4f842fd55f7ba741d678d
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/3d/f7/36515d10e85ab6d6193edbabbcae974c25d6fbabb8ead84cfd2b4ee8eaf6
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
