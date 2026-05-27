Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A08CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 18:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A05838431B;
	Wed, 27 May 2026 18:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15o54VresvV7; Wed, 27 May 2026 18:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00AE2842D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779907617;
	bh=OmLxPlKL527ZVfr06RRnxK4GMs7LcAAT2MEvZnVN16o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qd7DXLmHfuhOO3cGpZM1Q+Q1+MrZCJMQbReNsS++Hcm2z3XCObFHfHb2O3cBPjF34
	 bxzRHgpWZaJOoq6iPIo4UnwrzlgpVWZd14s7wq4UBtX0vvs59/q1Je0PH957Q3Sud1
	 VhllHckFFqIq2Be0CsCrv/4hNiRM796zt6w5/VPW1EbvpXaqdsIe/tnouKIu3x0nf2
	 LWqxQmMuI5YmjRdMFhSqfoDtx8c8CULYgmoeKL9y9UjPg6hAVxVySLum4nSCFqZPTF
	 e3rAGjZKtQJPXlamsvXAxzXQZkPHNRGr38d0bPeCl5QHaEXPMy0p0ejA2/ZYYnInEL
	 cnSSFeLTqpiaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00AE2842D3;
	Wed, 27 May 2026 18:46:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33952290
 for <buildroot@buildroot.org>; Wed, 27 May 2026 18:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13AF342132
 for <buildroot@buildroot.org>; Wed, 27 May 2026 18:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9c2QkUduvFHW for <buildroot@buildroot.org>;
 Wed, 27 May 2026 18:46:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E14C40AFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E14C40AFB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E14C40AFB
 for <buildroot@buildroot.org>; Wed, 27 May 2026 18:46:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E72CA4C2050
 for <buildroot@buildroot.org>; Wed, 27 May 2026 20:46:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33664)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSJH7-000000007K7-2gyC
 for buildroot@buildroot.org; Wed, 27 May 2026 18:46:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 May 2026 20:46:41 +0200
Message-ID: <20260527184641.3533110-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779907609;
 bh=kJoWfYHu/JVFRxotvds193JgWMf9H1fpDFXtxfoKJoo=;
 h=From:To:Subject:Date:From;
 b=TkQ7zzqfLu1HtSRfIrZnUr4IPlQ6XmPlfGhIUvpe8EEVLpm8RHZhbMm6Ax+hCYqlS
 aCSgUgQ/ylAObimhrkxNlqDp9hwjW7UB9XwWkB7EolEgRuf0J3La0gsUVNcYI9Mxqs
 rH20Pv7jUaII+wedqGAuw2z3sM+KbLHokjjvQwe03XD16h7EOn6ilZ5GK3tqu3Kv9Y
 A744l7yJYcpjWiev4srAurpSAZU5psyYOowVV511PqLW3G6jnmKZ6dtihoZF331xYg
 w6eWaq7j5LbrdFrnvXkjy5n0HVdWelQNX4QbJf3wjG6U0xZKgduvcarbxKOstf23Eb
 I0T0swTIGlP7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=TkQ7zzqf
Subject: [Buildroot] [PATCH v2 1/1] package/ustream-ssl: needs OpenSSL
 ssl-trace
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

Buildroot commit e1050a3a50886c72d3ff2416dd8db2fe3c389973 bumped the
package which includes upstream commit
https://git.openwrt.org/?p=project/ustream-ssl.git;a=commit;h=956fba242ac0a4bcfe3db103d4d1f41545c924fb
that adds the usage of SSL_trace causing a build error when OpenSSL was
built without ssl-trace support:

/home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:
 In function '__ustream_ssl_set_debug':
/home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:490:44:
 error: 'SSL_trace' undeclared (first use in this function); did you mean 'SSL_write'?
  490 |         SSL_CTX_set_msg_callback(ctx->ssl, SSL_trace);

Fixes:
https://autobuild.buildroot.net/results/17c/17c88282c32f2edfa0991e0e10cb45013c947be9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added result of Gitlab pipeline
    https://gitlab.com/bkuhls/buildroot/-/pipelines/2556948372

 package/ustream-ssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
index c328a6ea12..6fc54f3bef 100644
--- a/package/ustream-ssl/Config.in
+++ b/package/ustream-ssl/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_USTREAM_SSL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE if BR2_PACKAGE_LIBOPENSSL
 	help
 	  ustream SSL wrapper
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
