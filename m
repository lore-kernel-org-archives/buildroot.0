Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3313FC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED5EF40C9A;
	Sun, 20 Sep 2026 13:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cKcdowVuJjr; Sun, 20 Sep 2026 13:02:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1326F40A73
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789909375;
	b=CEg/NeS4XLvY/JhlwISClZYoW4dYA76uJGfYAlv2EMqgxBQVdlE2i06Uw8bc2CDzEEg+
	 77TlDQoVr0e+zrNhUJZ9BxP4RKsxjZPYXvfCoWl6yiEGYJdN86Xi8ADTYJZJqCZnUtraF
	 qlnWsvV8wwuufx2mpxuwFnQfLTNriEgU3WAoTEkZ2UhbM0Bfcrn1U2J5Df8WGOB9mTvLq
	 OHsVljXH+vpsYaR1Yea5jETLCtO+UyKDwovmK0snNaRdhUclQyiRJdNJVwY3+6dq73Kdp
	 OdFA02PC25+DJuJTb1kYTaJKBGuFT+HKtqmirYYUj9/Be4nZDaPZnke/6CuqbLWviwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789909375;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sEG9cMUQpww3F2pGJrzrJz199yrJg1yqKUDz2dDs7QA=;
	b=IDvXHAR+z3+pa6GrzH2wiZiqe9boNjFKTwVN1HioEwvTn2IIWxIPrcQzWtw5p/97Kqzc
	 IvtxWkfGbOQ/lrvn5Hb1jzJyXWXfmz0LhzFyaoqQiPt7fBv9cCKGhoXzT2qWttBKs2zUU
	 aTFaTkoQue2mSAzyrLmStUsJ75CNgGiWu2OeBbbCGVpwrsdFqqb9KaeS3uJy01Ps2maSw
	 CfUK1WG1d0JRSjr8B8cERUYnGRNIXDM9F/XIm0alILkX7ky04aYpLJOjdHP/4qdxJhT7v
	 WhMPD7xOSD4k1CIpu/IRj9uMja2XJtn6Iejjszwou+X385ejoROzrMrOkzmTuY10cEg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789909375;
	bh=sEG9cMUQpww3F2pGJrzrJz199yrJg1yqKUDz2dDs7QA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qHQllXCWwKJmjFSfgJIOsrkHgSttn71SLCY4dHnK1ovpnLxvwmzrMfc0G6/8mu+qC
	 wIIBaISff2pqhr9nBbuOmogo3bMT9XCXcqNL3ZMIn1jFajie/L6lZj9caw5OXz0cvH
	 z0lCeqLtMkXZ7cdE9bgRUqAMSv3Ev4pwxwFFVt9pG+7O7wQfN0lYcNGSaI4GZ3uZ8f
	 q3A9EoXBOdNV4rhjkmrNXn0ipYJhgZRZw6WdrJe3ZxKZdXStxlt25TUwMFfJ7QLqmH
	 aUp5dtKhoQ7FFBTiTsSn0v/w795QKv4e3SjZ5NAedbbXVOLjMmmmcB0ePJfTmxqldF
	 HvKBDIRveoIPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1326F40A73;
	Sun, 20 Sep 2026 13:02:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31AD737A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201CC4005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbC1lmnYgwFH for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:02:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 66489400C7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789909372;
 b=SEAW8BOc0HifYpt1Wu5Gk5k5SQgfp42DiczSfSucbSEAUBMI7WERw2GwJRbFP/tYH+TC
 90dz4lNIj/Ja+ULUtIOVLTCsaChK/tf3Us2sey3wB5B86EMScTJpAA9rAi3TIHUqCIHOF
 GxK1pttSGzQUxE+Fc0LwX2YtqVAfNNCLjofbxi8CLyTndseNDIVmkQFVhV9sx/BxRD7L6
 DoT3IBl7lknGwf4lV+RwkMQdPIepQD/acHFndkT9f8Jt3yNPU1J/2QZ0ptbkqEfnUQWBM
 Y6yUXqFNIMCWL+MhRKKPyaUua/oIvLBQfv+5CbgGEQFRxzJse3w4Fkz+yetQtEF+e8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789909372;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Tc3H0WQdKURk/aHsMkfGlkmJTVt5eXW4Bh/AJFSUFeo=;
 b=PxRYv4KdAL70L1cRm07W0wStxS4uks2A5luAiCF00CGispC83aCP/PU4Is+wdg3ZMg5o
 n+CfDa492EDyePo7L5RqhXvZdpQB+2iuOq26C4w9KB26nht3ECZe49OcvFk+2VBQtOqBQ
 i5Ez4jnc+PuO56p5X6oUPvJUMFNI74C8/Ezj8oE18chQUE7E22bhRmq5OdJW+tgSzuyZ9
 0H7oxc2WmJIAkzYxC7BEqLz8taMxuveGgcgEiteLTv8A4GA2nERBha2X4Vp20tBj/YLpu
 3ErOcnQx64l1hRvDXJnsVo5maDfnWTCJ7H9DsLDnGMKoSjWM/wbQqQvhjmNmfuAXxfQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66489400C7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13AE18CA36; Sun, 20 Sep 2026 13:01:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 15:02:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4253ee1a66a914714f67c427756980c064a9abd
X-Git-Newrev: a235a33cfea320907e330023c1c6ec1645a4374a
X-Patchwork-Hint: ignore
Message-Id: <20260920130144.13AE18CA36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: remove dependencies on
 Boost.DateTime
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a235a33cfea320907e330023c1c6ec1645a4374a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Boost.DateTime is header-only since 1.77.0
The Boost Release Notes[0] didn't mention it but it was introduced in
the documentation of DateTime in this commit: [1]

This was bumped in buildroot in d39d8f7cee9b4634e6f490020204f63fae419e8e

So analog to the "header-only" move of Boost.System we have now to
gradually phase out the dependencies on this library. Ideally before
the stub is removed as it now happened for Boost.System in 1.89.0.

[0] https://www.boost.org/releases/1.77.0/
[1] https://github.com/boostorg/date_time/commit/33dc6136f193a100c753c819694d6d11e9ab4123

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a9ab4836b5..7b78345798 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -95,6 +95,9 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 	  A set of date-time libraries based on generic programming
 	  concepts.
 
+	  This library is header only since boost 1.77.0. Building a
+	  stub library is still supported for backward compatibility.
+
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 	help
@@ -200,7 +203,6 @@ config BR2_PACKAGE_BOOST_LOG
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_THREAD
@@ -359,7 +361,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
