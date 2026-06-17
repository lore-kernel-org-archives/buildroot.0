Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B10CD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 14:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7401D6F79C;
	Wed, 17 Jun 2026 14:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YavVGE7rdj5; Wed, 17 Jun 2026 14:36:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DCAD6F774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781706972;
	bh=vdE387MElQgNQ3IljxqVmrW6oxtogpYgAXiQ0+owdKM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mO0X1o4UgVZXW1Fpk6QmnnxEsNpuT+xg5zyY1FvYUhUFVnwlrBQAQWFr/JmzNOUKx
	 m4LxGe5xu71zm+kMhxGeF/kcj6ErQ4A8Q5tm1fTEPL7g7a5Np9YHjBUTJLJLrDL+HJ
	 vnbGl+Tu1/ZgUKDjoDy9pUmded/LKYLk8IvFeoYRWDf+QHHdgEwFqUZO81TjF3e29J
	 JOBpjKtL8enzdFFHR+tImr3JbYvoZiZX2KNVWNzMoCEF2Jv6WLmhTcpxcqE6/Q2e5R
	 T8hqw2oB1VY1P7Gaoww+oCz9k/B2AoVZNrZDGAwbOL705s3bXl6ZoCtXrvIn3Lj3Y1
	 1fr34LxMDu4GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DCAD6F774;
	Wed, 17 Jun 2026 14:36:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D7EDD8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4768140145
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KMvbpogsqtA for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 14:36:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A204406A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A204406A2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A204406A2
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:36:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1xONWY0ENE-00wcex; Wed, 17
 Jun 2026 16:36:06 +0200
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Wed, 17 Jun 2026 16:35:27 +0200
Message-ID: <20260617143527.1442235-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:D9bg5I7UPTk0WlkxtJX9bmmSMPYlmOXtvX5dz3+s6d7XmJsWFbv
 hCcIRIge6xeFrjpsjCGOAE/uD0ua9ZbYHiyWeKGX4fw0YbzpPjHZy5XLnnQ59ILD30+klFG
 WI06cOPM2x21zbhbPdAg6YWFf11yX1364m92lil/Bs/f5PnqpfHZ3zsQV4otEXALYxEx2UF
 z5NHdc9Guj8bg9WExeqoA==
UI-OutboundReport: notjunk:1;M01:P0:8FsnXrUtUaE=;oEVQKNjY8IT/88y7fWrIsuyB31+
 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
 K01P9HkIjgui2NpFhJdpVXUdhBYY8XQPXWDFtga
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781706966; x=1782311766; i=fiona.klute@gmx.de;
 bh=+XY63EdAbui9+cr5sJtJEbArWiMz/BYGRXc0j5Tiq9o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LMWEWx4SZkwDXErB9iIlUqrX4bOFhupMIwLHYpfLgcEWiq+RwL0nitndaZfdJCWL
 i7QmxZc9gCCd6eJWE/nhtyaf9yGeXUhw2yf9uwzx2cLyMiW1/5m+gLQtCeym+dENZ
 riDXgAjmkBdtGi/9dUUHtF8giiT1DKVCjjbht80QaOt8GQnTgDi8c6XloxTEOZtJX
 7M+PS/NyT+Svn3SiiQXncF38GuJgHoyy9o+yv2Z6YqlrPg+9J7UbELlrSrkss74UQ
 AtJaX8iXdRX3w7gjwjqsUS5lpxgM0uD1M6JBTPZE81ScGlqKFINB4euJqdaoy4EPh
 u0UmiZ4y9unQU49bOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LMWEWx4S
Subject: [Buildroot] [PATCH 1/1] docs/manual/migrating.adoc: document iwd
 network config change for 2026.08
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With 8536a5d04a6a83d9ec4b4922b99c14a7c4a8ae92 the upstream default
config is used, changing EnableNetworkConfiguration.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 docs/manual/migrating.adoc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index d8d86d8945..230754be76 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -247,3 +247,14 @@ In 2026.02, the network-manager package stopped selecting the gnutls package as
 a cryptography backend automatically. Manually enable the gnutls or libnss
 package if you require features that depend on a cryptography backend, such as
 certificate-based authentication.
+
+[[migrating-to-2026-08]]
+=== Migration to 2026.08
+
+In 2026.08, the iwd package stopped installing a custom
++/etc/iwd/main.conf+, and started using the upstream example
+instead. With that the +EnableNetworkConfiguration+ setting changed
+from +true+ to +false+, in line with upstream defaults. If you need
++EnableNetworkConfiguration=true+ to let +iwd+ handle network
+configuration for active wifi connections, adjust +/etc/iwd/main.conf+
+in your build (see xref:rootfs-custom[] for options).
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
