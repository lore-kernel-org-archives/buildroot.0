Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B67CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 06:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E7284132D;
	Thu, 18 Jun 2026 06:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Mw4QT_hpapt; Thu, 18 Jun 2026 06:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951AF41326
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781764948;
	bh=+TOvEA+R2ZFxmimbKj/dB0qf984Oqd+iJ+4/2lU5nyA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pg0uO2UC5LUhwn/pQgDWjPzRPZRbTO3OiqGt3pEt+p//lwV0tQXOTEOSHhHft0c0X
	 WzhhyHYXjWvNZa3d0YcTY25DK+CrkUvqFQUne8LGlK+jWCTMX6+102Dsmx1q4//0g2
	 iQoqzYGBWPbRjDvjDcFY0mw7hHy9jr3jA2cocvOMxMdkuuNQ9WBV/dXBvW6CKhNq5L
	 agvmsdMnpVvS6FsLrDXZPBRa+kqN0yN+a6gV2Y5Ji+EaJwiOOhtBXv7XUbq6H5YU/+
	 bcThqFil7GcmQdD3bgnsy47mKrfyRIfESZwuL/aV9d9gx6bG74qZLWs1OHWgjYXIKP
	 jC4fayheDAPdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951AF41326;
	Thu, 18 Jun 2026 06:42:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3969A358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 159CD41326
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzNm8YovuuBq for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 06:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6716841322
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6716841322
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6716841322
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:42:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a06cf.dip0.t-ipconnect.de [91.58.6.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 433DBA4C0369
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 08:42:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50284)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wa6SD-000000003b4-1IRW
 for buildroot@buildroot.org; Thu, 18 Jun 2026 06:42:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 08:42:20 +0200
Message-ID: <20260618064220.335254-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781764941;
 bh=mQOlYFCyM9IIWSAjLYF6qOIGm63KVnn/f19gUf0PUM8=;
 h=From:To:Subject:Date:From;
 b=n6r+N7wyrsz2NbWzS1bmOOy53+6F66ZVxjhb9Rp9h9qWzgBOpO3KAaoV8YPo7/mIo
 gXadrjey4ObZyNFzx4GcbSvXnkl3mgNFvr+x8hggdn5xONt77dWeuGSX7/lfyhH9Qq
 KEhYe3wjTFB7xwghDhHU72ICGZD06D6qu4E+icOEdwjbTquAs4m9c1umLwYr6WYFJl
 bBtIDAord61J+JGMEyaKa3ojjfs53/unSAuBpZKEad2ktivuPfRWe6klzNulXJAgPQ
 hfq8vNsj0XbKpQzAbe8WYRl+ZNbBp+ILIULrRQvY6ZOOTqdhfRQG+4bpn4WVQ7v3dT
 91eL/VbpGJZuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n6r+N7wy
Subject: [Buildroot] [PATCH 1/1] package/net-tools: fix build with linux 7.1
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

Fixes build error

rose.c:41:10: fatal error: linux/rose.h: No such file or directory
   41 | #include <linux/rose.h>

caused by the upstream removal of the ax25 and amateur radio (hamradio)
subsystem:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-7.1.y&id=dd8d4bc28ad7252610d8e79c1313a2d1e3499a51

which was added to buildroot with commit
9530d74ddb04d5fc81f9054ec0e76fbcb2a1e7d2.

For details see https://github.com/ecki/net-tools/issues/69

Fixes:
https://autobuild.buildroot.net/results/6c7/6c7783e3b6dad01b5dd725141ebed2b84242051e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/net-tools/net-tools.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 344abee8b3..e208a78e71 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -32,7 +32,17 @@ define NET_TOOLS_ENABLE_IPV6
 	$(SED) 's:_AFINET6 0:_AFINET6 1:' $(@D)/config.h
 endef
 
-NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1),y)
+define NET_TOOLS_DISABLE_ROSE
+	$(SED) 's:HAVE_AFROSE 1:HAVE_AFROSE 0:' \
+	-e 's:HAVE_HWROSE 1:HAVE_HWROSE 0:' $(@D)/config.h
+endef
+endif
+
+NET_TOOLS_POST_CONFIGURE_HOOKS += \
+	NET_TOOLS_DISABLE_ROSE \
+	NET_TOOLS_ENABLE_I18N \
+	NET_TOOLS_ENABLE_IPV6
 
 define NET_TOOLS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
