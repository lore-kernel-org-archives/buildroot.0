Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3E8FED3E6
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 18:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAAC460720;
	Fri, 24 Apr 2026 18:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1qvkIst05o7; Fri, 24 Apr 2026 18:49:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E137060616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777056597;
	bh=Aasj7Ki4NGv9eow4bFA44tZgTLEi70elNjNYQazq0Kw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K/y4s2Q+5CDB29hYYwc7+3BhwWvvXMpIrq10VTKkgFBNSFv54avzd4dC+9sod7fpb
	 jg2cmJrB6CskH5/Yob6058ZvDHnp5isxIhZPXeTIgjoFLw5+fvHeYaOLAUKutfo3pH
	 3LUD7rRgrexJLzQK6okp/9lcip0fNTCeWayPK0HrwUkA92f5fbSzNB6I1/DkD1Zrgd
	 8I+FLRdwuOaDjPHyZG2lE+aygyh0IN084Tn83cnDOq0poV+dqmoA2bIC/Qw8AuZ4ai
	 IYhMPj14JTnQ6tg+J0ZYOLuzDi0bFbcJ5nhKBc/byAFGV/PyGtuR9Hx3XUFIw3kLoT
	 g5/+XIYvkkr/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E137060616;
	Fri, 24 Apr 2026 18:49:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 996AE194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 18:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A98E60615
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 18:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiOthVEk2lfU for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 18:49:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CEF460720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CEF460720
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CEF460720
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 18:49:52 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id GLb2wADfLrbJKGLb2w8CrJ; Fri, 24 Apr 2026 20:49:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 24 Apr 2026 20:49:30 +0200
Message-ID: <20260424184930.2281649-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA3SD3cXGGH3NnU26XPJ3hLICoC1tuXFp7yjqgOosfJLZqp2b71OxikMzFgNUkbNYb3i9tTefAoN/n0g8VTpizhBy4IbcqdFoVSuZkiNq2N+tAQBO/9c
 qosX2Wp3bXV8SDH3B5MiD8lMNyHK7CmJHt4SMF8RdSqd21GLQtffvaih2MddL2Oa5rG/lOg3RZbJAROueUk72oB2Xvz2Y94VTz2dUqXjP/3AQz/iQ6X+L2qu
 /bMseexWViDZQJ+htn+P1AyZEVWCeH2jFtj2uojU0a+xSugzGkRka+vV+ejeIp8puhCZSHWNzhLQuJT9jZZRJw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1777056589; bh=dExjoinUoddqfizFysPMZHmhVQjEotXD0rDdZbo9A68=;
 h=From:To:Subject:Date:MIME-Version;
 b=a1DlskrE7l0crKSi7YVdcN0jDoxcRarqc5sK6XjUMh5WT0XFLTeMtlJcv2fP0LtTc
 HM8/BloB+KWywFVVK9ENCB6R0U7BgLN4MUZUsFtanThtQ30HHveAGq0qPQ/8OCuw4v
 P47fKf6Wc7M0/E5WsKQCwfH013DMflgy+W5fnU99K3cD0MF9ZMswxRdyxfmuPaI/WT
 avH/fXHTAz9QgeO8Sw/oG0Ukm5KKV31USaGZj8EJm0IyNq49jyN7ggFXiCe2f3F/Ll
 CBWnASGr3/gcu4vXxCqVGzzUOM4rP6Out4xL6zFwiPNhWLjpWyY+4pyAz8kJ9EOaP9
 Zzp8YKjC2Kyfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=a1DlskrE
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.123.1
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
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_123_1.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 31c1315783..0f5ec9c8ee 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_RTM/src/SHA256SUMS
-sha256  2145113398a269779a7390515a1638800836b130248e33f93243268c026d4e49  nss-3.123.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_1_RTM/src/SHA256SUMS
+sha256  42065a3ff780a9710a3dddcd1cee9b9be2aa40628883cea851d562eb58b178b0  nss-3.123.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a47856b03e..3426995368 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.123
+LIBNSS_VERSION = 3.123.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
