Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A0CCDB46B
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 07:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 343B86F967;
	Sat, 20 Jun 2026 07:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKOFK87Pxiq8; Sat, 20 Jun 2026 07:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61A466F9D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781939029;
	bh=81Jx5xP02qrb1XDn5s49wGzGALA1VKwQey8YGrx9hHA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o7W5wzFj//Bc41zeUi1LaP1CefBi4lRSIRaTJVtySPUZXFLC9HvQ+J9T0ZDqLPFEi
	 +8xNlLSgH+aKzgKj1fC8UQmK5JNxTut6yXmYB+IdlJ3mu6oZpCPgCfW+VU82nITBa0
	 hJIGZ19YZz1r++jbIaWSp58AoNwyLs2/aaBKBjkOCA27BrwQgPUdzuE8lc2yOILiob
	 pPYOAxmrMfUvSLh8Mlksgp/rzpm+swGp9aO9OEo65Va81smAOt/O6gqDWoyPCvIt07
	 +pYEfNqHucauGr0dTomKvsIlMnXBIXnVuHhZ+aaBXGthOiYqx9vr/SdxFuHgZ1IJKu
	 6SsLWicyJq7uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61A466F9D9;
	Sat, 20 Jun 2026 07:03:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3974D367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 07:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3703D6F9D9
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 07:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd4xW2secsJQ for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 07:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 006756F967
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 006756F967
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 006756F967
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 07:03:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3161BA4C19FC;
 Sat, 20 Jun 2026 09:03:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40392)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wapjz-000000004Zp-3XbS;
 Sat, 20 Jun 2026 07:03:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Sat, 20 Jun 2026 09:03:43 +0200
Message-ID: <20260620070343.86834-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781939024;
 bh=sjpX76Ysf/CusWG313ib6sPPzve1pmsLmKMC9Ucpydc=;
 h=From:To:Cc:Subject:Date:From;
 b=b6pPb/YxQ+W9Rby4XK3oqvNH4eZA9N2SUa1lfIs5ExTZ1jVNw61tX3qhfC05waZHw
 5HSyEOMFoOD/R5D39ljdDJYQ98LJNo6sIDjiolRXeJBeWMah9KayOWuPjQl/AOUOc8
 wJM99UkUVilHfkHj6IML16BKcFqOjaTq3id4IQ0TTrYpazOByoNNFGZu4HWdgv98Wa
 8eHeL30EBMMxHdEjrqQagjKqXjVocxMZeuGJGf5LdFXnXtU1txetBPh+C2KgifoS4Z
 BvOjTbpwlHVHhD4z6a7t4oAhpMm+CIpZrwqqohLJh/fJBSqXZZT2Gk4h2KN4xi3/3f
 Ia2v89mBSXoeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=b6pPb/Yx
Subject: [Buildroot] [PATCH 1/1] package/cpp-httplib: depends on
 BR2_TOOLCHAIN_HAS_SYNC_1
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

Buildroot commit 8dad17ea06260ef0bd23eebc47c95a8510310bf5 bumped the
package from 0.27.0 to 0.37.2. This bump includes upstream commit
https://github.com/yhirose/cpp-httplib/commit/464867a9cedef2b6185e25e3e912d3f796fe58fd
which added WebSocket support to version 0.33.0 and causes a build error
detected by the Gitlab pipelines for bootlin-sparc-uclibc:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-sparc-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 /tmp/cciyXsAR.ltrans6.ltrans.o: in function
 `httplib::ws::WebSocket::close(httplib::ws::CloseStatus,
 std::__cxx11::basic_string<char, std::char_traits<char>,
 std::allocator<char> > const&)':
<artificial>:(.text+0x6408): undefined reference to `__atomic_exchange_1'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/1f16e14c1131a99a61f16200285b71d0cfe47020

 package/cpp-httplib/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cpp-httplib/Config.in b/package/cpp-httplib/Config.in
index 9bd93ee0af..7d1244c2ac 100644
--- a/package/cpp-httplib/Config.in
+++ b/package/cpp-httplib/Config.in
@@ -1,10 +1,12 @@
 comment "cpp-httplib needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_CPP_HTTPLIB
 	bool "cpp-httplib"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_USE_WCHAR
 	help
 	  A C++ header-only HTTP/HTTPS server and client library.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
