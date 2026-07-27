Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0FDC531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 18:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B6BD6068A;
	Mon, 27 Jul 2026 18:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0rv3-R3o_xh; Mon, 27 Jul 2026 18:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51FE16069B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785175996;
	bh=XeUEy41Rg6ovQIJjNwuEndeUSeFyEwao0BmnMd3IE9A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V2pxIqZnlAH5bBmqHcbw0OP6w9abhNAygg5ciI05CVJ7R8BP7oAde37vAfbBz6Udu
	 HadLTLWlIBQqmRalBopZkQXf5XLFcIXUfzcQ0vN7oIj+yq5CF1ZJfqtLxAH1VisYx8
	 V4chaap7s69jCrtkHmZs1uUgCQu/WrbOEfC0QRNN+294Nnxp5dgWL3IY/H9X9OLNmJ
	 Oi95pDXIIQADLgpQGia18twqcZSgeyQ/tFNIyrf6XAn1mx/8HlodxGHDhGyhcvyLih
	 +M4iNEQLIFAeRcZsUuTf/SWg3IF6N1dzd0mVP6ao08QZYK6uG+R8RAFl8deqhvDSZM
	 UWJW1wuDUPjvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51FE16069B;
	Mon, 27 Jul 2026 18:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96FE52E5
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 18:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 749476069B
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 18:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxM1YQ2Bqaop for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 18:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F8BE6068A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F8BE6068A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F8BE6068A
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 18:13:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0445.dip0.t-ipconnect.de [91.58.4.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1FE5FA4C414D
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 20:13:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38860)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1woPpA-00000000533-0VcI
 for buildroot@buildroot.org; Mon, 27 Jul 2026 18:13:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Jul 2026 20:13:11 +0200
Message-ID: <20260727181311.90940-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785175992;
 bh=xZEd6dY/KYqbyne8IAUZA9Rv4QdVq/drf+d1oiIJrTQ=;
 h=From:To:Subject:Date:From;
 b=b/2LSWBHZ6oYuaszCrDNDl2QDUtkHQacnbXNJoNmta0U1t2w+E6NzkXWvjD46uews
 exywHcIF6HcuqjtKwQ2AMnWB/iSb04LNGcLZOD9rqmvqWfQWK3o2ScZpWJqR7lgj4d
 Loz0gOFE126tEZmTl1vSbH4VI8cdeTp9h9e/1T4Mi7qlLdhbOq/AX0ShxOSRR9q/EZ
 9cD9roJG7QyZrQpqZDH2yisJUKQvG2zJeLjwXOkOqDBLba+bpOgcMUmnlQJBRWIse3
 G7jCdmjHatAiGco5LuRLZ8U09OzYIj7MPN7RpJ39sEoHYprbq4n4MEGixaIjlxm5/K
 ko7IQweUFcH6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=b/2LSWBH
Subject: [Buildroot] [PATCH 1/1] package/pango: bump version to 1.58.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://download.gnome.org/sources/pango/1.57/pango-1.57.0.news
https://download.gnome.org/sources/pango/1.57/pango-1.57.1.news
https://download.gnome.org/sources/pango/1.58/pango-1.58.0.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/6a251f733c2b230add47df631540534a8e402454

 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 41aa793184..c5ca12c50b 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pango/1.56/pango-1.56.4.sha256sum
-sha256  17065e2fcc5f5a5bdbffc884c956bfc7c451a96e8c4fb2f8ad837c6413cb5a01  pango-1.56.4.tar.xz
+# From https://download.gnome.org/sources/pango/1.58/pango-1.58.0.sha256sum
+sha256  bc5bad6213ad4886a47d1e80292fd850b64159b50db67917a43d9ea80ee2298a  pango-1.58.0.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 671705d0b3..69a68bc0ad 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.56
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
+PANGO_VERSION_MAJOR = 1.58
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).0
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
