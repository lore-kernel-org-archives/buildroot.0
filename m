Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF4AF46C6D
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0192B40A28;
	Mon,  6 Apr 2026 18:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xi-BtAmoHnRF; Mon,  6 Apr 2026 18:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4108040A02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499822;
	bh=xF2BjR1fIS6wX6c/iU7w+ysCod5znz2IHSPIk2Q/WSs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MQh6MhkOL2MdrOlKMoud8YtljiiterVeFjcsCF0MAOtuG8vL0lPlej1rY0Nv3b5o8
	 NEaxzFGlYl5qr4DjpdGizTK9v5Ttvcip3hQi/SpaBHC9fPt4R5LzHApYf2Jb20E3Gr
	 ZMHCiAkCWNbX2PFtRPeALNyggLPtQO/z6bLX7xpOqzJWjNi2LZoNSKxGkL/E+NIpgt
	 s2n6r53FFHCdxcd+D9VGLPjGZTBm09InMC1sSEzxOD6OD8ZI2J/PbqE5xsQqlNo1Ki
	 yn7CXezSQR/T9UWajoJGS3Crlb3U2Xgx23o4OTMDMOwW+JYvxQsabld1bHWIqV4jXb
	 XESI+9S0zCigg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4108040A02;
	Mon,  6 Apr 2026 18:23:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7352B1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5853B402EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfO_aQZ6GE1R for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:23:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24C7140126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24C7140126
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24C7140126
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46492A4C395C;
 Mon,  6 Apr 2026 20:23:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaX-000000001kA-1VGJ;
 Mon, 06 Apr 2026 18:22:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:09 +0200
Message-ID: <20260406182217.1853895-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182217.1853895-1-bernd@kuhls.net>
References: <20260406182217.1853895-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499782;
 bh=6SnzFwWmnQ20FwfNLFPxE6U8l/SUem1K8nreHo6kRwk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aG2wBnI6FsggNxu2yX1XGsJBo9lwmJIRZ9yPrpEOp1LlLA4fCTvXFA4txyEw7O/sy
 vM+K/4Sk2B4mianahHP2IxgmVXCC1jShsLKbrBsTkqCJV3n6GJCPbCGg1iPxjM+JAO
 AgKU2OK/D+upSu7AG9wigPZ1BR12guDRXf2XStfHbO9l4lHUUU1V+UZCZsRK5L+HHl
 YuE5EP2p3T0cPHr1SMdI0UZ1zS8UoqUHAOUbpXI0iFR4k3/M8SIjh22QvtHqbnzzMq
 GTYrDoZJrbOj/x6Us7tD046LVlgbtakB9IlSYiGcVL96JWyOPoNq82HnWQIyna8tLX
 PLSHlHFXxT3VQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=aG2wBnI6
Subject: [Buildroot] [PATCH 05/11] package/haproxy: remove optional support
 for pcre, keep pcre2
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
 package/haproxy/haproxy.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 51878e754f..9504ec6b7a 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -59,11 +59,6 @@ HAPROXY_DEPENDENCIES += pcre2
 HAPROXY_MAKE_OPTS += \
 	PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config \
 	USE_PCRE2=1
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-HAPROXY_DEPENDENCIES += pcre
-HAPROXY_MAKE_OPTS += \
-	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config \
-	USE_PCRE=1
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
