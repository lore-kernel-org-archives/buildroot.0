Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0DBEF06E8
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 14:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9393607F8;
	Sun,  8 Feb 2026 14:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yPXKq-_Okkz; Sun,  8 Feb 2026 14:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FAF6607E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770561389;
	bh=TWLiUfGcMzuoyAr5FC5BiJT6l8dqWGD5ucQ/OFejR84=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q8MFX5E48rCGlxOuoAHDOPxvEx29BArF+C3JUZS/H1Eydz+TQZDeCiz4AI8Q178uo
	 T5Ov/VpWnccawqF2fYe8/vH3lSIoMcYHSXv/jGzWBtwRHVbRHeZQZlZ+hcflpTZm23
	 fG59fa1myVx4Md5FzJXi0zqwXO/9cf/MenGKhxnaG6vCOc5fgBZIytMXWloEu3Ou1J
	 IUenpymPx7MlMijj1QAgxlyoLPZ3P0LyuQMnpYnNnzbzmNlQEPDzvkaBauhKXoLqpt
	 CpizmqhBz/CzSg3ewJbxZcUZLSmeHXJUgsaeFEEzmtsfeTRpflLoAUdhxC7Y5dF+Ir
	 s33IiL4Pp/ZDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FAF6607E7;
	Sun,  8 Feb 2026 14:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51A8B1A9
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E01821F7
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgvYFcses80R for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 14:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DD5381EC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DD5381EC9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DD5381EC9
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:26 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 568BD19F5C3;
 Sun,  8 Feb 2026 15:36:20 +0100 (CET)
To: buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun,  8 Feb 2026 15:36:00 +0100
Message-ID: <20260208143604.1477756-2-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208143604.1477756-1-ju.o@free.fr>
References: <20260208143604.1477756-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770561385;
 bh=JUm21eUDRZW6Wod0mEvLGG1M3J19Jb121z1lwkqVAL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z1IDFniaF9xdHZmXUU2PQ2rWdLZOvI/PlP8K0NVubQYfrQucTl/WDWF0j+aVtnJvZ
 YNkRxcBsLZKRSiCRU+rBXi5b7KJm8FauIih8cCIfaxgrXYm81iNBZWrMleOnIaWQ1Z
 0Q4aMKVkgVWSzWw0HGCifDJsRhiR2oLWVT7/7ZKnm+dZi5CH+jNOcham9VdKjd96Yh
 3jONBcEBn1+AaSFPPLoByUzIFVFU0If+q2NF37DYouqdQAUdQd13wd0WLxa/x+Tn8V
 I1NDg91g9hNaKqG1IKp/WDFmCuyIOPYYkyIsMIF+JMbraDdWMGh9AcnaCGQ1c8lZna
 uPaKWWiStllQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z1IDFnia
Subject: [Buildroot] [PATCH RFC 1/5] arch/Config.in.x86: increase x86
 default CPU from i586 to i686
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.x86 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index f9b32130b2..548bef9226 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -35,7 +35,7 @@ config BR2_X86_CPU_HAS_AVX512
 # https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
 choice
 	prompt "Target Architecture Variant"
-	default BR2_x86_i586 if BR2_i386
+	default BR2_x86_i686 if BR2_i386
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  Specific CPU variant to use
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
