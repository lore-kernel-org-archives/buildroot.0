Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0781CDB46B
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 06:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E92C36FAC3;
	Sat, 20 Jun 2026 06:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xf7DfyLumCOy; Sat, 20 Jun 2026 06:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56DEB6FABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781936534;
	bh=sIk5drNXF87nFuBCzdfNOD7kZxHhMc41Wj1CU0iY/ME=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dqt5tUWY+Fotr+6GwXPqPu0PXIr4Z+rYxSLNQZsywPUg0Xvr2drymXv9JdPA5PF+o
	 Jd5k/yOkUoSP8NpM4DTdWoEZTEYx3Ys3E4HExIVO/eDhxx+qjUd5rZ5cYZmpM8afgp
	 DXokFqL8u6l9YijN2dsxMqN6tMwC1p+819dVomZT3kP+/A7zWBO9CFdDnKGo2E7MnU
	 GNNtxVzbdxpLlYLUZH3WOeZd9pZ5v+S503wLMq120+NsJxwHqN+u+wVB/t/2nJbBXe
	 nxULkzKf1m0hrv6XsHxOh3pg2Jw9TybxlLOyyVrrkhD1/AeKdU2Zc7UjxfkVYsWdO1
	 7k9oHosdzIz4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56DEB6FABC;
	Sat, 20 Jun 2026 06:22:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12456367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 06:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FE438619A
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 06:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8xTiXCbTwJA for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 06:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19D5486195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19D5486195
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19D5486195
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 06:22:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07EC8A4C00D7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 08:22:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49000)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wap5k-000000005qf-2qyw
 for buildroot@buildroot.org; Sat, 20 Jun 2026 06:22:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 08:22:08 +0200
Message-ID: <20260620062208.18846-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781936529;
 bh=/XdyH2hanwWq/Ot/Dx94GPvMhSdv8zbXXbqhZ3qOL1o=;
 h=From:To:Subject:Date:From;
 b=q9H3FRrEX2q/5GYLYnYgKmVnscK6QbAShNHlaDNgEH7hd1zZaVUn3kf+yAc5MgClc
 1uA10npvMIDdpPzCohw+JGBWHzbM6Nt3kFMNNxv/EDudpIbQVK06IxdYJdMM7E0Zh4
 SZ29hqJN6n1OSAsNkvy6fZ2XA/OZ/7QuLxPbSbnKx+B7PTPyzs+9s71DAJQyVKWTGx
 IDIZo8XrjNBxWk7GCMQ1BIEW8iqv3i2yOyeJFOi7n4pHME1LIXY2OIHQ90/NOcD7Da
 fiHOmbqi2PLJaISdSwa9HdksfzwDKkj9YiNK2hwcWai223AqsAsjpau2YB5XnK7G6J
 23KWpK88njqMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=q9H3FRrE
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: security bump version to
 6.6.5
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

https://sourceforge.net/p/fetchmail/mailman/message/59347909/

"## SECURITY BUGFIX
* POP3 with RPA: fix calculation of buffer sizes to avoid buffer
  overflow on long service challenges with long user IDs"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/36fbe2c58ab4004f93e49a1e6f74fc2f0b77cff3

 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 60c950476c..cbf1ef2afb 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59332343/
-sha256  efe01690d22bda359a579c77e2b0072658a092bff490ec0478a212c6b7d0eb70  fetchmail-6.6.4.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59347909/
+sha256  ab0320fe4df0b5ee8659189e66590d9de96aadbf929fe59f353ae7a317e9ef1e  fetchmail-6.6.5.tar.xz
 # Locally computed:
 sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index d021c2c7bd..9b3c035844 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).5
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
