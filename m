Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EEB10706DF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF6F340A55;
	Sat, 14 Mar 2026 14:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r76CKmRUOHfz; Sat, 14 Mar 2026 14:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10F0E40BB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498138;
	bh=Wzfb4VtzpW/Jb3mvhWYSKQiVh6/G+7NsIZZWkb1grn8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hZUXd/78wTVe8EXQTACxm/MZAz39nlZ6yvE+DsH7OCBOTv6kMNkK6uCOkFQTnpjpa
	 P2WVZinkBKHV4NAWr550D1LjyYu17ACD2FETx8yzd9o59PIDB+e7Ovyu8hERCNJNFJ
	 Qo7WMp8fqJ/lN07m02oBnjlztu5wlXm6mXnRu7XYP5UrH/OFSjp+9tKqgUBa3dwG0V
	 YlXUjoxiRwnZMvVckMoesBiVyyAuVU5sd60r7BKRGzYU1fSyU9VwuljvWoLEDAvC7x
	 F5KwcIF/hxNHEXLtdXxAbqqe14RqGjNnAf3pD/XERU5nZoHshh/C29Rq5uIGRTvZQv
	 7iSLnn9LoFyhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F0E40BB1;
	Sat, 14 Mar 2026 14:22:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FEE81B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91FD0400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRePylKwfipX for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 569C040076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 569C040076
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 569C040076
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:22:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64795A4C1A23;
 Sat, 14 Mar 2026 15:07:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdU-000000003UM-0WjB;
 Sat, 14 Mar 2026 14:06:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:31 +0100
Message-ID: <20260314140633.2967249-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497224;
 bh=qo6eE64MqAIshwUMKYG152wA1v6A/I00nsuK8Ba+GTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Egdde92GjQ0ttcLOrPSs+wY0H0v2hVd/TCMsV51jaMNBiA3Vki/sdMwLX3iFD89TP
 1fGl4cQnKO3T4XaYMvQxv3kYDE9FBnplb42VW6RffrAgDmFjOAnnOA4xa3txcZ3pME
 uv/sZqNJ173aZYNJr9mD0aScTIsZb9+GHjRnjhB4htIN08zt66FsRFCcoq/+Pjs0Gh
 fEQSP4dOX7ECHxbBLRw+Dk0mo6EiFpUp5eVF2Df5EYhj20yxrw6UH4iZCUgzycEOAn
 RRdHmSY0qkNslNpertIdOoEr7pl8f/NUCuEmjj7Id2Yh3ZC/6mqjfwVVpFV9URpsTi
 Qd7545ud18TRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Egdde92G
Subject: [Buildroot] [PATCH 35/96] package/python-meson-python: bump version
 to 0.19.0
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

https://github.com/mesonbuild/meson-python/blob/0.19.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-meson-python/python-meson-python.hash | 4 ++--
 package/python-meson-python/python-meson-python.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
index fa1ac831c7..1bab8285eb 100644
--- a/package/python-meson-python/python-meson-python.hash
+++ b/package/python-meson-python/python-meson-python.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/meson-python/json
-md5  b4d7f9ef6f09deb8dc8a7e5cbf16778e  meson_python-0.18.0.tar.gz
-sha256  c56a99ec9df669a40662fe46960321af6e4b14106c14db228709c1628e23848d  meson_python-0.18.0.tar.gz
+md5  36c0a47464398008ea3939bbef334f31  meson_python-0.19.0.tar.gz
+sha256  9959d198aa69b57fcfd354a34518c6f795b781a73ed0656f4d01660160cc2553  meson_python-0.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
index 542b64943d..af8f26f9a8 100644
--- a/package/python-meson-python/python-meson-python.mk
+++ b/package/python-meson-python/python-meson-python.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MESON_PYTHON_VERSION = 0.18.0
+PYTHON_MESON_PYTHON_VERSION = 0.19.0
 PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
-PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/26/bd/fdb26366443620f1a8a4d4ec7bfa37d1fbbe7bf737b257c205bbcf95ba95
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/32/98/7fe5d1bf741c03c6eea04b6245737dbd79657d4f9200e82fcbb4cc12637b
 PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
 PYTHON_MESON_PYTHON_LICENSE = MIT
 PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
