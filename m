Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581DAC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018C64034A;
	Tue,  7 Feb 2023 17:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 018C64034A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuqwtXtEWP9v; Tue,  7 Feb 2023 17:25:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C2B402F0;
	Tue,  7 Feb 2023 17:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C2B402F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4720C1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21FDA40120
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21FDA40120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 36r4Po9X9DPE for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:25:53 +0000 (UTC)
X-Greylist: delayed 00:15:08 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D06AE40A68
Received: from neutron.kverse.co.uk (neutron.kverse.co.uk [88.97.48.192])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D06AE40A68
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:25:52 +0000 (UTC)
Received: from dvorak.ensemble.orchestrated-technology.com ([172.16.1.69])
 by tallis.ensemble.orchestrated-technology.com with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <james.kent@orchestrated-technology.com>)
 id 1pPRUP-0000pv-NO; Tue, 07 Feb 2023 17:10:41 +0000
From: James Kent <james.kent@orchestrated-technology.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 17:10:20 +0000
Message-Id: <20230207171020.20194-1-james.kent@orchestrated-technology.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=orchestrated-technology.com; s=dkim20210630; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TFsMAyjuLSr5hmWg9aZ7zSBYukLgY8PumEu53Zme5d4=; t=1675790752; x=1676654752; 
 b=Ju6UE5sG4zIUXcN4Jud9Tc1c+JHQg/LBp6pyp+Z/Ntq6teOHzsl9aUlmayoNfHOHs6KClOlcuLF
 hLjN0MB/fGpWayieIw4k1OI/Kd6yHNnNRCT0BwABrBZLWdddU7WPVVxCmOkEe11zy5BCAmXMg3OKw
 ROGFK8Uk9jjbd2CsF8Zo4szp36TvY8yYBOa1IahTESnhNuVnJWojdyl3QNyafVFPGgaie9yXqoVlu
 L3tUutK0T/s2urBVSxgqaA0Uwr/VagJiNUHVmisJ0UupbYFanthaZ6+G+a/0njgG227sccJ/cUapv
 2gzM+/RQDY1yXXue3AZ2nREnlk7FmXRou46A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orchestrated-technology.com
 header.i=@orchestrated-technology.com header.a=rsa-sha256
 header.s=dkim20210630 header.b=Ju6UE5sG
Subject: [Buildroot] [PATCH] package/chrony: add default unprivileged user
 option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Kent <james.kent@orchestrated-technology.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Configurable option to define and enable by default an unprivileged
user which the Chrony daemon will assume once initialised. Where libcap
is not enabled a comment indicates the dependency requirement to make
the option available.

This option supports the good security practice of dropping elevated
privileges for daemon runtime.

Signed-off-by: James Kent <james.kent@orchestrated-technology.com>
---
 package/chrony/Config.in | 10 ++++++++++
 package/chrony/chrony.mk |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index 158dc20530..8b053ed7e2 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -14,3 +14,13 @@ config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
 	  Enable support for debug logging output from Chrony when
 	  enabled at runtime. If disabled, code for debug logging will
 	  not be compiled in.
+
+config BR2_PACKAGE_CHRONY_USER
+	bool "chrony default unprivileged user"
+	depends on BR2_PACKAGE_CHRONY && BR2_PACKAGE_LIBCAP
+	help
+	  Define and enable default unprivileged user for the Chrony
+	  daemon to run as.
+
+comment "chrony default unprivileged user requires libcap"
+	depends on BR2_PACKAGE_CHRONY && !BR2_PACKAGE_LIBCAP
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 379e95a778..16f8f082a3 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -21,6 +21,14 @@ CHRONY_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 CHRONY_DEPENDENCIES += libcap
+
+ifeq ($(BR2_PACKAGE_CHRONY_USER),y)
+CHRONY_CONF_OPTS += --with-user=chrony
+define CHRONY_USERS
+	chrony -1 chrony -1 * /run/chrony - - Time daemon
+endef
+endif
+
 else
 CHRONY_CONF_OPTS += --without-libcap
 endif
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
