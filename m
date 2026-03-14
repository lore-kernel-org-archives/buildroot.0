Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7547210706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DD6F4141B;
	Sat, 14 Mar 2026 14:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeZwXvRIUesB; Sat, 14 Mar 2026 14:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 708574141C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497775;
	bh=q17+3A9VwNF880Eb0cCLMgIS9wef38VqzmHDX9FjjPk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fWMAWujq+bR6bCbQKyP/Kx25V4IGu+hjb2/7xXzORXaTssTO+klsEMGPCE/uE5RHI
	 933tEY5zDNivxEKSF47TlLUJNxkogGgSsQjr9lf/B71rFJ2eth4vyS+Y0OZIkNAQqv
	 iFaoz9F4riVQlA8y+5BwImUc/Twcvdgc72Nzdg7tjACtamuTYsWtfDokosOUCQQwGY
	 6tPYcPO1gR9bgfesPrGBtXxmZdAWnTqNEmEP7uhYNmGKAnnLyClgPFBXT3qqfjXuoS
	 tF3z13Mu0MPuf13LS/QcHl98wvXLI1laHdYXWMJmQ/Mr1Y0xdtdb4xKzhwAOpXlygd
	 oyBMrqNmRbsdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 708574141C;
	Sat, 14 Mar 2026 14:16:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0338201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B18578228F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AoJ7SYEv-dS for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A73B88228E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73B88228E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A73B88228E
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6055A4C1704;
 Sat, 14 Mar 2026 15:06:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdR-000000003UM-2rD9;
 Sat, 14 Mar 2026 14:06:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:04 +0100
Message-ID: <20260314140633.2967249-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497217;
 bh=vYtdpTE5TRmM31QC5YJfc88Zs7q2ncWbrC2dkrJd0v4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N1K/eqKtRHZP1M756DXQY/vEh7oNbKVTvqeXIQIoTCKOMIN3R6qqxKgn+AYDzhenP
 iRdBvRuts/NGY/iyKY4SktywhBPiOc/g0IKZ152WIRkd21o82l9JVOkt2SpKZGXfP4
 2kS1zBy+PvtEZkwRty/RYg0ijD7TP6zTTX5LPr8UpycdqTM75dEefmEOq6NyVIkaOd
 txUPXXzAJulDp4KlAYuVmFVm3UMZKWVi0lGFIoSJZlRYnMMUW2Jta0GXhqKbmPsL5s
 rmC+F/yt0zdbZeD4GWC86E1/7eGPzZQsn3RPUkAZWbS2QEJBYxhloeCzb74EC64t7B
 jG8ExuuK+od/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=N1K/eqKt
Subject: [Buildroot] [PATCH 08/96] package/python-boto3: bump version to
 1.42.68
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

https://github.com/boto/boto3/blob/1.42.68/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 29d4125fbb..a7e3ba6476 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  67045728a35f4e764ad826fc31006746  boto3-1.42.21.tar.gz
-sha256  9b92943d253bc837323079fe88460e741cb2eb80abaebcb558b2446bdb4049d6  boto3-1.42.21.tar.gz
+md5  8e39cbbb73c8eb861e2d2d7a5107c3d2  boto3-1.42.68.tar.gz
+sha256  3f349f967ab38c23425626d130962bcb363e75f042734fe856ea8c5a00eef03c  boto3-1.42.68.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 3d7088ddb3..7901c671a3 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.42.21
+PYTHON_BOTO3_VERSION = 1.42.68
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/27/36/999f23a821567334ecdfaec31fad556f5569383006543be63fdd1e17193f
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/06/ae/60c642aa5413e560b671da825329f510b29a77274ed0f580bde77562294d
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
