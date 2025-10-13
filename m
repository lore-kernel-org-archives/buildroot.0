Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9642ECCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68A396146F;
	Mon, 13 Oct 2025 18:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zs8_MNBh-FBI; Mon, 13 Oct 2025 18:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8153561393
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8153561393;
	Mon, 13 Oct 2025 18:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FE6FBC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 358D1613C3
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkVfrv3yX7tn for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:00:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 306C660B7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 306C660B7C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 306C660B7C
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:00:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84E8BA4C6A15;
 Mon, 13 Oct 2025 19:55:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlR-000000005Im-2DFu;
 Mon, 13 Oct 2025 17:55:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:55:05 +0200
Message-ID: <20251013175513.86276-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378118;
 bh=91OyB1GWJsZ/vPQ+3tbaNDyRWFa/9gAFFvfGe3eQZrQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DUTsG/XKOpn+5u3LIir4EAr3Y/YtQzXxBIAEar42DpdSAbz10OvcMfdWI4Eeud6qQ
 1xPwQNJHsbl8vLsYtXeyDWq2aJDVKKZUwM8j/VBQQSospBfqzGty3aVCclcdptnIvF
 owNO10fle0iU+Avlti3pXFACXsovKMMIp1KNyHkHpakRg9mJOw+J2TlTbXnZDglAFH
 OVpeDgDL07TmxwwHJFbAirkxYNwUFZB3OHWwd43isdoi/zY0tBN5kIN+/eZeohlw+7
 YikdggyC7bh+XPG3vzbj4b0nlx75Pyg1PGgcfypM0+HSOYM0PU5H+uuCZfFF/+5VVS
 eTHHZHddUQfcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=DUTsG/XK
Subject: [Buildroot] [PATCH 28/36] package/python-setproctitle: bump version
 to 1.3.7
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Olivier Matz <olivier.matz@6wind.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Nasser Afshin <afshin.nasser@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license file name and hash due to upstream commits:
https://github.com/dvarrazzo/py-setproctitle/commit/9950f38639e8bbda8d208bd4b8ec0531821e26a8
https://github.com/dvarrazzo/py-setproctitle/commit/11d5ba71f0dc2bee2deb32ad17ac577101d404cd

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-setproctitle/python-setproctitle.hash | 6 +++---
 package/python-setproctitle/python-setproctitle.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index 0076b0268f..3520520df8 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setproctitle/json
-md5  9971bff3c4dc79e31565f1f79adb97af  setproctitle-1.3.4.tar.gz
-sha256  3b40d32a3e1f04e94231ed6dfee0da9e43b4f9c6b5450d53e6dd7754c34e0c50  setproctitle-1.3.4.tar.gz
+md5  422cd04321b1aa0f4b56d51d10ae5bb8  setproctitle-1.3.7.tar.gz
+sha256  bc2bc917691c1537d5b9bca1468437176809c7e11e5694ca79a9ca12345dcb9e  setproctitle-1.3.7.tar.gz
 # Locally computed sha256 checksums
-sha256  4ace14d0836da75079088cfc5cef6f2ddc8ce16f600609b36ee1bf10f8101f61  COPYRIGHT
+sha256  4bb8a954b08857aaecf1da3ecd722ab810d3899f2ab386052bbe27f5ff24a02a  LICENSE
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 6698000eb2..7821eb5225 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.3.4
+PYTHON_SETPROCTITLE_VERSION = 1.3.7
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/ae/4e/b09341b19b9ceb8b4c67298ab4a08ef7a4abdd3016c7bb152e9b6379031d
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/8d/48/49393a96a2eef1ab418b17475fb92b8fcfad83d099e678751b05472e69de
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
-PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
+PYTHON_SETPROCTITLE_LICENSE_FILES = LICENSE
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
