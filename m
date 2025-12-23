Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CABE6F086
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 20:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C5B660E7A;
	Tue, 23 Dec 2025 20:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdZaEkNrDebO; Tue, 23 Dec 2025 20:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6303860E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766521356;
	bh=+P3edJoAqpTPtpA1cfpTyc8ig5HoAk4tKIwNC6adfXg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDdMChe/7R/yTqSsmR/oBhW+m/MJ5hQCBdkVlf9IMLwgDQY1NPReRw69LCgYm2LoO
	 25VPc6NSZO67lTWK+d96HXwQY1I6gBpBZoI7m8HbSUEILSwtbtQaduPvWukiulQfpH
	 vtu8sK00InakVVpp4jWvl2EpAISP90W++wYkf7U1EoyvTiGRJxJk74IS4MG02rIKa2
	 dA7ViyKKoK9Lt0Qa+x0DUBpj+0jlhEgS9oUYIAR5pZ1MadZU/9B7OSOK9opNkaYMiC
	 wPIA/aDGQ8QTqesBVk+itiNOg56pD1vAnsjWkvSE1N3qDDtQH3HibWFpUefqb6vbuW
	 YQX2CXHy/4/3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6303860E76;
	Tue, 23 Dec 2025 20:22:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18455119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09EF160E76
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJPU_uCcOpfd for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 20:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5E5360BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5E5360BC6
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5E5360BC6
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:22:33 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Y8tqvue6cfibdY8trvUMLb; Tue, 23 Dec 2025 21:22:31 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 23 Dec 2025 21:22:29 +0100
Message-ID: <20251223202230.3132006-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223202230.3132006-1-giulio.benetti@benettiengineering.com>
References: <20251223202230.3132006-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAi5qQ+kBa5XRj9q8Fji4N0wyOlYqSOFSYNRg54WUKwRc40FN+dFWuXF2TasrzwH1bstUH9e1XF7HyTG3rYjA7yCsRupqvy8mZlbK4PKiCYcTj4o8TTc
 W2WLF2kkjTjqkpFDnG4A+tkFndZ8VIlnJRpyooURIOG2OAwo+5WaTIC1MgZHprd/Bnzz6SBp5DEkMq0pSDgmR+UckZ3xMm5ymZ1tWqnwRKi7s795PCJ8Opi9
 VvaldDQCLiKbGiM1Ag1zUcAwCsAWw0I/WC9AsiSqU/E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766521351; bh=GU/iejlNYh34oZBeAI4lq+EOEDtqw5VDNTaQq1Cmews=;
 h=From:To:Subject:Date:MIME-Version;
 b=jxYKHrP7UF6oKRuQ9iIkpCAT1DeeNYu9kIsQp7E+ifgH6YIqkAdMhrBNskJKdVOLu
 SU8uNNKwgRlz4BW34eywu+6dZ4Cw9oRHXMrlJQGzQC9mwJft1DRlOwCk8HMHVR2BSG
 J4iyHF4ANMQ34nMt1dUKqPmfxTVIIobReGgZcQR0Nzb95q9krNB8t/6eG57QE+OF9q
 G5GAZ+TWs0fKvdeXx0lt8KmR4bc1bynj79sSFZVqKlHSOw2FpmR5D1xeAVTAdvcTb2
 ds6BX9kPmA5NH5sah44uupBAV6LGBrkTS1kLzOhQm4UwBGuSrHxcEx3i0W6gLJ6HGU
 yT4TZ/cXIulsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jxYKHrP7
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti for package
 zlib-ng
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f289f81229..224c0fda73 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1335,6 +1335,7 @@ F:	package/swupdate/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/wilc-driver/
+F:	package/zlib-ng/
 F:	toolchain/
 
 N:	Graeme Smecher <gsmecher@threespeedlogic.com>
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
