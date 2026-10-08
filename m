Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB023CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE99C60EE1;
	Sat, 10 Oct 2026 09:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5tCwlooVk7W; Sat, 10 Oct 2026 09:28:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 940F060EF8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624480;
	b=BeMy5DNcHdjZJ30JcYru1mWRWQlF8d32eNQus33+8EC9DdYkKO+ewrZlKCDFe87U4bpY
	 6UUOTJVeDMbf3utkdMaYAJ+GWQjGu8Vxp4+3iwi0b/HEJ4aI9mSXOAqPGXL5ruRiJiXyK
	 OQAYU10vZzOV7m4cfQxncpiHi6WtvovZmw1EKyvfGxCiNu6T7aBUd0xncMNQAxQ3nVnTg
	 o23FS1YHLiKjWwXTZ+L8L4J3WrSnXMCw82TnQMQ4c3XwNu3LCTQboKjldGOtECDpb30jl
	 3QNfk4BKkR5YzKyrSwjiS2LP1z5eHukFLUbyPJeDTqQ6f+OvNXWz7zBS3qkWDFA8L1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624480;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rTxt+wXPFYLRLn1MSHCP7SoklsOrLsxQHk+QYmTpYwc=;
	b=pxSDgkl53NrCjcVG052GGnPhmsS4Na6AAEYGc2wMLsqJiJhwpu+bj4qG6Qk0NGob289S
	 YAOF38zJ//83IIEXKxUvMaPs7aMy8KVnLSDge1yZpm2weg/pqnyvKHwMXJvfPgZ+YYaKJ
	 UH14OnFt/r23SVmei8WQvnj6rRpNE3h74ElZu3I7iuFtBcj/XE3+e7sAt2D2lJU+dteKu
	 V4KgeqmzUncRRP9oi9xiS5zeaiw3SE0LJEVlhAr5CwlrtHLEj0MXDr3peQEwMDPvESy7s
	 9EazqiV71b+CKi44Sl8UU0v/qxcUaQ45kGhLg6jITcS/58RopBcHRyBIgEQurapturA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624480;
	bh=rTxt+wXPFYLRLn1MSHCP7SoklsOrLsxQHk+QYmTpYwc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OrHl+Y4Z3LbLOFWfqPC5xbAH6l/Nmc2KRTXyAr8ggJO6A1OpzF7QH31gqgNxlUS77
	 sogIUPoXe3C0k/9m6FhaeTNfR7JoW4R50oZWLPBUj4vwLOHsxrTWIDI8ZijspIhvTz
	 Bpkm3Wy+2+iZMc0FkAnDWmi38c6zcV6cdwKv8Jv6wBAr2gFV4Z6M51txb3Y3ATuz1G
	 tw9qdHsf1x/qz4ba6KJB1kleqn/iKpbJn52Gzm/08wG6LSSQ+0VfS/eA54NqVrYSkJ
	 ANCZVPhd5g4EKQcjzH3idrwQzFW4lTodyCpUFhb+m+fqeuoy45Y7i8txdM1s+TNjJB
	 bzOQAB/KLtHNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 940F060EF8;
	Sat, 10 Oct 2026 09:28:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 758F5DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AFB081149
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zw9BN0gzjXJr for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 70CF5811E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=Q+KQizClBxwuqr9Srtvh1EmIB6LJtInur6a3PngSkRd0Y4VHY+RD57TSdOa5aOm2q5z7
 COH+bzi6QMGqGWkQtnQllVvvdRvaRzMt7QPh4j4t5WbVQw8NX1VN4luYRDkPyq5Zrnko9
 8x9JFCsWIUusaTOM8jFAwhGGLMcReuvieF7AMAjekdS+5z48hrrlvR/MbqdAEswvveT4+
 ft1T1bUOp5QUMnh99pdjr1UCrTeibBEl4zB5Ea48rwLh/iGutZpG9FCg7icsOE9eGvsWF
 S9hVnhz1bv60ibyV6VwXuAz2tbWbSxONLfwWR8CvaNZOpddo35v+50d5nsZV3F+3mjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IHz0VBBKsudB19VaXqpv96aajLc/X1rykgSR+tUQcI4=;
 b=DVXApnWEYUoQ/ig8zYcFZmshRgZGXRySMMeycdacWtP1WUrBkxupQXCPkyuu5XYsWh2j
 KV0eigGUjO9uwc/SIr+bl4kcUYZEAnwJNPR9ET61IFnd8DxudztlClnjAxBRtnAWuJi2e
 KN21CNe/WvNSh47zqZr4q0izJhm2GI8lH1qNkB2qiziVzWY0EG5VKfESHjaqQitulf1qX
 eW63rZKRx9KppMTleUOVuQ0mqyB4smlUANxPvaEh6+i01ezwnuZ+BuZEhy310vMVTUR4v
 AArCGBBnrj62FPAh4VsaNkhIo6xR5e4DAyftGCzTA0C3pda7nsS49qHphOKPN+TvPgA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70CF5811E7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A0538F0B1; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9b01c2a336ef77720f6d20f97b19f513c05a8545
X-Git-Newrev: 4029acf22e775a3fb2154ed75f333bace90bd392
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.5A0538F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libseccomp: bump
 to version 2.6.0
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7692415247458607930=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7692415247458607930==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4029acf22e775a3fb2154ed75f333bace90bd392
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For change log, see:
https://github.com/seccomp/libseccomp/blob/v2.6.0/CHANGELOG

This commit also enables LoongArch64 support,
added in upstream commit:
https://github.com/seccomp/libseccomp/commit/6966ec77b195ac289ae168c7c5646d59a307f33f

Signed-off-by: Preyas <preyas17@zohomail.in>
[Julien:
 - add link to change log
 - enable loongarch64 support
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4f9600c2f97039b4ad6eb66087a7654805536a76)
[raphael: drop BR2_loongarch64 because it's unsupported on 2025.02.x]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index b80efd68f5..aaadc8424e 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.5
-sha256  248a2c8a4d9b9858aa6baf52712c34afefcf9c9e94b76dce02c1c9aa25fb3375  libseccomp-2.5.5.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.0 (PGP-signed checksum)
+sha256  83b6085232d1588c379dc9b9cae47bb37407cf262e6e74993c61ba72d2a784dc  libseccomp-2.6.0.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 10d57bb78c..26585b1887 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.5.5
+LIBSECCOMP_VERSION = 2.6.0
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE

--===============7692415247458607930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7692415247458607930==--
