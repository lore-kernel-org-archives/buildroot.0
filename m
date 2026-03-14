Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D2210706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C174105C;
	Sat, 14 Mar 2026 14:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wnMa9PbmUK0; Sat, 14 Mar 2026 14:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3942441301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497608;
	bh=ngX8VC8zyF4KVp56A/bqxG1j62GP5CyZg7/vKhN08p0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=no1pohf/leGhyQ6fi6fztZw8XXe0186dt/FvdTLF1uA8oGKn/14ciHAAvZh7qEZrH
	 N65S6+w5FBFQdTU/yiThwKtBmZDc8uAejL8niMrfHGZuhYewKZFI7jckliOkNlRVz1
	 LIBS4K+RcOjx6+xIyqkuk/eB9O5Eld98DLQALAo/z6vplsnsmq4EewUNH7hTa5x//E
	 6jBY/dIbA6AbFVKr4Zq6P7INUi+IrXIYeO5j3qBlbZXQMsQdlRm3vBJ4QdlKgPtGjO
	 KEZuK1eHWnFZ/MyRIyk79MYL7xyvtAf91r4Z23b+CLA/OTqOzcK3KaVR9FEMczF+fF
	 3O+Vp+BSHbn6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3942441301;
	Sat, 14 Mar 2026 14:13:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E751E3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7FEB60704
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTGmwa4OhJta for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:13:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8FBE606F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8FBE606F4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8FBE606F4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 30DB8A4C146A;
 Sat, 14 Mar 2026 15:06:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdY-000000003UM-2gqB;
 Sat, 14 Mar 2026 14:06:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:21 +0100
Message-ID: <20260314140633.2967249-85-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497213;
 bh=QEkIMb/ZKFv9APB14LALFSX+tJ+8wfk3OazYipGa4xM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZwGmOgRRMzEF0r8b5BzXbDgXqSsAZUVhdPXiwwVeF3obhg3v80UhDWufo0fZNOyZQ
 jYCMjVryjsl+MyJUQfTdtByIxjfUVRtNnKvHvS43PXUWbv8NmXl/qvI68FTtlYDuou
 tbxKxU6e2hciEr5AMIK+bu6YeWbjJn2thcjVuQTi0al0c+P2E1U8G1M79CyGroGcET
 EiNBepdnjeDW2/n1GghqmO0un9gnh0J1WMXUfxWYNdr99rE4xF9RhrZVcHoLxB2dha
 sipqK/dQYmTSnWMKeb08pioUQoj8rdGhRk6jGQlpuZBlSDZIVVDgm9o5McP/g7F5Ay
 C6yGvGLpQXIFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZwGmOgRR
Subject: [Buildroot] [PATCH 85/96] package/python-urwid: bump version to
 3.0.5
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

https://github.com/urwid/urwid/blob/3.0.5/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index dd9c208ad0..56ea763deb 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  6cf95702b787fd7e5f90e74d9900f000  urwid-3.0.4.tar.gz
-sha256  c3d0d2f47602b21949ffb8669a7ef0a8ca5fa13ed5c1ee1d2d81edf05616187f  urwid-3.0.4.tar.gz
+md5  ee84dfeeac19cb4b09a9d90b64029c20  urwid-3.0.5.tar.gz
+sha256  24be27ffafdb68c09cd95dc21b60ccfd02843320b25ce5feee1708b34fad5a23  urwid-3.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index b3069fdaff..0c29c9ab75 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 3.0.4
+PYTHON_URWID_VERSION = 3.0.5
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/e0/4d/f0832a6bf0986bdd770d61f9cf9e9915741171502c0c399bf934c72a3e5e
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/b1/59/67cd42db7c549c0c106d2b56d2d2ec1915c459e0a92722029efc5359e871
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
