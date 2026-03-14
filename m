Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6917210706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C1F7410AB;
	Sat, 14 Mar 2026 14:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xx8ttGKPgnJ7; Sat, 14 Mar 2026 14:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59A88410B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497367;
	bh=yk/tr56j0hu99Wn7FFxpvIN5/tGVSbUy6ZJSj7c6JH8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PusWjgkYptuQSafb2WAWCgYGF30BATLuyzL+3DONgvdVWp+UHSO0Jo69iB4nySWcs
	 XMFXiZ3qEuF0OM95QenWgP8wjLAsasjUihyEKTa4FK0p5z5OWaC9mnfW+U3FUnFPN5
	 I+aSzfKa3rXHIyDJLZGlsJsSFlWud54bxO2tc9Zbg10xa6XX2m+acmTphXzTnrtYyc
	 a4okAN4h64JFU5HlS0y4goM5Ri92XhmLpv1tlEBHsC8iSjH/w40GHdd5BfvA/8w/N+
	 U3NciDYRdqvD7c46Bp4sgBlWRcXa3QZzx16i2PZNLtLNkfqZWgD9Ue0D5XEr2Pf46w
	 V8TYvyNOoqIDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A88410B9;
	Sat, 14 Mar 2026 14:09:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 945AC201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DF56410AB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FygTMdznNkhS for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FA24410B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA24410B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FA24410B9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1BCCA4C1420;
 Sat, 14 Mar 2026 15:06:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-2toW;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:00 +0100
Message-ID: <20260314140633.2967249-64-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497206;
 bh=58NXwA96xBfVQDaa3pMD8Q7LS6/B8IT0Y6UuMBD/6Xg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=smWEFycrhyvpNz3eE7QSYmX2IAKQVr74WQLutqbY4d/Jlr5y0mhaXuQDIe3RUnfSj
 thAMwRIWUkrgEUTsPldsd6uCJianzVaucHnkmmODdp5Aw56e2mDI7WoMUaf2i6froB
 GwNy3Si6GUIsgo7LL0XBy/9aYYJ/LGfeGjlAPhySY7nvEnttp0NaossQGO5rqpo5HO
 Ir7XEYrl5KJBNuQuRS0xK2Pb/pCI+5KVsvneO+7nUtOKUa2RTU1vFh+/QYkIEmpH8c
 IxaCkOsajzAdk/tfnjc56aWD8yTSDCcJpwz/MORL41e3yQB+QH8Mz2bW8UYOFBtKS3
 VYMOTm2SHiB6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=smWEFycr
Subject: [Buildroot] [PATCH 64/96] package/python-regex: bump version to
 2026.2.28
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

https://github.com/mrabarnett/mrab-regex/blob/2026.2.28/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 0b1bf1a350..3251993d45 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  23b45104a418985aa934ce00b094ec5a  regex-2025.11.3.tar.gz
-sha256  1fedc720f9bb2494ce31a58a1631f9c82df6a09b49c19517ea5cc280b4541e01  regex-2025.11.3.tar.gz
+md5  d0ce2a36afe1d6fe7b6e188963db1b22  regex-2026.2.28.tar.gz
+sha256  a729e47d418ea11d03469f321aaf67cdee8954cde3ff2cf8403ab87951ad10f2  regex-2026.2.28.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index a6a8d6e3fc..281a0e83a1 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2025.11.3
+PYTHON_REGEX_VERSION = 2026.2.28
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/cc/a9/546676f25e573a4cf00fe8e119b78a37b6a8fe2dc95cda877b30889c9c45
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/8b/71/41455aa99a5a5ac1eaf311f5d8efd9ce6433c03ac1e0962de163350d0d97
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
