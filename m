Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77CDEB7EAC
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 09:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9D2D607AC;
	Wed,  4 Mar 2026 09:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xkz5gaNnK-hV; Wed,  4 Mar 2026 09:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C2A607AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772616006;
	bh=83PHNWeItkpg+zaHY2eiDoBWN+87M4qLvwgww/tCM+w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXSZE/eaRyxtpEndMY7vk/TAX7ddi/dhZjfCpcvDA5qXG4WMKeuXE3QY+/VEfmPeV
	 sf+UwIV9BlZ2FN9ElOZkdRROrPmgifeqPfdR0jiaYxWOMmjyk52tmUkTGlJyuP2Gw8
	 hNldFy0fRtdB/wE2Qm3JvolR45fkv6LHUmOFJlBxVvYLRUSROZSMXhyde/4bDx+Z5O
	 CKZQ5ZQvm5VOnsI4dHOP2hEcMg53lyFeDe0h9DpFEfvxEQiFLk7AyScSOgVZp6I5Zx
	 own4trUji0LMBhjR5Qm8c/uss189H72B9m1vGGOyNmA3EmmgxpQ2BOun7i0DmeQvP+
	 AzXFGr+T0sCbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C2A607AB;
	Wed,  4 Mar 2026 09:20:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C5EE231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E0DD408E1
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrCOn2mEpZbt for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 09:20:04 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0709D40788
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0709D40788
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0709D40788
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:20:03 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id D44EDBDE2937;
 Wed, 04 Mar 2026 10:20:00 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Wed,  4 Mar 2026 10:19:10 +0100
Message-ID: <20260304091915.1102943-2-br025@umbiko.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304091915.1102943-1-br025@umbiko.net>
References: <20260304091915.1102943-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1772616001; bh=117iHDBQWkqkzSKdaYNUYI60D5K+HCtUxi7rsZZs6d0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=labfCVf4B9ykmhrqLZqjTJnSz3L3l/8eQsw16HzegU5QcO+kgJFQm/f0UaNGvSArH
 +dieQIxBE9zhlZencbzxwWFP5bSCxutj56hHHMmT9UxuSQovl1PJqneI1iS78Q3/0C
 o2eft5f+CmE5gs4ozaJMlZ1LTma5m0BXar6A408I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=labfCVf4
Subject: [Buildroot] [PATCH 1/3] DEVELOPERS: add Andreas Ziegler to icu
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

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..b6af461dc7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -198,6 +198,7 @@ F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
+F:	package/icu/
 F:	package/mpd/
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
