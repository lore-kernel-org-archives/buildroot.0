Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CEDE668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 16:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D75381754;
	Sat, 20 Dec 2025 16:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVyZGCbEdeIf; Sat, 20 Dec 2025 16:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E96A81786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766249420;
	bh=TpfZLorX5fLmW061n76zfcR5vIzrHu/igll8OzW/4e4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+iancLIbote4BZtaUZJgA4y9uX1XV5znqwYcR180xE2csrqKjTrLAP876565hr18
	 c+FjCYwswoAs9/O2dkJuctyQf9KEYGx2M5GUr35kWhtU6Rx5bVxCo3ePYB6cTbmSuQ
	 9cU/cOltTyRa+cj+34xWY/kVzhEuXwHoCmejHNEifCnmLiFh6mi1h/HPECes3i+ljX
	 MS6JwGZK/0F8Gnj+TIsP8Mr5ZjWj8tGjvVKshxIiMxUPT2BB0Vh3E0Z84vgG0ix+kT
	 eXq6dnLuwoPuagpTidsKdVt4XmpE0DjnUT8d2445Pkk92r6CajzpBSZ9kiSUxzhlvb
	 3RUiawqiuctRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E96A81786;
	Sat, 20 Dec 2025 16:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A46119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 978AE4091B
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeJR_CvlcIp4 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 16:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FE154091A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE154091A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FE154091A
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:50:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC31CA4C44EB
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:50:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40438)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX09Z-000000001TT-2jhJ
 for buildroot@buildroot.org; Sat, 20 Dec 2025 16:50:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 17:50:01 +0100
Message-ID: <20251220165001.128775-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220165001.128775-1-bernd@kuhls.net>
References: <20251220165001.128775-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766249401;
 bh=jBnwNcI2PK+I8HxPjoxUfN9y00QxKvabZRRFafWFrF0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=vDu3dlbkzXnk7Cruj7zvMYSmol4dEfaJILkG82XF7gYpDlGAoE5+9KJ6bY6vv5aMC
 eAD066Pj0xDH1RZDalZpPI4IDm40V6DaQ00M2uH3UySAWLmRukDYfRzYZz1LIAdsAg
 BFYo1hu2vQkWu6uCxnKWTYFmtGJITMYOZ+t5jE9gq06Jcbtx7OrgQydfnE8Zhz/mMM
 nxqV9KUJfreXkLaY1NgxH66Za1nezR0RFCFeIbm6E+vzX+FI9DbMIeg58fxh5MG+FH
 K5KKpIWFARx98MRvBbArwhRaVZ3o9kjXti2ip5LkdWc0Rt4tL1kupBFDalwiR6TRCv
 RxnYsLTgIopVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vDu3dlbk
Subject: [Buildroot] [PATCH 2/2] package/intel-gmmlib: bump version to 22.9.0
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

https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.9.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index aef463783c..76263f950f 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e43e538a002574f45d480a24e02297c960963dc7914b7328791d9836832ff43  intel-gmmlib-22.8.2.tar.gz
+sha256  6ae262b95540681ad5478c63affb880135f772c95410b092009a6f7dfc04a5ba  intel-gmmlib-22.9.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 92569a106e..1e263c3add 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.8.2
+INTEL_GMMLIB_VERSION = 22.9.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
