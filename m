Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1F1E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 09:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55B7F60646;
	Tue, 31 Dec 2024 09:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LonG618SrKla; Tue, 31 Dec 2024 09:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454A4606FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 454A4606FD;
	Tue, 31 Dec 2024 09:10:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41631968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 09:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 218DB606ED
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 09:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j45x9qHblRQS for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 09:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02FAD60646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02FAD60646
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02FAD60646
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 09:10:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1154EC0004;
 Tue, 31 Dec 2024 09:10:19 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 31 Dec 2024 10:10:18 +0100
Message-ID: <20241231091019.1578462-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735636220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WhDEeAfVfPQgOk04j3GUk+vGSR86ZiqTjKxcHrZ5Sho=;
 b=kpukY7C2uQpuNNoiW3IfLgas/L/wuN/Yu9X6Wr5L8M6s5bNh8dJIHKzV5B7VIAzprdD8yo
 xUWRQPh0UHs91UXocnh33hY1KjGZG2ppciv9hLdeqON+iZnZ4tKvVnUljdWjUAs78sBWye
 7fNdoR3FHKAVvpRb0DsOJuRTWmtyRgzxmKsPxOl6ysaDG6BRFk5R4LC442lQo+LqF0721s
 G8FLturDw6Zmp/cPgt50ct9Uayt4qqHMp2ib95tyrYXgi/sYOmlik+vA7zkYT1bitIs3+g
 znp8a/bJUSS1der69Zy686bFanrEQI3sKqtNWM+nu1b3NUomAEBcfaZ3txuhZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kpukY7C2
Subject: [Buildroot] [PATCH] package/postgresql: workaround documentation
 build failure
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of Postgresql to version 17.2 in commit
cc77be28fc030f8583a4a7f9f724d0fc9543dba5, the build fails when
host-libxml2 and host-libxslt have been built prior to Postgresql, or
when xmllint and xsltproc are available on the host machine, with:

I/O error : Attempt to load network entity: http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd
../doc/src/sgml/postgres.sgml:22: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
]>
  ^
../doc/src/sgml/postgres.sgml:24: element book: validity error : No declaration for attribute id of element book
<book id="postgres">

As this happens when building the documentation, this commit proposes
to disable building the documentation. Unfortunately, passing
-Ddocs=disabled -Ddocs_pdf=disabled is not sufficient, as the
documentation building logic still does stuff when it detects xmllint
and xsltproc, so we "poison" the detection of those tools so that they
do not get used.

This issue has been reported upstream as of bug #18760.

Fixes:

  http://autobuild.buildroot.net/results/b061e6a68c885e47a254e66dbc073e2b548b8cd3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 5ad3cea9e7..f4b58f58ed 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -14,7 +14,15 @@ POSTGRESQL_SELINUX_MODULES = postgresql
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-POSTGRESQL_CONF_OPTS = -Drpath=false
+# We have to force invalid paths for xmllint and xsltproc, otherwise
+# if detected they get used, even with -Ddocs=disabled and
+# -Ddocs_pdf=disabled, and it causes build failures
+POSTGRESQL_CONF_OPTS = \
+	-Drpath=false \
+	-Ddocs=disabled \
+	-Ddocs_pdf=disabled \
+	-DXMLLINT=/nowhere \
+	-DXSLTPROC=/nowhere
 POSTGRESQL_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-bison \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
