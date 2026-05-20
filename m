Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435AECD4F3C
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 10:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B156101E;
	Wed, 20 May 2026 10:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtZ-XsfTZt6m; Wed, 20 May 2026 10:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A1C61014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779271655;
	bh=UVR7WyvAtL0jo0q9/qAx+xLpagbIiHS0INJ20o/WZ1M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=futdZDY48jkZ+wEytQfapGRYNG+YKQW0y8BSSyO29fbwHttivJI/EcMAumhpoEiwn
	 l/PADQL9gbiznfxKJIDespaTzdU+nCp6WKVFAnc57Zt+hqIYpwvv9L8p7Pi4pEGo6O
	 s4nKGl2bKDHsh5UaRQgRybIO2DQkrKY+nL58GgIyS+7qwhcu8m6jPJG4x35pYxRnWV
	 Yogew28GJFefcfpMENgK2GP1b/xZXk8RYTQ3YqulPCCdhGRVBg7daxeQPo/uOHPamZ
	 FtY4ZJK5Y+kvmWRVQPuQ7m7xvMtrMI8buw3lAkvx85++8Cb2lxs9LnyOKMqK1sXU5M
	 iIR98gFz9EqXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A1C61014;
	Wed, 20 May 2026 10:07:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 162B6265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 10:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F01CE60F2A
 for <buildroot@buildroot.org>; Wed, 20 May 2026 10:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yqSPv1dpGLY for <buildroot@buildroot.org>;
 Wed, 20 May 2026 10:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6EE961014
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6EE961014
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6EE961014
 for <buildroot@buildroot.org>; Wed, 20 May 2026 10:07:29 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id PdpnwRFnPJWrEPdpnwo8nB; Wed, 20 May 2026 12:07:27 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 20 May 2026 12:07:26 +0200
Message-ID: <20260520100726.535469-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCkGQoZdGKeFE/1fF1rFiNCcIM9qJawOMwi6kSrK4KhCMn9sYoECYGlLybteY2hDOyS4gxtmgtmW/tSIBQYVck7QXe+mgeVDlxBX1lVmLTd/pnFWOhhp
 ltP6d4Wxw429AJzy4v8oUsLzgGvh5VfK670UmpHRTVBSxlWC9gbJmOofXX2bjq/tZi73I1xo/Ple/6Ozq9j4k5Kxjt0IdgW+mN+3AGpyo1OhOELJOzHhrbSW
 jotHt3FcSc1JN9aXYiwB1hKb+t9HI/igs8TMuka9dwY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1779271647; bh=cpPGhwHh00HLkOj0dlWuiu3qv5vhAr6SaTnQVwQ733g=;
 h=From:To:Subject:Date:MIME-Version;
 b=DfXu2pdAz5kPip3Q7avwRIFCsPtQNIp6B7JwiY+UlhsDcAEszBWoSLQTnx5GngU9D
 r9MqpxQzNgx4mkduNO+4CuFS0Otj7rvlfIwQffmJ+siDRT0GbkP9t7RwSxZcAawcFZ
 /rcGIK8o/+NfcHPTv+x5dMA7G05yrHjWz2dDTNVTGG/J/rsVTBbPMk6A6FMcjig6Rq
 rLo3ukaUz05PgBnQu6R+vbn2vKJWx2Mo8ZG16dTUJ2oE1CbviF1b6ROHsCQiSKgvgZ
 Mtb3p027kfiBwgZmKCJosnyiJs4PfAH3xLVmzfnx4LZEaYJME1IEYN6gNWEVarPJD8
 VrYvwLtW32vcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DfXu2pdA
Subject: [Buildroot] [PATCH] package/wireshark: bump to v4.4.16
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

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.16.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 037f2f509a..2c15d4f0f4 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.15.txt
-sha1  dd591df261c7866e7eaac3f015c904ab21d9d51d  wireshark-4.4.15.tar.xz
-sha256  05e884da8d91929bd1fb6a91c26836d69145ecd439b97c2d82698388de221570  wireshark-4.4.15.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.16.txt
+sha1  1424ea22b4959f94eb85c1fc3c510f281766144e  wireshark-4.4.16.tar.xz
+sha256  0bda0e34a4c5da72ea9009134d733783d08189c07462198e53a4f533fd1201fd  wireshark-4.4.16.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1ded080906..ab393b8a48 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.15
+WIRESHARK_VERSION = 4.4.16
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
