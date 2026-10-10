Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48775CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD1740899;
	Sat, 10 Oct 2026 16:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZV6uS7OmXDl; Sat, 10 Oct 2026 16:53:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EF2CC406DD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791651208;
	b=K7+Va/kBdVGIDPeKjOWpSC7QSTlDnR9pMeZJgXiPo3NiGlfyGDIHSsF3+xFyOp3WCvDO
	 EXFdukY1lLyAzuDLL98o/UHFCtUJjS680wKuZUPpge6VYpg62lzxRZOH05bRP+N/pJjpA
	 0tjYVAA+xWZmzTaRl/sqMwa8Rq0WxOA9cHBOD/oc73EexaDCwVCTwQ1Nke+T6lEUlmK1j
	 FobyiYL6Brb2LrHmLZ3PZ0Ix+3KexbbJPwiKVflAbK3MV0mWqXhgwSbWxPPph92dIPnC2
	 K9e5ddqT1tUHRjoLzGV4r9+0ygaiOafrJw+oE2UDOewDw5hmlftnM8HbWAFMa7IG7lg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791651208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6fgmmpNVG3nhYoKH6m5bnAsgEHFNdMn6KE+cUHlq4Ww=;
	b=Uk/MQKSeZonT8Te2xQpDcbt2nMbERuyw1I03R65jrKzSmiFHEk1qvAx5WQsdpCqrQAjR
	 sGfOUSQIZgWISZ8eqymQj9SSmN2PPhL3Q77zSLtJVqWzbxgCsFp6IV9i6uQa9WSqjqRjN
	 Q/9aIYogIKUOCx791cFjrfG8VoCgYRAhLdu3G3WqK1bzVuEMgwaCRkDXl/IyWw8bSRk6r
	 Th+K2wbqYZhQL72dvmIdZyVPvHw/5LHJ80HK6JeQX78aTvsmOUggKWuGwxx+m1dvMeR2d
	 dh4mR3Pj5woFnd6vD0YNs/b4p90Tvv7beE3pMqqkZGWLbupH6Pagy2cewc9lsOltxXw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791651208;
	bh=6fgmmpNVG3nhYoKH6m5bnAsgEHFNdMn6KE+cUHlq4Ww=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g3lVDx8d4W0/l974CQ4kBg0NP25iHwzez8l8G5Xyco/0kGGSMd3FjD2622YbYaZSY
	 SxnZKoIDttDCeatRV/GgOLCk9Sos6NOQJw8T5T3xaZW23n9zTiuFDHHzvWsz4yLvTb
	 IILwaTmoKdL+DpbA2gwodq99KgJa1tAKM+Xh+vcn0XEusLdekhZ1u2AcVYaYC4bRex
	 1xnE7TcfuaoK82lntjTaFJ2jNx3/8N3Tjv7BWKYZXD0KZDQGhaI3/fYPpFgtWe5L76
	 aaF1r1t+02PZwnyf8vZJawKwR8FLDQuGhkJVkaBNQgU02LADw72ekQZpPg6yCdur2c
	 dtflLfrLGJqGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF2CC406DD;
	Sat, 10 Oct 2026 16:53:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F36C3235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D943E406D8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hX9Auv4_0tnn for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:53:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 241D6406DD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791651206;
 b=MkwHfzt54vDZgIbr9qoJPEXn3ARYtnHWHVxzzSZOSYsZL4S5mdshq96XANVQP/2jlBgC
 83HH7ywHn3lITpwuh/nNVZYhzZH8Xb9zNt4FkKcM9MEjbg8osQRusM537xmmxM4WEyJzS
 MGOFeZO8Fc7zUw/CJgH/M4TXV9BEaRUK7LsvRzS45jV6uB+uNB+R7F2WFtg4VQ03YhnBa
 79WVJnq7UY9FfdPPbJnZjRQSFCTfFPEJSBhBmHfM9ZEqRvD/JwjEE9AOQff2KM78WhgXw
 hpilFTi6sSPKkWVBMzkNufbcZUXd1Gap1rzkpZftMlpUcMh41D827RkT8G6hEOGSPew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791651206;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FVOA8Z3aMl+pbWvJOQyDglIfQdj+ejWZptGbl30eFKM=;
 b=otVD+HX+kNWK1DqXD2ogbsp3HUxkcllVOGYDaOSnthJvq6ULeo2Y0ZVRtsV2gewBTX4w
 10MgSdXZpZr9nD9+OoGCGP8k1hDo6CAxQtv0nmvZt3E5kJGAJ42Rltf1zj3d35fgcnSyq
 sN90d9GmXLFHq2136BOll38wMp8feIFdSaGwPx0vrHzN6W5PhZ7VMnXhfBnEDmj4uSzEa
 36im50/24TEDJgxtvd5TpxtYgLiLusgWaeneekWhT4huF8l9+Io4ysfKGGQ09aH8StI7Q
 edW1nkc5bruoxAm+ga26dK6bsAj6Z9P3bDeva0l7FQybqB0nlT7jK8IZFJ5Ips1Skzw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 241D6406DD
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:53:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9C889346B; Sat, 10 Oct 2026 16:52:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:53:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 119f97d1e96d80a0eae451377e710c444a5321b5
X-Git-Newrev: eedb2067d8660b31a376ccdc05dc0ae2ba3ba4c5
X-Patchwork-Hint: ignore
Message-Id: <20261010165207.C9C889346B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-httplib: link with libatomic
 if needed
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eedb2067d8660b31a376ccdc05dc0ae2ba3ba4c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

To fix the problem we add -latomic to LDFLAGS when needed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cpp-httplib/Config.in      | 2 ++
 package/cpp-httplib/cpp-httplib.mk | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/package/cpp-httplib/Config.in b/package/cpp-httplib/Config.in
index 9bd93ee0af..83251e8eeb 100644
--- a/package/cpp-httplib/Config.in
+++ b/package/cpp-httplib/Config.in
@@ -1,9 +1,11 @@
 comment "cpp-httplib needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_CPP_HTTPLIB
 	bool "cpp-httplib"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 94f270df94..c9649936e4 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -13,6 +13,12 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dtest=false
 
+CPP_HTTPLIB_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CPP_HTTPLIB_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
 CPP_HTTPLIB_CONF_OPTS += -Dcompile=true
 CPP_HTTPLIB_DEPENDENCIES += host-python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
