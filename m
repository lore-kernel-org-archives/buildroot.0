Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D78C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F152B8210B;
	Tue,  8 Aug 2023 18:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F152B8210B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndOCOC8UVTXo; Tue,  8 Aug 2023 18:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD3E820F8;
	Tue,  8 Aug 2023 18:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD3E820F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC8FC1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7998582055
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7998582055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8ZwmX5EBDQm for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:52:01 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 718978208A
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 718978208A
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2FE6EA4C10ED;
 Tue,  8 Aug 2023 20:51:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnQ-0005AS-1Y;
 Tue, 08 Aug 2023 20:51:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:50:54 +0200
Message-Id: <20230808185108.3787835-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520669;
 bh=g+dGJxdu+mAijCbjqvNf1JquKNPu01koxG+NNJiAGlo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yYiImry1AMooOfr2JBG5HO1xY3+JLTsmH72BgMB5t/CECWzb4KymJUFw58pnx1Tti
 PsxLwRKAu8ZKqWhnWSuEAjsWPhXKK72Epiji8MYfnq+kPdFes2p8scKYXXT2y5OeLB
 PxjyuKJ4pPXLEvOiuU5GrBArZigtVrNZwehUcTTc7gbrzwYrgHRG8Z/mhrtG2ZGpU9
 GfY3M1zHr9tWAviynNg9dGT3uV6iwTXahfYkL9V/sIXu04w/5DoJBUSGAFlGBa44gq
 26cl2/D/BEz8WqZJ56vKgIaLbk6ug+cJn8GPe0aqN2QcbL3eykWxGVvU+Q0e0AmzWN
 IPFnIJ8vFH3dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=yYiImry1
Subject: [Buildroot] [PATCH/next 02/16] package/python3: berkeleydb support
 needs the dbm interface
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Berkeley DB support in python depends on dbm, when missing python fails
to detect libdb:
https://github.com/python/cpython/blob/d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4002

quoting configure log:
checking for libdb... no

quoting python config.log:
conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'

With this patch berkeleydb produces a working module:

output/build/python3-3.11.4$ find -iname *dbm*.so
./build/lib.linux-x86_64-3.11/_dbm.cpython-311-x86_64-linux-gnu.so

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 761c38c850..38f0580aa4 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_PYTHON3_2TO3
 config BR2_PACKAGE_PYTHON3_BERKELEYDB
 	bool "berkeleydb"
 	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_BERKELEYDB_DBM
 	help
 	  berkeleydb module for Python3
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
