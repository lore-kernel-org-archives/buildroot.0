Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668BACD98D0
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 18:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE9040AE6;
	Thu, 13 Nov 2025 18:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVm_c53Tn-Ic; Thu, 13 Nov 2025 18:52:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E52040AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E52040AFD;
	Thu, 13 Nov 2025 18:52:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66D57D5
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 18:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 593FA40AFD
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 18:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQThm2HaiEgl for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 18:52:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A95640AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A95640AE6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A95640AE6
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 18:52:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 082F6A4C63F7
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 19:52:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37420)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vJcQo-000000002vA-2uKv
 for buildroot@buildroot.org; Thu, 13 Nov 2025 18:52:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 13 Nov 2025 19:52:30 +0100
Message-ID: <20251113185230.83562-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763059951;
 bh=Ose8RnOOscdQBbZnigRe2IeGPgD9/BLFy0e4n8hwuSo=;
 h=From:To:Subject:Date:From;
 b=m/v6DJLbuIkScaPEhBH/TE6HKrdyda4scpp/BjhIgR0vrxN2Nlxk92sjb4SFCMRCT
 AQUTP/O4wbdbWtTbWpnMVwa996ZFNnFRHxjNlFAboBjAC8RTOjvAIph3liM3newiiX
 4jRElB+Xxms5Eksx9cJnE95ux9bDaB34PhZUQyU8IUc69HKxkEI/vAVvaGEjjFKsdP
 wlHBYKlE9r/dv9g3dTTzEKeOE/tHr2GN+kkOHvWVB0KHMIQpVBdrKD9Yvck/i4aPyM
 cD2yT4yKqxm64OhsTX2wUzY8fahGdcdXTEscHXp21yB6MZSUTuePWoIM3hVA1ZKaI+
 nbejtNHBR4lhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=m/v6DJLb
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.1
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

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/59258857/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 5438dc26c9..ddd71e6c86 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59252134/
-sha256  7b9c19e6683e827d556751aa5db5d44b961e87be8b3087535b4909ba1b59321c  fetchmail-6.6.0.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59258857/
+sha256  38d01fe404e67514df394a6ed1a815bbb61aa90c0fa4402252593aced0e38a1d  fetchmail-6.6.1.tar.xz
 # Locally computed:
 sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 4aac0408c6..8906b6c8d2 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).0
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).1
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
