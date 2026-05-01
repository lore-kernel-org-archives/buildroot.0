Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88F8CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D9942936;
	Fri,  1 May 2026 12:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bp6rb3PUFmIW; Fri,  1 May 2026 12:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64DA6428FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639382;
	bh=MBChWTNnXb+CEv9BpvNzHTwJlqKghsqIAeDa+brW0ro=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jdqS7wfotXb1HJmFtm2Vs9aM2gXbQEF1IA9JB+Z5gdPCcShrzxUPTiiyp94/ni8N4
	 tMLylhiHDlnBZuF+wuEBxgd6K2jQKkM3sE7xk628mRqkNgDuhT0MHYtMyOxncQNPGi
	 AdwYfgU87ld6kENy1WdVuE9RdQOHwTthhtMqofwW1H5h97rTcOqnChxcEGK5UHPDfx
	 cPXpmYUL6wdF+b+pcwAg4FGEGDpIFji3oyTzFN0Es9GOmvpq3a8m6lijYzBbYdcVJL
	 u7DKz1Xs6Y+D3cM1bQ2zAmB6OmVd5Yt0F0tFL9dMGHKpu1mIppEBk/ITWBo59Q23hP
	 zNrb6r2cUUtvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64DA6428FD;
	Fri,  1 May 2026 12:43:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA6E293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D57852E5
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Imze7xXE98xe for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:43:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CAA6852E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CAA6852E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CAA6852E4
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:43:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7FDE9A4C2F20;
 Fri,  1 May 2026 14:31:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1O-000000008NC-01PQ;
 Fri, 01 May 2026 12:31:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:46 +0200
Message-ID: <20260501123100.1918951-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638669;
 bh=a1NEgThm7VTVzS3iYG17Gp2yxsSYYrzhE2VwS4Wvj7o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=L7pOnoH88RdEtC23IBtWc2LpblMECgYRP2AvRKEmZfK/MZFC4Wso4wx+P5trUnjob
 VNTZUlFVjI1SvHbKZsIjPl84V0Swrdkk1N1BaqC6GSSeWWHcC6snkCFZ/ceB0Hx0JE
 udF3t0DO2t7hxV+izUbhipbPR1W01JdHpeRSC7HT4cZlIEgJhj/RbMNcFCIRH9Y5dw
 un8Js+78GgAfHthxeI53l+Vz8PwNMza4/kivcOQjjt8ac0ZRdbM+sK0QZX4cgdN73W
 XqGpkjOY0QeuSLbcKsvboieO0GK64jWfQkay7cI9r4UGwaadNGHl/xFYh/gv6LQCJS
 Uf3HU7I31fZKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=L7pOnoH8
Subject: [Buildroot] [PATCH 61/75] package/python-telnetlib3: bump version
 to 4.0.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jquast/telnetlib3/blob/4.0.2/docs/history.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-telnetlib3/python-telnetlib3.hash | 4 ++--
 package/python-telnetlib3/python-telnetlib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index 889a7aa428..14c52634f5 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  468f4d8cd3571065d093d9abcf8b8f39  telnetlib3-4.0.1.tar.gz
-sha256  819aa9dae793d66e9fef5524ce838eabc4723589b0f81c72fccd3f2448cbc2fb  telnetlib3-4.0.1.tar.gz
+md5  c72d70acb65fba264c7f1a8ed68d4e07  telnetlib3-4.0.2.tar.gz
+sha256  76726d7a7a34163b5dbef461e9cbf8fb4bda8f4fe7fcb225f56cbb4dcf5fd16e  telnetlib3-4.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  23bf24a5fe7cbfc70b962da94334649cf60a3b309834c72eb053d91d8caf60cb  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index 8d47ca44d4..7b29e7b13e 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 4.0.1
+PYTHON_TELNETLIB3_VERSION = 4.0.2
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/5d/57/42acb7ce2c1b3d88ab28d6b1de41a08fdd5180d262d728fd10071950566b
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/2c/1f/a5de9f0f86976d299a439619417019a9674fa8662377659734dd6e067235
 PYTHON_TELNETLIB3_SETUP_TYPE = hatch
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
