Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C05FFC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 13:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B9760AE6;
	Sat,  3 Jan 2026 13:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28WWxBxvcte9; Sat,  3 Jan 2026 13:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDF2760A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767446795;
	bh=P/PMAsvprAtk2s2Wj/kudjcJhU3zH+9MP2mq7FeUpuM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eD3BEPNZ3NwGAaha2d4lLbT8aL/MEupH9bfFeuu1/7spsc813MUgtHIDkq+K4Spym
	 gDoE5jK/7+ZJBP/f6Q9WBE5SSrN1/jdl0mM2ussC/WNkHebXSB4iB3/H//HVeoMQ0Y
	 maYdAEBgnyct4Mg00lu3OOFMaIKGvJ2v4vrAkliTVUZ+LmG7KOMD4Gq0blSRZU345Q
	 auA043JKVv27D9rCTecgFGdCkxVnDwu0bYnlsZJ2tD+JOsrlR/kb6hvLoiOK3jYOH+
	 H9aczyVUmzhepjg8uc8KmyhouEkMZc7ndnwAypf90SPpLvz5kZCvpmy/SMJ0dmYfYS
	 6H6+s1t8HY0pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDF2760A95;
	Sat,  3 Jan 2026 13:26:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4DE351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 620606075B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nNgsqhGhxHB for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 13:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30ACD60A95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30ACD60A95
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30ACD60A95
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26CE7A4C32DB;
 Sat,  3 Jan 2026 14:25:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc1dh-000000000rJ-3BKS;
 Sat, 03 Jan 2026 13:25:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Jan 2026 14:25:49 +0100
Message-ID: <20260103132552.3979708-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103132552.3979708-1-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767446754;
 bh=bbPB3ogJ6OwZDXCjFa6EcvTF9izrZRVLd45fwBmL5Jg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hwAwP5ba6/4aEhsbcrzFovHKoYfMudbZErPzBhCiFg3Giy2gRMbLqwWvAxWq2aaa8
 Su2OzwsnhyqJIqMLLTWP9Z3T3xVYRALpjvYY2Q23J4joye7m4Y8Mj2VGf5egbAz8kR
 MPG7LKuPmtG3OlJNjA9cTMs9crAJm5HGJH2MU5gjW0e8Vl7Sc2sF5y1i6Jk47Tdf07
 wZejHGm+W773+nDuBAXUGVC+ocJQpaqlsk8cc7yxen5T7y+p4SF4WZAPRqkDNdt82B
 fXiFQwPr2lKhmG+d6fScvx3cECLl7G/XmHGxgsVyjkeLdgs75hWFjFCzAEQ2BO6ulR
 My7txnhrvqfqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hwAwP5ba
Subject: [Buildroot] [PATCH v4 2/5] package/nfs-utils: fix build failure due
 to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

Package nfs-utils requires libtirpc rpcdb option enabled. Package
libtirpc with commit [1] disabled rpcdb functions by default so let's
select it by default to enable rpcdb functions required.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.org/results/29adf2d04cf4c46e492af95edaa96983985d6b57/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
[Bernd: enable BR2_PACKAGE_LIBTIRPC_RPCDB only for non-glibc toolchains]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nfs-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 02cc7e78cc..89b8b5da42 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
