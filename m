Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2AD10706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 451604110B;
	Sat, 14 Mar 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wT4WfGFoFgm2; Sat, 14 Mar 2026 14:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7300C41458
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497884;
	bh=oPk9fGak9KDUg3KlHA+OJBdzns7O5OuXqgo1dqId/HA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OA65pOHQuECx8u83IlCOvtUPRkHA+BqM+0teYj8vXsc3FSo3cnFwaRcE4cErsDiQZ
	 Yv4cYrohaRFWjPlJ3Sp8ZQdIO1lvRWIpf1/Fo0Rw2iFDMKKL8Vs0jyB1lWAaPJWq+l
	 5vQoZF1Z+huuDSwcijG7E/BrT7KZ0I6ObCbHQ8A2GcLbOsMcafKZMoTe5C5pRR4jwd
	 fH/Lvr/g0oKLhxdXgR8y+aPXzNrJnR+ynKz33/Meu00ertxPMhQWSQE9GW6fP/l6Mt
	 utFtHr0y2GdUAyOTk7bJXazqcxt3GggSMiMP9cc73yRh3ix8zX2GpQAp1DZQw9MDRT
	 vtdk7BrBt1inA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7300C41458;
	Sat, 14 Mar 2026 14:18:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F08EE201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D66D581746
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YY8rcJFxLWJJ for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CABC18169F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CABC18169F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CABC18169F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E9BBA4C17AA;
 Sat, 14 Mar 2026 15:07:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdS-000000003UM-1MdJ;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:11 +0100
Message-ID: <20260314140633.2967249-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497220;
 bh=JTXqLMpC7YGUiaj70QPv/num3wXlFhYgzZsPv/06iwk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dog76QzqLFl9s76Vu6fHilfa+JnWVOZ9fBhE48txdm+3ZvCrYkXBKsjO/l4zxVzvq
 BTSfbr4jaeL2U6w77XGbK+BsjbDzbHwZdRyVPcbNifAT4H3LbjsHJXOXlvYMoRm5r8
 KpBHE7ZfGVZnb9gGH++6xbl6tHxveAA6S3E2z16rK42ApBk0PtDB8ToXQ+Ev+MKtES
 JNsSt5dObli3BhRQyRIyRsSOaHrAmQHWRt+nPRX14jiSGnmRS6yjZV0H4Gh+Ev+NdD
 ZBfOIqiPwxa2/oql4LWuwqnQiaJP2xMQbVdHqut4fK5X9e06pc5BWZD6qupbjoS1GE
 dq3tYuo6e0FgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dog76Qzq
Subject: [Buildroot] [PATCH 15/96] package/python-evdev: bump version to
 1.9.3
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

https://python-evdev.readthedocs.io/en/latest/changelog.html#feb-05-2025

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-evdev/python-evdev.hash | 4 ++--
 package/python-evdev/python-evdev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
index c72a132277..9011065a56 100644
--- a/package/python-evdev/python-evdev.hash
+++ b/package/python-evdev/python-evdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/evdev/json
-md5  7f0ec85ff4bda28ee25e400ec30adff4  evdev-1.9.2.tar.gz
-sha256  5d3278892ce1f92a74d6bf888cc8525d9f68af85dbe336c95d1c87fb8f423069  evdev-1.9.2.tar.gz
+md5  d07e455e36642752ecc3ef161f15e5e6  evdev-1.9.3.tar.gz
+sha256  2c140e01ac8437758fa23fe5c871397412461f42d421aa20241dc8fe8cfccbc9  evdev-1.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256  d4554960d6496150c88c1fd02d7973121a9a57b961ea58fe349fbf8ada3816b2  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index 1bf95fb8c7..169055ab27 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EVDEV_VERSION = 1.9.2
+PYTHON_EVDEV_VERSION = 1.9.3
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/63/fe/a17c106a1f4061ce83f04d14bcedcfb2c38c7793ea56bfb906a6fadae8cb
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/a5/f5/397b61091120a9ca5001041dd7bf76c385b3bfd67a0e5bcb74b852bd22a4
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
