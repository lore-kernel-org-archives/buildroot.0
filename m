Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401FAC88E65
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6A1A40533;
	Sun, 13 Sep 2026 19:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TERD_z7i7lRX; Sun, 13 Sep 2026 19:34:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C5C24405A4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328065;
	b=SQ6FhESY9L/JYb0rJhszs7j5ShZFwFxOUhDhcFYRyfvIeK9NGpKwVcxadYIwdA1nugTw
	 eIA3CmVUAHshbd2sabnp0mFpK8U8qyJ3JmWMmF+NNDbPdymeJvYn7OahWaYe2keGE7ek6
	 bY/y8RAuRNXMyMjC84jEKNWN44tItBS4ZJw4GMQpyAkj8WzfKAaJg5l3j9Y6QXxohsydf
	 qxSwWlWlOSl3TOXFaQuWAl8NymB137Hrlqow5m8lzposXIDYcJ9Lb7CLSIQ59uN70ivdO
	 bFWqTR97WOvIuYV/m2T3ugn8CQ3Jk4BvuGl2sOm85iS8pja8TqnwNwlDSoTtR5tS9cA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uIh69vckwOsidPxBLLcIbirOzl1qhe0sPGf/BlL4C74=;
	b=hidIIC2y5fbyAldylGPbbvysb6O4M197ctwSZ+Yjp44IjBZ7o0+2i4zH0+TVPTSX8iNe
	 xaSoGbPqEjf9ic+XcrLD3W0JhPFNVOobOXG8WHg4f/VrGEqdKvvoFyaZB0E17/HUVB2X2
	 MrXhW9Gn76wK1n7uod+yVsiT5oUKhi4isZg/zIYu+As7bDmo5vol9Ckjm1kCxL4+eEWXq
	 1tNUJboPk8NWfizINNJ3UGYOp+mjc1RRFgxCAKYMHFZLIGYj3nz3hbkaQOx9Mtv54WElP
	 Nndy6bqDYoSKaQoYny7NyeWIJloH3n9fsLkvlmptLSCFETLjP+JPVpIBFl5/7AejyaQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328065;
	bh=uIh69vckwOsidPxBLLcIbirOzl1qhe0sPGf/BlL4C74=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SJijMlhI/5PC/v1A9HtPQQgIq6mf6A6tt/REAOQEPSpaghioByqis4O8HeYnG/Fm2
	 VvlIa6meDu142pqk8cABakPhY1DnXefp2cmXJc80WzyC5wlfjkzjWSayhgeD9WBuwa
	 EiEm12FPXQXRHmv1orO3TKyDtpgi5a+zEDVTXGKSbfIr0q8C+din11SZ0tajw+8luB
	 4vfQgJOhckL1P1r0+Ynq4fpG4LN1i+mnYtygp+rGJfJOeDbF5HzVAWA6I0b/GHZYBg
	 w34vptNF/xezw5CUNjYGmS5F8Xxg790omyG5NpxrDZR6Hyj+N2Wwv1jFy4YjqukqH9
	 0DToOFigNvGKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5C24405A4;
	Sun, 13 Sep 2026 19:34:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EE0F49D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B1B680CF0
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1MBlnAb_mAS for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6103080A82
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328060;
 b=drUDzOX5NBIUMqAGGybmzisdHFvUtMh14lgYX9DM2tr/ZsvR7g9E/Qliyi5zIpKcGCw+
 0EiEYeB2cHG0o4anYfU74jLgddp2G0Dw8VbADHnl8s9Rd5qqKtnQKpE0BzbVd/WDtY81N
 FfxKaMgEGEJ/t4WfDeF1C9BPUTUIFyEtdlWSxdULc6pEmOKkovXJU0gxYArlMelteW4Ga
 VXFk9NMAxE+H0Wlb2es+btBMO5P2LWwPtMCzLHF4h5RmxqLet7LGBAAfftt4f2Bbcpob6
 5JK+EAmn02cSrYoztxXS7PBJZ8OUaGwcVajN9AoKTe58JPbGPoi1xuM1j67VeP1A0zQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328060;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Z5aaHMnH7vEbLMQ0SMnZdHsOE04I9WyEey3cPtfihq8=;
 b=rBIsfKMz4oiI6sAKeVpiWhB8f7WVOYlU3JQTi98F0OwgG7FtPmAlip+la80gIIfsN9AO
 ikypPZqV9Py+Ov6rDESfJ5GvFhaIVf/PCcq0P7flqN91eL84zUs2dP2AWuNCJSE0A+PWb
 vKDL8oZHjf+3NfL1gAk5qT7LEFoD5zVhmeVG/EA5qUgH8GhlyH2KOda7LOgdmVZUBSPbs
 LQHeHL6eJueH3JgRExksWmwFPEGx7usBkITZrm8aPi2PSp2pF4ZUnmVEdWv0XeG1v0zYE
 ZZF8suJaEV1KpOyOZWWcjl+bPU89BYJDaUzwJORnHzuFU1fDCCGk5nqeVTPRe8r6SdA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6103080A82
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5900795C72; Sun, 13 Sep 2026 19:33:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:23:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f077ba9e67566a6855148ffa732c06d63db0622f
X-Git-Newrev: e96b7a0ef203ef2937a6fffe8bd9d8f3a9b58cb6
X-Patchwork-Hint: ignore
Message-Id: <20260913193315.5900795C72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbguard: fix gcc version
 dependency after libabseil-cpp bump
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e96b7a0ef203ef2937a6fffe8bd9d8f3a9b58cb6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump
to version 20260817.0"), libabseil-cpp was bumped, which required the
gcc >= 8.x dependency to be upgraded to a gcc >= 10.x dependency. This
was properly done in package/protobuf as part of this commit, as
protobuf is a reverse dependency of libabseil-cpp.

However, usbguard, which is a reverse dependency of protobuf, was
forgotten, and it no longer carries the correct gcc dependency.

This commit fixes this issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/usbguard/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 254209ff64..b71333aed9 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf, C++17 filesystem
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_PROTOBUF
@@ -18,9 +18,9 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 comment "usbguard needs a toolchain not affected by GCC bug 64735"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
