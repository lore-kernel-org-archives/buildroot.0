Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9D1D5B867
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A826840A29;
	Mon, 15 Dec 2025 19:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsFKDFgIyiEM; Mon, 15 Dec 2025 19:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEA7A40A24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826090;
	bh=eAwZH0jySKf0IXmhx/kzl1ZzRdMmzMsrqmHadaDHmn8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dF6E8iUEEENm1po8U4nJZPCxf5E9/tAXdReixb7dC+eDbXTF9fiI2yMBNA/VAgWxP
	 prLniVqmzEMUP4/55m2RMqaawsdRad/nT9kazpLczf2i+ezmLk4NjTYa6aHoGPumlV
	 2vbW2yE4EztWaIVyodih/toWdpDAg0tkNeNVIkqwJQYXUKQYNK1GQK900l5o1/pPH/
	 YdSrrTD1pfwToXwFvr+9CwqRwePXoUBKte28rZmSr1jMQIXptn0f57dLqgEyeByNX2
	 PtKiKtftwXb0FvCh4QgmKzr2xyzLvDd3ThEz79gwSs3hsA3xXFcsJ+n7y99lXEMnU7
	 mFLJeRfxRL/Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA7A40A24;
	Mon, 15 Dec 2025 19:14:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B65EB255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A853960EB7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vK7wyCjKQHT8 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E9CC60DE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E9CC60DE7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E9CC60DE7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34990A4C426A;
 Mon, 15 Dec 2025 20:14:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1Q-000000005ED-1ziq;
 Mon, 15 Dec 2025 19:14:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:52 +0100
Message-ID: <20251215191416.421755-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826057;
 bh=fZZk1UnO/fCTF1OSBZHnS8gSx6guk/tP7bm9vm/ETVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Or33F+J6Fyh6SeRFx5Skkjy+8SEmgCdjYUXHRjO22xSdsHvtTq7pJYtM3vEl4TSH5
 kcgHYs0IX6XDkYe/dpC/QQpPhhlkoyF5bg5P7K5QFUuP16mOi3hVQoPf5pNQEwvr8M
 YtLdIyuQqCaxWpRojP4YDkI8v3syo7K1yKfbmU1oSF/yyRjFpD7jcF+PFKMRDX0k6M
 5OFSH6gwAeVutUH154OilTM/8oaLfbwy2rWcwYMHTwsTIIoOlkW4khXhcVhDa+Etcm
 zZRvvA71Wi5Tufsn1br7nEPJLbA+N5MKXKhIxQ+ThIeC1TZ9cE74hsyEHp99/U7/QL
 fWQynedBCyFaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Or33F+J6
Subject: [Buildroot] [PATCH 03/27] package/python-psutil: bump version to
 7.1.3
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/giampaolo/psutil/blob/release-7.1.3/HISTORY.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 0ba261a7a8..02bd2fcd89 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  26dc8499f435198ab3f907edf9e7d7b4  psutil-7.1.0.tar.gz
-sha256  655708b3c069387c8b77b072fc429a57d0e214221d01c0a772df7dfedcb3bcd2  psutil-7.1.0.tar.gz
+md5  99dbbe92985d5e5a3a45574ea521af67  psutil-7.1.3.tar.gz
+sha256  6c86281738d77335af7aec228328e944b30930899ea760ecf33a4dba66be5e74  psutil-7.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b89c063b3786e28e0c0a38f1931db61fed35e69dd2a2966fbecffee0f46c8d10  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 41fd92fe37..2e20712f9a 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 7.1.0
+PYTHON_PSUTIL_VERSION = 7.1.3
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/b3/31/4723d756b59344b643542936e37a31d1d3204bcdc42a7daa8ee9eb06fb50
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/e1/88/bdd0a41e5857d5d703287598cbf08dad90aed56774ea52ae071bae9071b6
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
