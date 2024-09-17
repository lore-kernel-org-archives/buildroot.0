Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78070C3ABCB
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 03:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2209E6147A;
	Tue, 17 Sep 2024 03:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZIefbgS1CTk; Tue, 17 Sep 2024 03:29:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A15261483
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A15261483;
	Tue, 17 Sep 2024 03:29:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75C4E1BF33F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 03:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6398781779
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 03:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buP0jlNEnZ4J for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 03:29:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C67138176C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C67138176C
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C67138176C
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 03:29:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8507E35211BC; Tue, 17 Sep 2024 05:29:46 +0200 (CEST)
Date: Tue, 17 Sep 2024 05:29:46 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zuj3qpOmPcV0BhTw@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726543786; bh=GqoxV8zLCHzumY5TLJ57a1CvfJx+KtKoy7IzdLnMkik=;
 h=Date:From:To:Subject:From;
 b=lZfH41fXuLl48GwIp9xIuHisw8VwNjiC98f6ELdW5xDatd3dAzCnRdnjc7B08leBy
 pbTubqzJZtJ6vzOpHgbvDMT3A3VWlR74/nisSc/+UeYgTV2e8Up0Cbj0SOMyMsFscZ
 U7bapA0zLd14PpLG//6OlOxV1/Y4bmzdDE6sRh0H4z/j1u5VGZPLUoAnM4VCxQXOht
 4IZn4o1wF/ob71xpls0UazJswgrluhf5tqCNOWg7vysuyXAL9c/fGHVcUkZUSe/DJW
 kAaJg09TN6FdwdUyAvfj/oDYYLyuqMkH82WcymXu6oRO1yb6FsA9baIVybzRgdoXOn
 nIzSMgMmy1tlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=lZfH41fX
Subject: [Buildroot] [PATCH] package/bind: force shared build
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

We got following error with --enable-static:

checking whether to build static libraries... yes
configure: error: Static linking is not supported as it disables dlopen() and certain security features (e.g. RELRO, ASLR)

Fixes:

 http://autobuild.buildroot.org/results/b55/b553898381ff0fdf5dd705fbb11b469b7564c6e6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 217c9916fd..d594ab5e39 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -33,6 +33,7 @@ BIND_CONF_OPTS = \
 	--enable-epoll \
 	--disable-doh \
 	--disable-backtrace \
+	--disable-static \
 	--with-openssl=$(STAGING_DIR)/usr
 
 BIND_DEPENDENCIES = host-pkgconf libuv openssl
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
