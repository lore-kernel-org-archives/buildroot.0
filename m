Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA1FCD3439
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D261961022;
	Thu,  7 May 2026 13:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joL147SkudEH; Thu,  7 May 2026 13:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B6E61006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778159305;
	bh=AS34QrGTQpadbeFZuuTeOQ4/i+mSRsW+80oYlkEP+yA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FdfP6EyVZARK89aUHj/UUWCc5grSJPF3i+vNM6rsz+Ju48b/8Gf2THneEfIR2XI4Z
	 w1ZYJ1i0K+tQEEew7B29FH2J+t1gN7CsnyHmtIxFJNU6DhD7sHMipuUfrXWITRpe9J
	 uJu6/nQm1PUOAMGRrwnC68q5CU2yK7mFnQBxldfHTyc8cSV/5q8LWAzTh4c465H40i
	 C3EptRL/quOff06i4Att6Rb59foKZvKqoIAd+LkL43OqK/LCqf24ucjcwFImhUtOLO
	 9thVsfNLROxtYTxRE26/d5ovgbDSxfnM015YeOVoAOWzBfnJfuh0MpATxCtKicLHiD
	 R1AZN9kQcKZlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B6E61006;
	Thu,  7 May 2026 13:08:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 899C711B
 for <buildroot@buildroot.org>; Thu,  7 May 2026 13:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F59C41110
 for <buildroot@buildroot.org>; Thu,  7 May 2026 13:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OeZPJ6saDe3 for <buildroot@buildroot.org>;
 Thu,  7 May 2026 13:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39DB741111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39DB741111
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39DB741111
 for <buildroot@buildroot.org>; Thu,  7 May 2026 13:08:18 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wKySd-007PIU-EH; Thu, 07 May 2026 15:08:14 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 039a087c;
 Thu, 7 May 2026 13:08:13 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu,  7 May 2026 16:08:11 +0300
Message-ID: <20260507130813.67423-1-aperez@igalia.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8a+46xo8lzIXzb+YuD/0ZGbgrvha63Fpy0sZvb4JD2g=; b=ZBDCgh1RgpKcRmERm3iw3h9gtm
 3arsNImS+brjfrtfaOootoIoHJq5hAOyxCZ6yEKZ7DT3ApyrW5MRFhYzJdBMrbhAhqSWhHIet3MWj
 nnVFWyfdtGd2eOsIo6UWn1hXhB2/GTFRa7uvbqin0FkLnBlqexcscSGWq9OpL7QlQILubTZKobyVQ
 Us8dhK60yVdnrhYqsKClxAWKHmyipaUk6fodmSc3z/RR7JT0Mc3FvIQjckJPLD7BZzI5O1yuu63y4
 7xZk6RIaZCs4W7GkiliCBQTWlG41Dqh3CI6OH6l/2ATkNyA4il8t+ONtJQngiVlEOOURfz39uJbep
 y1du/DTA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=ZBDCgh1R
Subject: [Buildroot] [PATCH] package/bubblewrap: security bump to version
 0.11.2
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

Fixes CVE-2026-41163, which affects any system using bubblewrap 0.11.x
using a setuid bubblewrap.

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.11.2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash | 5 ++---
 package/bubblewrap/bubblewrap.mk   | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index 696c20ee07..e87d3c81cb 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,6 +1,5 @@
-# Also checked GPG signature from
-# https://github.com/containers/bubblewrap/releases/tag/v0.11.1
-sha256  c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71  bubblewrap-0.11.1.tar.xz
+# From https://github.com/containers/bubblewrap/releases/download/v0.11.2/bubblewrap-0.11.2.tar.xz.sha256sum
+sha256  69abc30005d2186baf7737feacd8da35633b93cf5af38838ecff17c5f8e924f6  bubblewrap-0.11.2.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index afbb29eab9..7838ab90b3 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.11.1
+BUBBLEWRAP_VERSION = 0.11.2
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
@@ -18,6 +18,7 @@ BUBBLEWRAP_CONF_OPTS = \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \
 	-Drequire_userns=false \
+	-Dsupport_setuid=true \
 	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
