Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4496C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 11:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44159400AC;
	Sun,  4 Aug 2024 11:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyO1PsnRykRU; Sun,  4 Aug 2024 11:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0395140257
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0395140257;
	Sun,  4 Aug 2024 11:20:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0F21BF375
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 11:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6617980C97
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 11:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNEbXoGzT9nC for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 11:20:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5B4180B63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B4180B63
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5B4180B63
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 11:20:21 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D35763536327; Sun,  4 Aug 2024 13:20:18 +0200 (CEST)
Date: Sun, 4 Aug 2024 13:20:18 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zq9j8m3YPt0Xh0gY@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722770418; bh=KQmLGTbe/6H3bhjzxc7ks1oj0zFCS/0hGybybq6gf8E=;
 h=Date:From:To:Subject:From;
 b=I5N19Vrk5s9pvqEEYDO1pFT5OiPczD42RuNNrO1DshN5t42HcrL1t+TMNWqmxuxKd
 +WSahVc0X6ZEkIqkpCQoGIQxczx+GVlQjw1J7DARUQg3TE29ery7E5WWy6YJ1f8lYY
 jZzlCJIk2upaGyF05KUNZBgqLm2L6DfYUiz5+KE2fjf+HANRKeZBQaw2aDARDJlJ7s
 2xpA0e8/BW+odfOZUMRPtCoHfP+1AS04Wp6T/mhRGLoNaIfKf3TAMjirpEKOiT+T0U
 Ib7JMBKiCNA2aqsn8UIfwi7muzVhRG0N9AXFYzAwdhfs4ZggcM+iWMjzvnN7VZmjbp
 iHTnzHQwGsTBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=I5N19Vrk
Subject: [Buildroot] [PATCH] package/nginx: fix sparc compile
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

When libatomic_ops are enabled the shared library is using symbols
from libatomic.

In output/build/nginx-1.24.0/objs/autoconf.err
You get:
checking for atomic_ops library

/home/wbx/buildroot/output/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
/tmp/ccx4rHjO.o: in function `main':
autotest.c:(.text.startup+0x30): undefined reference to
`__atomic_fetch_add_4'
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.net/results/5de/5de45530bbc615b1c44cc73a0ae7bf4cff5f1a56/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/nginx/nginx.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 7bd2173b48..c462c1f265 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -75,6 +75,7 @@ NGINX_CONF_OPTS += --with-libatomic
 NGINX_CONF_ENV += ngx_force_have_libatomic=yes
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 NGINX_CFLAGS += "-DAO_NO_SPARC_V9"
+NGINX_LDFLAGS += -latomic
 endif
 else
 NGINX_CONF_ENV += ngx_force_have_libatomic=no
@@ -300,7 +301,8 @@ define NGINX_CONFIGURE_CMDS
 	cd $(@D) ; $(NGINX_CONF_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		./configure $(NGINX_CONF_OPTS) \
-			--with-cc-opt="$(TARGET_CFLAGS) $(NGINX_CFLAGS)"
+			--with-cc-opt="$(TARGET_CFLAGS) $(NGINX_CFLAGS)" \
+			--with-ld-opt="$(NGINX_LDFLAGS)"
 endef
 
 define NGINX_BUILD_CMDS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
