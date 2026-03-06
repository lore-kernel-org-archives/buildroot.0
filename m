Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61CBFCC07D
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 21:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D26B40D5D;
	Fri,  6 Mar 2026 21:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dysvRGororXv; Fri,  6 Mar 2026 21:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C5440D26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772834019;
	bh=lt5hR5nlR1Ug/2d/ZRKIeNPfU7oDW5lJlIO0S0F/XgA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NIJpmE8UK7xQKzTxhOZTVaAzlNv1X+jAes1IDCFF69wRHKQ0Dm7ZKUNGJiEPzEa1N
	 Q4plV+/H0whOuFSJpRcThZjlBgIaQaFR5L+0L2nYjpvuu3OfzUNqRTHijTlCYP/kwq
	 hBtUTXQJU2xarAoN260PFI0PpN5HRQOx9krJ8wgydvsPGVWv8zziUoZGuWicLam/3p
	 psoKcYn1FczSLGHMLwyVDh4FxfZ+qdWDFQiMnchLea+KGz3+yRsVxSShePL9EMiAVH
	 +MHI72D7ovH1tokRv9EK9qzTDvoO6XGwKKfN4N/OtYmNIF5fRvTRwFcedNjFPGBDzr
	 H6AKyYQOPJuWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54C5440D26;
	Fri,  6 Mar 2026 21:53:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B881169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 21:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D5A061401
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 21:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqIiYm_KROtn for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 21:53:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FAC361400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FAC361400
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FAC361400
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 21:53:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 287A6A4C2FFF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:53:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55510)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyd6x-000000004Ba-3T2I
 for buildroot@buildroot.org; Fri, 06 Mar 2026 21:53:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 22:53:31 +0100
Message-ID: <20260306215331.3563400-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772834012;
 bh=Wu/BrnCd6lSCeN5RQRE+anBSos1/uKmHt7PqpHQMG6I=;
 h=From:To:Subject:Date:From;
 b=h4jlQ95mRGxy6z6NX43Qgzw4t4nr1lcGzfj9Laom0xFq6tCLhl1OSzQvNjDVPEffQ
 zGpmJDjIuQuFkeaBL0jN3jSfzWVS+jsP1gw/F/oL5k1zJ5qXSOniOclI9bNyen4hVr
 omqAMIbmA5E5lSPpzfr6Bbubd3zu5Z9vU9NtdGvOI/1W1Xj/O/5EtwygOSA/qQRQDK
 EYxUw61z5lf89wE/y38e7tea7LbEDEzlNCIZQ6RPL2AQqK/DaiZJQc8vIo7r5WJnBx
 M870JXQ2Nsl0SaYA8PpSNT05mxNJe5+cMJR1tczug9lpD8KYJrc+gFdnLQmo34iRGU
 YaGHReWaZO2Wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=h4jlQ95m
Subject: [Buildroot] [PATCH 1/1] package/leafnode2: fix build without pod2man
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

Fixes a build error when pod2man is missing on the host:

  pod2man ./tools/lsmac.pl >lsmac.1 || { rm -f lsmac.1 ; false ; }
  /bin/sh: line 1: pod2man: command not found

Fixes:
https://autobuild.buildroot.net/results/999/9996e81429f90f4615755827ac182094d416c467/

Although the build error only occurs since 2026-03-05 it should be
backported to LTS branches because the last change to the buildroot
package dates back to 2024.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/leafnode2/leafnode2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 566aaf3d55..8c44071209 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -11,6 +11,12 @@ LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
 LEAFNODE2_DEPENDENCIES = host-pcre pcre
 LEAFNODE2_AUTORECONF = YES
 
+# pod2man doesn't work when cross compiling
+define LEAFNODE2_DISABLE_POD2MAN
+	$(SED) 's/GENERATED_MANS=lsmac.1/GENERATED_MANS=/' $(@D)/Makefile.am
+endef
+LEAFNODE2_POST_PATCH_HOOKS += LEAFNODE2_DISABLE_POD2MAN
+
 LEAFNODE2_CONF_ENV = \
 	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
