Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903D9F531F8
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 07:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 456FA4299A;
	Tue, 14 Apr 2026 07:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cfHiXR5Ewcq; Tue, 14 Apr 2026 07:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 690754299C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776152773;
	bh=gw1NjlrVlbgmcpSnyz5wzp8SiaPxnrHJJmHKqDl7Tm8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZavOraxdrd+fL0Ei6rjBQQOzHmB7qhbSkDTusGvL8Bp+9RwgNlxwPVzRNZiPAy1h9
	 Big+vZGyY1kRDNfzhgfXKPT2uCfA4QdmBgHzaIE7f4xxQCxgGOe1xQTt6HRJbO0Qwh
	 R+DSRbJsiNPoQS8HHuyxrxGunsgHZg3b1ZqVlxlpEuNGRQmLpNZ2i3957urVVd1ZSg
	 XOqNJ9fVknlydUmiewZVDYeN82XKWdiPaDgb1k9ZdI9cXQG0kSpUk2DRkewYxIL23Y
	 Ms6Ks6evm/+zHU4LRKp+RfgcSIzazofNnPQrsxwD1yfb3XH/ppfoZzEx08F0/pZpzG
	 EcgZlSk1qJOCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 690754299C;
	Tue, 14 Apr 2026 07:46:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9CF9237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 07:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89F6261CDC
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 07:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1W1F6oi782Zn for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 07:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B83B961CDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B83B961CDB
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B83B961CDB
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 07:46:09 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id CYTFwpG4XxFXLCYTGwWceN; Tue, 14 Apr 2026 09:46:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 14 Apr 2026 09:46:05 +0200
Message-ID: <20260414074605.3769357-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfO/+7twa6Y0n0ggq+5C/Ig1Vh7x8beW6bQJ9h61w2E7Loo9zirfgdXW4kfg6fSZviw8tGchmV7FpFWU3+E56Vr2mk1zsHTg74MRd+ZjNAPT2bBeZlfC7
 e7TXYIww6ozDJfXjhT57uH6/1dL41o0GWexExHy07lnFaNOSObR+L9RmdhutwvvGMZ92DQYFIe83qzYtstek+YRuhEN3S/7Tk5Fh124HRubJqcLu9OdaNvov
 nxOSbQLMxMHuaTuIOkAfvr8ukBgd8O3Hu21vZ/yay/tE9ha50C0LuHy6vfAI3eC/8O0A8rsbk24FSGUZHbPVEA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1776152766; bh=tNgntZzigZTBQXpSlAS9OzwDDtnroSU1mMQgwdX2XLY=;
 h=From:To:Subject:Date:MIME-Version;
 b=H44MefcwWi93DckTUogHAjK0uJWsOSmoSN26THIZyMbzQ2/d3XuwhV7Rnjt0+0JNj
 CZuQiw8hdk9ExRJhJ9p4V71f18T+I2TyW4t+7fW4RnvaGhwoAcImXbUpb+H4stU98j
 zcMHjWrO84moJ1dcXkLNtlYa7xFDYG/ZzToLGobCguNonMmj4upO5W/pZPzCy5V4mn
 RkuECHS7uPamKLjZ7fi7q1LMIMN8xYYjM3tdDfG/oNr55vh8LpwMSpmE2qSGdxUgy4
 o/oJcpz7+g+L3gstVdE0/LekazcGipn1LSpVHn0goJjR007ysVRj+vCOTV1UFDe5Kh
 2tC0Mr7J++CoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=H44Mefcw
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.122.1
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

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_112_1.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index d2e85cb32d..d0d278c7f6 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_RTM/src/SHA256SUMS
-sha256  2699478b843b9f09c61f85341578df514463a0069447c816bef0d59bd800d777  nss-3.122.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_1_RTM/src/SHA256SUMS
+sha256  de5a655da82a67e502b802ae0b53f3eb02ea53f509c3fc0ab54a892e04493bbf  nss-3.122.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index bf59827bdc..b40cab03c9 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.122
+LIBNSS_VERSION = 3.122.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
