Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F43C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 20:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B08E411BA;
	Tue, 13 May 2025 20:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1FXcDtavN8t; Tue, 13 May 2025 20:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA637411CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA637411CA;
	Tue, 13 May 2025 20:05:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F01B153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00922813AC
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMqnOVilDrLA for <buildroot@buildroot.org>;
 Tue, 13 May 2025 20:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59E5B811BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E5B811BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59E5B811BC
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:05:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a074a.dip0.t-ipconnect.de [91.58.7.74])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33DC4A4C05E9
 for <buildroot@buildroot.org>; Tue, 13 May 2025 22:05:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60252)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uEvsh-000000006Kg-06rU
 for buildroot@buildroot.org; Tue, 13 May 2025 20:05:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 22:05:38 +0200
Message-Id: <20250513200538.2731927-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747166739;
 bh=rq8PNIJK8k3mK1L2Q47PI15zGjJ2bjnp8bokc4jlZ64=;
 h=From:To:Subject:Date:From;
 b=dhfvEBd9QX2LKpCBzAvEXStnPK4Y5GyNoiZQYcrw1MhvvYU+EoeadwryMBXceJDT9
 QQuQLSc2KK85vXo4rDtNL5aKa8GVHFdtMgBaKuLtFYPZHOnmCJ1lVSps8S/gLfuQJb
 Nt7ThDy/Gin/HMKIK6SHL+ENfUOc+axJmEf/8WYMoKYtf/v/r5IPEnR4DQ0cOpk04D
 jo+FHrec/eifV2h17ziXsy69gOVk5x25/mpt3Qvy3uTDnNnEJaad6Ybx8ROC1V/PJB
 EDbq4dzMdiB5JxD8M9R8lTP4KHjlg6qus9BpEo4u7GrDzg7LVWaMD/4gNBeWJrpHZO
 zfh0b/fCzoo2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=dhfvEBd9
Subject: [Buildroot] [PATCH v2] package/dhcp: fix build with gcc-15.x
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fix for older gcc versions (Julien)

 package/dhcp/dhcp.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index b3b7fe3203..ec1ae490f7 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -27,10 +27,17 @@ define DHCP_LIBTOOL_AUTORECONF
 	cp $(@D)/configure.ac+lt $(@D)/configure.ac
 endef
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+DHCP_GCC_OPTS = -std=gnu17
+endif
+
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
-	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
+	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1 $(DHCP_GCC_OPTS)'
 
 DHCP_BIND_EXTRA_CONFIG = \
 	--build=$(GNU_HOST_NAME) \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
