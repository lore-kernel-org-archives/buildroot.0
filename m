Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9564CD6E51
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C841B84268;
	Fri, 29 May 2026 13:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGlCMQFvr-bq; Fri, 29 May 2026 13:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7C7B84262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780061287;
	bh=xNZJ2jhlc4z2r2wPO3sNCUaHybGWBuy9Y5JnshSBO3E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uz7FPyL4oPKVwRNVLf7G/H6LGRf+irJQnsT5OVtjyICJt+LJTsjvULpx/uf+5vqr5
	 5YxlcUt2wF3TWo2zSP3lLcKqzDPOc/8wC3V0H/NiV+F4yKrEL3GWuCVS4gbY6BgaJc
	 7YYIKepkENie2J8Y96WwbAOAixB8J4h7HJXCvD/Q+EA7ftXHfl/SGHqEUfa2iA8c8O
	 GlUUdR0ZF27x8lyu5IxYeYaONGQq9mLpxcgpKkh/pzDxSvHUF0ahUAcdIpaJ8jKWgL
	 bTcZtPm0SUIBM3TEFepH4w0NFxuwhr6pmkfUt9Dv5zqi5m+rfXQjg1UVkLdV82DEgN
	 HYNtAPixf89Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7C7B84262;
	Fri, 29 May 2026 13:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0702E288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA0D141E66
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0RUrSAvRSC7 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5BD7403BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5BD7403BD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5BD7403BD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:28:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09fc.dip0.t-ipconnect.de [91.58.9.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22D86A4C33C4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:27:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50584)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSxFb-000000006ii-1TPI
 for buildroot@buildroot.org; Fri, 29 May 2026 13:27:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:27:45 +0200
Message-ID: <20260529132747.1269960-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529132747.1269960-1-bernd@kuhls.net>
References: <20260529132747.1269960-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780061268;
 bh=zk6fOWfLJ+JEB4rLTCnAoFdZtzIKp9VWoSvVSZNa0eA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=OYkRiw4cxV6tq7VdXNJrqeK/XG5MF4hQs83z0+PrNUAIXG6XN/8jHO1rdxO3asPFV
 WVuaG4D2dxEMmIVnORRQbvU2vvKVcYuCro9J+6TXuxDrMfYXzt/4rU5JZkS0+SMKuJ
 bzsS/lhtRMmFTPBxZgjGfYRmjeytZRGGUo82aOFcoQsgMPpSo80R7Pws9zvGTPDHcw
 6cIoRdAhk8sK9SSGaf/t2FxUJWrPw2qwLnK1cos2eQN28GS37oTLJy87qINiM3yKpR
 T81KA0BWhoCIIpRv7YFbad4l65dC4QXGXQflI5sXiJmPvxNYagwR9DU9gsLeAUTXS4
 CAYZpKLuq981g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OYkRiw4c
Subject: [Buildroot] [PATCH 2/3] package/libks: bump version to 2.0.11
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
Gitlab pipeline passed for libks:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2561720809

The build error with bootlin-aarch64-glibc-old occured in the freeswitch
package.

 package/libks/libks.hash | 2 +-
 package/libks/libks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libks/libks.hash b/package/libks/libks.hash
index de16d0b029..681fe3692f 100644
--- a/package/libks/libks.hash
+++ b/package/libks/libks.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8525dd943cf970c860cd2596207c7ba6646c9e1f407e350fc0a39b76af75e625  libks-2.0.5.tar.gz
+sha256  7142800a0c9095ce0e52308c815026a8ad2a197f519363c050fe441039de20be  libks-2.0.11.tar.gz
 sha256  3aba376a08bf91c95518532e627157f0ee3ab2712d1198463e2b1ac9186dd142  copyright
diff --git a/package/libks/libks.mk b/package/libks/libks.mk
index 2de6b727dd..53bec7dcdc 100644
--- a/package/libks/libks.mk
+++ b/package/libks/libks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKS_VERSION = 2.0.5
+LIBKS_VERSION = 2.0.11
 LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
 LIBKS_LICENSE = MIT
 LIBKS_LICENSE_FILES = copyright
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
