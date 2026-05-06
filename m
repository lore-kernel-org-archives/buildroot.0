Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44868CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DFCB82909;
	Wed,  6 May 2026 16:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYYKNEozblnd; Wed,  6 May 2026 16:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51308828F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085326;
	bh=EMWV8C2wSx3aKxgnHA40FrmAJB2MH/p4hJCOrkPF2rU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Oofcp3W7/Oe0FO8k0yK7/pwy0ATMfpVSpvUXTBAl9Q6qX8QqrAd5rBk/e/jHBFwVB
	 DrespNXWZ1i7Fl5/W6Ixp42lXGZYVsFe1sHg8VzGVJRUadbR2ua+9eYcYFYTS1uOy9
	 xelJJAMcdpYHlQ3wUrhN5x0MBZ8rwvfj4UqnOWXsgFpBXQFnc5Q6OMPlazXjDJHXT9
	 Y5orXRHm7BugTFq+1KUu1r+T/ky19Pz1VltKY1qE3bq2z/D+vG+Kwuvpcwx+yRYZPz
	 bA1zJ3ufrAJeXW6/dhISNOW+QYvpiyP7qit17Xk8UDlqCQC25/8B4JjPfpiRUte3xr
	 S1UODEnw+Wcag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51308828F2;
	Wed,  6 May 2026 16:35:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4212C317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33E4C4062A
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sB-SnSZk94Jd for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:35:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E535403E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E535403E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E535403E9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE73BA4C20E6;
 Wed,  6 May 2026 18:31:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9y-000000002XI-2l5N;
 Wed, 06 May 2026 16:31:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:30 +0200
Message-ID: <20260506163136.1330722-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085116;
 bh=YInEGN7jDme+QbAv8Gp+YGScu3e4B0elA6ZvIbYSQLI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=s2FKS7maOltNTvcbjSHhsovxg+mRTlUZol1gvr2q5bQ0Y4JCWR4a81hsdQRBX4m3y
 6lK+GM41+5nXwEbdjFnU/PgXrUHPuFhfzH0STR8sSBm4HTX/djAqEg9BkmYFzh2CD3
 qOMWgJlv8yYw10wq3Pk18LfgaRlIuHXqf10moyaLv2n/dOAjaf3wUaEwPxvBUZuNAO
 evZ8FsWLVo52Wv9JDMjs7IyKqLQXeooO140o+VuqxdBoDnq+TPsKsl2xyAYjAQ/Kff
 thCWEw63QbepQnVfT/9oX7NTUVEqx7/MnmPapT/pFCVzDXH4U7F1X8Eh5rdiL7gMpM
 lnACNT0EseXdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=s2FKS7ma
Subject: [Buildroot] [PATCH v5 17/22] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_17
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 624b5e9d21..863a1eed34 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -344,6 +344,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
