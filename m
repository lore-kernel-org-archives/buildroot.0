Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287AE10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E8D41520;
	Sat, 14 Mar 2026 14:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYCL6yXFNqCG; Sat, 14 Mar 2026 14:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7135D41522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497946;
	bh=fYoAdbsRsTXKoSKn6ov1yH9mTIYgENVE9u4Kq/Pm8+I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FaLyuelagVAaWXXUvNk/DIM7Af5yTtvGvHyoMrmaJdTFfWZbklhZM/0Tv7IL46J7G
	 VwHAWDJneanhNVfn+AF/vIYEKFNEKHjYDWhzSoRse+AF34Pj37gEF6vCGEzL2M5qHT
	 WP7AZavE46n84WmiCG/CUkZoXop+IcrsHEQcT7eS+8tOFED8ZAnfq5RR0TrkU33ru4
	 by1tzSwMeHIJGEoWuj1W3qAtjWaUvjlQ80NHtTFgOUtrpC0uVmyU9L4ga8ABtOFC0S
	 LurAJvAKdGxlLah0R1qFangL64wjNLGAwLO+aJXZM6hVlr6Z1rZo8GSePXQY2VZSdU
	 5/m7q8I/78MRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7135D41522;
	Sat, 14 Mar 2026 14:19:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B43DA201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98F38414FC
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmLQvGf6AuNh for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:19:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91C5241520
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C5241520
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91C5241520
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:19:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0945A4C180C;
 Sat, 14 Mar 2026 15:07:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdS-000000003UM-2qtm;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:15 +0100
Message-ID: <20260314140633.2967249-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497221;
 bh=8DwtcdD2KiQeB9zgA+EkrNLrYnr2o1BO+JmIDWnibyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tbZLCG8PeEYTjqpyIUh9zXmxvhuU7EXZnjZzltlGDj2xtELC6xF4xH/8De4W0s+G0
 3mtKN7fy2oKZbBEIk4uRE9D9vF6ZH6HrZSiQfpFbm6u5z6tMksaWYQuxUqsVkW0+q1
 MvGOaneJt3GEQJ9b2un/ULyGOVdo5wxgLheHvHcpV+B22/RvZgFtl36CVKfwd+hP9/
 jk9HtjEKnwPAwaWfXxmdz685MuIEqejxHsnJ31jxZHmEisl+gBG5LnlsMCKqRSwBhp
 Qxq0e8T6ODh3JBE2OfgH7fAcJoj+ruNRG0C4I5nsKhIVu6rhfJf9mKgiBSeUmRDy4/
 JxsJQN4vju6qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tbZLCG8P
Subject: [Buildroot] [PATCH 19/96] package/python-fonttools: bump version to
 4.62.1
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

https://github.com/fonttools/fonttools/blob/4.62.1/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 61dfad4f79..9218c8dea4 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  98125fbc3dd9254fd8b95c309138b837  fonttools-4.61.1.tar.gz
-sha256  6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69  fonttools-4.61.1.tar.gz
+md5  cd04d1eee484599b2fa502b3ab5c186a  fonttools-4.62.1.tar.gz
+sha256  e54c75fd6041f1122476776880f7c3c3295ffa31962dc6ebe2543c00dca58b5d  fonttools-4.62.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 85c589b616..1eb8224197 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.61.1
+PYTHON_FONTTOOLS_VERSION = 4.62.1
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/9a/08/7012b00a9a5874311b639c3920270c36ee0c445b69d9989a85e5c92ebcb0
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
