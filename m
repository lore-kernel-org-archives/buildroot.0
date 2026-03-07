Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9358F55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 18:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5697183FDD;
	Sat,  7 Mar 2026 18:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URqfEJS6FP_c; Sat,  7 Mar 2026 18:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D69D283F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772906857;
	bh=JkSyHtwMjwJPXqTsrNEoBpIgCD/PiUOw3DkC1g/P02s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=rJNPbG1B7ww5X3H2At5mz7UVU87gZr6Jh0OO+YfMMDY5Y82W/2mCUNHkgCIHyNHV8
	 fygyh1LaniqVXHarTX1W349EhTNc+TPRvMNc0YN265GZZcZ56+4y2PXD/fp1fHc0a0
	 vGCZfGEkms+IDFiL1YM4nOn5jxXLsu66wMehKCgiWJAQn5q/gW6X8bhNOm7XmQcLLm
	 DoMjqXCoIQKAAZigAY3cWpxjW+Z1YCtS16kTtww0VjhK4GijvQiMF8h73jwToGDLFH
	 +gzAGLiyFAk9XZuhJQxsOPpTUjWHRHLg56kRbCmYSpETIVPBUHvd/7VRSbps2dp8qI
	 WVulZfSFsNR9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D69D283F3A;
	Sat,  7 Mar 2026 18:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B57125B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CECF406FA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIEZHi7437al for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 18:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCF4C406F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCF4C406F1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCF4C406F1
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4436119F576;
 Sat,  7 Mar 2026 19:07:26 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 19:07:07 +0100
Message-ID: <20260307180711.1025866-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772906851;
 bh=szPnAFtT6e3ap0odDbFXigYLLJqOJIzUmBELeixHmdQ=;
 h=From:To:Cc:Subject:Date:From;
 b=QTISneo7qS6QbfsGRN38A53tIVzTDb7w34QrUm2BVh05mYMu849w4rE4oGcZA3LWn
 hnLbt/Dnx3txjxGQDK064syq+02qadFzFpTMzl1fVO5TzSbgphL5N/VdR9ByxrfLC4
 Cc4/ATS8sEDMnJGDDhRLK83Q7Ekc3Kd5+zR+E+fKXSpY1N0vqmOcDAw5RdQvOMZ4H4
 uSomEhyXgqYI67KFV+lZn50KPvuL89yAWgzKUC0go4RnLHL3+6/jiuQsX6adih/+eJ
 fJDQlbyqSFfQm1wbkZiBtn2X/+/szJrwBpDTsK6cK8fliPgWpTzNL4hCaxV67WIQHX
 pILoIib29NEQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QTISneo7
Subject: [Buildroot] [PATCH RFC v2 1/5] arch/Config.in.x86: increase x86
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
Cc: Julien Olivain <ju.o@free.fr>, Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2: no change.
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
