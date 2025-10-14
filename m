Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FACCCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D017612EB;
	Tue, 14 Oct 2025 18:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5mYAj8cPDY9; Tue, 14 Oct 2025 18:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362A4612FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 362A4612FA;
	Tue, 14 Oct 2025 18:51:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 368EB294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2833C405AE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9ICYosidu7w for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:51:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29EB5411E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29EB5411E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29EB5411E2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:51:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54374A4C6C35;
 Tue, 14 Oct 2025 20:51:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49012)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8k77-000000003qG-1FyM;
 Tue, 14 Oct 2025 18:51:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:51:05 +0200
Message-ID: <20251014185113.3583315-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014185113.3583315-1-bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760467874;
 bh=ivhIoKw+S9qNE4VOdej38d2mIYFGiuQ7TctRqYmK55A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bu03ENnNmbJa+vstgIqM4mV189EwI9K16M4GHmRt4MFdY7TNA90DvfHEPy4J/oZTe
 z1XnsozVaTMb8qH25CRzaFo7UFPvsr/vxRUuZxkIiS8f1/ypBTDD0vEciP3/DyIkcG
 eO88rp6CtVgl/xazLt4H7XA45od/SS+yO0LxliZQca4iMrcBQMq4aJiecf5BnVDOAo
 XOGb5CT8Zw8AY9cbwx0S3Faz7D3EMaAo2ZdPYSCB6ZBWndhPsh3KP5bGEGk6DlGVdl
 XNGxzMDMRT4eNBRcVu3l2f4XLIGvv1Wrc2N/F85SGtkHi+TlZ6NyU1a0OMPFG4+IT4
 Tn+8wq2HuYlcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=bu03ENnN
Subject: [Buildroot] [PATCH 06/14] package/python-websocket-client: bump
 version to 1.9.0
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
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to copyright year bump:
https://github.com/websocket-client/websocket-client/commit/e46a8fe2dbc74f88a2cfa749f2499f7cc6f31409

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-websocket-client/python-websocket-client.hash    | 6 +++---
 package/python-websocket-client/python-websocket-client.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index 373906c3dc..a966a7e441 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5  9cffbda9eefb0a17e9c4cda3b7884493  websocket_client-1.8.0.tar.gz
-sha256  3239df9f44da632f96012472805d40a23281a991027ce11d2f45a6f24ac4c3da  websocket_client-1.8.0.tar.gz
+md5  3e6fd932858e9123d6ef5161e9ce7c46  websocket_client-1.9.0.tar.gz
+sha256  9e813624b6eb619999a97dc7958469217c3176312b3a16a4bd1bc7e08a46ec98  websocket_client-1.9.0.tar.gz
 # Locally computed sha256 checksums
-sha256  453e6a69427ed9ff92a03ef2d7b21ef1db41fdf56d62307a49ba85059f7a0c62  LICENSE
+sha256  d7ad8d0966aa363d45c7b16b0838cadcd51676acdf215ad967307d581b47872c  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index ce582e89b7..f735782cf8 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 1.8.0
+PYTHON_WEBSOCKET_CLIENT_VERSION = 1.9.0
 PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/e6/30/fba0d96b4b5fbf5948ed3f4681f7da2f9f64512e1d303f94b4cc174c24a5
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/2c/41/aa4bf9664e4cda14c3b39865b12251e8e7d239f4cd0e3cc1b6c2ccde25c1
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKET_CLIENT_LICENSE = Apache-2.0
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
