Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A52FD9E2C
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D44B660BE4;
	Fri, 27 Feb 2026 19:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgsd27HBuWOW; Fri, 27 Feb 2026 19:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E50160BE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772221772;
	bh=FZVPt9wN7CJm+oTtFwyS1QeZJmYjNk2vIivOebDf+og=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cxywmQ52nWUTiQ7IPMGFDtstGB3AN6jIB8bBXzk1ofVdYrirAHxl4FiESQdI15tww
	 +aNWo+Q4FgsvpSdwGrUPASpnF1mMYP6tiFbD9IVF9VrBnI8H/BePZRlXmlrHpqdSk0
	 uF5CjnFVwdKQ1vzcdAHvwzgmNjleagZjoh38HO+usflkzJG2GvApRE94xXGFQhqF74
	 yYcCKjrp5pvdlQ4yZ4JJlp6+0rghs24jpZ91uBCRjQmdNa55INuYuUEuTSIDk5YHVh
	 nJXf73UAurER3I1MRbxNvm91pPNQPb+shYn/kUECef7pr3vMmmKOBtqNIW24PcE58E
	 k1wMS5oklutHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E50160BE3;
	Fri, 27 Feb 2026 19:49:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ABC8204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C65C40CBF
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POUpYhMWHz_h for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A99140169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A99140169
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A99140169
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:49:26 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id w3pyvL7cy5gYjw3pyvwjxT; Fri, 27 Feb 2026 20:49:24 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 27 Feb 2026 20:49:21 +0100
Message-ID: <20260227194921.3401564-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK9Ptr0yF+VNTqaUaDhhY4GYJxVSzbNtA3sbuTqisA3klvdVHgTgSgE4gdeCHkgv7bPrSZ01CKEetSVacnzHFn8YCJHAk4L5v2iA8g+uGQThamoGnfFN
 D3RFqInQmXVa39iBVsZ/hKurmDn2gJuuyI5gMNuFAbJnbwvTmxA2inkQQXl5AxZT++dJMXVBu1bbpQo1sKHtGbye9X3jY0Uw4Z275v2uz3xGb7f6eFdRWmzB
 i6OoqntpM5tkza0gz2jjYFCwnuRaTnMDNpbcnUpxkHbRBsR0Dm+HNcNADV8OOKesVnTG+Kr8OUmjYlXbBW8/YXYPYKWP9WJ8ZZ3/keA+zUw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1772221764; bh=heEWNCjhGUqheo20b94PDxMzRNVe0wFdN0pKDDLl5KU=;
 h=From:To:Subject:Date:MIME-Version;
 b=Bq+i0BgMLgQafBpwOpi+L3HZlBCD6+bHPmzkbCRTKdcuyqXdb/icIs7wuHN2D4KkX
 vpe4zjdLgjf8z1cTAedbxsIGg9rqTLuxK60DzZvJmmc1q5zIrXmjW70YP4AZdGOJdV
 5Txz/xb4RngU/21ZCbGeeK+WA9zASgE+kPUHWheNj6gODzpHurzttYPVd7kYjgNyjP
 FDEc0zzoBr+gcbPdRu5UXSuPQKLQYOlL95mGH1CkOEqKSjaMFllCt8NC1mr1wNpq4q
 SfAeZnOmiTZ+GBnadJ3z3PZQKWrmCuatAsOVww5yKA6+s9260oGr7GaGKKU+tgdDqn
 KjtLoJNwOeV2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Bq+i0BgM
Subject: [Buildroot] [PATCH] package/udisks: security bump to version 2.11.1
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

This fixes these CVEs:
CVE-2026-26103:
https://github.com/storaged-project/udisks/security/advisories/GHSA-c75h-phf8-ccjm
CVE-2026-26104:
https://github.com/storaged-project/udisks/security/advisories/GHSA-fcvx-497g-6xmw

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index a62e6b5ed6..8a70b90a67 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0bf30151fe8d9d2fb59b57f6630739dfbbd16417dee69ec57d43b37335bd649a  udisks-2.11.0.tar.bz2
+sha256  e88c52bae02fa13414604bbef42c6bb91c2e24177ee0057ed55c6bd7451bcb6d  udisks-2.11.1.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index c9b66872e9..43d066c9e1 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.11.0
+UDISKS_VERSION = 2.11.1
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
