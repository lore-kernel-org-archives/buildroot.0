Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FC9D59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 15:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A62E60D84;
	Sat, 13 Dec 2025 15:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1lQTZc1giX0; Sat, 13 Dec 2025 15:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B39C60BC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765639062;
	bh=T/iWymghmWevyYjJSy/WPo0qSwOz0egTZ2cLBEcWSKg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xz1j9xYTAWxmN5DHJoFDeS4a9Od/EpzUwciUOIE4VXLYh6GjPkvNdEeHHQo6DXp1A
	 Ox8/EqkOEpXDbTPZJri4Hc6tR6tUQX46CK7ObvHfYffkXpt/hszsWSoIzJDmppi7iq
	 0zzPdB3ItNuovici+IvDToH8yCBRI1iZSLGt74m7JT48aIIh+1P8vB2mNyzCIBIBC7
	 nAoVtLnFV8X42F9TjwqcfArqovHAeGcFFOWNxuNat5PyptKnn9ymW3nteXLuKu2tT+
	 GDdzE9lnzZD0Xtjp1K0VrMrVo3xMPgIyPB0o0SzZWgIuzIO2O+KFlr9OxeCuvLRLvZ
	 1oT1x3Bc1s+Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B39C60BC7;
	Sat, 13 Dec 2025 15:17:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CA16E7
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D0C380EA8
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aj_6AcJPKMl for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 15:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7248D80D30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7248D80D30
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7248D80D30
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:17:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id URNEvWlslwf0DURNEvzJka; Sat, 13 Dec 2025 16:17:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Dec 2025 16:17:30 +0100
Message-ID: <20251213151730.821513-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
References: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKZcuaO3jkyCyUXqTErCXCDe4wtA8/gxUYGbeRdXU9cveuXJyrLu/gcqQhEdfmO1EXYEwf6H4qqTRjgxo8DxaJWD6Xld6tJHXeUgD2vW6ukPbHcX8Yf0
 OtmlVUCVuvpfcpOcSUjQEzMlzeqUm3evrOCfM/ym6xSDAVmi/7oaPLZ0BPcfl1wkDA1S8nUMKIo7FUhWnREQ/fMnWqUVUyXTP9E+wIdyGpJFQg5DGGlo0ByZ
 qg0WA5aZeELp2nTUfnAwcT4Ljv4XzmblIGcYwrQKiUkO9oGyXdlZifQIzRhe+N+3dmSF7NZcF+q4maGdfPJIuQ1Zqe6EK1nBf9z/nz1kYpsEOE9wyg5xI+jp
 dD9hyZah
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765639052; bh=33EDITAQJRpQ7taV20Pv8vbgA7EE0xUVDFlU+e+84Jo=;
 h=From:To:Subject:Date:MIME-Version;
 b=BIW5XRs+GkWSRcLiNrpWmaX9TuuJGPozd44ySRrfAszbQBa/7AIn6UK3vcG3a5b03
 gf2bEKhBiRILG60+t2HtKTN5rudmjvXw1InBxSR13xy5WlQI4k6mHJUa8P/oD6G3SA
 afDFR99KQA9YulmcREI8Odkf2rLGlQ7VueKNs9M2alfOluWLRLTgCkE8BqsprZbj2K
 Dlv9F1Riwh2UbSTxh56j9IxEevt7tJqS9CEX6wJ653+52GZYmuEXpKXDlilUWzCzHp
 ToxMQFehQcZgl8MZPAoJ1w0R4xd6yjFtYHAnHYCvepAoC+ggxDQcXoibtiCx6JkDZx
 F341R9SHdEdKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BIW5XRs+
Subject: [Buildroot] [PATCH v2 2/2] pacakge/nfs-utils: fix build failure due
 to missing BR2_PACKAGE_LIBTIRPC_DB
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

Pacakge nfs-utils requires libtirpc rpcdb option, so let's select it by
default.

Fixes:
https://autobuild.buildroot.org/results/29adf2d04cf4c46e492af95edaa96983985d6b57/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* no changes
---
 package/nfs-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 02cc7e78cc..3e13bf87a9 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
+	select BR2_PACKAGE_LIBTIRPC_DB
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
