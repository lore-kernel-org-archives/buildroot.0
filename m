Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B88CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 06:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7807B40949;
	Sat, 10 Oct 2026 06:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dejmpYKiSpPr; Sat, 10 Oct 2026 06:55:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 867A04093F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791615358;
	b=qOJD678iKugyLY7bo6WyIK5AVBh42teykMTzram4Usn6L41ndQyqhN4YmNwb629Wi86S
	 vxTrsKvGXusm2W4b8noQSwyHKNgIq7d/u21kBEOa7qX594o8lb0LiYFXgofbaa14xxlFt
	 qToRKBPQMSu6BL8N/bnwmnqY1SVGcm1vZIZtE8U6S+Lq00qab/mKACDGVelK6VBAKXKce
	 XKT1aE+gTJo5mIsBA1zE1VaJOBI/wxVHr04pfxTjVg3kaw7HSdLc0sqEtnKvIu/Mwlfq/
	 Jhp/qyV+z7gQgENJU1t4yMkw08br2ukO2WuydbtRCTYYSa/9X2+IN1XV4lyamlKHAxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791615358;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=h9EKRVk7TIqPPDxjpmOUI898uYkPn26XrkgB9BpNpX4=;
	b=gjo8DRcBLt2OOW29bCC2R40lDLjlB7acnkow5X3jB2m9Gt/4xHVzOIHEihfg113ve53q
	 0c3qezVis4dtUgovW1h0IjP0VPL1GIOLwSbMjJaBjN8XIm9sPkx1unVaPva1O2dQJ97J0
	 Q9XfiBKp9wbGcpA8lJ6AbtxL5ogsEqsFvB/y1HiibPBlLxLFOn/fOUR2BblT3+h5KBfDq
	 6XAReAWXS7sw+H1e193DAe0AqXeBp5sR1WbLfTpcnH67bcXPvfReRZrQ6zDGR6xqdcEJB
	 XMXWOJ1+hjMpGDLH0ZNAvRgA/KP10bG0x2BpnT5NYANPSefzEJpt+sckFPnmIXHbnGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791615358;
	bh=h9EKRVk7TIqPPDxjpmOUI898uYkPn26XrkgB9BpNpX4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OEYaCqhnsm3ao71k3I+u5d62HqX2/sA0OBjFwcc2SHfGlkY2uQecSJ/k1soKvqM1V
	 813h92pCRs7jdGaBZLol2zOCnV3gC8Ho6QEdnd9mHoaTkAvWF8zb2m+I4knFpF3C8a
	 I1D8Dokl56/sQuQ6f7j4lYCs+xGe7M5K5lzsBXtXQ/Xs0hrA+K0R3kgCCl1TPNL7zH
	 JoI44MDkWdwfH97asnWzZ8k8Z3dsHlkynla8oLPrzlJREgDEMl41vkNG8ZELxTTplx
	 TRDWIlXq7fqzBkde/dgxYhBXwvoHk6qRaPid4mAw9EFPG9be6tnxPibSkUNHTCAbpa
	 JgrMnmJIZ1dyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867A04093F;
	Sat, 10 Oct 2026 06:55:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 787AB75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 544326061E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTTtNhnd5xFy for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 06:55:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A17F26061A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791615356;
 b=ZjsfdnKNdInRN2pePqdKa9glBL3jk3zooUFswIHFaYndRJP1END4OIIbACTPh31ITZKd
 FAqr6XIeNVRNxM0s5PJH17uKobhfXIuQBKWxEO9SpC0hwRiAc4gWhkoGgiaSMV6hIyOsF
 T6ctENd3jWWc/9F7pSXHrJKCQXx159Sz90SCiqX2o+0i5QlPZezU4X7ZBsvnrenywcezs
 umhtViXBDuLRge308C21+Z3RDwTyf9S0VMP4p69e3cZYyXXoXiO1hG9o2ZA6iUjHbYbqe
 yVbVBAit8L3t3Vs6MG5MsYuo2j9fuknuIVAdLpTd800NAiFCPGRNcFcbFE0THjtjdDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791615356;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PK0bICnSlCtfKz7s53crZFPFS5J75QdoxARLuO8A0gw=;
 b=frMfwMdUONWsqbiOSpFilE5tq1dBb5lch4Bufmbe1OoQsH7jAXYMOQRsbebLlO1W2KgF
 CJABy0FYSFNwFE8kdmWRUp/sEp9rVwVMyJdqsNwEb1XuK6sFRpji4En+5iZGLBs3EL8zT
 hpjyTCzRYZFxILbRdCkz0SSLcfI7wOPVV0zFJDo5d3F5nfL6g7/KmhFLaUPsSlPxE3iMm
 2bcHmcoNLm3xmdxvABaPR1NgqVLxy76rb4zZfqH/3kB8dQQHjVmkwzgwsSwJYKinBtTqt
 JldXQpKU8gLkukiA8KWs5n13pn4HfdpNFTXZIWclSWeEomZjFtw1gheHNtNpGxEsCeQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A17F26061A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:55:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8638A8E5E9; Sat, 10 Oct 2026 06:54:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 08:54:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 743365acd53797309018137e19b24be4cb68353e
X-Git-Newrev: b2a7c4db4be1900a88c7062dcf5f0f0b4bbf5434
X-Patchwork-Hint: ignore
Message-Id: <20261010065438.8638A8E5E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quickjs: enable uClibc support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2a7c4db4be1900a88c7062dcf5f0f0b4bbf5434
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The internal Buildroot toolchain does support FENV
in uClibc since commit 4c5039b80ebbe42db35af189afcff7fb7d5cace6.
Tested in Qemu system emulation for aarch64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quickjs/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index 0ae0389b2e..99f1c66be5 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_QUICKJS
 	depends on !BR2_microblaze # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_sh # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_STATIC_LIBS
-	# No way to check for fenv support.
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_USE_MMU # fork()
@@ -15,9 +13,9 @@ config BR2_PACKAGE_QUICKJS
 
 	  https://bellard.org/quickjs/
 
-comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
+comment "quickjs needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
 	depends on !BR2_microblaze
 	depends on !BR2_sh
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
+	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
