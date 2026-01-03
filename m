Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C1AFC6182
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 20:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5E70404D0;
	Sat,  3 Jan 2026 20:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfT5hDW54sgH; Sat,  3 Jan 2026 20:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC8074057D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767470561;
	bh=dNo72iW2lCD4ZeZ2+varIq0MHoQcZUwKbrvAoDKzPdM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=YXVNU7KvKs8Vu3nLAiq6cxIj8JynknGKukFrjozcluFf++tEQVkBCT06o9zSAgD9x
	 SWAZDoDikQI6QBIDqK55jHr/3yWgqljFuaroKVOy+NGeVAlaKgiUAsqmFzJFuYeVtA
	 XEHAitxsYyX81O0jVNJ/fEjWuCzHGXy0AgfkvQqJ7JsshsncdeUCoRwwaAnbtyTBz6
	 6/U3vpOf3ODxlib4ceZStzklQsIf2Gxdlq1oWk7LBZs0ZjcK0khDU5TMJugr5lyYQ4
	 NwVLvlca/ikP/jPCsqnGKybFelhVyvCCtyoaJMr6/nYJ1YgYICCiRRFxMgITdMJcK6
	 6uDFmRL484nSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC8074057D;
	Sat,  3 Jan 2026 20:02:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D799F249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDF6D4057D
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 20:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJIsHs5IaNQw for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 20:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B15D4404D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B15D4404D0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B15D4404D0
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 20:02:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 196EF19F5A5;
 Sat,  3 Jan 2026 21:02:34 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat,  3 Jan 2026 21:02:29 +0100
Message-ID: <20260103200229.246015-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767470555;
 bh=QUw7VY4qrxcT6vadPnKbqX/nRCyInp6Lj17f7qOXhnA=;
 h=From:To:Cc:Subject:Date:From;
 b=Pyd/1NmFz0tbLzjZWZCLGYqQkC73Mz9SX31yv3MXSDZR/W3l3WbiYrrw3YIADNFy3
 lY8bmHVh77VwEhLNRYLLkwwIP8EZNb/BsCO4Waedfw4cr6yMQxsiVEi9ximHPxRpFE
 J6EbE+yTWS4tZFP8SGVt/LymMcWTVFJMABtRTZ08CV30YH0l1ctZSN7twsrQmuAe/Y
 +8+Nz2JwatpeWM4nYAabz51CCcR4z5NANG5ljOEnMl7JQt3f0D92dUr+fAIorfxnoO
 koL105SXffYSC+lHoqaZtFg28eflQwqmbTR3JSiuHrOgw3LmAx//3ImhUOpqRrwYyF
 4cSA5edcXLa9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Pyd/1NmF
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.4.9
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

For release note, see:
https://dev.gnupg.org/T8001

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12595598071
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 01060f897b..ee37e6a3af 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  c704085aa7cc131a67edd0b7c0c90e5c35ee4adb  gnupg-2.4.8.tar.bz2
-sha256  b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616  gnupg-2.4.8.tar.bz2
+sha1  d4b76a8de78631b64b8c6f3725ed28dede40bdb4  gnupg-2.4.9.tar.bz2
+sha256  dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964  gnupg-2.4.9.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index debf15ef63..d083ea850a 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.8
+GNUPG2_VERSION = 2.4.9
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
