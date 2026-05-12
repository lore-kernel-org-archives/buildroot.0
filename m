Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A63CD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A2540F70;
	Tue, 12 May 2026 14:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceAby13_ib0i; Tue, 12 May 2026 14:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62C8740C0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778597560;
	bh=ERBI+iBikUXV3elrxQ7X4qUPtib9daa20NKI1Vuss+M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jlr0sBbsYQV8kz5igjPlpWZ9p6/PKSXo4JeOzx4i8R0KGzYt+7UW0PiOcpZ8mbI7J
	 itpSrQMPpyt6B2OPbvUTbwMe0Vg/3GM1ESL+zjSjpEczTDrdafikUoPexZdMyM9m15
	 BHQg/qx1k/ZqFyJBg3scAlkINydp9GHR0MzRdERz2RLw6edaZDs0ACjZW4JE5fiFdQ
	 Xs5ro2PvSRh+UVKO6TeUNN5PVBeVyFKQirqQGglf81HVyqmdzjkfTwuJDNAMYBaaWd
	 Q7/pHsfvdUNrfp0yVte6M3t/rXOeN+3RWgfIv8obwp1YJ4Qu2Yt2d4t/kK5TvjFTV8
	 pTi5Nrb9CXYvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C8740C0C;
	Tue, 12 May 2026 14:52:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A65BB398
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C12080C27
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nliC51Lsev1j for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:52:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 785B780C24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 785B780C24
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 785B780C24
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72DC5A4C0991;
 Tue, 12 May 2026 16:52:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMoSj-000000004ON-24WM;
 Tue, 12 May 2026 14:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 12 May 2026 16:51:55 +0200
Message-ID: <20260512145156.320992-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512145156.320992-1-bernd@kuhls.net>
References: <20260512145156.320992-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778597521;
 bh=fx/6hILwFZkCP6lFWoJJHVYMQs79JrIFC5wKCJ94Q1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=C874WoYbjgPhtj9W1yZS2Q9wEdS5fUMlssJQMt6bv0AbFY4TU3iVXAWaVBS7/QyhW
 cGTEUuwXEla79YgxA2s7n3NdvuQIFfNT5ZE4kDyJ2MncaFuazTvnGI/YPzCjpCHIGk
 MqgXVP5thZpzJNokrbGamTDjBYqDHed0Hq+UqW0wChE2iSyNzzHbuZ33VwIyuezqXN
 GzPJjeOvdG3mTSeq6FH3n7Nc2Us4np1Y88OqWogGcgYI8zux4BAdzSTgPRdrC7GGBz
 XgE2W/G8YGCve1OyEIij+KN/Zo04r7S1xKeDFTlaAX92OQjAnAyOGaA6wjOBWUOBL6
 +kHSEuxmxA5Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=C874WoYb
Subject: [Buildroot] [PATCH/next 7/8] package/selinux-python: bump version
 to 3.10
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

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 44095dcd74..e976d3f55f 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  dcfa5f1919dcb7e7b775851994eb5c83b7580dc496cd2d1f73867dfa074d2339  selinux-python-3.9.tar.gz
+sha256  9d0a5b69f2fbcce8e5ccd8e0f17d56f71e6005a756386f8fb36c31f9424191a2  selinux-python-3.10.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 27ff12ad06..279592d43d 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.9
+SELINUX_PYTHON_VERSION = 3.10
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
