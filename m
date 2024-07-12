Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88E1C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6729940628;
	Fri, 12 Jul 2024 21:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9JfmL0LmohN; Fri, 12 Jul 2024 21:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 325954062F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 325954062F;
	Fri, 12 Jul 2024 21:48:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9043D1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E1FD605F8
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2C6JF9k6gu4 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AE8A605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE8A605D0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AE8A605D0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:48:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 46A78B004FF;
 Fri, 12 Jul 2024 23:48:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 23:48:38 +0200
Message-ID: <20240712214838.446517-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720820923;
 bh=6SRht0Y2E9oqZ3Hr1oraB+pOm/YJFKVkpJ8BF4SpCD8=;
 h=From:To:Cc:Subject:Date:From;
 b=UvrZWDMRvONqx0ZUsLEmdGwqGDbUaOXepkWkW14SYHw7No4DDs8fBUrlqDTE/qp3D
 6kle+FYIqF+/IBpj7B1c0V+WVz4OJz1CmtQ6XXHDxwJZGvjeQh+ykMzvDxrIjAkw6R
 qbbcYbXqA//MMihEkR7tARwMzFCudrBjC8TYIWTV4U/Y4avBtGtxArmuNe//4IOg3L
 gUcRsWkjRVVODGmHk2KhJ3XrwGuMz9vmDZyRB/e7ItqzqjhH0qqvbmeQn7w+IGU1a1
 4tU11myhmMluS4z5Lw5zaPnw/D/siQAyAiBuJJcrxY447i0T1skGGfyLw/tsLn/vqU
 wSUdK3jLk6RJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UvrZWDMR
Subject: [Buildroot] [PATCH 1/1] package/octave: add optional libsndfile
 support
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GNU Octave supports the --with-sndfile configure option since v4.0.0.

For reference, commit 40ea68b4b2 "package/octave: new package"
introduced the package at v7.1.0.

This commits adds this optional support.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 0c7c411692..2e2fe0f989 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -43,6 +43,13 @@ else
 OCTAVE_CONF_OPTS += --without-curl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+OCTAVE_CONF_OPTS += --with-sndfile
+OCTAVE_DEPENDENCIES += libsndfile
+else
+OCTAVE_CONF_OPTS += --without-sndfile
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OCTAVE_CONF_OPTS += --with-openssl=yes
 OCTAVE_DEPENDENCIES += openssl
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
