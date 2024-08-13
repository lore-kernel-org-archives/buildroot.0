Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E46C52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 04:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C329405DE;
	Tue, 13 Aug 2024 04:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fla8dboj_nnM; Tue, 13 Aug 2024 04:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B0E4063A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B0E4063A;
	Tue, 13 Aug 2024 04:48:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 355CB1BF3B0
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 04:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2189981449
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 04:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1aDhybQ_3vuh for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 04:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A7608143F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A7608143F
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A7608143F
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 04:48:44 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4610B35211D6; Tue, 13 Aug 2024 06:48:42 +0200 (CEST)
Date: Tue, 13 Aug 2024 06:48:42 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrrlqhreN1oOJBdA@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723524522; bh=ooX+ObjaLsJVFzDmbcpupkQhUvm5/CpSXhiInGLOyiM=;
 h=Date:From:To:Subject:From;
 b=ZfereZkpR/E+pFq5RuNlYHjH8d0AYq7PWID9Pisy+OHFSZ/a6sk12AhSLgP0YzeW/
 bHyAPlDKHyEdDmjcYu3yO28tsl1oJbFppqj5rRhW3YESX5ZVJQQjdqhn2XxKFyKaD8
 /CmjstoxC9i3b2QRVl2UM1KU3MY6fzRZQ2sl3XF3wXxiJmJXOlS4PqiZ1KpsPyWuN7
 q3C9VpDYYMPab+q/RfsJMJSSslx7H/aZUOjA+t6XjwAtIKkqtcSBe2tJGP/cTY7NyS
 fSnLANOioHSUOXX4YgNb0aCAkPXpf+/avxm6qjxjZO9RG6jx0kfa1DowVQhN6Zqqb9
 fdbbMEAt3r9iA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=ZfereZkp
Subject: [Buildroot] [PATCH v2 next] package/unbound: enable tfo-client for
 uClibc-ng systems
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc-ng systems have MSG_FASTOPEN since 2018 so no need
to disable support for TCP fastopen client mode.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - split patches this one goes to next, suggested by Thomas P.
---
 package/unbound/unbound.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index ff0262bef1..04386e8d5b 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -18,18 +18,11 @@ UNBOUND_CONF_OPTS = \
 	--with-pidfile=/var/run/unbound.pid \
 	--with-rootkey-file=/etc/unbound/root.key \
 	--enable-tfo-server \
+	--enable-tfo-client \
 	--with-libevent=$(STAGING_DIR)/usr \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
-# uClibc-ng does not have MSG_FASTOPEN
-# so TCP Fast Open client mode disabled for it
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-UNBOUND_CONF_OPTS += --disable-tfo-client
-else
-UNBOUND_CONF_OPTS += --enable-tfo-client
-endif
-
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 UNBOUND_CONF_OPTS += --with-pthreads
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
