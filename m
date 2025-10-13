Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D3CCCD18D
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 17:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D415F61323;
	Mon, 13 Oct 2025 17:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8E5vb_YUi9Xq; Mon, 13 Oct 2025 17:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1EFF61303
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1EFF61303;
	Mon, 13 Oct 2025 17:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD74294
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7360A40A2F
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lu_J1leYvMkS for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 17:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F081740A26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F081740A26
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F081740A26
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:55:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A91DEA4C69F6;
 Mon, 13 Oct 2025 19:55:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlN-000000005Im-37LJ;
 Mon, 13 Oct 2025 17:55:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:54:39 +0200
Message-ID: <20251013175513.86276-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378114;
 bh=EKQeySYJvF0rYCaMtNff66qOdXs38Zuq/3PKwp4yOfk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=unqQovhxJNvG5lKrE1zby5I1x0jM6GO/iwH8+lVL2EkUXUx77Hisfu8lb8ad3i3bw
 8jfWbfWErwi3QfY/qjYN60cO5qEwctHWFTiffQmj/9aaslsJXumtYGFzZ49TbJK0FW
 En/5zqYeY3Y/SgBdYGaWTKkDl92Jo2l5iZzkQOplwCfgTPS0Q4l2sg/IFK5xNd+FJd
 2VrFtsMI/qS99BlXYOqWdYVu4BJMY8ZqZPufYTjtTAcG2mc7Kr03gr3XTjXpvC/uz2
 tOeBj9CDa71Ajj97vRmnnGgY/TX4CUA0JZbCm76Jezkqo2LjjoZFEmuFtbwXbm/F2x
 mCw1t7rO25jQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=unqQovhx
Subject: [Buildroot] [PATCH 02/36] package/python-pathvalidate: bump version
 to 3.3.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 9793217fcb..c9cde9d906 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathvalidate/json
-md5  9b6599a16c5e3ea7b6dcad5ca7dc337e  pathvalidate-3.2.3.tar.gz
-sha256  59b5b9278e30382d6d213497623043ebe63f10e29055be4419a9c04c721739cb  pathvalidate-3.2.3.tar.gz
+md5  eb93289da5c87fc28af52e8536f417bc  pathvalidate-3.3.1.tar.gz
+sha256  b18c07212bfead624345bb8e1d6141cdcf15a39736994ea0b94035ad2b1ba177  pathvalidate-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  130a35b917df1951aefbf366120491d5124045a87ded123f20ded21521f4e3a2  LICENSE
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index f666e07fb8..5d5baa5731 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 3.2.3
+PYTHON_PATHVALIDATE_VERSION = 3.3.1
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/92/87/c7a2f51cc62df0495acb0ed2533a7c74cc895e569a1b020ee5f6e9fa4e21
+PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/fa/2a/52a8da6fe965dea6192eb716b357558e103aea0a1e9a8352ad575a8406ca
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
