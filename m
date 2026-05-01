Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F39CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8666761AC7;
	Fri,  1 May 2026 12:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kuv_hJGUyoni; Fri,  1 May 2026 12:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B00ED61B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638706;
	bh=b8P10g8YYbc2+xdx9O1aQV+mGWG+3iVLU8i2uDjVhzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XMEH9qKgK2rRnhP5p/MYZqsXb3cHXgYRDs/YfwDd1BMiMIPv14S/fKvezLzyYyHsF
	 qwvr9MT3DHgn/g2E6Hl797obi9b958OWpFoq529R4UZwGu13mvrPh1skcDQGAL1Bs+
	 NtA/IaYkfA3V1BwnmeoDUrwZUAHzoj3TAY3TEt6hOh9rBX1eytGmKvn5432yFGBiu9
	 p2EIZRxP8TFDMAw1584OH274zZ94U9Pvju/4dInRbWWqR+fpQCuur7WEaBdfA/WM+4
	 aIkweXJ5WwBEWp6K/NmQzC/D7ae4GUSnj0xBj/kEWzy3rcEnIaHJF6pLrG0N2VKQGR
	 Jn62Y/PqG/X2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B00ED61B25;
	Fri,  1 May 2026 12:31:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B699293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DC8441DD8
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATsi0q4J8i6j for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:31:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42B8141DB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B8141DB2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42B8141DB2
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:31:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E994A4C26F4;
 Fri,  1 May 2026 14:31:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1J-000000008NC-1Erm;
 Fri, 01 May 2026 12:31:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:29:52 +0200
Message-ID: <20260501123100.1918951-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638662;
 bh=yK9lY/LSyQ+BJKGjMKY1spU1Wu//DCH+LQQolNJGtKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QL43ZdwzIfwd551RSQLzkQSc6Qsm70cjAMMtdFyUqbGTnQgu9NkHV2U3CJbMCMDTZ
 /y/BMPP0Qw0q2/CSslG2ONx5aurtdgI1VeaO2pl860Kd21kaVxvxnJORL5LVXlGjCU
 fFJZoXdWCHAyjJgictzAJxVRPyuIVXvJgUhgOYucS3FXWweRBkXNLoXhPjgBEl9lwg
 50NBkOvfLR/0I+cXWTqpBerOWw7X9f1ik7YtdpvfOypunrwhWPRwUJoWV/paKOGhW8
 A6RHTEzn/IjfwNN4WrjUB01QIlUVnfRtdaozYWpeHB8wqstb8NENAialFEUWWw80vV
 KoBM9noozfDUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QL43Zdwz
Subject: [Buildroot] [PATCH 07/75] package/python-boto3: bump version to
 1.43.1
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

https://github.com/boto/boto3/blob/1.43.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index a7e3ba6476..0a620aff21 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  8e39cbbb73c8eb861e2d2d7a5107c3d2  boto3-1.42.68.tar.gz
-sha256  3f349f967ab38c23425626d130962bcb363e75f042734fe856ea8c5a00eef03c  boto3-1.42.68.tar.gz
+md5  8f6916a7e50632593cdf56b5fcdbd365  boto3-1.43.1.tar.gz
+sha256  9e4f85a7884797ff0f52c257094730ed228aaa07fa8134775ff8f86909cf4f2a  boto3-1.43.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 7901c671a3..4a88e115cf 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.42.68
+PYTHON_BOTO3_VERSION = 1.43.1
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/06/ae/60c642aa5413e560b671da825329f510b29a77274ed0f580bde77562294d
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/98/36/028c12ed6ed85009a21b5472eb76c27f9b0341c6986f06f83475b40aaf51
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
