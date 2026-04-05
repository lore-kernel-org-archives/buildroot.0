Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D5BE64019
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 11:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23A5E8124C;
	Sun,  5 Apr 2026 11:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SVcs5BDkDM3; Sun,  5 Apr 2026 11:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8E8E80F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775390262;
	bh=rO/0Zjwrc7cE9mjCvDJZGZ01oV/FpeqCMDL4DoyjpS8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RtzdN0i5p+Fsa+0bNNZQtDuxS5eFYXqFQ2yKR7uf+UAlQFvF7suPNtcEvc9rmuCEf
	 ep6P54ElIRI20O3ybRwgLzNYnC5cuJbh50R7b93pbg8Aibts4wJHsqZLNdRoHhXfCt
	 xYlLgqXDgjAGEvCp3BorhYhIDi7qiJImyXBUgPz1lDEeU7rtTQzuuRfDq89HzcDWXh
	 9obE486+LXlX82wCLC+OdffDwsIv8XVvRYeRYAjfhKpk4T1D5IeXCGR5KwPiUni0ro
	 6G73q8dhAeHlUYQ4QJHltiSu13jxsIXBLNeYT6t0zgMPOU04RG3eerAzx2ChncrPhz
	 vJJC3ldLk2jDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8E8E80F8C;
	Sun,  5 Apr 2026 11:57:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BA5A1EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DF8540389
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZBaMiiurHFz for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 11:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 472FB4005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 472FB4005B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 472FB4005B
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:57:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78E87A4C0413
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 13:57:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35286)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9M6k-000000004Zm-0lhV
 for buildroot@buildroot.org; Sun, 05 Apr 2026 11:57:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Apr 2026 13:57:38 +0200
Message-ID: <20260405115738.2469253-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775390258;
 bh=NkXx4M6+A2eirxC1h/H+cx5vbFgjeWfjW06DpdT6J2s=;
 h=From:To:Subject:Date:From;
 b=KuaNbNXNtm+liPnD8sHQxdbSGQB4+2RGQkU8gw6OZ4RPVn9FCYcZCYZGYpS64yNZW
 UA5e52jC9gO+qAdS90gi3a1IMcVkiWUuTYnMihhOgcpx0dqFYBXcbdO050QMmIHN3d
 LCa4uEEsr/2wNuVTxkjzq+euDmBCMjRKaw6yqBX9HuFLXwgmK+34stk6DXomRnFXXD
 FviUUbttcrqSl4WCnVpoLcfbNWAl4/IwJl63DMlNjFO0JyOXtUPgmi9Vds4X9BGqp1
 uQH3iagddxbciD0Ygx6UEBuWuBXUISmbUH/SNtvT+ldT8R4Tfz2pJBI2OhC5ZZXVIc
 greCaAPcVBUvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KuaNbNXN
Subject: [Buildroot] [PATCH 1/1] package/luvi: update help text
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

Buildroot commit 00317f0aff243986983650671fd220ab040af50f switched the
package from pcre to pcre2 but forgot update the Kconfig help text.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/luvi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index 19d3307f12..04163141b0 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_LUVI
 	  The luvi core can be extended with several Lua modules by
 	  adding its bundled Lua binding libraries.
 	  To get the Lua module...
-	    * 'rex' select PCRE (BR2_PACKAGE_PCRE)
+	    * 'rex' select PCRE2 (BR2_PACKAGE_PCRE2)
 	    * 'ssl' select OpenSSL (BR2_PACKAGE_OPENSSL)
 	    * 'zlib' select zlib (BR2_PACKAGE_ZLIB)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
