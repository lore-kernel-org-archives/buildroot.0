Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AECFCA6002
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 08:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD514070C;
	Wed,  7 Oct 2026 08:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92TNURlIWtZl; Wed,  7 Oct 2026 08:04:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 99BE4406D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791360286;
	b=E/WSDidsC8d3ERYXJ4SjG8+59+IcetqAdp0LwswvegyGC+0Ew21PecBF2ULEKNSie97A
	 TjvoKdDTcvqO54cGaE//UYhzuhEgMfX+J7PteMcH7u8Yp6kJWfZ7s8zpmB5mLp9ZZVeMe
	 ZyCam+9VhgmTCrRJT/dV5+dLavrSyZtm+5tH/tTZ67SXNmP5BDN9jWNlhBRAdWGZwIV3U
	 VpRV6QTZBB6ONQ1LNr4Ur987cvVDc9PzbxRkCq4KBQGBtYMPlsbP6r0XsZH2OJnsN2VFT
	 IaSbEiXc/pl/LLyzn86gx6PwA1eiX3DwMg5AaIJMR6wdNQVbaf4QKIhWOGp2yGXdsSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791360286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/IQHSyNRj3dPiXZDsguzZ4Gf/aqZPkckAH/dFIZEa6U=;
	b=P4Eisn+HFhDTBZwgy9fr2ETc/9pSDsNbmB3KCLT9J6h2vGlk33w3pVgdB2QfKpobubST
	 NbLhHMZtoBijuYCzQq9hcPaXXpTZi2L9Ez/FNSZ64L9le1kEpr3yfIuWFZW48nZzYqSLW
	 CYE5I6IE9dGn22wsqg05rVqCsXuvfSiCtbgrYCkrR3Gm6i4vj/vOk7PYP+W+D01mpkroC
	 pIDyGxvui9ON6hgJfPmvAgLsloZdEdz44iQe/veIEFMulYlNB1hq2Rg3PgoINyVi2I2yU
	 vJlDiVLKEuGyF5Bx2Efe2/COXN3nVBlxMdxKeGd5IFo84i9vVaglua3cvjGQHBJAy1Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791360286;
	bh=/IQHSyNRj3dPiXZDsguzZ4Gf/aqZPkckAH/dFIZEa6U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RMIq6oOjXB0Bb0czebR0Pytyb/kEAhYih/j5y/4kQQL+OizttP/qAgxo7XbF93Uvd
	 ZG89WXF7kExdEaWFZvj0LCs4kSZ0RUX0mfm9TCtV6ehDiIzyz06FUQnXIIs3hBbAHX
	 rraOsERwpo7ZaqZ8IKjsOPcNQwRz0lccUcxgAU5+aGLka/29Uep1LMw68cMDT9zdOh
	 ZXb/Z/47pFGFgCpFwu98Uk9L4BrwIvigwYyOT04YM0sglAgortUUvN83LLFm3Xel1R
	 v37aYiovPoaGn4af5aieAsCN339cw70BojrmAcGrJ2TpvaMm40/erqkDOuQi1RT46Y
	 mqnOaK6nsF9WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99BE4406D1;
	Wed,  7 Oct 2026 08:04:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA3C8317
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83BB480EE4
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmHBMk0hxE8V for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 07:55:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A95BA80E6B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791359732;
 b=IAB1kgsZ94POnvTDkw/n7GOm7htM96F8dp7CKB8+75G7wFzIQI6vsKWviDyI7inlv7jU
 wN+2tAAbtEP5z9T+Vi0BHU8jJX+8XIvvZ/WG+c9QmPCoUZDHWmVI2vwd+sNXYUUGoMfoh
 5wxmIn8EzpGptblx0RwFtLLp+Ur8l48H/jQlbnHZT39GTWzOcawlc1r4ufYSGBVOpbR72
 YxyPTWaFBk0OLxj14jQZgcjnk/eMCqUicl8P9hVO+M8nr/TelFOCLMsFf7MG1oQDJiwfl
 gFGr7XfzKOhu+qO7DFsAiXlFyUbWVc21yYIYyi6z+4I1HT7aGq/mGIryAF6q3vMCFNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791359732;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=t/4tMaGnc39iffzoY7s3WdPGFdyHU6zSQBtMQcVJE30=;
 b=jjAvwCCpxf3IEOghxFtG8MBQ1K3ys+wDHHikzUfUFqI3naT5I9VXrNT62KAjqMToUDk3
 q9u1A5WnIOgpcFOSKyeNgK7DqJiP8F2CAEVOtrSWr9+h2vt9iHxHBRPqj5IVG/Mq6K807
 r9ZunQocdQtub4pw8fQmS4o7ZvaZjgJwJW898RSOop92PYiOnA8B+Gv1v9TFDrD7cvV5H
 eIwtRx0ouMoQpwYEHcpdZeQr6Z9kfW/BT4laBQCBXVWXhoOrml/rkHa+xIwqupBE4mAYB
 1QMh7rBvvvNNstGZDNgFybt0gG89dJMfHYwyT7AlQaHtBgZP8B4kSdJkt1ijMJi+llA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A95BA80E6B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:55:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F097E8DA9C; Wed,  7 Oct 2026 07:54:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Oct 2026 09:54:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23d71bfd96a32a7a1282ca474861d5e5d86a8d41
X-Git-Newrev: 0710da403def5df6219c2b6a3f4cdfa5930b2a89
X-Patchwork-Hint: ignore
Message-Id: <20261007075415.F097E8DA9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmsxx: add option for pykms
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0710da403def5df6219c2b6a3f4cdfa5930b2a89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add option to kmsxx to enable building pykms.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmsxx/Config.in | 7 +++++++
 package/kmsxx/kmsxx.mk  | 7 ++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
index fa327ba18d..8fe023c63e 100644
--- a/package/kmsxx/Config.in
+++ b/package/kmsxx/Config.in
@@ -16,6 +16,13 @@ config BR2_PACKAGE_KMSXX
 
 if BR2_PACKAGE_KMSXX
 
+config BR2_PACKAGE_KMSXX_PYKMS
+	bool "Enable Python bindings"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  This option enables the pykms python bindings.
+
 config BR2_PACKAGE_KMSXX_INSTALL_TESTS
 	bool "Install test programs"
 	help
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 5aeb48910c..10cae65779 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -12,13 +12,18 @@ KMSXX_INSTALL_STAGING = YES
 KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
 KMSXX_CONF_OPTS = \
 	-Dkmscube=false \
-	-Dpykms=disabled \
 	-Domap=disabled
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
 endif
 
+ifeq ($(BR2_PACKAGE_KMSXX_PYKMS),y)
+KMSXX_CONF_OPTS += -Dpykms=enabled
+else
+KMSXX_CONF_OPTS += -Dpykms=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_CONF_OPTS += -Dutils=true
 # extra handling for some utils not installed by default
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
