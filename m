Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAE8EDEBEB
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7544F8303C;
	Tue,  3 Mar 2026 20:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRIOqAzk5Pkg; Tue,  3 Mar 2026 20:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E615580F62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568210;
	bh=s+wIFR5hGVmMBPQwRuznekK7ivnUMa+bdLmiLsbemTg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oFeXGKPKzuiPlC8kxN2mDs32wlwTQ6nmkAkkeF/5bJjznsz5oiM8sBpkK5HqJY19y
	 ILb/MIBJ4yQhT9JQb4222NC54vyPYgMUBiNw4AovS2ZZ0pikXEYV7HDYe1Y0pF6InR
	 hFGOYl/jLWhLg0f2Zpsij4BZEFmeOs7O7wQb/xBBLVqLSQbfkQ/ip6/4N3MgFVKIak
	 sxT8mYvdgyEd0xxlrXX6c2Qlle60IMc5jEpomOp4xx5tWylKjFKOWlGBC73o6MY+Z3
	 0W1Y3Ybu1whLKshT4For9oeZPoeDbWLW21tZgp1ZiNIawS9gNI9ZmXUQd+DDVoKyLm
	 SqJL1wWXw5E5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E615580F62;
	Tue,  3 Mar 2026 20:03:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F1141EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50CA64082C
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSmmiBocxTnF for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4572F40829
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4572F40829
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4572F40829
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 022C2A4C3428;
 Tue,  3 Mar 2026 21:01:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvL-000000003gI-29TY;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:42 +0100
Message-ID: <20260303200054.784253-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568063;
 bh=BKRqNKbUs1+t05q1DsBZYgTES1NEKoZw7EAa17m1Xfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LQ1vGzcbHIMFEn2BLQh57cqJADoRA8kgxoWv505e5HCTnYpEUBVWIB28OFwMuwuIz
 2jnuMaUysIR4O7/GoqtAIjP7By7OykaQFspAdqpdBTJF9IL27F+1XegGZfZVpqg85w
 8WQ+gvwExDV99ObODa2mQuKFthTy+esRFsmCkum9+5KPpn/Beq4D6kydvX02k8nVLP
 w91sHWZ89khLCKj+dUQNhsQuR8veXb0Py6ZKlY5q62i95fUXI365BObKK6fx5o/NUs
 qFYZ8KPO93giAutt/lZbJR9C3VHuBbFmV2/AlpwfUzZWw/DbjLHaU5+ZQDJHz53IvT
 lR49elewxykpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LQ1vGzcb
Subject: [Buildroot] [PATCH/next 03/14] package/foot: bump version to 1.26.0
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://codeberg.org/dnkl/foot/src/tag/1.26.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/foot/foot.hash | 2 +-
 package/foot/foot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index fe058c05be..a95da3e6b8 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6fb18d482e2ac6a1d8ec293bbdd144e4f7f3bbd0302e9a8b60141cdb02b1aa6f  foot-1.24.0-git4.tar.gz
+sha256  043fc0d4ad609c1585837e0341dc2127f4077000589dea6a32aa8ab069946862  foot-1.26.0-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index 055adf8bce..3e37d41557 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FOOT_VERSION = 1.24.0
+FOOT_VERSION = 1.26.0
 FOOT_SITE = https://codeberg.org/dnkl/foot.git
 FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
