Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFF4C982DF
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24BA860DBD;
	Fri, 18 Sep 2026 13:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6wDzLlqAUlQ; Fri, 18 Sep 2026 13:06:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 369AF60DDD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736784;
	b=MCMoQGSVb+Lf4m1mW4q4XA/I2GP2g4XuqNyC8P1eIzeefXz2S79wiXiQGfiGT2BQHXSA
	 gc6gj/HTC6toXXeI4X7IdKIBRncPNEG3jDHlfme81mt9L6sSTxeyAC9t5wguQqrcW7flL
	 ztnj+uEVM7JymbhW2EUrtnQdK2/qpIoNM1RIIaCg1FYg6F63ehtNOkguZzVTyjnIBUSNj
	 +PxzlLURy8Q5KVO95XAWPIpySyRk97bOXKFjwm2VDvBtmZuRg0aXC6/u6fV3GFftQv2ih
	 4YXOLkNi0jT2CIqSDKqd7qH1MjQWXIrOZuaJVxEFhFRqzoO51d8HQivX+zV44ejGL4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=geHWUPnbmMckzf0ng1swxnInnKWb34oSfHEYjy71yQQ=;
	b=nywv4HO1Eq/eq6jAuMWiKPUYpQ/N01EP7DpCwqDpjGyefFWjIhrFrS5Zg2cCPSsRmCsa
	 Dc2zWtrRTAzSLb+uIE8SkspxDQEg6KkrKU3k79A4o6pbUa297rAARjqj14YqsLkPWcQzl
	 m1Hj5z3bOf+riq1A2h2zya92E6Q3O4ID1+yuhcDbEbp8nRBglrBwgjOZsQppyLA9VLQQH
	 6ZO6Zy+Xbvyb+7OY1jucmGT9wFG7su7nL2obEG5P2ck3hEWJTq8WNnae13XnUv56afC39
	 7TVg7H8fnG1ffWauW8Mf9VI7aYHz7CDzelOeEA7F2KM6qmDBIi4BWZNmEEgo+eeA3QA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736784;
	bh=geHWUPnbmMckzf0ng1swxnInnKWb34oSfHEYjy71yQQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YGIAc5vIRWU+VzfJay+rUUrPlgx8GAy+mNeRGMKnQ0A7shPAP3HKvYJWrmeRKxAFO
	 BE23iEvNTbvyjRvZCMsE4Q+Iz/F7yIfN3JNUlkVXcAwIc78hxoEh+7u5nk1cl3M+Vd
	 7xCWHTUAaj3peq/0S8EIZ0GopHZil8Hg9DRggl0Rf7r0KBIsIcINhCVdp4zqKn6ugT
	 usuvCh+EaSej2zG96pT8O6NJFJjloyYYACMbNnK1EuMf2MQct74AE83tWxH5cMhWo0
	 4MzYSGiPCHD5agVEac7CrvQN/UtRYa8v0H1LZo9rXceFYlDba3liK9Xe2QObAeFGz3
	 nUbzdjljhgIMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 369AF60DDD;
	Fri, 18 Sep 2026 13:06:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F21AC1FC8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E47B78124D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aujDTV9EhBYd for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0925E812A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736748;
 b=Ka2h6DJp3or1kDiL7L1mtXasJaDB8CMHcyg6ZujsuisOh+nEcr5RjFNlBVudNweykqom
 JGgzDOM/Ek+Mx/L0GhDfNnazqSfGqUkAkJqmM3W02JzvFxW37l9G9iCI8oMWwXOlnpTSa
 nkBMkq5F9OwBzqrfesLMJwsTi2KRDDdYwEFxJrfAoVqEULOO5j8LNAzmlw0Aimo+8NgMg
 u8pUqfvCjzXzeD10lXsUt9poac+CfDOjsq0j+oPgzBxSSpGD44l6gdJlmcMCfl8U577/v
 KC1V/ikAGAHiVpaWDvwpekqLFkjvtV/3mZz/iBwzkxdYCasidOkO5sdaB4mF51JZg7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736748;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KcousYrwkoCLLfgVZcEEDeapIVk8KP3pDfJ0SEKN9gw=;
 b=BsmEZCURiEf8AZvXqSWEYe9NjL7wirP7qh4BaJV6lKaobYtFoZqpVnC3n0kgfKCv/Gka
 MupYi1G6LAGJtq9/JApckE05WqySUOENWaNCKHrczY4xwxh7hh3BPcZLgJvuoNcXzzDko
 r0S9fGs5fa3nCUKfGXmVXd0BUyWSbv1RG3cpvbdOMUDb4qTpIZ/UQ9QsIzwA8A1tCOKYA
 ChIFwwu3Zgs/50vVIZlYh3FqRytBSH+ZZny4VgZ59hzdQV3DaJ9llBba8RGPfCCqVBj5/
 RtvYjxOKPdgpRjorCdW15Zy8vBfj8knUOUHP/xXEaHGITBGC12ID33UrgyTyyPZfU1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0925E812A0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B663397696; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 215f018aecfbdac512c3f4cd184e162d902931e5
X-Git-Newrev: 981c60907fb44a94a1e07ad37bcfc30a8f48f628
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.B663397696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libssh: fix
 select BR2_PACKAGE_LIBOPENSSL_ENGINES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/981c60907fb44a94a1e07ad37bcfc30a8f48f628
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_LIBSSH_OPENSSL unconditionnally selects
BR2_PACKAGE_LIBOPENSSL_ENGINES even though libressl is also supported
as an OpenSSL provider (and BR2_PACKAGE_LIBOPENSSL_ENGINES doesn't
make sense for libressl).

This causes the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBOPENSSL_ENGINES
  Depends on [n]: <choice> && BR2_PACKAGE_LIBOPENSSL [=n]
  Selected by [y]:
  - BR2_PACKAGE_LIBSSH_OPENSSL [=y] && <choice> && BR2_PACKAGE_OPENSSL [=y]

We checked that libssh, with OpenSSL support and libressl selected as
an OpenSSL provider works fine, using the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_LIBSSH=y
BR2_PACKAGE_LIBSSH_SERVER=y
BR2_PACKAGE_LIBRESSL=y

Fixes: 62103be918e7a155749b1b3b680a9e4ecba6af87 ("package/libssh: select BR2_PACKAGE_LIBOPENSSL_ENGINES")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f7fe354adadac3d2425fbe59da0744f1e4103726)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libssh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index eaec754414..bc9a02d9b0 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -36,7 +36,7 @@ config BR2_PACKAGE_LIBSSH_LIBGCRYPT
 config BR2_PACKAGE_LIBSSH_OPENSSL
 	bool "openssl"
 	depends on BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
