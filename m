Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC124CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 20:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D3E96064E;
	Sat,  3 Oct 2026 20:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwDj980p-wrk; Sat,  3 Oct 2026 20:54:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8B3C2606B0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791060856;
	b=H4KBV7bAmHxeCIVQcHUIpLokJMXPhh5gMEXEGO2x6Svya+IXK1vIcgacXEzuMYkMtSs1
	 +naorvp9GbANmNGkl0mIcyvziBN8JQCadLY8F6yjVHTCYC9FoUfrldbuhecdWM9wVqrs5
	 kNUxnY+MMyi6ljcVroSqxssqNYkUpzcTST9ut5FWSgGWGdNVHzD9OTVD8KWc3ZpRLq7r4
	 z9IOkkqqJiDCs7FvN1a4S18/toiaRxF6Z9yYpK2Em+o6L1iv7QwYLtLCZXBYJt7iORuu1
	 gRS/+gNCzFRZR8p8z4nQW+jdmvq/izw/7vXIVD8U1RK7i+okDkaUIlamoh4cssyUJ3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791060856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PRbI5QyO7GYIjB5K0Mnd9SDH985UyWiqo3Xw7lgMdAo=;
	b=kGZF+hckjdnKldzQaKVvw6IaBr3MDPjtog5A+IGH9vBheSqrIY4IO/pKUluA1BmOuwk7
	 Z/rrTHdJ90GwGBkJDILHVfViA2Bn1wnmtyA61z2D0uVFc/UCDBpmtBcv6enAY7gErNa7C
	 7+Oq82+pTOxcOn9YOeKHvhgaRDy085O4M00HeVmzzrfIgB6F1lgSc4dpXMFq8BDK1+zbd
	 3gC9TFJUXPtBRFbfiy1wG/pkN5j6zQQf/kALBahxqZYf2bPK/SovkFm0WKwFr8WljsuFy
	 O5SqFsMNbTbRdPqSAAZod6h6I6J8PpJttV0D5GCWLGjlqpxKSuQhu27oYcKM7wP1fNg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791060856;
	bh=PRbI5QyO7GYIjB5K0Mnd9SDH985UyWiqo3Xw7lgMdAo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cly75EhkLH4cxoD2cX56eIpV8tApC6FigvqaSsuOy+iJPS3IWhupIvq6sJIvj3P+/
	 2ME82UxTZ8eNDUuq6V74Og0q/xSe1mJM0PmBV3Bul1yMknxUjsyO9g3/ZxCi9yQYSi
	 xsVdcwzjN2lt0DxNUURVgIjBZJr2/liErhD8z1G4Tf0C/+WsAeM6K8G8++AdhPXREN
	 qxAAqqulmaCP03hri/4NlXDMnKVZ/YZ8fAU9co8Fi+NpzYhbwyF/zHub+saADGG1pc
	 G0AD3ir8EHB7B4OaOvCvtYr5XznAV9Udm8cYY+j32TgYEl4o+C1cfq8/7mBASV1CpJ
	 JF/H6oFJcDdDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B3C2606B0;
	Sat,  3 Oct 2026 20:54:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B412E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72F7A81421
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUBdJJ541vBm for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 20:54:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D24748141F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791060854;
 b=V7Djx0DtOMR5o4S2GE3SWxKDeweswBhyMhalh8ETuf6RuQTiJ7s4Srs+d1uyPH5NgUlK
 E7Z+9dOP0kGMJBCaWBQrIMQUPV/TjCHzG4NKNbPHdMYrToDIjiQW86jaD5/qfBAqe6SQ1
 yAP/Uh3qgMF0+nSOEz/3HK3ne1nTqjBWB0zQ+7oVs6gGqtnPpSPQFMJUbWs3B2IZ8GnWZ
 DgmRard4cDwAfD9mPqkxUUW+y9BFc/4d9ZPK8YfdGLsKY4QPR9fGSRV0NCNfPEMpyfB+J
 3ZqvI0I7v/CXMv+NWriuMQVFbgL2tNpj61vmkN65l3vbHGVdMwDz5pYUNlk4iE2Aa5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791060854;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=BLDoI7/+yu9bOGnfoJLFahwuv6lRoi2jcxOPK3grtiM=;
 b=XaB3BmG4MTW4CD7cutlVKWrL911nb8UwALk95JTmyqx4G1nVjSVNdBvrD9PYq+BdPYIv
 svk32GhYVtXXF8a0DTvW3lyir7tVGrrSSAffdvyXRiGwuFVB5JAt8JS3cgcJX4fxLVh/r
 keuOSKlaCMQPYNmmiKbU844ZH3mm0aD27IdrXjTOzMkOfohM8LPi6EvGiB/CpGbX2jZ7A
 WzlJCt8s6NdHP5cXd6MrH4vcb2I8xTNMH++2Hw5Ea9/Fc9dvCyaeikfI5eGq/tS7wwir5
 OoBJl05g9DuUV5ToOP4e18NRnL+tLkjEw9nnvW9f5BSUNwxsiL26KssbofW2GhqW8rA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Qv5kUpkm; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D24748141F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:54:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.160.0.144])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B6E39B0053D;
 Sat,  3 Oct 2026 22:54:09 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Date: Sat,  3 Oct 2026 22:54:02 +0200
Message-ID: <20261003205402.2056139-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qoriq-ddr-phy-binary: bump version to
 lf-6.18.37-2.1.0
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No change: the firmware files are identical to lf-6.18.20-2.0.0, only
the release tag moved.

Changelog:
https://github.com/nxp-qoriq/ddr-phy-binary/compare/lf-6.18.20-2.0.0...lf-6.18.37-2.1.0

Tested with Buildroot's GitLab CI (test-pkg on all toolchains):
https://gitlab.com/vjardin/buildroot/-/pipelines/2909708419

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash | 2 +-
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
index 94f9c999c5..45055eabc1 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4faeb92a1c63d99cdc18994beddc5916f2ac5cd853466fbc2557693bc371bf2d  qoriq-ddr-phy-binary-lf-6.18.20-2.0.0.tar.gz
+sha256  cb3e18b85237c6beec7a3da6b09255edd57b182086649017b310d82075976aab  qoriq-ddr-phy-binary-lf-6.18.37-2.1.0.tar.gz
 sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
index 3c39b36362..46784e5175 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_DDR_PHY_BINARY_VERSION = lf-6.18.20-2.0.0
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.18.37-2.1.0
 QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
 QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
 QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
